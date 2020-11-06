package com.kh.john.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.john.board.model.vo.Board;
import com.kh.john.member.model.vo.Member;

public interface AdminDao {

	List<Member> selectMemberList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	int selectMemberCount(SqlSession session);
	
	List<Board> selectBoardList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	int selectBoardCount(SqlSession session);
}
