package com.kh.john.exboard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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
import com.kh.john.member.controller.AES256Util;
import com.kh.john.member.controller.MailHandler;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ExboardController {

	@Autowired
	private ExboardService service;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private AES256Util aes;

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
							if (eb.getEXPERT_BOARD_ADVICE_RESULT() != null) {
								er.setEndCounsel(true);
							}
							log.debug(er.getEXPERT_REQUEST_MEM_NICK() + " START : " + er.getStartCounsel());
							log.debug(er.getEXPERT_REQUEST_MEM_NICK() + " END : " + er.getEndCounsel());
							break;
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
	public String counselStart(HttpServletRequest req, HttpSession session, String no, String nic,
			RedirectAttributes redirectAttributes) {
		log.debug("counselStart 실행");
		String context = "";
		Member expertmem = (Member) session.getAttribute("loginMember");
		int result = 0;
		try {
			log.debug("memusid : " + no);
			log.debug("expertmem : " + expertmem);
			result = service.insertExpertBoard(no, expertmem);
			Member m = service.selectMember(nic);
			String email = m.getMem_email();
			email = aes.decrypt(email);
			log.debug("email : " + email);
			int n = (req.getRequestURL()).indexOf(req.getRequestURI());
			context = (req.getRequestURL()).substring(0, n);
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("상담 채팅 요청이 도착했습니다.)");
			String html = context + "/expertRoom?bno=" + result;
			log.debug("html : " + html);
			sendMail.setText(new StringBuffer().append(html + "<br> 링크를 클릭해서 상담으로 바로가기").toString());
			sendMail.setFrom("minsu87750@gmail.com", "재판하는 존경장님");
			sendMail.setTo(email);
			sendMail.send();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.debug("result : " + result);
		redirectAttributes.addAttribute("bno", result);
		return "redirect:/expertRoom";
	}

	public ModelAndView gotoMsg(ModelAndView mv, String loc, String msg) {
		mv = new ModelAndView("/common/msg");
		mv.addObject("loc", loc);
		mv.addObject("msg", msg);
		return mv;
	}

	// 채팅창 입장
	@RequestMapping("/expertRoom")
	public ModelAndView expertRoom(@RequestParam("bno") String bnum, HttpSession session) {
		log.debug("expertRoom 실행");
		ModelAndView mv = new ModelAndView("/exboard/exchatRoom");
		Member m = (Member) session.getAttribute("loginMember");
		SessionVo s = new SessionVo();
		log.debug("m : " + m);
		// 해당 게시판 넘버에 맞는 유저를 판별하기 위해서 가져옴
		try {
			ExpertBoard eb = service.selectExpertBoard(bnum);
			log.debug(" 상담 결과 : " + eb.getEXPERT_BOARD_ADVICE_RESULT());
			if (m.getMem_class().equals("전문가")) {
				log.debug("전문가");
				if (m.getUsid() != eb.getEXPERT_BOARD_USID()) {
					log.debug("잘못된 접근");
					mv = gotoMsg(mv, "/", "잘못된 접근입니다.");
					return mv;
				} else if (eb.getEXPERT_BOARD_ADVICE_RESULT() != null) {
					log.debug("이미 만료된 상담입니다.");
					mv = gotoMsg(mv, "/", "만료된 상담입니다.");
					return mv;
				}
				s.setExpert(true);
			} else {
				log.debug("전문가 아님");
				if (m.getUsid() != eb.getEXPERT_BOARD_MEM_USID()) {
					log.debug("잘못된 접근2");
					mv = gotoMsg(mv, "/", "잘못된 접근입니다.");
					return mv;
				} else if (eb.getEXPERT_BOARD_ADVICE_RESULT() != null) {
					log.debug("이미 만료된 상담입니다.");
					mv = gotoMsg(mv, "/", "만료된 상담입니다.");
					return mv;
				}
				s.setExpert(false);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		s.setCurRoomBid(bnum);
		s.setNickname(m.getMem_nickname());
		s.setSessionUsid(m.getUsid());
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

	@RequestMapping(value = "/msg")
	public ModelAndView error() throws Exception {
		log.info(" ===== error 실행 ===== ");
		ModelAndView mv = new ModelAndView("/common/msg");
		return mv;
	}

	@RequestMapping(value = "/counselEnd")
	public String counselEnd(String extext, String bno) throws Exception {
		log.info(" ===== counselEnd 실행 ===== ");

		log.debug("extext : " + extext);
		service.updateCounselResult(extext, bno);
		return "redirect:/expertRequestPrintList";
	}
}
