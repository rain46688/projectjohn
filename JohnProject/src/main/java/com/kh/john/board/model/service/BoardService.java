package com.kh.john.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.john.board.model.vo.Board;
import com.kh.john.board.model.vo.BoardFile;
import com.kh.john.board.model.vo.Comment;
import com.kh.john.board.model.vo.Subscribe;

public interface BoardService {
	List<Map> boardList();
	List<Map> boardPopularList();
	List<Map> boardPopularList(int cPage, int numPerPage);
	List<Map> boardNewList();
	List<Map> boardNewList(int cPage, int numPerPage);
	List<Map> boardLikedList(int cPage, int numPerPage, int usid);
	int boardLikedCount(int usid);
	List<Map> boardHistoryList(int cPage, int numPerPage, int usid);
	int boardHistoryCount(int usid);
	List<Map> boardCateList(int cPage, int numPerPage, String key);
	int boardCateCount(String key);
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

