package com.kh.john.exboard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.exboard.model.service.ExboardService;
import com.kh.john.exboard.model.vo.SessionVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
//@SessionAttributes(value = { "loginnedMember" }) // 세션 처리
public class ExboardController {

	@Autowired
	private ExboardService service;

	@RequestMapping("/expert")
	public ModelAndView expertPage(HttpSession session) {
		log.debug("expertPage 실행");
		session.invalidate();
		log.debug("세션 삭제됨");
		ModelAndView mv = new ModelAndView("/exboard/exboardMain");
		return mv;
	}

	@RequestMapping("/expertLogin")
	public ModelAndView expertLoginPage(String nick, String ex, HttpSession session) {
		log.debug("expertLoginPage 실행");
		log.debug(nick + " " + ex);
		SessionVo sv = new SessionVo();
		sv.setNickname(nick);
		if (ex.equals("e")) {
			sv.setExpert(true);
		} else {
			sv.setExpert(false);
		}
		session.setAttribute("loginnedMember", sv);
		ModelAndView mv = new ModelAndView("/exboard/expertList");
		return mv;
	}

//	@RequestMapping("/expertsms")
//	public ModelAndView expertsms(String phone, String msg) {
//		log.debug("expertsms 실행");
//		log.debug("phone : " + phone + " msg : " + msg);
//		ModelAndView mv = new ModelAndView("/index");
//		return mv;
//	}

}
