package com.kh.john.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class BoardChatSocket extends AbstractWebSocketHandler{

	private Map <Member, WebSocketSession> allUsers = new HashMap<Member, WebSocketSession>();
	
	private Multimap<Integer, Member> rooms = ArrayListMultimap.create();
	
	private Multimap<Integer, BoardChat> roomChat = ArrayListMultimap.create();
	
	private Map <Member, String> imageFileName = new HashMap();
	
	private ObjectMapper mapper = new ObjectMapper();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		log.info(session.getId() + "채팅 소켓 접속");
		Map<String, Object> map = session.getAttributes();
		Member member = (Member)map.get("loginMember");
		allUsers.put(member, session);
		System.out.println(roomChat);
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
			System.out.println(path);
			System.out.println(path.substring(0,path.lastIndexOf("/target/"))+"/src/main/webapp/resources/images");
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
			log.debug(""+boardId);
			msgFromClient.setBoardId(boardId);
			msgFromClient.setUsid(member.getUsid());
			msgFromClient.setMessage((String)result.get("message"));
			msgFromClient.setUserImg(member.getProfilePic());
			msgFromClient.setUserNick(member.getMemNickname());
			msgFromClient.setEnrollDate(new Date());
			
			roomChat.put(boardId, msgFromClient);
			
			if(!rooms.keySet().contains(boardId)) {
				rooms.put(boardId, member);
			}else {
				for(Member mem : rooms.get(boardId)) {
					if(member!=allUsers.get(mem)) {
						rooms.put(boardId, member);
						break;
					}
				}
			}
			
			List<BoardChat> chatList = new ArrayList();
			
			System.out.println(rooms);
			
			for(Member mem : rooms.get((Integer)result.get("boardId"))) {
				for(BoardChat chat : roomChat.get((Integer)result.get("boardId"))) {
					chatList.add(chat);
				}
				allUsers.get(mem).sendMessage(new TextMessage(mapper.writeValueAsString(chatList)));
			}
		}else {
			imageFileName.put(member, messageValue);
		}
	}
//		
//		Map<Member, WebSocketSession> user = new HashMap();
//		user.put(member, allUsers.get(member));
//		
//		rooms.put((Integer)result.get("boardId"), user);
//		
//		rooms.get((Integer)result.get("boardId"));
//		
//		
//		
//		for(Map<Member, WebSocketSession> users : rooms.get((Integer)result.get("boardId"))) {
//			for(Map.Entry<Member, WebSocketSession> sess : users.entrySet()) {
//				sess.getValue().sendMessage(new TextMessage(mapper.writeValueAsString(rooms.asMap().get((Integer)result.get("boardId")).toString())));
//			}
//		} 
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		Member member = (Member)session.getAttributes().get("loginMember");
		
		Iterator it = rooms.keySet().iterator();
		
		int board = 0;
		
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
		
		Iterator it2 = roomChat.keySet().iterator();
		while(it2.hasNext()) {
			int boardId = (Integer)it2.next();
			for(BoardChat chat : roomChat.get(boardId)) {
				if(member.getUsid() == chat.getUsid()) {
					roomChat.remove(boardId, chat);
					break;
				}
			}
		}
		
		List<BoardChat> chatList = new ArrayList();
		
		
		System.out.println("************************"+board);
		for(Member mem : rooms.get(board)) {
			for(BoardChat chat : roomChat.get(board)) {
				chatList.add(chat);
			}
			allUsers.get(mem).sendMessage(new TextMessage(mapper.writeValueAsString(chatList)));
		}
		
		allUsers.remove(member);
		System.out.println(member.getMemNickname() + "연결 종료");
	}
}
