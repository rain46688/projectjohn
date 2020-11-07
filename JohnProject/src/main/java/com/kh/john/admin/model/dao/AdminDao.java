package com.kh.john.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.john.board.model.vo.Board;
import com.kh.john.member.model.vo.Member;

public interface AdminDao {

	//멤버관련
	List<Member> selectMemberList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	int selectMemberCount(SqlSession session);
	
	int deleteMember(SqlSessionTemplate session, Member m);
	
	//게시판관련
	List<Board> selectBoardList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	int selectBoardCount(SqlSession session);
	
	//전문가관련
	List<Member> selectExpertList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	int selectExpertCount(SqlSession session);
	
	List<Member> selectBeforeExpertList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	int selectBeforeExpertCount(SqlSession session);
	
	Member updateMemberToExpert(SqlSessionTemplate session, Map param);
	
	//공지관련
//	List<Notice> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerPage);
//	
//	int selectNoticeCount(SqlSession session);
} 
