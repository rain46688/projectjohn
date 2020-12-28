package com.kh.john.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.common.page.PageBarFactory;
import com.kh.john.member.model.vo.Member;
import com.kh.john.report.model.service.ReportService;
import com.kh.john.report.model.vo.Report;

@Controller
public class AdminReportController {

	@Autowired
	private ReportService service;
	
	//신고관리 불러오기
	@RequestMapping("/admin/adminReport")
	public ModelAndView adminReport(ModelAndView mv,
			@RequestParam (value="cPage", required=false, defaultValue="1") int cPage, 
			@RequestParam (value="numPerPage", required=false, defaultValue="5") int numPerPage) {
		
		List<Report> list = service.selectReportList(cPage,numPerPage);
		int totalData = service.selectReportCount();
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "adminReport")); //페이지바 PageBarFactory에서 가져오기
		
		mv.addObject("totalData",totalData);
		
		mv.addObject("list", list);
		mv.setViewName("admin/adminReport");
		return mv;
		
	}
	
	//신고관리 불러오기(신고처리true)
	@RequestMapping("/admin/adminReportAfter")
	public ModelAndView adminReportAfter(ModelAndView mv,
			@RequestParam (value="cPage", required=false, defaultValue="1") int cPage, 
			@RequestParam (value="numPerPage", required=false, defaultValue="5") int numPerPage) {
		
		List<Report> list = service.selectReportListAfter(cPage,numPerPage);
		int totalData = service.selectReportCountAfter();
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "adminReportAfter"));
		
		mv.addObject("totalData",totalData);
		
		mv.addObject("list", list);
		System.out.println("신고처리true list"+list);
		mv.setViewName("admin/adminReportAfter");
		return mv;
		
	}
	
	//신고 게시글 불러오기
	@RequestMapping("/admin/adminReportView")
	public ModelAndView reportView(ModelAndView mv, int reportId) {
		
		mv.addObject("report",service.selectOneReport(reportId));
		mv.addObject("reportFile",service.selectReportFile(reportId));
		mv.setViewName("admin/adminReportView");
			
		return mv;
	}
	
	//신고 게시글 삭제
	@RequestMapping(value="/admin/adminReportDelete")
	public ModelAndView deleteReport(Report r, ModelAndView mv){
		
		int result = service.deleteReport(r);
		
		String msg= "";
		
		if(result>0) {
			msg="삭제 성공!";
		}else {
			msg="삭제 실패!ㅠㅠ";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc","/admin/adminReport");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	//신고 게시글 경고주기
	@RequestMapping("/admin/adminReportWarn")
	public ModelAndView reportWarn(Report r, ModelAndView mv, Member m,
			@RequestParam(value="reportIswarning", required=false) int reportIswarning) {
		int result = service.reportWarn(r);
		
		String msg = "";
		
		
		if(result>0&&reportIswarning<2) {
			msg="경고 주기 성공!";
		}else if(result>0&&reportIswarning>=2) {
			msg="3번 경고 누적으로 강제탈퇴 처리됩니다";
			service.reportWarnOut(m);
		}
		else {
			msg="실패";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc","/admin/adminReport");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	//신고 게시글 답글달기
	@RequestMapping("/admin/reportAnswer")
	public ModelAndView reportAnswer(Report r, ModelAndView mv, String reportId) {
		int result = service.insertReportAnswer(r);
		
		if(result>0) {
			mv.addObject("msg","등록 완료!");
			mv.addObject("loc", "/admin/adminReportView?reportId="+reportId);
			mv.setViewName("common/msg");
		}else {
			mv.addObject("msg", "등록 실패ㅠㅠ");
			mv.addObject("loc", "/admin/adminReport");
		}
		
		return mv;
	}
	
	
}
