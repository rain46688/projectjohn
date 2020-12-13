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

/**
 * @Author : cms
 * @Date : 2020. 12. 8.
 * @explain : 알람 컨텐츠 소켓으로 리스트 뿌려주는 핸들러
 */
@Slf4j
public class AlarmSocketHandler extends TextWebSocketHandler {

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 세션 접속 유저를 담기 위한 맵 설정 & 잭슨 매퍼 생성 & 서비스 주입
	 */
	private Map<Member, WebSocketSession> users = new HashMap<Member, WebSocketSession>();
	private ObjectMapper objectMapper = new ObjectMapper();

	@Autowired
	private AlarmService service;

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 온 오픈 실행시 메소드 실행 맵에 세션을 집어넣는 과정
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		log.debug("알람 서버 afterConnectionEstablished");
		Map<String, Object> map = session.getAttributes();
		Member m = (Member) map.get("loginMember");
		if (m != null) {
			users.put(m, session);
			log.debug(" === 알람 서버 오픈 접속 닉네임 : " + m.getMemNickname() + " === ");
		} else {
			log.debug(" === m 객체 null === ");
		}
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 알람 상대방한테 발송해주는것 리스트 뽑아오는것도 같이함 세션에 접속해있지 않아도 디비에는 넣어야됨! 사용자가 사이트에
	 *          접속안되어있어도 알람은 보내야되니깐.
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		log.debug("알람 서버 handleTextMessage, getPayload :  " + message.getPayload());
		Map<String, Object> map = session.getAttributes();
		Member m = (Member) map.get("loginMember");
		log.info("알람 서버 메세지 접속 닉네임 : " + m.getMemNickname());

		// 알람 리스트 뽑아오는것 드롭 다운 알람
		if (message.getPayload().equals("list")) {
			log.debug(" === list 부분 분기 실행 === ");
			Iterator<Member> lit = users.keySet().iterator();
			while (lit.hasNext()) {
				Member key = lit.next();
				if (m.getUsid() == key.getUsid()) {
					log.debug(" === <m.getUsid() == key.getUsid()> 부분 분기 실행 === ");
					sendList(key);
				}
			}
		} else {
			log.debug(" === else 부분 분기 실행 === ");
			Object oo = objectMapper.readValue(message.getPayload(), Object.class);
			log.debug("넘어온 자료형 확인 : " + oo.getClass().getName());

			if (oo.getClass().getName().equals("java.util.ArrayList")) {
				log.debug(" === java.util.ArrayList인 경우 분기 === ");
				List<Alarm> ll = objectMapper.readValue(message.getPayload(), new TypeReference<List<Alarm>>() {
				});
				// 읽음 처리로 만들기
				service.updateAlarmRead(ll);
				log.debug(" === 읽음 처리 === ");
			} else if (oo.getClass().getName().equals("java.util.LinkedHashMap")) {
				log.debug(" === java.util.LinkedHashMap인 경우 분기 === ");
				Alarm almsg = objectMapper.readValue(message.getPayload(), Alarm.class);
				log.debug("알람 객체 : " + almsg);
				log.debug(" === 알람 디비 넣기 === ");
				service.insertExpertAlarm(almsg);
				Iterator<Member> it = users.keySet().iterator();
				while (it.hasNext()) {
					Member key = it.next();
					log.debug(" === 알람 전송 === ");
					sendList(key);
				}
			}
		}
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 메소드 종료될때 실행
	 */
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

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 리스트 발송하는 메소드 따로 빼놓음
	 */
	private void sendList(Member m) {
		log.debug(" === sendList 메소드 실행 === ");
		List<Alarm> list = null;
		try {
			list = service.selectAlarmList(m.getUsid());
			users.get(m).sendMessage(new TextMessage(objectMapper.writeValueAsString(list)));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.debug(" === sendList 에러 === ");
		}
	}

}
