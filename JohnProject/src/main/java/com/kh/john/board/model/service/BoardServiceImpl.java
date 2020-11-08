package com.kh.john.board.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.john.board.model.dao.BoardDao;
import com.kh.john.board.model.vo.Board;

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
}
