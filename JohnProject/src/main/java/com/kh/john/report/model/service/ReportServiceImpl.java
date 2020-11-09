package com.kh.john.report.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.john.report.model.dao.ReportDao;
import com.kh.john.report.model.vo.Report;
import com.kh.john.report.model.vo.ReportFile;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	//customer
	@Override
	public int insertReport(Report r, List<ReportFile> files) throws RuntimeException {
		int result = dao.insertReport(session, r);
		
		if(result==0) throw new RuntimeException("0값입력!");
		
		if(!files.isEmpty()) {
			for(ReportFile file: files) {
				result = dao.insertReportFile(session, file);
				if(result==0) throw new RuntimeException("입력 오류");
				
			}
		}
		
		return result;
	}


	
	
	//admin
	@Override
	public List<Report> selectReportList(int cPage, int numPerPage) {
		return dao.selectReportList(session, cPage, numPerPage);
	}

	@Override
	public int selectReportCount() {
		return dao.selectReportCount(session);
	}
	
	

	
}
