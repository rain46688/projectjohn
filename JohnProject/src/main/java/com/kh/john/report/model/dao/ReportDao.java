package com.kh.john.report.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.john.report.model.vo.Report;
import com.kh.john.report.model.vo.ReportFile;

public interface ReportDao {

	//customer
	int insertReport(SqlSession session, Report r);
	
	int insertReportFile(SqlSession session, ReportFile file);

	//admin
	List<Report> selectReportList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	int selectReportCount(SqlSession session);
}
