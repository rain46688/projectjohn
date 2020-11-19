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
		log.debug("********멤버 소켓 핸들러 실행********");
		Map<String, Object> map=session.getAttributes();
		Member member=(Member)map.get("loginMember");
		users.put(member, session);
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {		
		List<MemberChat> allChatList=service.loadAllChatList();
		if(message.getPayload().equals("connect")) {
			session.sendMessage(new TextMessage(objectMapper.writeValueAsString(allChatList)));
			return;
		}
		
		MemberChat memberChat=objectMapper.readValue(message.getPayload(), MemberChat.class);//JSON으로 받은 메세지를 해석해서 memberChat 객체에 저장
		log.debug("memberChat"+ memberChat);
		service.insertMemberChat(memberChat);//저장
		
		allChatList=service.loadAllChatList();
		//map을 반복문 돌릴 수 있도록 해주는 것
		Iterator<Member> it=users.keySet().iterator();//users라는 map 전체를 돌릴 것이다
		while(it.hasNext()) {
			Member key=it.next();//user에 있는 Member객체로 하나씩 뽑아와서 key변수로 지정
			users.get(key).sendMessage(new TextMessage(objectMapper.writeValueAsString(allChatList)));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.debug("********멤버 소켓 핸들러 종료********");
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
