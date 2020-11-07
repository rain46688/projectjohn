package com.kh.john.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.john.admin.model.dao.AdminDao;
import com.kh.john.admin.model.vo.Notice;
import com.kh.john.board.model.vo.Board;
import com.kh.john.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{
	
	
	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	
	//멤버관련
	@Override
	public List<Member> selectMemberList(int cPage, int numPerPage) {
		return dao.selectMemberList(session, cPage, numPerPage);
	}

	@Override
	public int selectMemberCount() {
		return dao.selectMemberCount(session);
	}
	
	
	
	@Override
	public int deleteMember(Member m) {
		return dao.deleteMember(session, m);
	}

	//게시판관련
	@Override
	public List<Board> selectBoardList(int cPage, int numPerPage) {
		return dao.selectBoardList(session,cPage,numPerPage);
	}

	@Override
	public int selectBoardCount() {
		return dao.selectBoardCount(session);
	}
	
	//전문가관련
	@Override
	public List<Member> selectExpertList(int cPage, int numPerPage) {
		return dao.selectExpertList(session,cPage,numPerPage);
	}

	@Override
	public int selectExpertCount() {
		return dao.selectExpertCount(session);
	}

	@Override
	public List<Member> selectBeforeExpertList(int cPage, int numPerPage) {
		return dao.selectBeforeExpertList(session,cPage,numPerPage);

	}
	
	@Override
	public int selectBeforeExpertCount() {
		return dao.selectBeforeExpertCount(session);

	}

	@Override
	public Member updateMemberToExpert(Map param) {
		return dao.updateMemberToExpert(session, param);
	}
	
	
	
	
	//공지관련
//	@Override
//	public List<Notice> selectNoticeList(int cPage, int numPerPage) {
//		return dao.selectNoticeList(session,cPage,numPerPage);
//	}
//
//	@Override
//	public int selectNoticeCount() {
//		return dao.selectNoticeCount(session);
//	}
	
	
	
}
