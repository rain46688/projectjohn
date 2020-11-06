package com.kh.john.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerController {

	//고객센터 메뉴화면 이동(임시)
	@RequestMapping("/customer/customerPage")
	public String customerPage() {
		return "/customer/customerPage";
	}
	

	
	//공지사항 게시판 불러오기
	
	//1:1 채팅 불러오기
	
}
