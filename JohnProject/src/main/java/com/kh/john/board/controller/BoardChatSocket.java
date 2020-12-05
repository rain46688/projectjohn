package com.kh.john.board.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import com.kh.john.board.model.vo.BoardChat;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class BoardChatSocket extends TextWebSocketHandler{

	private Map <Member, WebSocketSession> allUsers = new HashMap<Member, WebSocketSession>();
	
	private Multimap<Integer, WebSocketSession> rooms = ArrayListMultimap.create();
	
	private Multimap<Integer, BoardChat> roomChat = ArrayListMultimap.create();
	
	private ObjectMapper mapper = new ObjectMapper();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		log.info(session.getId() + "접속");
		Map<String, Object> map = session.getAttributes();
		Member member = (Member)map.get("loginMember");
		allUsers.put(member, session);
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		Member member = (Member)session.getAttributes().get("loginMember");
		String messageFromClient = message.getPayload();
		String messageKey = messageFromClient.substring(0,messageFromClient.indexOf(":"));
		String messageValue = messageFromClient.substring(messageFromClient.indexOf(":")+1);
		
		Map<String,Object> result = mapper.readValue(messageValue, HashMap.class);
		
		if(messageKey.equals("chat")) {
			BoardChat msgFromClient = new BoardChat();
			
			int boardId = (Integer)result.get("boardId");
			msgFromClient.setBoardId(boardId);
			msgFromClient.setUsid(member.getUsid());
			msgFromClient.setMessage((String)result.get("message"));
			msgFromClient.setUserImg(member.getProfilePic());
			msgFromClient.setUserNick(member.getMemNickname());
			msgFromClient.setEnrollDate(new Date());
			
			roomChat.put(boardId, msgFromClient);
			
			if(!rooms.keySet().contains(boardId)) {
				rooms.put(boardId, allUsers.get(member));
			}else {
				for(WebSocketSession sess : rooms.get(boardId)) {
					if(session!=sess) {
						
					}
				}
			}
			
			List<BoardChat> chatList = new ArrayList();
			
			System.out.println(rooms);
			
			for(WebSocketSession sess : rooms.get((Integer)result.get("boardId"))) {
				for(BoardChat chat : roomChat.get((Integer)result.get("boardId"))) {
					chatList.add(chat);
				}
				sess.sendMessage(new TextMessage(mapper.writeValueAsString(chatList)));
			}
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
			for(WebSocketSession sess : rooms.get(boardId)) {
				if(session.equals(sess)) {
					board = boardId;
					rooms.remove(boardId, sess);
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
		for(WebSocketSession sess : rooms.get(board)) {
			for(BoardChat chat : roomChat.get(board)) {
				chatList.add(chat);
			}
			sess.sendMessage(new TextMessage(mapper.writeValueAsString(chatList)));
		}
		
		allUsers.remove(member);
		System.out.println(member.getMemNickname() + "연결 종료");
	}
}
