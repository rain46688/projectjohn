package com.kh.john.exboard.socket;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.john.exboard.controller.ExboardController;
import com.kh.john.exboard.model.vo.ExboardMsg;
import com.kh.john.exboard.model.vo.SessionVo;

import lombok.extern.slf4j.Slf4j;

/**
 * @Author : cms
 * @Date : 2020. 12. 8.
 * @explain : 1:1 WebRTC 상담을 위한 핸들러 클래스
 */
@Slf4j
public class ExpertHandler extends TextWebSocketHandler {

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 세션 접속 유저를 담기 위한 맵 설정 & 잭슨 매퍼 생성
	 */
	private Map<SessionVo, WebSocketSession> users = new HashMap<SessionVo, WebSocketSession>();
	private ObjectMapper objectMapper = new ObjectMapper();

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 컨트롤러 의존성 주입
	 */
	@Autowired
	private ExboardController con;

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 온 오픈 실행시 메소드 실행 맵에 세션을 집어넣는 과정
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug("SocketHandler 실행 시그널링 서버");
		Map<String, Object> map = session.getAttributes();
		SessionVo sv = (SessionVo) map.get("loginnedMember");
		users.put(sv, session);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 온 메세지 실행시 실행되는 메소드 같은 방에접속한 상담사와 유저를 이어줌
	 */
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message)
			throws InterruptedException, IOException {

		log.debug("handleTextMessage 실행 시그널링 서버");

		ExboardMsg msg = objectMapper.readValue(message.getPayload(), ExboardMsg.class);
		Map<String, Object> map = session.getAttributes();
		SessionVo sv = (SessionVo) map.get("loginnedMember");

		Iterator<SessionVo> it = users.keySet().iterator();
		while (it.hasNext()) {
			SessionVo key = it.next();
			// 같은 방의 인원만
			if (key.getCurRoomBid().equals(sv.getCurRoomBid())) {
				if (sv.isExpert()) {
					// 호스트인 경우
					// log.debug("현재 세션 호스트");
					if (!key.isExpert()) {
						// log.debug("현재 세션 호스트 이니깐 참여자한테 메세지 보냄");
						users.get(key).sendMessage(new TextMessage(objectMapper.writeValueAsString(msg)));
					}
				} else {
					// 호스트가 아닌경우
					// log.debug("현재 세션 참여자");
					if (key.isExpert()) {
						// log.debug("현재 세션 호스트 아니니깐 호스트한테 메세지 보냄");
						users.get(key).sendMessage(new TextMessage(objectMapper.writeValueAsString(msg)));
					}
				}
			}
		}

		// 온 메세지 종료
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 바이너리로 넘어올시 자동으로 매칭됨, MyServerContainerConfigurer 이 클래스가 설정되어있어야
	 *          메소드가 실행됨 없으면 실행안됨!
	 */
	@Override
	protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		// TODO Auto-generated method stub
		log.debug("handleBinaryMessage 실행");
		ByteBuffer byteBuffer = message.getPayload();
		byte[] byteArray = byteBuffer.array();
		MultipartFile multipartFile = new MockMultipartFile("file", "OriginalName.png", "text/plain", byteArray);
		String renamedFileName = con.socketUploadImg(multipartFile);
		Map<String, Object> map = session.getAttributes();
		SessionVo sv = (SessionVo) map.get("loginnedMember");
		Iterator<SessionVo> it = users.keySet().iterator();
		while (it.hasNext()) {
			SessionVo key = it.next();
			// 같은 방의 인원만
			if (key.getCurRoomBid().equals(sv.getCurRoomBid())) {
				ExboardMsg msg = new ExboardMsg();
				msg.setType("FILE2");
				msg.setMsg(renamedFileName);
				try {
					log.debug("이미지 발송");
					users.get(key).sendMessage(new TextMessage(objectMapper.writeValueAsString(msg)));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
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
		// log.info(" === afterConnectionClosed 실행 === ");
		List<SessionVo> keyList = new ArrayList<SessionVo>();
		Iterator<SessionVo> it = users.keySet().iterator();
		while (it.hasNext()) {
			SessionVo key = it.next();
			if (users.get(key).equals(session)) {
				keyList.add(key);
			}
		}
		for (SessionVo listkey : keyList) {
			users.remove(listkey);
		}
	}

}
