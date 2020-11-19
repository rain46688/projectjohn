package com.kh.john.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.admin.model.service.AdminService;
import com.kh.john.admin.model.vo.Notice;
import com.kh.john.admin.model.vo.NoticeFile;
import com.kh.john.common.page.PageBarFactory;
import com.kh.john.member.model.service.MemberService;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class CustomerController {

	@Autowired
	private AdminService service;
	
	@Autowired
	private MemberService memberService;

	// 고객센터 메뉴화면 이동(임시)
	@RequestMapping("/customer/customerPage")
	public String customerPage() {
		return "/customer/customerPage";
	}

	// 공지사항 게시판 불러오기
	@RequestMapping("/customer/customerNotice")
	public ModelAndView customerNotice(ModelAndView mv,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", required = false, defaultValue = "10") int numPerPage) {

		List<Notice> list = service.selectNoticeList(cPage, numPerPage);
		int totalData = service.selectNoticeCount();

		mv.addObject("pageBar", PageBarFactory.getPageBar(totalData, cPage, numPerPage, "customerNotice")); // 페이지바
																											// PageBarFactory에서
																											// 가져오기

		mv.addObject("totalData", totalData);

		mv.addObject("list", list);
		mv.setViewName("customer/customerNotice");
		return mv;
	}

	// 공지사항 글쓰기로 이동
	@RequestMapping("/customer/customerNoticeForm")
	public String NoticeForm() {
		return "/customer/customerNoticeForm";
	}

	// 공지사항 글쓰기 완료
	@RequestMapping(value = "/customer/customerNoticeFormEnd")
	public ModelAndView NoticeFormEnd(MultipartFile[] upFile, Notice notice, ModelAndView mv,
			HttpServletRequest request) {
		System.out.println("업파일" + upFile);
		System.out.println("파라미터노티스" + notice);
		String saveDir = request.getServletContext().getRealPath("resources/upload/notice");
		File dir = new File(saveDir);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		List<NoticeFile> files = new ArrayList();

		for (MultipartFile f : upFile) {
			System.out.println("멀티파트파일:" + f);
//			if(!f.isEmpty()) { 
			String originalFilename = f.getOriginalFilename();
			System.out.println("오리지널파일네임" + f.getOriginalFilename());

			String ext = originalFilename.substring(originalFilename.lastIndexOf('.') + 1);
			System.out.println("ext:" + ext);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_ddHHmmssSSS");
			int rndNum = (int) (Math.random() * 1000);
			String renamedFilename = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + "." + ext;

			try {
				f.transferTo(new File(saveDir + "/" + renamedFilename));
			} catch (IOException e) {
				e.printStackTrace();
			}

			NoticeFile noticeFile = new NoticeFile();
			noticeFile.setNoticeFileName(renamedFilename);
			files.add(noticeFile);
			System.out.println("노티스파일" + noticeFile);
			System.out.println("파일스" + files);
			// }
		}

		int result = service.insertNotice(notice, files);
		System.out.println("파일파일파일" + files);
		System.out.println("공지공지" + notice);
		System.out.println("result::::::" + result);

		if (result > 0) {
			mv.addObject("msg", "등록성공!");
			mv.addObject("loc", "/customer/customerNotice");
			mv.setViewName("common/msg");
		} else {
			mv.addObject("msg", "실패");
			mv.addObject("loc", "/customer/customerNotice");
		}

		return mv;

	}

	// 공지사항 상세보기
	@RequestMapping("/customer/customerNoticeView")
	public ModelAndView NoticeView(ModelAndView mv, int noticeId) {

		mv.addObject("notice", service.selectOneNotice(noticeId));
		System.out.println("mv" + mv);
		System.out.println("noticeId" + noticeId);
		System.out.println("서비스.셀렉트원노티스" + service.selectOneNotice(noticeId));
		mv.addObject("noticeFile", service.selectNoticeFile(noticeId));
		mv.setViewName("customer/customerNoticeView");

		return mv;
	}

	// 공지사항 수정으로 이동
	@RequestMapping("/customer/customerNoticeModify")
	public ModelAndView noticeModify(@RequestParam Map param, ModelAndView mv) {
		Notice n = service.noticeModify(param);
		mv.addObject("notice", n);
		mv.setViewName("customer/customerNoticeModifyForm");

		return mv;
	}

	// 공지사항 수정 완료
	@RequestMapping("/customer/customerNoticeModifyEnd")
	public ModelAndView noticeModifyEnd(MultipartFile[] upFile, Notice n, ModelAndView mv, HttpServletRequest request) {
		
		System.out.println("업파일" + upFile);
		System.out.println("파라미터노티스" + n);
		String saveDir = request.getServletContext().getRealPath("resources/upload/notice");
		File dir = new File(saveDir);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		List<NoticeFile> files = new ArrayList();

		for (MultipartFile f : upFile) {
			System.out.println("멀티파트파일:" + f);
//			if(!f.isEmpty()) { 
			String originalFilename = f.getOriginalFilename();
			System.out.println("오리지널파일네임" + f.getOriginalFilename());

			String ext = originalFilename.substring(originalFilename.lastIndexOf('.') + 1);
			System.out.println("ext:" + ext);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_ddHHmmssSSS");
			int rndNum = (int) (Math.random() * 1000);
			String renamedFilename = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + "." + ext;

			try {
				f.transferTo(new File(saveDir + "/" + renamedFilename));
			} catch (IOException e) {
				e.printStackTrace();
			}

			NoticeFile noticeFile = new NoticeFile();
			noticeFile.setNoticeFileName(renamedFilename);
			files.add(noticeFile);
			System.out.println("노티스파일" + noticeFile);
			System.out.println("파일스" + files);
			// }
		}

		int result = service.noticeModifyEnd(n,files);
		System.out.println("파일파일파일" + files);
		System.out.println("공지공지" + n);
		System.out.println("result::::::" + result);
		
		String msg = "";

		if (result > 0) {
			mv.addObject("msg", "수정성공!");
			mv.addObject("loc", "/customer/customerNotice");
			mv.setViewName("common/msg");
		} else {
			mv.addObject("msg", "수정실패");
			mv.addObject("loc", "/customer/customerNotice");
		}



		return mv;
	}

	// 공지사항 삭제
	@RequestMapping(value = "/customer/customerNoticeDelete")
	public ModelAndView deleteNotice(Notice n, ModelAndView mv) {

		int result = service.deleteNotice(n);

		String msg = "";

		if (result > 0) {
			msg = "삭제 성공!";
		} else {
			msg = "삭제 실패 ㅠㅠ";
		}

		mv.addObject("msg", msg);
		mv.addObject("loc", "/customer/customerNotice");
		mv.setViewName("common/msg");

		return mv;
	}
	
	
//	@RequestMapping("/customer/customerNoticeView")
//	public ModelAndView NoticeView(ModelAndView mv, int noticeId) {
//
//		mv.addObject("notice", service.selectOneNotice(noticeId));
//		System.out.println("mv" + mv);
//		System.out.println("noticeId" + noticeId);
//		System.out.println("서비스.셀렉트원노티스" + service.selectOneNotice(noticeId));
//		mv.addObject("noticeFile", service.selectNoticeFile(noticeId));
//		mv.setViewName("customer/customerNoticeView");
//
//		return mv;
//	}
	
	// 1:1 채팅 불러오기
//	@RequestMapping("/customer/customerChat")
//	public ModelAndView adminChat(ModelAndView mv, int adminUsid) {
//		mv.addObejct("adminChat", service.selectOneAdminChat);
//	}
	
	@RequestMapping("/customer/customerChat")
	public ModelAndView adminChat(ModelAndView mv, @SessionAttribute("loginMember") Member loginMember,
			@RequestParam("adminUsid") int adminUsid) {
		Member myInfo=memberService.selectMemberByUsid(loginMember);
		Member otherInfo=new Member();
		otherInfo.setUsid(adminUsid);
		otherInfo=memberService.selectMemberByUsid(otherInfo);
		mv.addObject("myInfo",myInfo);
		mv.addObject("otherInfo",otherInfo);
		mv.setViewName("customer/customerChat");
		return mv;
		
	}
	


}
