package com.kh.john.exboard.socket;

import java.io.IOException;
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
import com.kh.john.exboard.controller.ExboardController;
import com.kh.john.exboard.model.service.ExboardService;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ExpertListHandler extends TextWebSocketHandler {

	@Autowired
	private ExboardService service;
	@Autowired
	private ExboardController controller;
	private Map<Member, WebSocketSession> users = new HashMap<Member, WebSocketSession>();
	private ObjectMapper objectMapper = new ObjectMapper();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug(" === afterConnectionEstablished 실행 === ");
		Map<String, Object> map = session.getAttributes();
		Member m = (Member) map.get("loginMember");
		users.put(m, session);
		log.debug("m : " + m);
		log.info("닉네임 : " + m.getMemNickname());
	}

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message)
			throws InterruptedException, IOException {
		log.debug(" === handleTextMessage 실행 === ");

		try {
			if (message.getPayload().equals("1")) {
				log.debug("handleTextMessage 리스트 뽑아오기!");
				Iterator<Member> it = users.keySet().iterator();
				while (it.hasNext()) {
					Member key = it.next();
					users.get(key).sendMessage(
							new TextMessage(objectMapper.writeValueAsString(service.selectExRequestList())));
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.debug(" === afterConnectionClosed 실행 === ");
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
