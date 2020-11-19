package com.kh.john.admin.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.john.admin.model.service.AdminService;
import com.kh.john.admin.model.vo.AdminChat;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

@Slf4j
public class AdminSocketHandler extends TextWebSocketHandler {

	@Autowired
	private AdminService service;

	Map<Member, WebSocketSession> users = new HashMap<Member, WebSocketSession>();
	private ObjectMapper objectMapper = new ObjectMapper();


	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		log.debug("핸들러실행됨");
		Map<String, Object> map1 = session.getAttributes();
		Member m = (Member) map1.get("loginMember");
		users.put(m, session);
		
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {


		Map<String, Object> map1 = session.getAttributes();
		Member m = (Member) map1.get("loginMember");
		users.put(m, session);

		List<AdminChat> allChatList=service.selectAdminInChat(m.getUsid()); //db에서 채팅내역 불러옴
		if(message.getPayload().equals("connect")) {
			session.sendMessage(new TextMessage(objectMapper.writeValueAsString(allChatList)));
			return;
		}
		
		//받아온 메세지를 받아오는 것 
		AdminChat acmsg = objectMapper.readValue(message.getPayload(), AdminChat.class);
		
		
		System.out.println(session.getId() + "로부터 메시지 수신:" + message.getPayload());
		
		Iterator<Member> it = users.keySet().iterator();
		
		while(it.hasNext()) {
			Member key = it.next();
			
		}
			for(WebSocketSession s : users.values()) {
				s.sendMessage(message);
			}

		service.insertAdminChat(acmsg);

	
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.debug("핸들러끝");
		List<Member> keyList = new ArrayList<Member>();
		Iterator<Member> it = users.keySet().iterator();
		while (it.hasNext()) {
			Member key = it.next();
			if (users.get(key).equals(session)) {
				keyList.add(key);
			}
		}

		for (Member listkey : keyList) {
			users.remove(listkey);
		}

	}

}
