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
	public int boardInsert(List<BoardFile> files, Board b) {
		// TODO Auto-generated method stub
		
		int result = dao.boardInsert(session, b);
		
		if(result > 0) {
			if(!files.isEmpty()) {
				for(BoardFile f : files) {
					dao.boardInsertFiles(session, f);
				}
			}
		}
		
		return result;
	}
	
	@Override
	public Board boardSelectOne(int boardNo) {
		// TODO Auto-generated method stub
		return dao.boardSelectOne(session, boardNo);
	}
	
	@Override
	public List<Comment> commentSelectList(int currBoardNo) {
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
}
