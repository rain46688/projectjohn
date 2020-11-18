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

@Slf4j	
public class AdminSocketHandler extends TextWebSocketHandler {

	@Autowired
	SqlSession sqlsession;

	@Autowired
	private AdminService service;
	
	Map<Member, WebSocketSession> users = new HashMap<Member, WebSocketSession>();
	private ObjectMapper objectMapper= new ObjectMapper();
	
	List<AdminChat> list = new ArrayList();
	Member m = new Member();
	AdminChat ac = new AdminChat();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug("핸들러실행됨");
		Map<String, Object> map1 = session.getAttributes();
		m = (Member)map1.get("loginMember");
		users.put(m, session);
		log.debug("m:"+m);
		log.debug("닉넴:"+m.getMemNickname());
		
		
		
		Gson gson = new Gson();
		list = service.selectAdminInChat(ac.getAdminUsid());

		//json으로 변경
		String result = gson.toJson(list);
		log.debug(result);
		session.sendMessage(new TextMessage(result));
		
		log.debug("list:"+list);

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		Map<String, Object> map1 = session.getAttributes();
//		Member m = (Member)map1.get("loginMember");
//		users.put(m, session);
		

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
//				
//				System.out.println(session.getId() + "로부터 메시지 수신 : " + message.getPayload());
//				for(WebSocketSession s : users.values()) {
//					s.sendMessage(message);
//					System.out.println(s.getId() + "에 메시지 발송 : " + message.getPayload());
//					System.out.println("s:"+s);
//					System.out.println("message:"+message);
//			}
//			
//			
//		}
//		
//
//		}
		
		

		
		
		AdminChat acmsg = objectMapper.readValue(message.getPayload(), AdminChat.class);
		log.debug("acmsg : "+acmsg);
		
	
		
		System.out.println(session.getId() + "로부터 메시지 수신 : " + message.getPayload());
		for(WebSocketSession s : users.values()) {
			s.sendMessage(message);
			System.out.println(s.getId() + "에 메시지 발송 : " + message.getPayload());
		}
	
		service.insertAdminChat(acmsg);
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
