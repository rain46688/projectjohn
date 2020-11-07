package com.kh.john.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.john.board.model.vo.Board;


public interface BoardDao {
	List<Board> boardList(SqlSession session);
}
