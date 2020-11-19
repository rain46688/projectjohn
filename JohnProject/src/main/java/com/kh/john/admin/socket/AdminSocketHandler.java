package com.kh.john.admin.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.SessionAttribute;
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
		Member member = (Member) map1.get("loginMember");
		users.put(member, session);
		
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		List<AdminChat> allChatList = new ArrayList<AdminChat>();
		
		allChatList=service.selectAdminInChat();
		System.out.println("allchatlist:"+allChatList.get(1));
		
		if(message.getPayload().equals("memberConnected")) {
			session.sendMessage(new TextMessage(objectMapper.writeValueAsString(allChatList)));
			return;
		}
		
		AdminChat ac = new AdminChat();
		ac=objectMapper.readValue(message.getPayload(), AdminChat.class);//읽어온걸 insert
		service.insertAdminChat(ac);
		allChatList=service.selectAdminInChat();
		
		Iterator<Member> it=users.keySet().iterator();//users라는 map 전체를 돌릴 것이다
	      while(it.hasNext()) {
	         Member key=it.next();//user에 있는 Member객체로 하나씩 뽑아와서 key변수로 지정
	         users.get(key).sendMessage(new TextMessage(objectMapper.writeValueAsString(allChatList)));
	      }
		
	  
		
		

	
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
