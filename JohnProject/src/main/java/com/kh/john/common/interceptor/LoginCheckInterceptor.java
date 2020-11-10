package com.kh.john.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.john.member.model.vo.Member;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Member login=(Member)(request.getSession().getAttribute("loginMember"));
		
		String msg = "";
		String contextPath = request.getContextPath();
		
		if(login==null||login.getUsid()!=31) {
			request.setAttribute("msg", "관리자만 접근이 가능합니다");
			request.setAttribute("loc", "/");
	
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
			.forward(request, response);
			
			return false;
		}else {
			
		
		
		}
		
		return super.preHandle(request, response, handler);
	}

	

	
}
