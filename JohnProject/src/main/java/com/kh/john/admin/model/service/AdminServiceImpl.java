package com.kh.john.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.john.admin.model.dao.AdminDao;
import com.kh.john.board.model.vo.Board;
import com.kh.john.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Member> selectMemberList(int cPage, int numPerPage) {
		return dao.selectMemberList(session, cPage, numPerPage);
	}

	@Override
	public int selectMemberCount() {
		return dao.selectMemberCount(session);
	}
	
	@Override
	public List<Board> selectBoardList(int cPage, int numPerPage) {
		return dao.selectBoardList(session,cPage,numPerPage);
	}

	@Override
	public int selectBoardCount() {
		return dao.selectBoardCount(session);
	}
	
}
