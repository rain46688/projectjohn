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

import com.fasterxml.jackson.core.type.TypeReference;
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
		if (m != null) {
			users.put(m, session);
			log.debug("알람 서버 오픈 접속 닉네임 : " + m.getMemNickname());

		} else {
			log.debug("m이 null임.");
		}
	}

//알람 목록 호버하면 나오는 리스트에 시간 초까지 제대로 보이게 수정해보기
// 알람 보내면 상대방한테 제대로 바로 알람 갱신되는지 확인해보기
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		log.debug("알람 서버 handleTextMessage, getPayload :  " + message.getPayload());
		Map<String, Object> map = session.getAttributes();
		Member m = (Member) map.get("loginMember");
		log.info("알람 서버 메세지 접속 닉네임 : " + m.getMemNickname());
		//
		if (message.getPayload().equals("list")) {
			log.debug("알람 리스트 뽑아오기");
			Iterator<Member> lit = users.keySet().iterator();
			while (lit.hasNext()) {
				Member key = lit.next();
				if (m.getUsid() == key.getUsid()) {
					log.debug("자기 usid로 도착한 알람 리스트 자신한테만 뿌려주기");
					sendList(key);
				}
			}
		} else {
			Object oo = objectMapper.readValue(message.getPayload(), Object.class);
			log.debug("자료형 확인 : " + oo.getClass().getName());

			if (oo.getClass().getName().equals("java.util.ArrayList")) {
				log.debug("리스트인 경우");
				List<Alarm> ll = objectMapper.readValue(message.getPayload(), new TypeReference<List<Alarm>>() {
				});
				service.updateAlarmRead(ll);

			} else if (oo.getClass().getName().equals("java.util.LinkedHashMap")) {
				log.debug("다른 객체인 경우");
				Alarm almsg = objectMapper.readValue(message.getPayload(), Alarm.class);
				log.debug("알람 디비 넣기");
				log.debug("almsg : " + almsg);
				// 세션에 접속해있지 않아도 디비에는 넣어야됨!
				// 사용자가 사이트에없어도 알람은 보내야되니깐.
				service.insertExpertAlarm(almsg);
				Iterator<Member> it = users.keySet().iterator();
				while (it.hasNext()) {
					Member key = it.next();
					// 세션에 접속해있는 사람한테 리스트 발송
					if (almsg.getAlarmReceiveMemUsid() == key.getUsid()) {
						log.debug("알람 전송");
						sendList(key);
					}
				}
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

	private void sendList(Member m) {
		log.debug("sendList 메소드 실행");
		List<Alarm> list = null;
		try {
			list = service.selectAlarmList(m.getUsid());
			users.get(m).sendMessage(new TextMessage(objectMapper.writeValueAsString(list)));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
