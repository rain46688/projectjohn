package com.kh.john.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.john.member.model.vo.Member;

public class MyPageInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Member loginMember=(Member)(request.getSession().getAttribute("loginMember"));
		int usid=Integer.parseInt(request.getParameter("usid"));
		if(loginMember.getUsid()!=usid) {
			request.setAttribute("msg", "접근 불가능한 페이지입니다.");
			request.setAttribute("loc","/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
		return super.preHandle(request, response, handler);
	}
	
}
