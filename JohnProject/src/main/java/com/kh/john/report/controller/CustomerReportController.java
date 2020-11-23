package com.kh.john.report.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	//신고하기 글쓰기 페이지
	@RequestMapping("/report/customerReport")
	public String customerReport() {
		return "/report/customerReport";
	}
	
	//신고하기 글쓰기 완료
	@RequestMapping(value="/report/customerReportEnd")
	public ModelAndView customerReportEnd(Report report, ModelAndView mv, HttpServletRequest request) {
//		String saveDir = request.getServletContext().getRealPath("resources/upload/report");
//		File dir = new File(saveDir);
//		if(!dir.exists()) {
//			dir.mkdirs();
//		}
//		
//		List<ReportFile> files = new ArrayList();
//		for(MultipartFile f : upFile) {
//			//if(!f.isEmpty()) {
//				String originalFilename = f.getOriginalFilename();
//				String ext = originalFilename.substring(originalFilename.lastIndexOf('.')+1);
//				
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_ddHHmmssSSS");
//				int rndNum = (int)(Math.random()*1000);
//				String renamedFilename = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + "." + ext;
//				try {
//					f.transferTo(new File(saveDir + "/" + renamedFilename));
//				}catch(IOException e) {
//					e.printStackTrace();
//				}
//				ReportFile reportFile = new ReportFile();
//				reportFile.setReportFileName(renamedFilename);
//				files.add(reportFile);
//			//}
//		}
//		int result = service.insertReport(report, files);
//		
//		if(result>0) {
//			mv.addObject("msg","신고 완료!");
//			mv.addObject("loc", "/report/customerReport");
//			mv.setViewName("common/msg");
//		}else {
//			mv.addObject("msg", "실패");
//			mv.addObject("loc", "/report/customerReport");
//		}
//		
//		return mv;
//	
//	}
		
		int result = service.insertReport(report);
		
		if(result>0) {
			mv.addObject("msg","신고 완료!");
			mv.addObject("loc", "/report/customerReport");
			mv.setViewName("common/msg");
		}else {
			mv.addObject("msg", "실패");
			mv.addObject("loc", "/report/customerReport");
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
