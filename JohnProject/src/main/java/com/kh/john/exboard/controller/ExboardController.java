package com.kh.john.exboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.exboard.model.service.ExboardService;
import com.kh.john.exboard.model.vo.SessionVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes(value = { "loginnedMember" }) // 세션 처리
public class ExboardController {

	@Autowired
	private ExboardService service;

	@RequestMapping("/expert")
	public ModelAndView expertPage(SessionStatus status) {
		log.debug("expertPage 실행");
		if (!status.isComplete()) {
			status.setComplete();
		}
		ModelAndView mv = new ModelAndView("/exboard/exboardMain");
		return mv;
	}

	@RequestMapping("/expertRtc")
	public ModelAndView expertChatPage(String nick, String num, String ex) {
		log.debug("expertChatPage 실행");
		log.debug(nick + " " + num + " " + ex);
		SessionVo sv = new SessionVo();
		sv.setNickname(nick);
		sv.setCurRoomBid(num);
		if (ex.equals("e")) {
			sv.setExpert(true);
		} else {
			sv.setExpert(false);
		}
		ModelAndView mv = new ModelAndView("/exboard/exchatRoom");
		return mv;
	}

}
