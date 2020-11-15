package com.kh.john.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.john.member.model.vo.Member;

public class MemberInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Member login=(Member)(request.getSession().getAttribute("loginMember"));
		
		String msg = "";
		String contextPath = request.getContextPath();
		
		if(login==null) {
			request.setAttribute("msg", "로그인 후 이용해주세요");
			request.setAttribute("loc", "/");
	
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
			.forward(request, response);
			
		}
		
		return super.preHandle(request, response, handler);
	}
}
