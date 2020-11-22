package com.kh.john.exboard.socket;

import java.io.IOException;
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
import com.kh.john.exboard.controller.ExboardController;
import com.kh.john.exboard.model.service.ExboardService;
import com.kh.john.exboard.model.vo.ExpertBoard;
import com.kh.john.exboard.model.vo.ExpertRequest;
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
			Map<String, Object> map = session.getAttributes();
			Member m = (Member) map.get("loginMember");
			if (message.getPayload().equals("start")) {
				log.debug("handleTextMessage 리스트 뽑아오기!");
				List<ExpertRequest> list = service.selectExRequestList();
				List<ExpertBoard> blist = service.selectExpertBoard(m);

				for (ExpertRequest er : list) {

					SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
					String extime_ = format1.format(er.getExpertDate());
					er.setExpertDateTmp(extime_);

					if (blist.size() == 0) {
						er.setStartCounsel(false);// 신청 내역이 없는 상태 전부 false로 만들어줌
						er.setEndCounsel(false);
					} else {
						for (ExpertBoard eb : blist) {
							if (er.getExpertRequestMemUsid() == eb.getExpertBoardMemUsid()) {
								// expert_board가 있는 상태
								er.setStartCounsel(true);

								if (er.getExpertIscounsel() == 1 && eb.getExpertBoardExpertend() == 1) {
									// 상담 끝난 상태
									er.setEndCounsel(true);
								} else {
									er.setEndCounsel(false);
								}

							} else {
								// 상담 시작 안했다는것 expert_board가 없는 상태
								er.setEndCounsel(false);
							}
						}
					}
				}

				Iterator<Member> it = users.keySet().iterator();
				while (it.hasNext()) {
					Member key = it.next();
					users.get(key).sendMessage(new TextMessage(objectMapper.writeValueAsString(list)));
				}
			} else if (message.getPayload().equals("2")) {
				// 추가 예정
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
