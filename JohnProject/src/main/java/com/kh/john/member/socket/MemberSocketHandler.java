package com.kh.john.member.socket;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.john.member.model.service.MemberService;
import com.kh.john.member.model.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MemberSocketHandler extends TextWebSocketHandler {
	
	@Autowired
	private MemberService service;
	
	Map<Member, WebSocketSession> users= new HashMap<Member, WebSocketSession>();
	private ObjectMapper objectMapper=new ObjectMapper();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug("멤버 핸들러 실행됨");
		Map<String, Object> map=session.getAttributes();
		Member member=(Member)map.get("loginMember");
		users.put(member, session);
		log.debug("member: "+member);
		log.debug("닉네임: "+member.getMemNickname());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		super.handleTextMessage(session, message);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}
	
}
