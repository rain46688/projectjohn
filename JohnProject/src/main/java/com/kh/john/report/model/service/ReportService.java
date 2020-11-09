package com.kh.john.report.model.service;

import java.util.List;

import com.kh.john.report.model.vo.Report;
import com.kh.john.report.model.vo.ReportFile;

public interface ReportService {

	//customer
	int insertReport(Report r, List<ReportFile> files);
	
	//admin
	List<Report> selectReportList(int cPage, int numPerPage);
	
	int selectReportCount();
}
