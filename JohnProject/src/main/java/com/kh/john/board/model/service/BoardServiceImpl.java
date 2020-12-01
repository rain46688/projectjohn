package com.kh.john.board.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.john.board.model.dao.BoardDao;
import com.kh.john.board.model.vo.Board;
import com.kh.john.board.model.vo.BoardFile;
import com.kh.john.board.model.vo.Comment;
import com.kh.john.board.model.vo.Subscribe;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao dao;
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<Board> boardList() {
		// TODO Auto-generated method stub
		return dao.boardList(session);
	}
	
	@Override
	@Transactional
	public int boardInsert(Board b) {
		// TODO Auto-generated method stub
		int result = dao.boardInsert(session, b);
		
		return result;
	}
	
	@Override
	public Map boardSelectOne(int boardNo) {
		// TODO Auto-generated method stub
		return dao.boardSelectOne(session, boardNo);
	}
	
	@Override
	public List<Map> commentSelectList(int currBoardNo) {
		// TODO Auto-generated method stub
		return dao.commentSelectList(session, currBoardNo);
	}
	
	@Override
	public int boardCommentInsert(Map param) {
		// TODO Auto-generated method stub
		return dao.boardCommentInsert(session, param);
	}
	
	@Override
	public List<Board> boardSelectCate(String boardTitle) {
		// TODO Auto-generated method stub
		return dao.boardSelectCate(session, boardTitle);
	}
	
	@Override
	public List<Subscribe> boardSubList(int usid) {
		// TODO Auto-generated method stub
		return dao.boardSubList(session, usid);
	}
	
	@Override
	public int boardLikeInsert(Map param) {
		// TODO Auto-generated method stub
		return dao.boardLikeInsert(session, param);
	}
	
	@Override
	public int boardLikeDelete(Map param) {
		// TODO Auto-generated method stub
		return dao.boardLikeDelete(session, param);
	}
	
	@Override
	public int boardHasLiked(Map param) {
		// TODO Auto-generated method stub
		return dao.boardHasLiked(session, param);
	}
	
	@Override
	public int boardReadCount(int boardNo) {
		// TODO Auto-generated method stub
		return dao.boardReadCount(session, boardNo);
	}
	
	@Override
	public int boardHasJudged(Map param) {
		// TODO Auto-generated method stub
		return dao.boardHasJudged(session, param);
	}
	
	@Override
	public int boardJudgeInsert(Map param) {
		// TODO Auto-generated method stub
		return dao.boardJudgeInsert(session, param);
	}
	
	@Override
	public int boardCommentHasLiked(Map param) {
		// TODO Auto-generated method stub
		return dao.boardCommentHasLiked(session, param);
	}
	
	@Override
	public int boardCommentLike(Map param) {
		// TODO Auto-generated method stub
		return dao.boardCommentLike(session,param);
	}
}
