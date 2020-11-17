package com.kh.john.member.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.john.member.model.service.MemberService;
import com.kh.john.member.model.vo.Member;
import com.kh.john.member.model.vo.MemberChat;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MemberSocketHandler extends TextWebSocketHandler {
	
	@Autowired
	private MemberService service;
	
	Map<Member, WebSocketSession> users= new HashMap<Member, WebSocketSession>();
	private ObjectMapper objectMapper=new ObjectMapper();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug("멤버 소켓 핸들러 실행");
		Map<String, Object> map=session.getAttributes();
		Member member=(Member)map.get("loginMember");
		users.put(member, session);
		log.debug("member: "+member);
		log.debug("닉네임: "+member.getMemNickname());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getId()+"로부터 메세지 수신: "+message.getPayload());
		log.debug("메세지 실행 됨");
		MemberChat memberChat=objectMapper.readValue(message.getPayload(), MemberChat.class);
		log.debug("memberChat"+ memberChat);
		
		Iterator<Member> it=users.keySet().iterator();
		while(it.hasNext()) {
			Member key=it.next();
			if(memberChat.getMchatSecondUsid()==key.getUsid()) {
				service.insertMemberChat(memberChat);
				users.get(key).sendMessage(new TextMessage(objectMapper.writeValueAsString(memberChat)));
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.debug("멤버 소켓 핸들러 종료");
		List<Member> keyList=new ArrayList<Member>();
		Iterator<Member> it=users.keySet().iterator();
		while(it.hasNext()) {
			Member key=it.next();
			if(users.get(key).equals(session)) {
				keyList.add(key);
			}
		}
		for(Member listKey : keyList) {
			users.remove(listKey);
		}
	}
	
}
