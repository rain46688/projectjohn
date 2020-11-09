package com.kh.john.report.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

	
}
