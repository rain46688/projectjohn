package com.kh.john.exboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.john.common.exception.RequestDuplicateException;
import com.kh.john.exboard.model.service.ExboardService;
import com.kh.john.exboard.model.vo.ExpertBoard;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.exboard.model.vo.SessionVo;
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

	// 전문가 리스트들 불러오기
	@RequestMapping("/expertPrintList")
	public ModelAndView expertPrintList() {
		log.debug("expertPrintList 실행");
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

	// 전문가 상세 프로필 보는곳 여기서 상담 신청 가능
	@RequestMapping("/expertApply")
	public ModelAndView expertApply(String no, String nic, HttpSession session) {
		log.debug("expertApply 실행");
		log.debug("no : " + no + " nic : " + nic);
		Member mem = (Member) session.getAttribute("loginMember");
		Member expert = new Member();
		expert.setUsid(Integer.parseInt(no));
		expert.setMem_nickname(nic);
		ModelAndView mv = new ModelAndView("/exboard/expertApply");
		try {
			mv.addObject("expert", service.selectExpertMem(no));
			mv.addObject("requestIsDuplicate", service.selectIsDuplicateReq(expert, mem));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error("전문가 정보 불러오기 실패");
		}
		return mv;
	}

	// 상담 신청 버튼 눌렀을때
	@ResponseBody
	@RequestMapping("/expertRequest")
	public String expertRequest(String no, String nic, HttpSession session) {
		log.debug("expertRequest 실행");
		log.debug("no : " + no + " nic : " + nic);
		Member mem = (Member) session.getAttribute("loginMember");
		Member expert = new Member();
		expert.setUsid(Integer.parseInt(no));
		expert.setMem_nickname(nic);

		String result = "";
		try {
			service.insertExpertMemRequest(expert, mem);
			result = "1";
		} catch (RequestDuplicateException e) {
			result = "2";
		} catch (Exception e) {
			result = "0";
		}
		return result;

	}

	// 상담 신청 취소 버튼 눌렀을때
	@ResponseBody
	@RequestMapping("/expertRequestCancel")
	public String expertRequestCancel(String no, String nic, HttpSession session) {
		log.debug("expertRequestCancel 실행");
		log.debug("no : " + no + " nic : " + nic);
		Member mem = (Member) session.getAttribute("loginMember");
		Member expert = new Member();
		expert.setUsid(Integer.parseInt(no));
		expert.setMem_nickname(nic);

		String result = "";
		try {
			service.deleteExpertMemRequest(expert, mem);
			result = "1";
		} catch (Exception e) {
			result = "0";
		}
		return result;
	}

	// 전문가가 자신한테 유저들이 신청한 리스트 출력하기
	@RequestMapping("/expertRequestPrintList")
	public ModelAndView expertRequestPrintList(HttpSession session) {
		log.debug("expertRequestPrintList 실행");
		ModelAndView mv = new ModelAndView("/exboard/expertRequestList");
		Member mem = (Member) session.getAttribute("loginMember");
		try {

			List<ExpertRequest> rlist = service.selectExpertRequest(mem);
			List<ExpertBoard> blist = service.selectExpertBoard(mem);

			for (ExpertRequest er : rlist) {

				if (blist.size() == 0) {
					er.setStartCounsel(false);
				} else {
					for (ExpertBoard eb : blist) {
						if (er.getEXPERT_REQUEST_MEM_USID() == eb.getEXPERT_BOARD_MEM_USID()) {
							// 이미 상담 게시판이 만들어진 유저
							er.setStartCounsel(true);
							log.debug("er : " + er.getStartCounsel());
						} else {
							er.setStartCounsel(false);
						}
					}
				}

			}

			mv.addObject("list", rlist);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error("상담 유저 리스트 불러오기 실패");
		}
		return mv;
	}

	// 상담 게시판 개설
	@RequestMapping("/counselStart")
	public String counselStart(HttpSession session, String no, RedirectAttributes redirectAttributes) {
		log.debug("counselStart 실행");
		Member expertmem = (Member) session.getAttribute("loginMember");
		int result = 0;
		try {
			log.debug("memusid : " + no);
			log.debug("expertmem : " + expertmem);
			result = service.insertExpertBoard(no, expertmem);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.debug("result : " + result);
		redirectAttributes.addAttribute("bno", result);
		return "redirect:/expertRoom";
	}

	// 채팅창 입장
	@RequestMapping("/expertRoom")
	public ModelAndView expertRoom(@RequestParam("bno") String bnum, HttpSession session) {
		ModelAndView mv = new ModelAndView("/exboard/exchatRoom");
		Member m = (Member) session.getAttribute("loginMember");
		SessionVo s = new SessionVo();
		s.setCurRoomBid(bnum);
		s.setNickname(m.getMem_nickname());
		s.setSessionUsid(m.getUsid());
		if (m.getMem_class().equals("전문가")) {
			s.setExpert(true);
		} else {
			s.setExpert(false);
		}
		session.setAttribute("loginnedMember", s);
		mv.addObject("bno", bnum);
		return mv;
	}

	// 상담 게시판 개설
	@RequestMapping("/counselConn")
	public String counselConnction(HttpSession session, String no, RedirectAttributes redirectAttributes) {
		log.debug("counselConnction 실행");
		Member expertmem = (Member) session.getAttribute("loginMember");

		int bno = 0;
		try {
			bno = service.selectExBoardNum(expertmem, no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		redirectAttributes.addAttribute("bno", bno);
		return "redirect:/expertRoom";
	}

}
