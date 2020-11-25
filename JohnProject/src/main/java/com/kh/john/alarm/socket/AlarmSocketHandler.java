package com.kh.john.alarm.socket;

import java.text.SimpleDateFormat;
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

	private Map<Member, WebSocketSession> users = new HashMap<Member, WebSocketSession>();
	private ObjectMapper objectMapper = new ObjectMapper();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		log.debug("알람 서버 afterConnectionEstablished");
		Map<String, Object> map = session.getAttributes();
		Member m = (Member) map.get("loginMember");
		users.put(m, session);
		log.debug("m : " + m);
		log.info("닉네임 : " + m.getMemNickname());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		log.debug("알람 서버 handleTextMessage, getPayload :  " + message.getPayload());
		//
		Map<String, Object> map = session.getAttributes();
		Member m = (Member) map.get("loginMember");
		log.debug("유저 : " + m);
		if (message.getPayload().equals("list")) {
			log.debug("list 가져오기 실행, 닉네임 :  " + m.getMemNickname());

			Iterator<Member> lit = users.keySet().iterator();
			while (lit.hasNext()) {
				Member key = lit.next();
				if (m.getUsid() == key.getUsid()) {
					log.debug(m.getMemNickname() + "인 나 자신한테만 쏘기 : " + key.getMemNickname());
					sendList(key);
				}
			}
		} else {
//			Alarm almsg = objectMapper.readValue(message.getPayload(), Alarm.class);
//			log.debug("almsg : " + almsg);
//			Iterator<Member> it = users.keySet().iterator();
//			while (it.hasNext()) {
//				Member key = it.next();
//				if (almsg.getAlarmReceiveMemUsid() == key.getUsid()) {
//					log.debug("알람 디비 넣기");
//					service.insertExpertAlarm(almsg);
//					// users.get(key).sendMessage(new
//					// TextMessage(objectMapper.writeValueAsString(almsg)));
//					sendList(key);
//				}
//			}
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

	private void sendList(Member m) {
		List<Alarm> list = null;
		try {
			list = service.selectAlarmList(m.getUsid());
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			for (Alarm a : list) {
				String date = fmt.format(a.getAlarmDate());
				log.debug("a : " + a);
				a.setTmpDate(date);
			}
			users.get(m).sendMessage(new TextMessage(objectMapper.writeValueAsString(list)));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
