package com.kh.john.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ExpertRoomInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		log.debug("로그인 채팅 인터셉터");
		if ((Member) session.getAttribute("loginMember") == null) {
			log.debug("로그인 안되있음");
			String path = request.getServletPath();
			log.debug("path : " + path + " " + request.getParameter("bno"));
			// session.setAttribute("URL", path + "?bno=" + request.getParameter("bno"));
			session.setAttribute("bnum", request.getParameter("bno"));
			request.setAttribute("msg", "로그인을 해주세요");
			request.setAttribute("loc", "/memberLogin");
			request.getRequestDispatcher("/msg").forward(request, response);
			return false;
		}
		return true;
		// return super.preHandle(request, response, handler);
	}

}
