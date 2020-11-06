package com.kh.john.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerReportController {

	//신고하기 글쓰기 페이지
	@RequestMapping("/customer/customerReport")
	public String customerReport() {
		return "/customer/customerReport";
	}
}
