package com.kh.john.exboard.socket;

import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ExpertHandler extends TextWebSocketHandler {

//	Map<SessionVo, WebSocketSession> users = new HashMap<SessionVo, WebSocketSession>();
//	private ObjectMapper objectMapper = new ObjectMapper();
//
//	@Override
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		log.info("SocketHandler 실행 시그널링 서버");
//		Map<String, Object> map = session.getAttributes();
//		SessionVo sv = (SessionVo) map.get("loginnedMember");
//		users.put(sv, session);
//		log.info("닉네임 : " + sv.getNickname());
//
//	}
//
//	@Override
//	public void handleTextMessage(WebSocketSession session, TextMessage message)
//			throws InterruptedException, IOException {
//		log.info("handleTextMessage 실행 시그널링 서버");
//
//		RtcMsg msg = objectMapper.readValue(message.getPayload(), RtcMsg.class);
//		log.info("sdp : " + msg.getSdp() + " type : " + msg.getType());
//		Map<String, Object> map = session.getAttributes();
//		SessionVo sv = (SessionVo) map.get("loginnedMember");
//		log.info("users Size : " + users.size());
//		Iterator<SessionVo> it = users.keySet().iterator();
//		while (it.hasNext()) {
//			SessionVo key = it.next();
//			// 같은 방의 인원만
//			if (key.getCurRoomBid().equals(sv.getCurRoomBid())) {
//				if (sv.isHost()) {
//					// 호스트인 경우
//					log.debug("현재 세션 호스트");
//					if (!key.isHost()) {
//						log.debug("현재 세션 호스트 이니깐 참여자한테 메세지 보냄");
//						users.get(key).sendMessage(message);
//					}
//				} else {
//					// 호스트가 아닌경우
//					log.debug("현재 세션 참여자");
//					if (key.isHost()) {
//						log.debug("현재 세션 호스트 아니니깐 호스트한테 메세지 보냄");
//						users.get(key).sendMessage(message);
//					}
//				}
//
//			}
//		}
//
//	}
//
//	@Override
//	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		log.info(" === afterConnectionClosed 실행 === ");
//		List<SessionVo> keyList = new ArrayList<SessionVo>();
//		Iterator<SessionVo> it = users.keySet().iterator();
//		while (it.hasNext()) {
//			SessionVo key = it.next();
//			if (users.get(key).equals(session)) {
//				keyList.add(key);
//			}
//		}
//		for (SessionVo listkey : keyList) {
//			users.remove(listkey);
//		}
//	}

}
