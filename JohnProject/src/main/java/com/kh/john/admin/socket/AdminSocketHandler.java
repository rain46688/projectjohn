package com.kh.john.admin.socket;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j	
public class AdminSocketHandler extends TextWebSocketHandler {

	Map<Member, WebSocketSession> map = new HashMap();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug("핸들러실행됨");
		Map<String, Object> map1 = session.getAttributes();
		Member m = (Member)map1.get("loginMember");
		map.put(m, session);
		log.debug("m:"+m);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.debug("메세지실행됨");

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.debug("핸들러끝");

	}
}
