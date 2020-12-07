package com.kh.john.board.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.BinaryWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import com.kh.john.board.model.vo.BoardChat;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;



@Slf4j
public class BoardImageSocket extends BinaryWebSocketHandler {
	
	private Map <Member, WebSocketSession> allUsers = new HashMap<Member, WebSocketSession>();
	
	private Multimap<Integer, WebSocketSession> rooms = ArrayListMultimap.create();
	
	private Multimap<Integer, BoardChat> roomChat = ArrayListMultimap.create();
	
	private ObjectMapper mapper = new ObjectMapper();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		log.info(session.getId() + " 이미지 소켓 접속");
		Map<String, Object> map = session.getAttributes();
		Member member = (Member)map.get("loginMember");
		allUsers.put(member, session);
	}
	
	@Override
	protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		ByteBuffer payload = (ByteBuffer)message.getPayload();
		if(message.isLast()) {
			String path = BoardImageSocket.class.getResource("/").getPath();
			System.out.println(path);
			System.out.println(path.substring(0,path.lastIndexOf("/target/"))+"/src/main/webapp/resources/images");
			String realPath = path.substring(0,path.lastIndexOf("/target/"))+"/src/main/webapp/";
			Path basePath = Paths.get(realPath, "resources/images", UUID.randomUUID().toString());
			try {
				Files.createDirectories(basePath);
				FileChannel channel = new FileOutputStream(
		                Paths.get(basePath.toString()).toFile(), false).getChannel();
				channel.write(payload);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}

