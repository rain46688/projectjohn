package com.kh.john.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.admin.model.service.AdminService;
import com.kh.john.admin.model.vo.Notice;
import com.kh.john.admin.model.vo.NoticeFile;
import com.kh.john.common.page.PageBarFactory;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class CustomerController {
	
	@Autowired
	private AdminService service;


	//고객센터 메뉴화면 이동(임시)
	@RequestMapping("/customer/customerPage")
	public String customerPage() {
		return "/customer/customerPage";
	}
	

	
	//공지사항 게시판 불러오기 
	@RequestMapping("/customer/customerNotice")
	public ModelAndView customerNotice(ModelAndView mv, 
												@RequestParam (value="cPage", required=false, defaultValue="1") int cPage, 
												@RequestParam (value="numPerPage", required=false, defaultValue="10") int numPerPage) {
		
		List<Notice> list = service.selectNoticeList(cPage, numPerPage);
		int totalData = service.selectNoticeCount(); 
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "customerNotice")); //페이지바 PageBarFactory에서 가져오기
		
		mv.addObject("totalData",totalData);
		
		mv.addObject("list", list);
		mv.setViewName("customer/customerNotice");
		return mv;
	}
	
	//공지사항 글쓰기로 이동
	@RequestMapping("/customer/customerNoticeForm")
	public String NoticeForm() {
		return "/customer/customerNoticeForm";
	}
	
	//공지사항 글쓰기 완료
	@RequestMapping("/customer/customerNoticeFormEnd")
	public ModelAndView NoticeFormEnd(Notice notice, MultipartFile[] upFile, ModelAndView mv, HttpServletRequest request) {
		String saveDir = request.getServletContext().getRealPath("resources/upload/notice");
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		List<NoticeFile> files = new ArrayList();
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				String originalFilename = f.getOriginalFilename();
				String ext = originalFilename.substring(originalFilename.lastIndexOf('.')+1);
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_ddHHmmssSSS");
				int rndNum = (int)(Math.random()*1000);
				String renamedFilename = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + "." + ext;
				try {
					f.transferTo(new File(saveDir + "/" + renamedFilename));
				}catch(IOException e) {
					e.printStackTrace();
				}
				NoticeFile noticeFile = new NoticeFile();
				noticeFile.setNotice_file_name(renamedFilename);
				files.add(noticeFile);
			}
		}
		int result = service.insertNotice(notice, files);
		
		if(result>0) {
			mv.setViewName("/customer/customerNotice");
		}else {
			mv.addObject("msg", "실패");
			mv.addObject("loc", "/customer/customerNotice");
		}
		
		return mv;
	
	}
	
	//공지사항 상세보기
	@RequestMapping("/customer/customerNoticeView")
	public ModelAndView NoticeView(ModelAndView mv, int notice_id) {
		
		mv.addObject("notice",service.selectOneNotice(notice_id));
		mv.addObject("noticeFile",service.selectNoticeFile(notice_id));
		mv.setViewName("customer/customerNoticeView");
		
		return mv;
	}
	
	//1:1 채팅 불러오기
	
}
