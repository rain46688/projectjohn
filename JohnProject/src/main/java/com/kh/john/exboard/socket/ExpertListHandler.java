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
import com.kh.john.exboard.model.service.ExboardService;
import com.kh.john.exboard.model.vo.ExpertBoard;
import com.kh.john.exboard.model.vo.ExpertBoardListVo;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

/**
 * @Author : cms
 * @Date : 2020. 12. 8.
 * @explain : 전문가 상담 게시판 소켓으로 리스트 뿌려주는 핸들러
 */
@Slf4j
public class ExpertListHandler extends TextWebSocketHandler {

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 세션 접속 유저를 담기 위한 맵 설정 & 잭슨 매퍼 생성 & 서비스 주입
	 */
	private Map<Member, WebSocketSession> users = new HashMap<Member, WebSocketSession>();
	private ObjectMapper objectMapper = new ObjectMapper();

	@Autowired
	private ExboardService service;

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 온 오픈 실행시 메소드 실행 맵에 세션을 집어넣는 과정
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug(" === afterConnectionEstablished 실행 === ");
		Map<String, Object> map = session.getAttributes();
		Member m = (Member) map.get("loginMember");
		users.put(m, session);
		log.debug("m : " + m);
		log.info("닉네임 : " + m.getMemNickname());
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 온 메세지 실행시 리스트 뿌려줌 start는 expertRequestList, start2는 expertList
	 */
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message)
			throws InterruptedException, IOException {
		log.debug(" === handleTextMessage 실행 === ");
		try {
			Map<String, Object> map = session.getAttributes();
			Member m = (Member) map.get("loginMember");
			if (message.getPayload().equals("start")) {
				log.debug("handleTextMessage 리스트 뽑아오기!");
				List<ExpertRequest> list = service.selectExRequestList(m);
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
								er.setStartCounsel(false);
							}
						}
					}
				}

				for (ExpertRequest er : list) {
					log.debug("확인용 : " + er);
				}

				Iterator<Member> it = users.keySet().iterator();
				while (it.hasNext()) {
					Member key = it.next();
					users.get(key).sendMessage(new TextMessage(objectMapper.writeValueAsString(list)));
				}
			} else if (message.getPayload().equals("start2")) {
				// 추가 예정
				log.debug("start2");
				List<ExpertBoardListVo> list = service.selectExpertBoardList();
				Iterator<Member> it = users.keySet().iterator();
				while (it.hasNext()) {
					Member key = it.next();
					users.get(key).sendMessage(new TextMessage(objectMapper.writeValueAsString(list)));
				}
			} else if (message.getPayload().equals("start3")) {
				// 추가 예정
				log.debug("start3");
				List<ExpertBoard> list = service.selectExpertReviewList();

				for (ExpertBoard eb : list) {

					SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
					String extime_ = format1.format(eb.getExpertBoardDate());
					eb.setExpertBoardDateString(extime_);
				}

				Iterator<Member> it = users.keySet().iterator();
				while (it.hasNext()) {
					Member key = it.next();
					users.get(key).sendMessage(new TextMessage(objectMapper.writeValueAsString(list)));
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 메소드 종료될때 실행
	 */
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
