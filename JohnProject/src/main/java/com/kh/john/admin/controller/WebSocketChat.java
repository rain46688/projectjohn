//package com.kh.john.admin.controller;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.Collections;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpServlet;
//import javax.websocket.OnClose;
//import javax.websocket.OnMessage;
//import javax.websocket.OnOpen;
//import javax.websocket.Session;
//import javax.websocket.server.ServerEndpoint;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.socket.BinaryMessage;
//import org.springframework.web.socket.WebSocketSession;
//import org.springframework.web.socket.handler.TextWebSocketHandler;
//
//import com.kh.john.exboard.socket.ExpertHandler;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//@Controller
//@ServerEndpoint("/customer/customerChat")
//public class WebSocketChat extends TextWebSocketHandler {
//	
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
//	private static Map<Session,String> users = Collections.synchronizedMap(new HashMap<Session, String>());
//	
//
//	 @RequestMapping(value="/customer/customerChat") //내가 추가한 메소드
//	    public ModelAndView getChatViewPage(ModelAndView mav) {
//	        mav.setViewName("customer/customerChat");
//	        return mav;
//	    }
//	 
//	
//	@OnMessage
//	public void onMsg(String message, WebSocketSession session) throws Exception{
//		//hs.getAttribute("mem_nickname");
//		//String userName = users.get(session);
//		
//		//String userName = (String)hs.getAttribute("mem_nickname");
//		Map<String,Object> map = session.getAttributes();
//		  String userName = (String)map.get("mem_nickname");
//		  System.out.println("로그인 한 아이디 : " + userName);
//
//		
//		System.out.println(userName + " : " + message);
//		
//		synchronized (users) {
//			Iterator<Session> it = users.keySet().iterator();
//			while(it.hasNext()){
//				Session currentSession = it.next();
//				if(!currentSession.equals(session)){
//					currentSession.getBasicRemote().sendText(userName + " : " + message);
//				}
//			}
//		}
//		
//	}
//	
//	@OnOpen
//	public void onOpen(Session session) throws IOException{
//		System.out.println(session);
//		String userName = "user" + (int)(Math.random()*100);
//		users.put(session, userName);
//		sendNotice(userName + "님이 입장하셨습니다. 현재 사용자 " + users.size() + "명");
//	}
//	
//	
//	public void sendNotice(String message) throws IOException{
//		String userName = "server";
//		System.out.println(userName + " : " + message);
//		
//		synchronized (users) {
//			Iterator<Session> it = users.keySet().iterator();
//			while(it.hasNext()){
//				Session currentSession = it.next();
//				currentSession.getBasicRemote().sendText(userName + " : " + message);
//			}
//		}
//	}
//
//	@OnClose
//	public void onClose(Session session) throws IOException{
//		String userName = users.get(session);
//		users.remove(session);
//		sendNotice(userName + "님이 퇴장하셨습니다. 현재 사용자 " + users.size() + "명");
//	}
//
//}