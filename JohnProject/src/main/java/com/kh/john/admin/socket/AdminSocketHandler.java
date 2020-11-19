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

//	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
//	//클라이언트가 접속 했을 때 호출될 메소드

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		log.debug("핸들러실행됨");
		Map<String, Object> map1 = session.getAttributes();
		Member m = (Member) map1.get("loginMember");
		users.put(m, session);
		log.debug("m:" + m);
		log.debug("닉넴:" + m.getMemNickname());
		
		
		


		// List<AdminChat> list = service.selectAdminInChat(ac.getAdminUsid()); //x
		// 수정
		// 잭슨으로
		
//		AdminChat ac = new AdminChat();
//		List<AdminChat> list = service.selectAdminInChat(m.getUsid());
//		System.out.println("ac:"+ac.getAdminChatMemUsid());
//		System.out.println("mm:"+m.getUsid());
//		Gson gson = new Gson();
//		String jsonPlace = gson.toJson(list);
//		log.debug(jsonPlace);
//		session.sendMessage(new TextMessage(jsonPlace));

	}

//		list.add(session);
//		System.out.println("하나의 클라이언트가 연결됨 ");
//		}
//		//클라이언트가 메시지를 보냈을 때 호출되는 메소드

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		
		List<AdminChat> allChatList=service.selectAdminInChat();
		session.sendMessage(new TextMessage(objectMapper.writeValueAsString(allChatList)));
		
		
//		Map<String, Object> map1 = session.getAttributes();
//		Member m = (Member)map1.get("loginMember");
//		users.put(m, session);
//		
//
//		log.debug("메세지실행됨");
//		AdminChat acmsg = objectMapper.readValue(message.getPayload(), AdminChat.class);
//		log.debug("acmsg : "+acmsg);
//		
//		Iterator<Member> it = users.keySet().iterator();
//		while(it.hasNext()) {
//			Member key = it.next();
//			System.out.println("key : "+key);
//			if(acmsg.getAdminChatMemUsid()==key.getUsid()) {
//				
//				System.out.println("acmsg.getAdminUsid() : "+acmsg.getAdminUsid());
//				System.out.println("acmsg.getAdminChatMemUsid() : "+acmsg.getAdminChatMemUsid());
//				System.out.println("key.getUsid() :"+key.getUsid());
//				
//				service.insertAdminChat(acmsg);
//				users.get(key).sendMessage(new TextMessage(objectMapper.writeValueAsString(acmsg)));
		AdminChat acmsg = objectMapper.readValue(message.getPayload(), AdminChat.class);
		log.debug("acmsg : " + acmsg);

		System.out.println(session.getId() + "로부터 메시지 수신:" + message.getPayload());
		for (WebSocketSession s : users.values()) {
			s.sendMessage(message);
			System.out.println(s.getId() + "에 메시지 발송:" + message.getPayload());
		}

		service.insertAdminChat(acmsg);
		
		
		
	
	}

	

//		 Gson gson = new Gson(); 
//		 list = service.selectAdminInChat(ac.getAdminUsid());
//		 System.out.println("리스트:"+list); //json으로 변경 String result =
//		 gson.toJson(list); log.debug(result); session.sendMessage(new
//		 TextMessage(result));
//		 
//		 log.debug("list:"+list);

//		AdminChat acmsg = objectMapper.readValue(message.getPayload(), AdminChat.class);
//		log.debug("acmsg : "+acmsg);
//		
//		System.out.println(session.getId() + "로부터 메시지 수신:" + message.getPayload());
//		for(WebSocketSession s : users.values()) {
//			s.sendMessage(message);
//			System.out.println(s.getId() + "에 메시지 발송:" + message.getPayload());
//		}
//	
//		service.insertAdminChat(acmsg);
//		//자바로 받아서 자바 

	// 전송된 메시지를 List의 모든 세션에 전송
//		AdminChat msg = objectMapper.readValue(message.getPayload(), AdminChat.class);
//		//String msg = message.getPayload();
//		for (WebSocketSession s : list) {
//		s.sendMessage(new TextMessage(session.getAcceptedProtocol()+":"+msg));
//		}
//		
//		service.insertAdminChat(msg);
//		System.out.println(msg);

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

//		System.out.println("클라이언트와 연결 해제됨");
//		list.remove(session);
//		}
}
