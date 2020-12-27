package com.kh.john.admin.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.util.UriComponents;

import com.kh.john.admin.model.service.AdminService;
import com.kh.john.admin.model.vo.AdminMessage;
import com.kh.john.board.model.vo.Board;
import com.kh.john.common.page.PageBarFactory;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.controller.AES256Util;
import com.kh.john.member.model.service.MemberService;
import com.kh.john.member.model.vo.License;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
import java.util.*;

@Controller
@Slf4j
public class AdminController {

	@Autowired
	private AdminService service;

	@Autowired
	private MemberService memberService;

	@Autowired
	private AES256Util aes;

	// 어드민 메뉴화면 이동(임시)
//	@RequestMapping("/admin/adminPage")
//	public String adminPage() {
//		return "/admin/adminPage";
//	}

	// 멤버 리스트 불러오기
	@RequestMapping("/admin/adminMember")
	public ModelAndView adminMember(ModelAndView mv,
			@RequestParam(value = "memEmail", required = false) String memEmail,
			@RequestParam(value = "tel", required = false) String tel,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", required = false, defaultValue = "5") int numPerPage)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		List<Member> list = service.selectMemberList(cPage, numPerPage);

		for (Member a : list) {
			String memberId;
			String tele;
			try {
				memberId = aes.decrypt(a.getMemEmail());
				tele = aes.decrypt(a.getTel());
			} catch (Exception e) {
				memberId = a.getMemEmail();
				tele = a.getTel();
			}
			a.setMemEmail(memberId);
			a.setTel(tele);
		}

		int totalData = service.selectMemberCount();
		System.out.println("멤버리스트토탈데이터:" + totalData);

		mv.addObject("pageBar", PageBarFactory.getPageBar(totalData, cPage, numPerPage, "adminMember"));

		mv.addObject("totalData", totalData);
		mv.addObject("list", list);

		mv.setViewName("admin/adminMember");
		return mv;
	}

	// 멤버 탈퇴시키기
	@RequestMapping(value = "/admin/adminDeleteMember")
	public ModelAndView deleteMember(Member m, ModelAndView mv) {

		int result = service.deleteMember(m);

		String msg = "";

		if (result > 0) {
			msg = "탈퇴 완료";
		} else {
			msg = "탈퇴 실패";
		}

		mv.addObject("msg", msg);
		mv.addObject("loc", "/admin/adminMember");
		mv.setViewName("common/msg");

		return mv;
	}

	// 멤버 검색
	@RequestMapping("/admin/adminMemberSearch")
	public ModelAndView adminMemberSearch(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value = "tel", required = false) String tel,
			@RequestParam(value = "searchType", required = false) String searchType,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "gender", required = false) String gender,
			@RequestParam(value = "memClass", required = false) String[] memClass,
			@RequestParam(value = "leaveMem", required = false) String[] leaveMem,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", required = false, defaultValue = "5") int numPerPage) {

		Map<String, Object> param = new HashMap();

		param.put("searchType", searchType);
		param.put("keyword", keyword);
		param.put("gender", gender);
		param.put("memClass", memClass);
		param.put("leaveMem", leaveMem);
		System.out.println("맵안에:" + param);

		// int totalData = service.searchMemberListCount(param);

		// List<Member> list = service.searchMemberList(param, cPage, numPerPage);

		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}

		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} catch (NumberFormatException e) {
			numPerPage = 5;
		}

		String mc = Arrays.toString(memClass);
		System.out.println("mc::" + mc);
		mc = mc.replace("[", "").replace("]", "");

		String lm = Arrays.toString(leaveMem);
		System.out.println("lm::" + lm);
		lm = lm.replace("[", "").replace("]", "");

////////////////////////////////////////////////////////////////////////////////////////
		List<Member> list = service.searchMemberList(param, cPage, numPerPage);

		int totalData = service.searchMemberListCount(param);

		// properties 다 썼으면
		int totalPage = (int) (Math.ceil((double) totalData / numPerPage));

		
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String pageBar = "";

		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		
		if (pageNo == 1) {
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>이전</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='" + request.getContextPath() + "/admin/adminMemberSearch?cPage=" + (pageNo - 1)
					+ "&searchType=" + searchType + "&keyword=" + keyword + "&gender=" + gender + "&memClass=" + mc
					+ "&leaveMem=" + lm + "'>이전</a>";
			pageBar += "</li>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link' href='#'>" + pageNo + "</a>";
				pageBar += "</li>";
			} else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='" + request.getContextPath() + "/admin/adminMemberSearch?cPage=" + pageNo
						+ "&searchType=" + searchType + "&keyword=" + keyword + "&gender=" + gender + "&memClass=" + mc
						+ "&leaveMem=" + lm + "'>" + pageNo + "</a>";
			}
			pageNo++;
		}
		if (pageNo > totalPage) {
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>다음</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='" + request.getContextPath() + "/admin/adminMemberSearch?cPage=" + pageNo
					+ "&searchType=" + searchType + "&keyword=" + keyword + "&gender=" + gender + "&memClass=" + mc
					+ "&leaveMem=" + lm + "'>다음</a>";
			pageBar += "</li>";
		}

		pageBar += "</ul>";
		
		request.setAttribute("pageBar", pageBar);
////////////////////////////////////////////////////////////////////////////////////////

		for (Member a : list) {
			String memberId;
			String tele;
			try {
				memberId = aes.decrypt(a.getMemEmail());
				tele = aes.decrypt(a.getTel());
			} catch (Exception e) {
				memberId = a.getMemEmail();
				tele = a.getTel();
			}
			a.setMemEmail(memberId);
			a.setTel(tele);
		}

		
		mv.addObject("totalData", totalData);
		System.out.println("토탈데이터:" + totalData);
		mv.addObject("list", list);
		System.out.println("리스트:" + list);

		mv.setViewName("admin/adminMemberSearch");
		return mv;

	}

	// 게시판 리스트 불러오기
	@RequestMapping("/admin/adminBoard")
	public ModelAndView adminBoard(ModelAndView mv,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", required = false, defaultValue = "5") int numPerPage) {

		List<Board> list = service.selectBoardList(cPage, numPerPage);
		int totalData = service.selectBoardCount();

		mv.addObject("pageBar", PageBarFactory.getPageBar(totalData, cPage, numPerPage, "adminBoard"));

		mv.addObject("totalData", totalData);

		mv.addObject("list", list);
		mv.setViewName("admin/adminBoard");
		return mv;
	}

	// 게시판 검색
	@RequestMapping("/admin/adminBoardSearch")
	public ModelAndView adminBoardSearch(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value = "searchType", required = false) String searchType,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "searchType2", required = false) String searchType2,
			@RequestParam(value = "bigCategory", required = false) String bigCategory,
			@RequestParam(value = "smallCategory", required = false) String smallCategory,
			@RequestParam(value = "order", required = false) String order,
			@RequestParam(value = "isclose", required = false) String[] isclose,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", required = false, defaultValue = "5") int numPerPage) {

		Map<String, Object> param = new HashMap();

		param.put("searchType", searchType);
		param.put("keyword", keyword);
		param.put("searchType2", searchType2);
		param.put("bigCategory", bigCategory);
		param.put("smallCategory", smallCategory);
		param.put("isclose", isclose);
		param.put("order", order);

		System.out.println("맵안에:" + param);
		System.out.println("searchType:" + searchType);
		System.out.println("searchType2:" + searchType2);
		System.out.println("isclose:::::" + isclose);
//		String[] is=request.getParameterValues("isclose");
//		for(int i=0;i<is.length;i++) {
//		    System.out.println("is:::"+is[i]);        
//		}

		String a = Arrays.toString(isclose);
		System.out.println("a::" + a);
		a = a.replace("[", "").replace("]", "");

		// int totalData = service.searchBoardListCount(param);

		// List<Board> list = service.searchBoardList(param, cPage, numPerPage);

////////////////////////////////////////////////
		// mv.addObject("pageBar", PageBarFactory.getPageBar(totalData, cPage,
		// numPerPage, "adminBoardSearch"));

		// int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}

		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} catch (NumberFormatException e) {
			numPerPage = 5;
		}

//		List<Member> list=new AdminService().selectMemberSearch(type,keyword,cPage, numPerPage);
//		//list.size(); 로 하면 안되는 이유 --> 평생 5만나옴~! (페이지 수를 나눌 수가 없음)
		List<Board> list = service.searchBoardList(param, cPage, numPerPage);
//		
//		//전체자료
//		int totalData = new AdminService().selectMemberSearchCount(type,keyword);//검색된 애들 중에서 몇개
		int totalData = service.searchBoardListCount(param);

		// properties 다 썼으면
		int totalPage = (int) (Math.ceil((double) totalData / numPerPage));

		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String pageBar = "";

		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		
		if (pageNo == 1) {
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>이전</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='" + request.getContextPath() + "/admin/adminBoardSearch?cPage=" + (pageNo - 1)
					+ "&searchType=" + searchType + "&keyword=" + keyword + "&bigCategory=" + bigCategory
					+ "&searchType2=" + searchType2 + "&smallCategory=" + smallCategory + "&isclose=" + a + "&order="
					+ order + "'>이전</a>";
			pageBar += "</li>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link' href='#'>" + pageNo + "</a>";
				pageBar += "</li>";
			} else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='" + request.getContextPath() + "/admin/adminBoardSearch?cPage=" + pageNo
						+ "&searchType=" + searchType + "&keyword=" + keyword + "&bigCategory=" + bigCategory
						+ "&searchType2=" + searchType2 + "&smallCategory=" + smallCategory + "&isclose=" + a
						+ "&order=" + order + "'>" + pageNo + "</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		if (pageNo > totalPage) {
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>다음</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='" + request.getContextPath() + "/admin/adminBoardSearch?cPage=" + pageNo
					+ "&searchType=" + searchType + "&keyword=" + keyword + "&bigCategory=" + bigCategory
					+ "&searchType2=" + searchType2 + "&smallCategory=" + smallCategory + "&isclose=" + a + "&order="
					+ order + "'>다음</a>";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";

		request.setAttribute("pageBar", pageBar);

		/////////////////////////////////////////

		mv.addObject("totalData", totalData);
		System.out.println("토탈데이터:" + totalData);
		mv.addObject("list", list);
		System.out.println("리스트:" + list);

		//
		mv.addObject("searchType", searchType);
		mv.addObject("keyword", keyword);
		mv.addObject("searchType2", searchType2);
		mv.addObject("bigCategory", bigCategory);
		mv.addObject("smallCategory", smallCategory);
		mv.addObject("isclose", isclose);
		mv.addObject("order", order);
		//

		mv.setViewName("admin/adminBoardSearch");
		return mv;
	}

	// 전문가 리스트 불러오기
	@RequestMapping("/admin/adminExpert")
	public ModelAndView adminExpert(ModelAndView mv,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", required = false, defaultValue = "5") int numPerPage) {
		List<Member> list = service.selectExpertList(cPage, numPerPage);
		int totalData = service.selectExpertCount();

		for (Member a : list) {
			String memberId;
			String tele;
			try {
				memberId = aes.decrypt(a.getMemEmail());
				tele = aes.decrypt(a.getTel());
			} catch (Exception e) {
				memberId = a.getMemEmail();
				tele = a.getTel();
			}
			a.setMemEmail(memberId);
			a.setTel(tele);
		}

		mv.addObject("pageBar", PageBarFactory.getPageBar(totalData, cPage, numPerPage, "adminExpert"));

		mv.addObject("totalData", totalData);

		mv.addObject("list", list);
		mv.setViewName("admin/adminExpert");
		return mv;
	}

	// 승인 전 전문가 리스트 불러오기
	@RequestMapping("/admin/adminBeforeExpert")
	public ModelAndView adminBeforeExpert(ModelAndView mv,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", required = false, defaultValue = "5") int numPerPage) {
		List<Member> list = service.selectBeforeExpertList(cPage, numPerPage);
		int totalData = service.selectBeforeExpertCount();

		for (Member a : list) {
			String memberId;
			String tele;
			try {
				memberId = aes.decrypt(a.getMemEmail());
				tele = aes.decrypt(a.getTel());
			} catch (Exception e) {
				memberId = a.getMemEmail();
				tele = a.getTel();
			}
			a.setMemEmail(memberId);
			a.setTel(tele);
		}

		mv.addObject("pageBar", PageBarFactory.getPageBar(totalData, cPage, numPerPage, "adminBeforeExpert"));

		mv.addObject("totalData", totalData);

		mv.addObject("list", list);
		mv.setViewName("admin/adminBeforeExpert");
		return mv;
	}

	// 전문가 승인화면으로 이동
	@RequestMapping("/admin/adminUpdateMemberToExpert")
	public ModelAndView adminUpdateMemberToExpert(@RequestParam Map param, ModelAndView mv) {
		List<License> list = service.updateMemberToExpertLicense(param);
		Member m = service.updateMemberToExpert(param);

		mv.addObject("list", list);
		mv.addObject("member", m);
		mv.setViewName("admin/adminMemberUpdate");

		return mv;

	}

	// 전문가 승인해주기
	@RequestMapping("/admin/adminUpdateMemberToExpertEnd")
	public ModelAndView adminUpdateMemberToExpertEnd(Member m, ModelAndView mv) {
		int result = service.updateMemberToExpertEnd(m);

		String msg = "";

		if (result > 0) {
			mv.addObject("msg", "전문가 승인이 완료되었습니다");
			mv.addObject("loc", "/admin/adminExpert");
			mv.setViewName("common/msg");
		} else {
			mv.addObject("msg", "전문가 승인이 완료되었습니다");
			mv.addObject("loc", "/admin/adminExpert");
		}

		System.out.println("result=" + result);

		return mv;
	}

	// 전문가 검색
	@RequestMapping("/admin/adminExpertSearch")
	public ModelAndView adminExpertSearch(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value = "searchType", required = false) String searchType,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "gender", required = false) String gender,
			@RequestParam(value = "memClass", required = false) String[] memClass,
			@RequestParam(value = "leaveMem", required = false) String[] leaveMem,
			@RequestParam(value = "searchType2", required = false) String searchType2,
			@RequestParam(value = "order", required = false) String order,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", required = false, defaultValue = "5") int numPerPage) {

		Map<String, Object> param = new HashMap();

		param.put("searchType", searchType);
		param.put("keyword", keyword);
		param.put("gender", gender);
		param.put("memClass", memClass);
		param.put("leaveMem", leaveMem);
		param.put("searchType2", searchType2);
		param.put("order", order);
		System.out.println("맵안에:" + param);

//		int totalData = service.searchExpertListCount(param);
//
//		List<Member> list = service.searchExpertList(param, cPage, numPerPage);

		String mc = Arrays.toString(memClass);
		System.out.println("mc::" + mc);
		mc = mc.replace("[", "").replace("]", "");

		String lm = Arrays.toString(leaveMem);
		System.out.println("lm::" + lm);
		lm = lm.replace("[", "").replace("]", "");
		
////////////////////////////////////////////////

		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}

		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} catch (NumberFormatException e) {
			numPerPage = 5;
		}

		List<Member> list = service.searchExpertList(param, cPage, numPerPage);

		int totalData = service.searchExpertListCount(param);

		
		int totalPage = (int) (Math.ceil((double) totalData / numPerPage));

		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String pageBar = "";

		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		
		if (pageNo == 1) {
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>이전</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='" + request.getContextPath() + "/admin/adminExpertSearch?cPage=" + (pageNo - 1)
					+ "&searchType=" + searchType + "&keyword=" + keyword + "&gender=" + gender
					+ "&searchType2=" + searchType2 + "&memClass=" + mc + "&leaveMem=" + lm + "&order="
					+ order + "'>이전</a>";
			pageBar += "</li>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link' href='#'>" + pageNo + "</a>";
				pageBar += "</li>";
			} else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='" + request.getContextPath() + "/admin/adminExpertSearch?cPage=" + pageNo
						+ "&searchType=" + searchType + "&keyword=" + keyword + "&gender=" + gender
						+ "&searchType2=" + searchType2 + "&memClass=" + mc + "&leaveMem=" + lm + "&order="
						+ order + "'>" + pageNo + "</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		if (pageNo > totalPage) {
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>다음</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='" + request.getContextPath() + "/admin/adminExpertSearch?cPage=" + pageNo
					+ "&searchType=" + searchType + "&keyword=" + keyword + "&gender=" + gender
					+ "&searchType2=" + searchType2 + "&memClass=" + mc + "&leaveMem=" + lm + "&order="
					+ order + "'>다음</a>";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";

		request.setAttribute("pageBar", pageBar);

/////////////////////////////////////////

		for (Member a : list) {
			String memberId;
			String tele;
			try {
				memberId = aes.decrypt(a.getMemEmail());
				tele = aes.decrypt(a.getTel());
			} catch (Exception e) {
				memberId = a.getMemEmail();
				tele = a.getTel();
			}
			a.setMemEmail(memberId);
			a.setTel(tele);
		}

		//mv.addObject("pageBar", PageBarFactory.getPageBar(totalData, cPage, numPerPage, "adminExpertSearch"));

		mv.addObject("totalData", totalData);
		System.out.println("토탈데이터:" + totalData);
		mv.addObject("list", list);
		System.out.println("리스트:" + list);
		mv.setViewName("admin/adminExpertSearch");
		return mv;
	}

	// 전문가 상담진행상황 불러오기(진행중)
	@RequestMapping("/admin/adminExpertCounsel0")
	public ModelAndView adminExpertCounsel(ModelAndView mv,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", required = false, defaultValue = "5") int numPerPage) {

		List<ExpertRequest> list = service.selectAdminExpertCounsel0(cPage, numPerPage);
		int totalData = service.selectAdminExpertCounselCount0();

		mv.addObject("pageBar", PageBarFactory.getPageBar(totalData, cPage, numPerPage, "adminExpertCounsel0"));
		System.out.println("컨트롤러 numperpage" + numPerPage);
		mv.addObject("totalData", totalData);

		mv.addObject("list", list);
		mv.setViewName("admin/adminExpertCounsel0");
		return mv;
	}

	// 전문가 상담진행상황 불러오기(종료)
	@RequestMapping("/admin/adminExpertCounsel1")
	public ModelAndView adminExpertCounsel2(ModelAndView mv,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", required = false, defaultValue = "5") int numPerPage) {

		List<ExpertRequest> list = service.selectAdminExpertCounsel1(cPage, numPerPage);
		int totalData = service.selectAdminExpertCounselCount1();

		mv.addObject("pageBar", PageBarFactory.getPageBar(totalData, cPage, numPerPage, "adminExpertCounsel1"));

		mv.addObject("totalData", totalData);

		mv.addObject("list", list);
		mv.setViewName("admin/adminExpertCounsel1");
		return mv;
	}

	// 1:1 채팅답변 불러오기
	@RequestMapping("/admin/adminChatRoom")
	public ModelAndView adminChat(ModelAndView mv, @SessionAttribute("loginMember") Member loginMember) {

		int adminUsid = loginMember.getUsid();

		List<Integer> totalUsidList = new ArrayList<Integer>();
		List<Integer> firstUsidList = new ArrayList<Integer>();
		List<Integer> secondUsidList = new ArrayList<Integer>();

		firstUsidList = service.firstUsidList();
		secondUsidList = service.secondUsidList();

		for (int i = 0; i < firstUsidList.size(); i++) {
			totalUsidList.add(firstUsidList.get(i));
		}
		for (int i = 0; i < secondUsidList.size(); i++) {
			if (!totalUsidList.contains(secondUsidList.get(i))) {
				totalUsidList.add(secondUsidList.get(i));
			}
		}

		// 닉네임 최근메세지 프로필사진 날짜시간
		// 멤버 adminchat 멤버 adminchat

		List<AdminMessage> memberInfoList = new ArrayList<AdminMessage>();

		for (int i = 0; i < totalUsidList.size(); i++) {

			AdminMessage am = new AdminMessage();
			Member member = new Member();
			HashMap<String, Integer> usidMap = new HashMap<String, Integer>();

			int memberUsid = totalUsidList.get(i);
			am.setMemberUsid(memberUsid);
			member.setUsid(memberUsid);

			member = memberService.selectMemberByUsid(member);

			am.setProfilePic(member.getProfilePic());
			am.setNickname(member.getMemNickname());

			usidMap.put("adminUsid", adminUsid);
			usidMap.put("memberUsid", memberUsid);

			AdminMessage am2 = service.loadAdminMessage(usidMap);

			am.setLatestMsg(am2.getLatestMsg());
			am.setTime(am2.getTime());

			memberInfoList.add(am);

		}

		mv.addObject("memberInfoList", memberInfoList);
		mv.setViewName("admin/adminChatRoom");
		System.out.println("멤버인포리스트:" + memberInfoList);
		return mv;

	}

	@RequestMapping("/admin/adminChat") // 1
	public ModelAndView adminChat(@RequestParam(value = "memberUsid") int memberUsid,
			@RequestParam(value = "adminUsid") int adminUsid, ModelAndView mv) {

		// member와 admin의 정보 가져오기
		Member adminInfo = new Member();
		adminInfo.setUsid(adminUsid);
		memberService.selectMemberByUsid(adminInfo);

		Member memberInfo = new Member();
		memberInfo.setUsid(memberUsid);
		memberService.selectMemberByUsid(memberInfo);

		mv.addObject("adminInfo", adminInfo);
		mv.addObject("memberInfo", memberInfo);

		mv.setViewName("admin/adminChat");

		return mv;
	}

}
