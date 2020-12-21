package com.kh.john.exboard.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.john.common.exception.RequestDuplicateException;
import com.kh.john.exboard.model.service.ExboardService;
import com.kh.john.exboard.model.vo.ExpertBoard;
import com.kh.john.exboard.model.vo.SessionVo;
import com.kh.john.member.controller.AES256Util;
import com.kh.john.member.controller.MailHandler;
import com.kh.john.member.model.vo.Expert;
import com.kh.john.member.model.vo.License;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

/**
 * @Author : cms
 * @Date : 2020. 12. 8.
 * @explain : 전문가 컨트롤러
 */

@Controller
@Slf4j
public class ExboardController {

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 의존성 주입 및 파일 업로드 PATH 설정
	 */

	@Autowired
	private ExboardService service;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private AES256Util aes;

	private static String pathzz;

	@RequestMapping("/expert/1")
	public ModelAndView test1() {
		log.debug("에러");
		ModelAndView mv = new ModelAndView("/common/1");
		return mv;
	}

	@RequestMapping("/expert/2")
	public ModelAndView test2() {
		log.debug("에러");
		ModelAndView mv = new ModelAndView("/common/2");
		return mv;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 9.
	 * @explain : 전문가 리스트들 불러오기
	 */
	@RequestMapping("/expert/expertPrintList")
	public ModelAndView expertPrintList() {
		log.debug("expertPrintList2 실행");
		ModelAndView mv = new ModelAndView("/exboard/expertList");
		return mv;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 9.
	 * @explain : 전문가 정보 수정 페이지 기존 정보 가져와서 뿌려주기
	 */
	@RequestMapping("/member/myPage/expertInfoModify")
	public ModelAndView expertInfoModify(HttpSession session) throws Exception {
		log.info(" ===== expertInfoModify 실행 ===== ");
		ModelAndView mv = new ModelAndView("/exboard/expertInfoModify");
		try {
			mv.addObject("expert",
					service.selectExpertMem("" + ((Member) session.getAttribute("loginMember")).getUsid()));
			mv.addObject("license",
					service.selectExpertLicense("" + ((Member) session.getAttribute("loginMember")).getUsid()));
			mv.addObject("mem", service.selectMember("" + ((Member) session.getAttribute("loginMember")).getUsid()));
			mv.addObject("likindList", service.selectLicenseKind());
			mv.addObject("coukindList", service.selectCounselKind());
			mv.addObject("comkindList", service.selectCompanyKind());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return mv;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 전문가 페이지 임시 메인
	 */
	@RequestMapping("/expert")
	public ModelAndView expertPage(HttpSession session) {
		log.debug("expertPage 실행");
		ModelAndView mv = new ModelAndView("/exboard/exboardMain");
		return mv;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 전문가가 자신한테 유저들이 신청한 리스트 출력하기
	 */
	@RequestMapping("/member/myPage/expertRequestPrintList")
	public ModelAndView expertRequestPrintList(HttpSession session) {
		log.debug("expertRequestPrintList 실행");
		ModelAndView mv = new ModelAndView("/exboard/expertRequestList");
		return mv;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 전문가 상세 프로필 보는곳 여기서 상담 신청 가능
	 */
	@RequestMapping("/expert/expertApply")
	public ModelAndView expertApply(String no, String nic, HttpSession session) {
		log.debug("expertApply 실행");
		log.debug("no : " + no + " nic : " + nic);
		Member mem = (Member) session.getAttribute("loginMember");
		Member expert = new Member();
		expert.setUsid(Integer.parseInt(no));
		expert.setMemNickname(nic);
		ModelAndView mv = new ModelAndView("/exboard/expertApply");
		try {
			// map에다가 넣고 파라미터로 넘김
			Map<String, String> map = new HashMap<String, String>();
			map.put("exusid", "" + expert.getUsid());
			map.put("memusid", "" + mem.getUsid());
			Member mm = service.selectMember(no);
			try {
				// 복호화
				mm.setMemEmail(aes.decrypt(mm.getMemEmail()));
				mm.setTel(aes.decrypt(mm.getTel()));
			} catch (Exception e) {

			}
			mv.addObject("mem", mm);
			mv.addObject("expert", service.selectExpertMem(no));
			mv.addObject("license", service.selectExpertLicense(no));
			mv.addObject("requestIsDuplicate", service.selectIsDuplicateReq(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error("전문가 정보 불러오기 실패");
		}
		return mv;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 상담 신청 버튼 눌렀을때
	 */
	@ResponseBody
	@RequestMapping("/expert/expertRequest")
	public String expertRequest(String no, String nic, String time, String applyText, HttpSession session) {
		log.debug("expertRequest 실행");
		log.debug("no : " + no + " nic : " + nic + " time : " + time + " applyText : " + applyText);
		Member mem = (Member) session.getAttribute("loginMember");
		Member expert = new Member();
		expert.setUsid(Integer.parseInt(no));
		expert.setMemNickname(nic);
		time = time.replace("T", " ");

		// 큰 숫자는 그냥 구분하기 위한 숫자
		if (time.equals("") || time == null) {
			log.debug("예상 시간을 입력하지 않았을 경우");
			return "9998";
		}

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date time_ = null;
		try {
			time_ = format1.parse(time);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Date now = new Date();
		int compare = now.compareTo(time_);
		if (compare > 0) {
			log.debug("현재 시간보다 과거를 선택했음");
			return "9999";
		}

		Map<String, String> map = new HashMap<String, String>();
		map.put("exusid", "" + expert.getUsid());
		map.put("exnick", expert.getMemNickname());
		map.put("memusid", "" + mem.getUsid());
		map.put("memnick", mem.getMemNickname());
		map.put("time", time);
		map.put("applyText", applyText);

		String result = "";
		try {
			service.insertExpertMemRequest(map);
			result = "1";
		} catch (RequestDuplicateException e) {
			result = "2";
		} catch (Exception e) {
			result = "0";
		}
		return result;

	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 상담 신청 취소 버튼 눌렀을때
	 */
	@ResponseBody
	@RequestMapping("/expert/expertRequestCancel")
	public String expertRequestCancel(String no, String nic, HttpSession session) {
		log.debug("expertRequestCancel 실행");
		log.debug("no : " + no + " nic : " + nic);
		Member mem = (Member) session.getAttribute("loginMember");
		Member expert = new Member();
		expert.setUsid(Integer.parseInt(no));
		expert.setMemNickname(nic);

		String result = "";
		try {
			result = "" + service.deleteExpertMemRequest(expert, mem);
		} catch (Exception e) {
			result = "1";
		}
		log.debug("zzre : " + result);
		return result;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 전문가 게시판을 생성하고 해당 게시판의 ID값을 가져와서 반환함
	 */
	@ResponseBody
	@RequestMapping("/expert/selectExpertBno")
	public String selectExpertBno(HttpSession session, String no, String nic) {
		String result = "";
		Member expertmem = (Member) session.getAttribute("loginMember");
		try {
			result = "" + service.insertExpertBoard(no, nic, expertmem);
			log.debug("result : " + result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 상담 게시판 개설, 처음에 유저랑 상담사가 상담 할때 한번 실행되고 나머진 연결로만됨
	 */
	@RequestMapping("/expert/counselStart")
	public String counselStart(HttpServletRequest req, String no, String nic, String bno,
			RedirectAttributes redirectAttributes) {
		log.debug("counselStart 실행");
		log.debug("no : " + no + " nic : " + nic);
		String context = "";
		log.debug("bno : " + bno);
		int result = Integer.parseInt(bno);
		try {
			Member m = service.selectMember(no);
			String email = m.getMemEmail();
			email = aes.decrypt(email);
			log.debug("email : " + email);
			int n = (req.getRequestURL()).indexOf(req.getRequestURI());
			context = (req.getRequestURL()).substring(0, n);
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("상담 채팅 요청이 도착했습니다.)");
			String html = context + "/john/expert/expertRoom?bno=" + result;
			log.debug("html : " + html);
			sendMail.setText(new StringBuffer().append(html + "<br> 링크를 클릭해서 상담으로 바로가기").toString());
			sendMail.setFrom("minsu87750@gmail.com", "재판하는 존경장님");
			sendMail.setTo(email);
			sendMail.send();
			// 상담하는 유저의 메일로 이메일 발송하기 원래는 문자였지만 사정상 이렇게 대체
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.debug("result : " + result);
		redirectAttributes.addAttribute("bno", result);
		return "redirect:/expert/expertRoom";
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 채팅창 입장
	 */
	@RequestMapping("/expert/expertRoom")
	public ModelAndView expertRoom(@RequestParam("bno") String bnum, HttpSession session, HttpServletRequest request) {
		log.debug("expertRoom 실행");
		pathzz = request.getServletContext().getRealPath("/resources/upload_images");
		log.debug("pathzz : " + pathzz);
		ModelAndView mv = new ModelAndView("/exboard/exchatRoom");
		Member m = (Member) session.getAttribute("loginMember");
		SessionVo s = new SessionVo();
		ExpertBoard eb;
		log.debug("m : " + m);
		// 해당 게시판 넘버에 맞는 유저를 판별하기 위해서 가져옴
		try {
			eb = service.selectExpertBoard(bnum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			eb = null;
		}
		log.debug("eb : " + eb);// 없으면 아예 없는 방이라는뜻
		// 쿼리스트링에 방넘버가 없거나 있지도 않는 방에 접근할때
		if (eb == null || bnum.equals("") || bnum == null) {
			log.debug("잘못된 접근");
			mv = gotoMsg(mv, "/", "잘못된 접근입니다.");
			return mv;
		}

		// 만료된 상담에 접근할때
		if (eb.getExpertBoardExpertend() == 1 && eb.getExpertBoardMemberend() == 1) {
			mv = gotoMsg(mv, "/", "만료된 상담입니다.");
			return mv;
		}

		// 해당 방의 유저 이외에 사람들이 접근할때 에러
		if (m.getMemClass().equals("전문가")) {
			if (m.getUsid() != eb.getExpertBoardUsid()) {
				mv = gotoMsg(mv, "/", "잘못된 접근입니다.");
				return mv;
			}
			s.setExpert(true);
		} else {
			if (m.getUsid() != eb.getExpertBoardMemUsid()) {
				mv = gotoMsg(mv, "/", "잘못된 접근입니다.");
				return mv;
			}
			s.setExpert(false);
		}

		s.setCurRoomBid(bnum);
		s.setNickname(m.getMemNickname());
		s.setSessionUsid(m.getUsid());
		session.setAttribute("loginnedMember", s);
		mv.addObject("bno", bnum);
		mv.addObject("eb", eb);
		return mv;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 전문가가 상담 게시판 접속 이미 생성된 상태에서 접속하는것
	 */
	@RequestMapping("/expert/counselConn")
	public String counselConnction(HttpSession session, String no, String nick, RedirectAttributes redirectAttributes) {
		log.debug("counselConnction 실행");
		Member expertmem = (Member) session.getAttribute("loginMember");
		log.debug("no : " + no + " nick : " + nick);
		int bno = 0;
		try {
			bno = service.selectExBoardNum(expertmem, no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		redirectAttributes.addAttribute("bno", bno);
		return "redirect:/expert/expertRoom";
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 에러 메세지 매핑용
	 */
	@RequestMapping(value = "/msg")
	public ModelAndView error() throws Exception {
		log.info(" ===== error 실행 ===== ");
		ModelAndView mv = new ModelAndView("/common/msg");
		return mv;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 에러 메세지용 메소드
	 */
	public ModelAndView gotoMsg(ModelAndView mv, String loc, String msg) {
		mv = new ModelAndView("/common/msg");
		mv.addObject("loc", loc);
		mv.addObject("msg", msg);
		return mv;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 상담 종료
	 */
	@RequestMapping(value = "/expert/counselEnd")
	public String counselEnd(String extext, String bno, RedirectAttributes redirectAttributes, HttpSession session)
			throws Exception {
		log.info(" ===== counselEnd 실행 ===== ");

		log.debug("extext : " + extext + "bno : " + bno);

		int result = service.updateCounselResult(extext, bno);

		if (result == 1) {// 1이면 정상 종료
			log.debug("extext : 정상종료");
			redirectAttributes.addAttribute("usid", ((Member) session.getAttribute("loginMember")).getUsid());
			return "redirect:/member/myPage/expertRequestPrintList";
		}
		// 아니면 비정상 종료
		redirectAttributes.addAttribute("loc", "/member/myPage/expertRequestPrintList");
		redirectAttributes.addAttribute("msg", "잘못된 종료 관리자에게 문의하세요");
		log.debug("extext : 비정상종료");
		return "redirect:/msg";
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 웹소켓 파일 업로드 하기
	 */
	public String socketUploadImg(MultipartFile upFile) {
		log.debug("socketUploadImg실행");
		String originalFileName = upFile.getOriginalFilename();
		String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HHmmssSSS");
		int rndNum = (int) (Math.random() * 1000);
		String renamedFileName = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + "." + ext;
		try {
			upFile.transferTo(new File(pathzz + "/" + renamedFileName));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return renamedFileName;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 파일 업로드용 전문가 상담
	 */
	@ResponseBody
	@RequestMapping("/expert/upload")
	public String expertuUploadll(MultipartFile[] upFile, HttpServletRequest request) {
		log.debug("expertuUploadll 실행");

		log.debug("upFile : " + upFile);
		log.debug("자료형 확인 : " + upFile);

		String result = "";
		String path = request.getServletContext().getRealPath("/resources/upload_images");
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < upFile.length; i++) {
			log.debug(" ================================ ");
			log.debug("파일명 : " + upFile[i].getOriginalFilename());
			log.debug("파일크기 : " + upFile[i].getSize());
		}
		File dir = new File(path);
		if (!dir.exists()) {
			// 지정된 경로의 폴더가 없으면
			dir.mkdirs();// s넣으면 중간 경로 없어도 알아서 만들어주는것!!
		}

		// 파일 업로드 로직 처리하기
		for (MultipartFile f : upFile) {
			if (!f.isEmpty()) {
				// 전달된 파일이 있으면... 파일 업로드 처리
				// 파일 리네임 처리 -> 중복방지를 위해!
				String originalFileName = f.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HHmmssSSS");
				int rndNum = (int) (Math.random() * 1000);
				String renamedFileName = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + "." + ext;
				try {
					// renamedFileName 으로 파일을 저장하기 -> transferTo(파일)
					f.transferTo(new File(path + "/" + renamedFileName));
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				list.add(renamedFileName);
			}
		}
		try {
			result = new ObjectMapper().writeValueAsString(list);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 회원 정보보기, 회원이 상담사 보기 , 상담사가 회원 보기 둘다 이걸로 실행됨
	 */
	@RequestMapping(value = "/expert/memInfo")
	public ModelAndView memInfo(@RequestParam(required = false) String usid, @RequestParam(required = false) String bno,
			@RequestParam(required = false) String musid) throws Exception {
		log.info(" ===== exmemInfo 실행 ===== ");
		log.debug("usid : " + usid + ", bno : " + bno);
		ModelAndView mv = new ModelAndView("/exboard/exboardMemInfo");

		Member enterMem = service.selectMember(usid);
		String searchMemUsid = null;
		Member searchMem = null;
		Expert ex = null;

		// 보드 넘버가 파라미터로 안넘어왔으면 두개의 USID로 가져옴
		if (bno == null || bno.equals("")) {
			Map<String, String> bomap = new HashMap<String, String>();
			bomap.put("musid", musid);
			bomap.put("usid", usid);
			log.debug("bno null");
			bno = service.selectExBoardNumUsid(bomap);
		}

		// 현재 실행한 유저가 전문가인지 아닌지를 분기로 전문가면 같은 방의 유저를 반환, 유저면 전문가 정보를 반환
		Map<String, String> map = new HashMap<String, String>();
		if (enterMem.getMemClass().equals("전문가")) {
			// 일반 유저 아이디
			// 이 부분 이렇게 안해도될꺼같은데 나중에 보고 지우기
			if (musid.equals("undefined") || musid == null) {
				map.put("expertusid", "" + enterMem.getUsid());
				map.put("bno", bno);
				musid = service.selectMemExboard(map);
			}
			log.debug("musid" + musid);
			Member noboard = service.selectMember(musid);
			log.debug("noboard" + noboard);

			try {
				noboard.setMemEmail(aes.decrypt(noboard.getMemEmail()));
				noboard.setTel(aes.decrypt(noboard.getTel()));
			} catch (Exception e) {
				// TODO: handle exception
				noboard.setMemEmail(noboard.getMemEmail());
				noboard.setTel(noboard.getTel());
			}

			mv.addObject("mem", noboard);
			Map<String, String> mm = new HashMap<String, String>();
			mm.put("exusid", "" + enterMem.getUsid());
			mm.put("memusid", "" + noboard.getUsid());
			mv.addObject("expertRequest", service.selectIsExpertReq(mm));
		} else if (enterMem.getMemClass().equals("일반유저")) {
			map.put("memusid", "" + enterMem.getUsid());
			map.put("bno", bno);
			searchMemUsid = service.selectExpertExboard(map);
			searchMem = service.selectMember(searchMemUsid);
			ex = service.selectExpertMem("" + searchMem.getUsid());
			searchMem.setMemEmail(aes.decrypt(searchMem.getMemEmail()));
			searchMem.setTel(aes.decrypt(searchMem.getTel()));
			mv.addObject("mem", searchMem);
			mv.addObject("expert", ex);
			mv.addObject("license", service.selectExpertLicense("" + searchMem.getUsid()));
		}
		return mv;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 유저가 고민 해결을 누르면 실행됨 그 다음에 상담사가 상담 종료 가능
	 */
	@ResponseBody
	@RequestMapping("/expert/counselMemberEnd")
	public String counselMemberEnd(String bno) {
		String result = "";
		// expertBoardMemberend의 값을 1로 바꾸기
		try {
			service.updateCounselMemberEnd(bno);
			result = "1";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "0";
		}
		return result;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 전문가 수정 첫번째 페이지 자격증 아님
	 */
	@ResponseBody
	@RequestMapping("/expert/modifyEx")
	public String expertModifyEx(MultipartFile[] upFile, HttpServletRequest request, String career,
			String counselSelect, String fistTime, String seTime, String modiText, String beforeProfile,
			HttpSession session) {
		log.debug("expertModifyEx 실행");
		log.debug("업 파일 : " + upFile + " 업파일 길이 : " + upFile.length);
		log.debug("파람 : " + career + " " + counselSelect + " " + fistTime + " " + seTime + " " + modiText);

		if (upFile.length == 0) {
			log.debug("기존 프로필 이름 ; " + beforeProfile);
		}

		String result = "";
		String path = request.getServletContext().getRealPath("/resources/profile_images");
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < upFile.length; i++) {
			log.debug(" ================================ ");
			log.debug("파일명 : " + upFile[i].getOriginalFilename());
			log.debug("파일크기 : " + upFile[i].getSize());
		}
		File dir = new File(path);
		if (!dir.exists()) {
			// 지정된 경로의 폴더가 없으면
			dir.mkdirs();// s넣으면 중간 경로 없어도 알아서 만들어주는것!!
		}

		// 파일 업로드 로직 처리하기
		for (MultipartFile f : upFile) {
			if (!f.isEmpty()) {
				// 전달된 파일이 있으면... 파일 업로드 처리
				// 파일 리네임 처리 -> 중복방지를 위해!
				String originalFileName = f.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HHmmssSSS");
				int rndNum = (int) (Math.random() * 1000);
				String renamedFileName = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + "." + ext;
				try {
					// renamedFileName 으로 파일을 저장하기 -> transferTo(파일)
					f.transferTo(new File(path + "/" + renamedFileName));
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				list.add(renamedFileName);
			}
		}
		try {
			Expert et = new Expert();
			et.setExpertUsid(((Member) session.getAttribute("loginMember")).getUsid());
			et.setExpertCounselArea(counselSelect);
			et.setExpertCounselStartTime(fistTime);
			et.setExpertCounselEndTime(seTime);
			et.setExpertGreetings(modiText);
			et.setExpertProfile(career);
			service.updateExInfoModify(et);
			result = "1";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			result = "0";
		}
		return result;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 전문가 자격증 수정 두번째 페이지임
	 */
	@ResponseBody
	@RequestMapping("/expert/modifyLicense")
	public String expertModifyLicense(MultipartFile[] upFile, HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "") String[] types,
			@RequestParam(required = false, defaultValue = "") String[] dates,
			@RequestParam(required = false, defaultValue = "") String[] companys,
			@RequestParam(required = false, defaultValue = "") String[] linum) {
		log.debug("expertModifyLicense 실행");

		String result = "";
		String path = request.getServletContext().getRealPath("/resources/upload/upload_license");
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < upFile.length; i++) {
			log.debug(" ================================ ");
			log.debug("파일명 : " + upFile[i].getOriginalFilename());
			log.debug("파일크기 : " + upFile[i].getSize());
		}
		File dir = new File(path);
		if (!dir.exists()) {
			// 지정된 경로의 폴더가 없으면
			dir.mkdirs();// s넣으면 중간 경로 없어도 알아서 만들어주는것!!
		}

		// 파일 업로드 로직 처리하기
		for (MultipartFile f : upFile) {
			if (!f.isEmpty()) {
				// 전달된 파일이 있으면... 파일 업로드 처리
				// 파일 리네임 처리 -> 중복방지를 위해!
				String originalFileName = f.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HHmmssSSS");
				int rndNum = (int) (Math.random() * 1000);
				String renamedFileName = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + "." + ext;
				try {
					// renamedFileName 으로 파일을 저장하기 -> transferTo(파일)
					f.transferTo(new File(path + "/" + renamedFileName));
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				list.add(renamedFileName);
			}
		}
		try {

			List<License> paramlist = new ArrayList<License>();

			for (int i = 0; i < upFile.length; i++) {
				License li = new License();
				if (!linum[i].equals("undefined")) {
					li.setLicenseId(Integer.parseInt(linum[i]));
				} else {
					li.setLicenseId(-1);
					log.debug(" 음수 확인용 : " + li.getLicenseId());
				}
				li.setLicenseFileName(list.get(i));
				li.setLicenseDate(new java.sql.Date((new SimpleDateFormat("YYYY-MM-DD")).parse(dates[i]).getTime()));
				li.setLicenseType(types[i]);
				li.setLicenseCompany(companys[i]);
				paramlist.add(li);
			}
			service.updateLicenseModify(paramlist);

			result = "1";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			result = "0";
		}
		return result;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 리뷰작성 페이지
	 */
	@RequestMapping("/expert/expertReviewWrite")
	public ModelAndView expertReviewWrite(String bno) {
		ModelAndView mv = new ModelAndView("/exboard/expertReviewWrite");
		int result = -2;
		try {
			result = service.expertReviewWriteCheck(bno);
		} catch (Exception e) {
			// TODO: handle exception
		}
		log.debug("result : " + result);
		mv.addObject("duplicate", result);
		mv.addObject("bno", bno);
		return mv;
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 리뷰작성 완료 페이지
	 */
	@ResponseBody
	@RequestMapping("/expert/expertReviewWriteEnd")
	public String expertReviewWriteEnd(String bno, String review, String rating, HttpSession session) {
		log.debug("expertReviewWriteEnd");
		log.debug("bno : " + bno + " review : " + review + " rating : " + rating);
		String result = "";
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("bno", bno);
			map.put("review", review);
			map.put("rating", rating);
			map.put("memusid", "" + ((Member) session.getAttribute("loginMember")).getUsid());
			log.debug("memusid : " + map.get("memusid"));
			service.updateExpertBoardReview(map);
			result = "1";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "0";
		}
		return result;
	}

}
