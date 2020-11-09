package com.kh.john.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.common.page.PageBarFactory;
import com.kh.john.report.model.service.ReportService;
import com.kh.john.report.model.vo.Report;

@Controller
public class AdminReportController {

	@Autowired
	private ReportService service;
	
	//신고관리 불러오기
	@RequestMapping("/report/adminReport")
	public ModelAndView adminReport(ModelAndView mv,
			@RequestParam (value="cPage", required=false, defaultValue="1") int cPage, 
			@RequestParam (value="numPerPage", required=false, defaultValue="10") int numPerPage) {
		
		List<Report> list = service.selectReportList(cPage,numPerPage);
		int totalData = service.selectReportCount();
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "adminReport")); //페이지바 PageBarFactory에서 가져오기
		
		mv.addObject("totalData",totalData);
		
		mv.addObject("list", list);
		mv.setViewName("report/adminReport");
		return mv;
		
	}
}
