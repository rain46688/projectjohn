package com.kh.john.admin.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.john.admin.model.service.AdminService;
import com.kh.john.admin.model.vo.AdminChat;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j	
public class AdminSocketHandler extends TextWebSocketHandler {

	@Autowired
	private AdminService service;
	
	Map<Member, WebSocketSession> users = new HashMap<Member, WebSocketSession>();
	private ObjectMapper objectMapper= new ObjectMapper();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug("핸들러실행됨");
		Map<String, Object> map1 = session.getAttributes();
		Member m = (Member)map1.get("loginMember");
		users.put(m, session);
		log.debug("m:"+m);
		log.debug("닉넴:"+m.getMemNickname());
		
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String, Object> map1 = session.getAttributes();
		Member m = (Member)map1.get("loginMember");
		users.put(m, session);
		
		System.out.println(session.getId()+"로부터 메세지 수신 : "+message.getPayload());
	
		
		log.debug("메세지실행됨");
		AdminChat acmsg = objectMapper.readValue(message.getPayload(), AdminChat.class);
		log.debug("acmsg : "+acmsg);
		
		Iterator<Member> it = users.keySet().iterator();
		while(it.hasNext()) {
			Member key = it.next();
			if(acmsg.getAdminChatMemUsid()==key.getUsid()) {
				
				service.insertAdminChat(acmsg);
				users.get(key).sendMessage(new TextMessage(objectMapper.writeValueAsString(acmsg)));
			}
			
		}
		
		
		/*
		 * System.out.println(session.getId()+" 로부터 [" + message.getPayload()+"] 받음");
		 * session.sendMessage(new TextMessage("echo : " + message.getPayload()));
		 */
	}	

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.debug("핸들러끝");
		List<Member> keyList = new ArrayList<Member>();
		Iterator<Member> it = users.keySet().iterator();
		while(it.hasNext()) {
			Member key = it.next();
			if(users.get(key).equals(session)) {
				keyList.add(key);
			}
		}
		
		for(Member listkey : keyList) {
			users.remove(listkey);
		}

	}
}
