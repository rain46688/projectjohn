package com.kh.john.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.john.board.model.vo.Board;
import com.kh.john.board.model.vo.BoardFile;


public interface BoardDao {
	List<Board> boardList(SqlSession session);
	int boardInsert(SqlSession session, Board b);
	int boardInsertFiles(SqlSession session, BoardFile file);
}
