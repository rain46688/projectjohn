package com.kh.john.member.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.john.member.model.service.MemberService;
import com.kh.john.member.model.vo.Member;
import com.kh.john.member.model.vo.MemberMessage;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class MsgListSocketHandler extends TextWebSocketHandler {
	
	@Autowired
	private MemberService service;
	
	Map<Member, WebSocketSession> users= new HashMap<Member, WebSocketSession>();
	private ObjectMapper objectMapper=new ObjectMapper();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug("********메세지 리스트 소켓 핸들러 실행********");
		Map<String, Object> map=session.getAttributes();
		Member member=(Member)map.get("loginMember");
		users.put(member, session);
	}

	

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String, Object> map=session.getAttributes();
		Member member=(Member)map.get("loginMember");
		
		int myUsid=member.getUsid();
		System.out.println("msghandler getusid"+myUsid);
		
		List<Integer> usidList=new ArrayList<Integer>();
		List<Integer> firstUsid=new ArrayList<Integer>();
		List<Integer> secondUsid=new ArrayList<Integer>();
		
		firstUsid=service.firstUsidList(myUsid);
		for(int i=0; i<firstUsid.size(); i++) {
			usidList.add(firstUsid.get(i));
		}
		secondUsid=service.secondUsidList(myUsid);
		secondUsid=service.secondUsid(myUsid);
		for(int i=0; i<secondUsid.size(); i++) {
			if(!usidList.contains(secondUsid.get(i))) {
				usidList.add(secondUsid.get(i));
			}
		}
		
		List<MemberMessage> otherInfo=new ArrayList<MemberMessage>();//mM들어갈 리스트
		
		for(int i=0; i<usidList.size(); i++) {
			MemberMessage mM=new MemberMessage();
			Member mem=new Member();
			HashMap<String, Integer> usidMap=new HashMap<>();//내 usid, 상대 usid 저장용
	
			int otherUsid=usidList.get(i);
			mM.setOtherUsid(otherUsid);
			
			mem.setUsid(otherUsid);
			mem=service.selectMemberByUsid(mem);
			mM.setOtherProfilePic(mem.getProfilePic());
			mM.setOtherNick(mem.getMemNickname());
			
			usidMap.put("myUsid", myUsid);
			usidMap.put("otherUsid", otherUsid);
			MemberMessage mM2=service.loadLatestMessage(usidMap);
			mM.setLatestMessage(mM2.getLatestMessage());
			mM.setLatestDate(mM2.getLatestDate());
			otherInfo.add(mM);
		}
		
		if(message.getPayload().equals("messageListOpen")) {
			session.sendMessage(new TextMessage(objectMapper.writeValueAsString(otherInfo)));
			return;
		}
		if(message.getPayload().equals("messageInserted")) {
			Iterator<Member> it=users.keySet().iterator();//users라는 map 전체를 돌릴 것이다
			while(it.hasNext()) {
				Member key=it.next();//user에 있는 Member객체로 하나씩 뽑아와서 key변수로 지정
				users.get(key).sendMessage(new TextMessage(objectMapper.writeValueAsString(otherInfo)));
			}
		}
		
	}



	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.debug("********메세지 리스트 소켓 핸들러 종료********");
		List<Member> keyList=new ArrayList<Member>();
		Iterator<Member> it=users.keySet().iterator();
		while(it.hasNext()) {
			Member key=it.next();
			if(users.get(key).equals(session)) {
				keyList.add(key);
			}
		}
		for(Member listKey : keyList) {
			users.remove(listKey);
		}
	}

}
