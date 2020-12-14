package com.kh.john.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.john.board.model.vo.Board;
import com.kh.john.board.model.vo.BoardFile;
import com.kh.john.board.model.vo.Comment;
import com.kh.john.board.model.vo.Subscribe;

public interface BoardService {
	List<Map> boardList();
	List<Board> boardSelectCate(String boardTitle);
	int boardInsert(Board b);
	Map boardSelectOne(int boardNo);
	List<Map> commentSelectList(int currBoardNo);
	int boardCommentInsert(Map param);
	List<Subscribe> boardSubList(int usid);
	int boardLikeInsert(Map param);
	int boardLikeDelete(Map param);
	int boardHasLiked(Map param);
	int boardReadCount(int boardNo);
	int boardHasJudged(Map param);
	int boardJudgeInsert(Map param);
	int boardCommentHasLiked(Map param);
	int boardCommentLike(Map param);
	int boardCommentDelete(Map param);
	int boardCommentModify(Map param);
}

