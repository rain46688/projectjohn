package com.kh.john.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.john.board.model.service.BoardService;
import com.kh.john.board.model.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class BoardListSocket extends TextWebSocketHandler  {
	
	@Autowired
	private BoardService service;
	
	private ObjectMapper mapper = new ObjectMapper();
	
	private List<WebSocketSession> sessions = new ArrayList();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		log.info(session.getId() + "접속");
		sessions.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		String messageFromClient = message.getPayload();
		if(messageFromClient.equals("boardList")) {
			List<Board> list = service.boardList();
			session.sendMessage(new TextMessage(mapper.writeValueAsString(list)));
		}
		if(messageFromClient.equals("boardInsertSuccess")) {
			List<Board> list = service.boardList();
			for(WebSocketSession sess : sessions) {
				sess.sendMessage(new TextMessage(mapper.writeValueAsString(list)));
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		sessions.remove(session);
	}
}
