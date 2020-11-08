package com.kh.john.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.member.model.service.MemberService;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("/")
	public ModelAndView mainPage() {
		log.debug("mainPage 실행");
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("list", service.selectMember());
		return mv;
	}
	
	@RequestMapping("/member/memberLogin")
	public String enterPage() {
		return "/member/memberLogin";
	}
	
	@RequestMapping("/member/memberLoginEnd")
	public ModelAndView loginPage(ModelAndView mv) {
		
		mv.setViewName("/board/boardList");
		
		return mv;
	}
	
	@RequestMapping("/member/signUp")
	public ModelAndView signUpPage(ModelAndView mv) {
		mv.setViewName("/member/signUp");
		return mv;
	}
	
	@RequestMapping(value= "/member/certiEmail", method = RequestMethod.POST)
	public ModelAndView certiEmail(HttpServletRequest request, ModelAndView mv) throws Exception {
		String email=request.getParameter("email");
		String authKey=service.sendAuthKey(email);
        mv.addObject("authKey",authKey);
        mv.setViewName("member/certiResult");
		return mv;
	}

}
