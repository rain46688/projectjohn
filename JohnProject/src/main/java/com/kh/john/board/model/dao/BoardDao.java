package com.kh.john.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.john.board.model.vo.Board;
import com.kh.john.board.model.vo.BoardFile;
import com.kh.john.board.model.vo.Comment;
import com.kh.john.board.model.vo.Subscribe;


public interface BoardDao {
	List<Map> boardList(SqlSession session);
	List<Map> boardPopularList(SqlSession session);
	List<Map> boardPopularList(int cPage, int numPerPage, SqlSession session);
	List<Map> boardNewList(SqlSession session);
	List<Map> boardNewList(int cPage, int numPerPage, SqlSession session);
	List<Map> boardLikedList(SqlSession session, int cPage, int numPerPage, int usid);
	int boardLikedCount(SqlSession session, int usid);
	List<Map> boardHistoryList(SqlSession session, int cPage, int numPerPage, int usid);
	int boardHistoryCount(SqlSession session, int usid);
	List<Map> boardCateList(SqlSession session, int cPage, int numPerPage, String key);
	int boardCateCount(SqlSession session, String key);
	List<Board> boardSelectCate(SqlSession session, String boardTitle);
	int boardInsert(SqlSession session, Board b);
	int boardInsertFiles(SqlSession session, BoardFile file);
	Map boardSelectOne(SqlSession session, int boardNo);
	List<Map> commentSelectList(SqlSession session, int currBoardNo);
	int boardCommentInsert(SqlSession session, Map param);
	List<Subscribe> boardSubList(SqlSession session, int usid);
	int boardLikeInsert(SqlSession session, Map param);
	int boardLikeDelete(SqlSession session, Map param);
	int boardHasLiked(SqlSession session, Map param);
	int boardReadCount(SqlSession session, int boardNo);
	int boardHasJudged(SqlSession session, Map param);
	int boardJudgeInsert(SqlSession session, Map param);
	int boardCommentHasLiked(SqlSession session, Map param);
	int boardCommentLike(SqlSession session, Map param);
	int boardCommentDelete(SqlSession session, Map param);
	int boardCommentModify(SqlSession session, Map param);
}
