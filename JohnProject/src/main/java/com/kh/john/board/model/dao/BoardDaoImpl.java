package com.kh.john.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.john.board.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Override
	public List<Board> boardList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("board.boardList");
	}
}
