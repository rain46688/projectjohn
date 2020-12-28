package com.kh.john.report.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.kh.john.board.model.vo.Board;
import com.kh.john.report.model.service.ReportService;
import com.kh.john.report.model.vo.Report;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class CustomerReportController {
	
	@Autowired
	private ReportService service;

	
	//임시임시임시 에러페이지확인
	@RequestMapping("/report/customerReportJsp")
	public String customerReportJsp() {
		return "/common/errorPage";

	}
	
	//신고하기 글쓰기 페이지
	@RequestMapping("/report/customerReport")
	public ModelAndView customerReport(ModelAndView mv, @RequestParam(value="boardId", required=false) int boardId) {
		
	
		Board b = service.selectBoard(boardId);
		System.out.println("b::::"+b);
		mv.addObject("b",b);
		
		
//		Map<String,Object> param = new HashMap();
//		param.put("boardId", boardId);
//		param.put("usid", usid);
//		param.put("nick", nick);
		
		mv.setViewName("report/customerReport");
		return mv;
	}
	
	
	//신고하기 글쓰기 완료
	@RequestMapping(value="/report/customerReportEnd")
	public ModelAndView customerReportEnd(Report report, ModelAndView mv, HttpServletRequest request, String reportWriterUsid) {
		
		
		int result = service.insertReport(report);
		
		
		if(result>0) {
			mv.addObject("msg","신고 완료!");
			mv.addObject("loc", "/member/myPage/myReport?usid="+reportWriterUsid);
			mv.setViewName("common/msg");
		}else {
			mv.addObject("msg", "실패");
			mv.addObject("loc", "/member/myPage/myReport?usid="+reportWriterUsid);
		}
		
		return mv;
	
	}
	
	
	
	@RequestMapping(value="/report/customerReportFileUpload", method=RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, 
                 MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if(file != null){
			if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())){
				if(file.getContentType().toLowerCase().startsWith("image/")){
					try{
						String fileName = file.getName();
						byte[] bytes = file.getBytes();
						String uploadPath = req.getServletContext().getRealPath("/resources/upload/report");
						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()){
							uploadFile.mkdirs();
						}
						fileName = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
                        out.write(bytes);
                        
                        printWriter = resp.getWriter();
                        resp.setContentType("text/html");
                        String fileUrl = req.getContextPath() + "/resources/upload/report/" + fileName;
                        
                        // json 데이터로 등록
                        // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
                        // 이런 형태로 리턴이 나가야함.
                        json.addProperty("uploaded", 1);
                        json.addProperty("fileName", fileName);
                        json.addProperty("url", fileUrl);
                        
                        printWriter.println(json);
                    }catch(IOException e){
                        e.printStackTrace();
                    }finally{
                        if(out != null){
                            out.close();
                        }
                        if(printWriter != null){
                            printWriter.close();
                        }		
					}
				}
			}
		}
		return null;
	}	
	
	
}
