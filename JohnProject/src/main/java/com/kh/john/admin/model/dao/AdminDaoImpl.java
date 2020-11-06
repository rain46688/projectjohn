package com.kh.john.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.john.board.model.vo.Board;
import com.kh.john.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Member> selectMemberList(SqlSessionTemplate session, int cPage, int numPerPage) {
		return session.selectList("admin.selectMemberList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectMemberCount(SqlSession session) {
		return session.selectOne("admin.selectMemberCount");
	}

	@Override
	public List<Board> selectBoardList(SqlSessionTemplate session, int cPage, int numPerPage) {
		return session.selectList("admin.selectBoardList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectBoardCount(SqlSession session) {
		return session.selectOne("admin.selectBoardCount");
	}
	
	
}
