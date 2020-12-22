package com.kh.john.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.john.board.model.vo.Board;
import com.kh.john.board.model.vo.BoardFile;
import com.kh.john.board.model.vo.Subscribe;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Override
	public List<Map> boardList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("board.boardList");
	}
	
	@Override
	public List<Map> boardSearch(SqlSession session, String keyword, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("board.boardSearch", keyword, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}
	
	@Override
	public int boardSearchCount(SqlSession session, String keyword) {
		// TODO Auto-generated method stub
		return session.selectOne("board.boardSearchCount", keyword);
	}
	
	@Override
	public List<Map> boardPopularList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("board.boardPopularList");
	}
	
	@Override
	public List<Map> boardPopularList(int cPage, int numPerPage, SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("board.boardPopularListSmall",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}
	
	@Override
	public List<Map> boardNewList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("board.boardNewList");
	}
	
	@Override
	public List<Map> boardNewList(int cPage, int numPerPage, SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("board.boardNewListSmall",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}
	
	@Override
	public List<Map> boardLikedList(SqlSession session, int cPage, int numPerPage, int usid) {
		// TODO Auto-generated method stub
		return session.selectList("board.boardLikedList",usid, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}
	
	@Override
	public int boardLikedCount(SqlSession session, int usid) {
		// TODO Auto-generated method stub
		return session.selectOne("board.boardLikedCount", usid);
	}
	
	@Override
	public List<Map> boardHistoryList(SqlSession session, int cPage, int numPerPage, int usid) {
		// TODO Auto-generated method stub
		return session.selectList("board.boardHistoryList",usid, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}
	
	@Override
	public int boardHistoryCount(SqlSession session, int usid) {
		// TODO Auto-generated method stub
		return session.selectOne("board.boardHistoryCount", usid);
	}
	
	@Override
	public List<Map> boardCateList(SqlSession session, int cPage, int numPerPage, String key) {
		// TODO Auto-generated method stub
		return session.selectList("board.boardCateList", key, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}
	
	@Override
	public int boardCateCount(SqlSession session, String key) {
		// TODO Auto-generated method stub
		return session.selectOne("board.boardCateCount", key);
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
	public int boardCurrBoard(SqlSession session) {
		// TODO Auto-generated method stub
		int result = Integer.parseInt(session.selectOne("board.boardCurrBoard"));
		return result;
	}
	
	@Override
	public int boardModify(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("board.boardModify", param);
	}
	
	@Override
	public int boardDelete(SqlSession session, int boardId) {
		// TODO Auto-generated method stub
		return session.update("board.boardDelete", boardId);
	}
	
	@Override
	public Map boardSelectOne(SqlSession session, int boardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("board.boardSelectOne", boardNo);
	}
	
	@Override
	public List<Map> commentSelectList(SqlSession session, int currBoardNo) {
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
	
	@Override
	public int boardLikeInsert(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("board.boardLikeInsert", param);
	}
	
	@Override
	public int boardLikeDelete(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.delete("board.boardLikeDelete", param);
	}
	
	@Override
	public int boardHasLiked(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("board.boardHasLiked", param);
	}
	
	@Override
	public int boardReadCount(SqlSession session, int boardNo) {
		// TODO Auto-generated method stub
		return session.update("board.boardReadCount", boardNo);
	}
	
	@Override
	public int boardHasJudged(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("board.boardHasJudged", param);
	}
	
	@Override
	public int boardJudgeInsert(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("board.boardJudgeInsert", param);
	}
	
	@Override
	public int boardCommentHasLiked(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("board.boardCommentHasLiked", param);
	}
	
	@Override
	public int boardCommentLike(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("board.boardCommentLike", param);
	}
	
	@Override
	public int boardCommentDelete(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.delete("board.boardCommentDelete", param);
	}
	
	@Override
	public int boardCommentModify(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("board.boardCommentModify", param);
	}
}
