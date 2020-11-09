package com.kh.john.exboard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.common.exception.RequestDuplicateException;
import com.kh.john.exboard.model.service.ExboardService;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ExboardController {

	@Autowired
	private ExboardService service;

	@RequestMapping("/expert")
	public ModelAndView expertPage(HttpSession session) {
		log.debug("expertPage 실행");
		ModelAndView mv = new ModelAndView("/exboard/exboardMain");
		return mv;
	}

	@RequestMapping("/expertPrintList")
	public ModelAndView expertPrintList() {
		ModelAndView mv = new ModelAndView("/exboard/expertList");
		try {
			mv.addObject("list", service.selectExpert());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error("전문가 리스트 불러오기 실패");
		}
		return mv;
	}

//	@RequestMapping("/expertLogin")
//	public ModelAndView expertLoginPage(String nick, HttpSession session) {
//		log.debug("expertLoginPage 실행");
//		log.debug(nick);
//		SessionVo sv = null;
//		if (session.getAttribute("loginnedMember") == null) {
//			sv = new SessionVo();
//			Member m = null;
//			try {
//				m = service.selectMember(nick);
//				sv.setSessionUsid(m.getUsid());
//			} catch (Exception e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//			sv.setNickname(nick);
//
//			if (m.getMem_class().equals("전문가")) {
//				sv.setExpert(true);
//			} else {
//				sv.setExpert(false);
//			}
//			session.setAttribute("loginnedMember", sv);
//		}
//		ModelAndView mv = new ModelAndView("/exboard/expertList");
//		try {
//			mv.addObject("list", service.selectExpert());
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			log.error("전문가 리스트 불러오기 실패");
//		}
//		return mv;
//	}

	@RequestMapping("/expertApply")
	public ModelAndView expertApply(String no) {
		log.debug("expertApply 실행");
		log.debug("no : " + no);
		ModelAndView mv = new ModelAndView("/exboard/expertApply");
		try {
			mv.addObject("expert", service.selectExpertMem(no));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error("전문가 정보 불러오기 실패");
		}
		return mv;
	}

	@RequestMapping("/expertRequest")
	public ModelAndView expertRequest(String no, String nic, HttpSession session) {
		log.debug("expertRequest 실행");
		log.debug("no : " + no + " nic : " + nic);
		Member mem = (Member) session.getAttribute("loginMember");
		Member expert = new Member();
		expert.setUsid(Integer.parseInt(no));
		expert.setMem_nickname(nic);

		String msg = "";
		String loc = "";
		try {
			service.insertExpertMemRequest(expert, mem);
			msg = "상담 신청 성공";
			loc = "/expertPrintList";
		} catch (RequestDuplicateException e) {
			msg = "이미 상담 신청을 하셨습니다.";
			loc = "/expertPrintList";
			log.error(msg);
		} catch (Exception e) {
			msg = "상담 신청 실패";
			loc = "/expertPrintList";
			log.error(msg);
		}
		ModelAndView mv = new ModelAndView("common/msg");
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		return mv;

		// service.selectIsDuplicateReq();

//		SessionVo expert = new SessionVo();
//		expert.setSessionUsid(Integer.parseInt(no));
//		expert.setNickname(nic);
//		SessionVo mem = (SessionVo) session.getAttribute("loginnedMember");
//		ModelAndView mv = new ModelAndView("common/msg");
//
//		String msg = "";
//		String loc = "";
//		try {
//			service.insertExpertMemRequest(expert, mem);
//			msg = "상담 신청 성공";
//			loc = "/expertLogin";
//		} catch (Exception e) {
//			e.printStackTrace();
//			msg = "상담 신청 실패";
//			loc = "/expertLogin";
//			log.error(msg);
//		}
//		mv.addObject("msg", msg);
//		mv.addObject("loc", loc);
//		return mv;

	}

}
