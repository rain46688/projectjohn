package com.kh.john.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.john.board.model.vo.Board;
import com.kh.john.board.model.vo.BoardFile;
import com.kh.john.board.model.vo.Comment;


public interface BoardDao {
	List<Board> boardList(SqlSession session);
	int boardInsert(SqlSession session, Board b);
	int boardInsertFiles(SqlSession session, BoardFile file);
	Board boardSelectOne(SqlSession session, int boardNo);
	List<Comment> commentSelectList(SqlSession session, int currBoardNo);
}
