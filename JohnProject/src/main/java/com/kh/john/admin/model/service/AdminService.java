package com.kh.john.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.john.board.model.vo.Board;
import com.kh.john.member.model.vo.Member;

public interface AdminService {

	//멤버관련
	List<Member> selectMemberList(int cPage, int numPerPage);
	
	int selectMemberCount();
	
	int deleteMember(Member m);
	
	//게시판관련
	List<Board> selectBoardList(int cPage, int numPerPage);	
	
	int selectBoardCount();
	
	//전문가관련
	List<Member> selectExpertList(int cPage, int numPerPage);
	
	int selectExpertCount();
	
	List<Member> selectBeforeExpertList(int cPage, int numPerPage);
	
	int selectBeforeExpertCount();
	
	Member updateMemberToExpert(Map param);
	
	
	
	//공지관련
//	List<Notice> selectNoticeList(int cPage, int numPerPage);
//	
//	int selectNoticeCount();
	
	
	

}
