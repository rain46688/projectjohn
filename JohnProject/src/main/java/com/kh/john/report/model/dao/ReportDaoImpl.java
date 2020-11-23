package com.kh.john.report.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.john.member.model.vo.Member;
import com.kh.john.report.model.vo.Report;
import com.kh.john.report.model.vo.ReportFile;

@Repository
public class ReportDaoImpl implements ReportDao {

	//customer
	@Override
	public int insertReport(SqlSession session, Report r) {
		return session.insert("report.insertReport",r);
	}

	@Override
	public int insertReportFile(SqlSession session, ReportFile file) {
		return session.insert("report.insertReportFile",file);
	}

	//admin
	@Override
	public List<Report> selectReportList(SqlSessionTemplate session, int cPage, int numPerPage) {
		return session.selectList("report.selectReportList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectReportCount(SqlSession session) {
		return session.selectOne("report.selectReportCount");
	}

	@Override
	public List<Report> selectReportListAfter(SqlSessionTemplate session, int cPage, int numPerPage) {
		return session.selectList("report.selectReportListAfter",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectReportCountAfter(SqlSession session) {
		return session.selectOne("report.selectReportCountAfter");
	}

	@Override
	public Report selectOneReport(SqlSessionTemplate session, int report_id) {
		return session.selectOne("report.selectOneReport",report_id);
	}

	@Override
	public List<ReportFile> selectReportFile(SqlSession session, int report_id) {
		return session.selectList("report.selectReportFile",report_id);
	}

	@Override
	public int deleteReport(SqlSessionTemplate session, Report r) {
		return session.delete("report.deleteReport",r);
	}

	@Override
	public int reportWarn(SqlSessionTemplate session, Report r) {
		return session.insert("report.reportWarn",r);
	}

	@Override
	public int reportWarnOut(SqlSessionTemplate session, Member m) {
		return session.insert("report.reportWarnOut",m);
	}

	@Override
	public int insertReportAnswer(SqlSessionTemplate session, Report r) {
		return session.insert("report.insertReportAnswer",r);
	}
	
	

	
}
