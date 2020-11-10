package com.kh.john.report.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.report.model.service.ReportService;
import com.kh.john.report.model.vo.Report;
import com.kh.john.report.model.vo.ReportFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomerReportController {
	
	@Autowired
	private ReportService service;

	//신고하기 글쓰기 페이지
	@RequestMapping("/report/customerReport")
	public String customerReport() {
		return "/report/customerReport";
	}
	
	//신고하기 글쓰기 완료
	@RequestMapping(value="/report/customerReportEnd")
	public ModelAndView customerReportEnd(Report report, MultipartFile[] upFile, ModelAndView mv, HttpServletRequest request) {
		String saveDir = request.getServletContext().getRealPath("resources/upload/report");
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		List<ReportFile> files = new ArrayList();
		for(MultipartFile f : upFile) {
			//if(!f.isEmpty()) {
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
				ReportFile reportFile = new ReportFile();
				reportFile.setReport_file_name(renamedFilename);
				files.add(reportFile);
			//}
		}
		int result = service.insertReport(report, files);
		
		if(result>0) {
			mv.addObject("msg","신고 완료!");
			mv.setViewName("/report/customerReport");
		}else {
			mv.addObject("msg", "실패");
			mv.addObject("loc", "/report/customerReport");
		}
		
		return mv;
	
	}
}
