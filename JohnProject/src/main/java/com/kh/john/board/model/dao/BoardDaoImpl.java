package com.kh.john.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.john.board.model.vo.Board;
import com.kh.john.board.model.vo.BoardFile;
import com.kh.john.board.model.vo.Comment;
import com.kh.john.board.model.vo.Subscribe;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Override
	public List<Board> boardList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("board.boardList");
	}
	
	@Override
	public int boardInsert(SqlSession session, Board b) {
		// TODO Auto-generated method stub
		return session.insert("board.boardInsert", b);
	}
	
	@Override
	public int boardInsertFiles(SqlSession session, BoardFile file) {
		// TODO Auto-generated method stub
		return session.insert("board.boardInsertFile", file);
	}
	
	@Override
	public Board boardSelectOne(SqlSession session, int boardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("board.boardSelectOne", boardNo);
	}
	
	@Override
	public List<Comment> commentSelectList(SqlSession session, int currBoardNo) {
		// TODO Auto-generated method stub
		return session.selectList("board.commentSelectList", currBoardNo);
	}
	
	@Override
	public int boardCommentInsert(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("board.boardCommentInsert", param);
	}
	
	@Override
	public List<Board> boardSelectCate(SqlSession session, String boardTitle) {
		// TODO Auto-generated method stub
		return session.selectList("board.boardSelectCate", boardTitle);
	}
	
	@Override
	public List<Subscribe> boardSubList(SqlSession session, int usid) {
		// TODO Auto-generated method stub
		return session.selectList("board.boardSubList", usid);
	}
}
