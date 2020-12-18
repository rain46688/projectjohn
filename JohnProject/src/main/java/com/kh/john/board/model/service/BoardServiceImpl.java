package com.kh.john.board.model.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.TransactionIsolationLevel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.john.board.model.dao.BoardDao;
import com.kh.john.board.model.vo.Board;
import com.kh.john.board.model.vo.Subscribe;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao dao;
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<Map> boardList() {
		// TODO Auto-generated method stub
		return dao.boardList(session);
	}
	
	@Override
	public List<Map> boardPopularList() {
		// TODO Auto-generated method stub
		return dao.boardPopularList(session);
	}
	
	@Override
	public List<Map> boardPopularList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.boardPopularList(cPage, numPerPage, session);
	}
	
	@Override
	public List<Map> boardNewList() {
		// TODO Auto-generated method stub
		return dao.boardNewList(session);
	}
	
	@Override
	public List<Map> boardNewList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.boardNewList(cPage, numPerPage, session);
	}
	
	@Override
	public List<Map> boardLikedList(int cPage, int numPerPage, int usid) {
		// TODO Auto-generated method stub
		return dao.boardLikedList(session, cPage, numPerPage, usid);
	}
	
	@Override
	public int boardLikedCount(int usid) {
		// TODO Auto-generated method stub
		return dao.boardLikedCount(session, usid);
	}
	
	@Override
	public List<Map> boardHistoryList(int cPage, int numPerPage, int usid) {
		// TODO Auto-generated method stub
		return dao.boardHistoryList(session, cPage, numPerPage, usid);
	}
	
	@Override
	public int boardHistoryCount(int usid) {
		// TODO Auto-generated method stub
		return dao.boardHistoryCount(session, usid);
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
	
	@Override
	public int boardCommentDelete(Map param) {
		// TODO Auto-generated method stub
		return dao.boardCommentDelete(session,param);
	}
	
	@Override
	public int boardCommentModify(Map param) {
		// TODO Auto-generated method stub
		return dao.boardCommentModify(session,param);
	}
}
