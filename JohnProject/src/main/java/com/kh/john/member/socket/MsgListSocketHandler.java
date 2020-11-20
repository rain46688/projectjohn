package com.kh.john.member.socket;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
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
import com.kh.john.member.model.vo.MemberChat;
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
		
		if(message.getPayload().equals("messageListOpen")) {
			System.out.println("********msgListOPen");
			List<MemberMessage> otherInfo=loadOtherInfo(session);
			session.sendMessage(new TextMessage(objectMapper.writeValueAsString(otherInfo)));
			return;
		}
		
		MemberChat memberchat=objectMapper.readValue(message.getPayload(), MemberChat.class);
		System.out.println("**********msg핸들러 메소드 실행됨*******");
		Iterator<Member> it=users.keySet().iterator();//users라는 map 전체를 돌릴 것이다
		while(it.hasNext()) {
			Member key=it.next();//user에 있는 Member객체로 하나씩 뽑아와서 key변수로 지정
			if(memberchat.getMchatSecondUsid()==key.getUsid()) {
				List<MemberMessage> otherInfo=loadOtherInfo(users.get(key));
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
	
	private List<MemberMessage> loadOtherInfo(WebSocketSession session){
		
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
			mM.setLatestDateStr(mM2.getLatestDateStr());
			mM.setMyUsid(myUsid);
			otherInfo.add(mM);
		}
		
		Collections.sort(otherInfo,new Comparator<MemberMessage>() {
			@Override
			public int compare(MemberMessage mm1, MemberMessage mm2) {
				SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm");
				Date date1=mm1.getLatestDate();
				Date date2=mm2.getLatestDate();
				try {
					date1=format.parse(mm1.getLatestDateStr());
					date2=format.parse(mm2.getLatestDateStr());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				return date1.compareTo(date2);
			}
		});
		Collections.reverse(otherInfo);
		return otherInfo;
	}

}
