package com.kh.john.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.member.model.service.MemberService;

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

}
