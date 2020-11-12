package com.kh.john.alarm.socket;

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
import com.kh.john.alarm.model.service.AlarmService;
import com.kh.john.alarm.model.vo.Alarm;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AlarmSocketHandler extends TextWebSocketHandler {

	@Autowired
	private AlarmService service;

	Map<Member, WebSocketSession> users = new HashMap<Member, WebSocketSession>();
	private ObjectMapper objectMapper = new ObjectMapper();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		log.debug("알람 서버 afterConnectionEstablished");
		Map<String, Object> map = session.getAttributes();
		Member m = (Member) map.get("loginMember");
		users.put(m, session);
		log.debug("m : " + m);
		log.info("닉네임 : " + m.getMem_nickname());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		log.debug("알람 서버 handleTextMessage");
		Alarm almsg = objectMapper.readValue(message.getPayload(), Alarm.class);

		log.debug("almsg : " + almsg);

		Iterator<Member> it = users.keySet().iterator();
		while (it.hasNext()) {
			Member key = it.next();
			if (almsg.getAlarmReceiveMemUsid() == key.getUsid()) {
				service.insertExpertAlarm(almsg);
				users.get(key).sendMessage(new TextMessage(objectMapper.writeValueAsString(almsg)));
			}
		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		log.debug("알람 서버 afterConnectionClosed");
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
