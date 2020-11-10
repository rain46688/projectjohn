package com.kh.john.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.john.admin.model.vo.Notice;
import com.kh.john.admin.model.vo.NoticeFile;
import com.kh.john.board.model.vo.Board;
import com.kh.john.member.model.vo.Member;

public interface AdminService {

	//멤버관련
	List<Member> selectMemberList(int cPage, int numPerPage);
	
	int selectMemberCount();
	
	int deleteMember(Member m);
	
	List<Member> searchMemberList(Map<String,Object> param, int cPage, int numPerPage);
	
	int searchMemberListCount(Map<String,Object> param);
	
	Member selectMemberById(Member member);
	
	//게시판관련
	List<Board> selectBoardList(int cPage, int numPerPage);	
	
	int selectBoardCount();
	
	List<Board> searchBoardList(Map<String,Object> param, int cPage, int numPerPage);
	
	int searchBoardListCount(Map<String,Object> param);
	
	//전문가관련
	List<Member> selectExpertList(int cPage, int numPerPage);
	
	int selectExpertCount();
	
	List<Member> selectBeforeExpertList(int cPage, int numPerPage);
	
	int selectBeforeExpertCount();
	
	Member updateMemberToExpert(Map param);
	
	List<Member> searchExpertList(Map<String,Object> param, int cPage, int numPerPage);
	
	int searchExpertListCount(Map<String,Object> param);
	
	//공지관련
	List<Notice> selectNoticeList(int cPage, int numPerPage);
	
	int selectNoticeCount();
	
	int insertNotice(Notice n,List<NoticeFile> files);
	
	Notice selectOneNotice(int notice_id);
	
	List<NoticeFile> selectNoticeFile(int notice_id);
	
	Notice noticeModify(Map param);
	
	int noticeModifyEnd(Notice n);
	
	int deleteNotice(Notice n);
	
	

}
