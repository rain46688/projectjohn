package com.kh.john.report.model.service;

import java.util.List;

import com.kh.john.member.model.vo.Member;
import com.kh.john.report.model.vo.Report;
import com.kh.john.report.model.vo.ReportFile;

public interface ReportService {

	//customer
	int insertReport(Report r, List<ReportFile> files);
	
	//admin
	List<Report> selectReportList(int cPage, int numPerPage);
	
	int selectReportCount();
	
	Report selectOneReport(int report_id);
	
	List<ReportFile> selectReportFile(int report_id);
	
	int deleteReport(Report r);
	
	int reportWarn(Report r);
	
	int reportWarnOut(Member m);
	
	int insertReportAnswer(Report r);
	
}
