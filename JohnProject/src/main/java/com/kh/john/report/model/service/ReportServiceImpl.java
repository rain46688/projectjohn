package com.kh.john.report.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.john.admin.model.vo.NoticeFile;
import com.kh.john.member.model.vo.Member;
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
//	@Override
//	public int insertReport(Report r, List<ReportFile> files) throws RuntimeException {
//		int result = dao.insertReport(session,r);
//		System.out.println("서비스"+files);
//		if(result>0) {
////			if(!files.isEmpty()) {
//				for(ReportFile f: files) {
//					dao.insertReportFile(session, f);
//					
//				}
//			//}
//		}
//		
//		return result;
//	}
	@Override
	public int insertReport(Report r) {
		return dao.insertReport(session, r);
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
	
	@Override
	public List<Report> selectReportListAfter(int cPage, int numPerPage) {
		return dao.selectReportListAfter(session, cPage, numPerPage);
	}

	@Override
	public int selectReportCountAfter() {
		return dao.selectReportCountAfter(session);
	}

	@Override
	public Report selectOneReport(int report_id) {
		return dao.selectOneReport(session, report_id);
	}

	@Override
	public List<ReportFile> selectReportFile(int report_id) {
		return dao.selectReportFile(session, report_id);
	}

	@Override
	public int deleteReport(Report r) {
		int result = dao.deleteReport(session, r);
		return result;
	}

	@Override
	public int reportWarn(Report r) {
		return dao.reportWarn(session, r);
	}

	@Override
	public int reportWarnOut(Member m) {
		return dao.reportWarnOut(session, m);
	}

	@Override
	public int insertReportAnswer(Report r) {
		return dao.insertReportAnswer(session, r);
	}
	
	
	
	

	
}
