package com.kh.john.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.john.board.model.vo.Board;
import com.kh.john.board.model.vo.BoardFile;
import com.kh.john.board.model.vo.Comment;
import com.kh.john.board.model.vo.Subscribe;

public interface BoardService {
	List<Board> boardList();
	List<Board> boardSelectCate(String boardTitle);
	int boardInsert(Board b);
	Map boardSelectOne(int boardNo);
	List<Comment> commentSelectList(int currBoardNo);
	int boardCommentInsert(Map param);
	List<Subscribe> boardSubList(int usid);
	int boardLikeInsert(Map param);
	int boardLikeDelete(Map param);
	int boardHasLiked(Map param);
	int boardReadCount(int boardNo);

}

