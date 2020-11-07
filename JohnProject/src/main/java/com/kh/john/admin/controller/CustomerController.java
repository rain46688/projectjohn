package com.kh.john.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.admin.model.service.AdminService;
import com.kh.john.admin.model.vo.Notice;
import com.kh.john.common.page.PageBarFactory;

@Controller
public class CustomerController {
	
	@Autowired
	private AdminService service;

	//고객센터 메뉴화면 이동(임시)
	@RequestMapping("/customer/customerPage")
	public String customerPage() {
		return "/customer/customerPage";
	}
	

	
	//공지사항 게시판 불러오기 <!--향후 DB 생성시 다시 가져올 예정!! 지우지 마시오 !!-->
//	@RequestMapping("/customer/customerNotice")
//	public ModelAndView customerNotice(ModelAndView mv, 
//												@RequestParam (value="cPage", required=false, defaultValue="1") int cPage, 
//												@RequestParam (value="numPerPage", required=false, defaultValue="10") int numPerPage) {
//		
//		List<Notice> list = service.selectNoticeList(cPage, numPerPage);
//		int totalData = service.selectNoticeCount(); 
//		
//		
//		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "customerNotice")); //페이지바 PageBarFactory에서 가져오기
//		
//		mv.addObject("totalData",totalData);
//		
//		mv.addObject("list", list);
//		mv.setViewName("customer/customerList");
//		return mv;
//	}
	
	
	
	//1:1 채팅 불러오기
	
}
