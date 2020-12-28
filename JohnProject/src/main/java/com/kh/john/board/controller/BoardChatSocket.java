package com.kh.john.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.AbstractWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import com.kh.john.board.model.vo.BoardChat;
import com.kh.john.board.model.vo.RoomDate;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class BoardChatSocket extends AbstractWebSocketHandler{

	//접속한 모든 유저
	private Map <Member, WebSocketSession> allUsers = new HashMap<Member, WebSocketSession>();
	//방에 따라 나눠진 유저목록
	private Multimap<Integer, Member> rooms = ArrayListMultimap.create();
	//해당 방의 채팅목록
	private Multimap<Integer, BoardChat> roomChat = ArrayListMultimap.create();
	//유저가 올린 이미지파일 이름 저장
	private Map <Member, String> imageFileName = new HashMap();
	//해당 방의 이미지 파일 이름
	private Map <Integer, String> roomImageFileName = new HashMap();
	//새로고침시 메시지 유지를 위한 채팅리스트
	private Multimap<RoomDate, BoardChat> tempDumpChat = ArrayListMultimap.create();
	
	private ObjectMapper mapper = new ObjectMapper();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		log.info(session.getId() + "채팅 소켓 접속");
		Map<String, Object> map = session.getAttributes();
		Member member = (Member)map.get("loginMember");
		allUsers.put(member, session);
	}
	
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// TODO Auto-generated method stub
		if(message instanceof TextMessage) {
			handleTextMessage(session, (TextMessage)message);
		}else if (message instanceof BinaryMessage) {
			handleBinaryMessage(session, (BinaryMessage)message);
		}
	}
	
	@Override
	protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		Member member = (Member)session.getAttributes().get("loginMember");
		ByteBuffer payload = (ByteBuffer)message.getPayload();
		String fileName = imageFileName.get(member);
		String extension =fileName.substring(fileName.lastIndexOf('.'), fileName.length()-1);
		FileOutputStream fos = null;
		if(message.isLast()) {
			String path = BoardImageSocket.class.getResource("/").getPath();
			String realPath = path.substring(0,path.lastIndexOf("/target/"))+"/src/main/webapp/";
			Path basePath = Paths.get(realPath, "resources/images", UUID.randomUUID().toString() + extension);
			try {
				fileName = UUID.randomUUID().toString() + extension;
				File file = new File(realPath+"resources/images");
				if(!file.exists()) file.mkdirs();
				realPath = realPath + "/resources/images/" + fileName;
				fos = new FileOutputStream(new File(realPath));
				FileChannel channel = fos.getChannel();
				channel.write(payload);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			int roomNum = 0;
			for(Map.Entry<Integer, Member> room : rooms.entries()) {
				if(allUsers.get(room.getValue()).equals(session)) {
					roomNum = room.getKey();
					break;
				}
			}
			imageFileName.clear();
			roomImageFileName.put(roomNum, fileName);
			for(Member mem : rooms.get(roomNum)) {
				allUsers.get(mem).sendMessage(new TextMessage("image:"+fileName));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		Member member = (Member)session.getAttributes().get("loginMember");
		String messageFromClient = (String)message.getPayload();
		String messageKey = messageFromClient.substring(0,messageFromClient.indexOf(":"));
		String messageValue = messageFromClient.substring(messageFromClient.indexOf(":")+1);
		
		if(messageKey.equals("chat")) {
			Map<String,Object> result = mapper.readValue(messageValue, HashMap.class);
			
			BoardChat msgFromClient = new BoardChat();
			
			int boardId = (Integer)result.get("boardId");
			
			//임시 메시지 있는지 확인
			if(tempDumpChat!=null) {
				dumpChatManager(tempDumpChat, boardId);
				//해당 방의 사라진 메세지 다시 받기
				Iterator it = tempDumpChat.entries().iterator();
				while(it.hasNext()) {
					Map.Entry<RoomDate, BoardChat> tempChat = (Map.Entry<RoomDate, BoardChat>)it.next();
					if(tempChat.getKey().getBoardId() == boardId) {
						roomChat.put(boardId, tempChat.getValue());
						it.remove();
						//tempDumpChat.remove(tempChat.getKey(), tempChat.getValue());
					}
				}
			}
			boolean isFirst = false;
			if(result.get("isFirst")!=null) {
				isFirst = (boolean)result.get("isFirst");
			}
			boolean hasSaid = false;
			for(BoardChat chat : roomChat.get(boardId)) {
				if(chat.getUsid() == member.getUsid()) {
					hasSaid = true;
					break;
				}
			}
			
			if(isFirst) {
				if(hasSaid) {
					
				}else {
					msgFromClient.setBoardId(boardId);
					msgFromClient.setUsid(member.getUsid());
					msgFromClient.setMessage((String)result.get("message"));
					msgFromClient.setUserImg(member.getProfilePic());
					msgFromClient.setUserNick(member.getMemNickname());
					msgFromClient.setEnrollDate(new Date());
					
					roomChat.put(boardId, msgFromClient);
				}
			}else {
				msgFromClient.setBoardId(boardId);
				msgFromClient.setUsid(member.getUsid());
				msgFromClient.setMessage((String)result.get("message"));
				msgFromClient.setUserImg(member.getProfilePic());
				msgFromClient.setUserNick(member.getMemNickname());
				msgFromClient.setEnrollDate(new Date());
				
				roomChat.put(boardId, msgFromClient);
			}
			
			if(!rooms.keySet().contains(boardId)) {
				rooms.put(boardId, member);
			}else {
//				for(Member mem : rooms.get(boardId)) {
//					if(member!=allUsers.get(mem)) {
//						rooms.put(boardId, member);
//						break;
//					}
//				}
				if(!rooms.containsValue(member))rooms.put(boardId, member);
			}
			
			if(roomImageFileName.get(boardId)!=null) {
				for(Member mem : rooms.get(boardId)) {
					allUsers.get(mem).sendMessage(new TextMessage("image:"+roomImageFileName.get(boardId)));
				}
			}
			
			List<BoardChat> chatList = new ArrayList();
			
			log.debug("roomChat size : "+roomChat.size());
			log.debug("room size : "+rooms.get((Integer)result.get("boardId")).size());
			for(Member mem : rooms.get((Integer)result.get("boardId"))) {
				for(BoardChat chat : roomChat.get((Integer)result.get("boardId"))) {
					chatList.add(chat);
				}
				allUsers.get(mem).sendMessage(new TextMessage(mapper.writeValueAsString(chatList)));
				log.debug("전체 사용자 : " + allUsers);
				log.debug("사용자 : " + mem);
				log.debug("채팅 메세지 : "+chatList);
				chatList.clear();
			}
		}else if(messageKey.equals("image")){
			imageFileName.put(member, messageValue);
		}else {
			int boardId = Integer.parseInt(messageValue);
			for(Member mem : rooms.get(boardId)) {
				allUsers.get(mem).sendMessage(new TextMessage("leave"));
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		Member member = (Member)session.getAttributes().get("loginMember");
		
		Iterator it = rooms.keySet().iterator();
		
		int board = 0;
		
		//방에서 유저 삭제
		outerloop:
		while(it.hasNext()) {
			int boardId = (Integer)it.next();
			for(Member mem : rooms.get(boardId)) {
				if(member.equals(mem)) {
					board = boardId;
					rooms.remove(boardId, member);
					break outerloop;
				}
			}
		}
		
		log.debug("방번호 확인: "+board);
		
		//채팅 목록에서 유저가 작성한 목록 삭제
		Iterator it2 = roomChat.entries().iterator();
		while(it2.hasNext()) {
			Map.Entry<Integer, BoardChat> chats = (Map.Entry<Integer, BoardChat>)it2.next();
			int boardId = (Integer)chats.getKey();
			BoardChat chat = chats.getValue();
			if(member.getUsid() == chat.getUsid()) {
				tempDumpChat.put(new RoomDate(boardId, new Date()), chat);
				if(chat.equals(chats.getValue()))it2.remove();
			}
		}
		//접속한 유저 중 삭제
		allUsers.remove(member);
		
		List<BoardChat> chatList = new ArrayList();
		
		//나간 유저를 제외한 모든 유저들에게 메세지 전송
		for(Member mem : rooms.get(board)) {
			for(BoardChat chat : roomChat.get(board)) {
				chatList.add(chat);
			}
			if(allUsers.get(mem)!=null)allUsers.get(mem).sendMessage(new TextMessage(mapper.writeValueAsString(chatList)));
			chatList.clear();
		}
		log.debug("afterConnectionClosed 완료");
	}
	
	private void dumpChatManager(Multimap<RoomDate, BoardChat> tempDumpChat, int boardId) {
		Date now = new Date();
		Iterator it = tempDumpChat.entries().iterator();
		while(it.hasNext()) {
			Map.Entry<RoomDate, BoardChat> chats = (Map.Entry<RoomDate, BoardChat>)it.next();
			if(chats.getKey().getBoardId() == boardId) {
				if(now.getTime() - chats.getKey().getDate().getTime() > 10000) {
					it.remove();
				}
			}
		}
	}
	
	@ExceptionHandler(IOException.class)
	@ResponseStatus(HttpStatus.SERVICE_UNAVAILABLE)   //(1)
	public Object exceptionHandler(IOException e, HttpServletRequest request) {
	    if (StringUtils.containsIgnoreCase(ExceptionUtils.getRootCauseMessage(e), "Broken pipe")) {   //(2)
	        return null;        //(2)	socket is closed, cannot return any response    
	    } else {
	        return new HttpEntity<>(e.getMessage());  //(3)
	    }
	}
}
