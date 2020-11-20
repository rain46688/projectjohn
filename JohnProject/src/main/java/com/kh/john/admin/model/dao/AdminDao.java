package com.kh.john.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.john.admin.model.vo.AdminChat;
import com.kh.john.admin.model.vo.AdminMessage;
import com.kh.john.admin.model.vo.Notice;
import com.kh.john.admin.model.vo.NoticeFile;
import com.kh.john.board.model.vo.Board;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.model.vo.License;
import com.kh.john.member.model.vo.Member;

public interface AdminDao {

	//멤버관련
	List<Member> selectMemberList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	int selectMemberCount(SqlSession session);
	
	int deleteMember(SqlSessionTemplate session, Member m);
	
	List<Member> searchMemberList(SqlSessionTemplate session, Map<String,Object> param, int cPage, int numPerPage);
	
	int searchMemberListCount(SqlSession session, Map<String,Object> param);

	Member selectMemberById(SqlSessionTemplate session, Member member);
	
	//게시판관련
	List<Board> selectBoardList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	int selectBoardCount(SqlSession session);
	
	List<Board> searchBoardList(SqlSessionTemplate session, Map<String,Object> param, int cPage, int numPerPage);
	
	int searchBoardListCount(SqlSession session, Map<String,Object> param);
	
	//전문가관련
	List<Member> selectExpertList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	int selectExpertCount(SqlSession session);
	
	List<Member> selectBeforeExpertList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	int selectBeforeExpertCount(SqlSession session);
	
	Member updateMemberToExpert(SqlSessionTemplate session, Map param);
	
	List<License> updateMemberToExpertLicense(SqlSessionTemplate session, Map param);
	
	List<Member> searchExpertList(SqlSessionTemplate session, Map<String,Object> param, int cPage, int numPerPage);
	
	int searchExpertListCount(SqlSession session, Map<String,Object> param);
	
	int updateMemberToExpertEnd(SqlSession session, Member m);
	
	List<ExpertRequest> selectAdminExpertCounsel(SqlSessionTemplate session, int cPage, int numPerPage);
	
	List<ExpertRequest> selectAdminExpertCounsel2(SqlSessionTemplate session, int cPage, int numPerPage);

	int selectAdminExpertCounselCount(SqlSession session);
	
	//공지관련
	List<Notice> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	int selectNoticeCount(SqlSession session);
	
	int insertNotice(SqlSession session, Notice n);
	
	int insertNoticeFile(SqlSession session, NoticeFile file);
	
	Notice selectOneNotice(SqlSessionTemplate session, int notice_id);
	
	List<NoticeFile> selectNoticeFile(SqlSession session, int notice_id);
	
	Notice noticeModify(SqlSessionTemplate session, Map param);
	
	int noticeModifyEnd(SqlSessionTemplate session, Notice n);
	
	int noticeModifyFile(SqlSession session, NoticeFile file);
	
	int deleteNotice(SqlSessionTemplate session, Notice n);
	
	
	
	//1:1문의관련
	
	int insertAdminChat(SqlSessionTemplate session, AdminChat ac) throws Exception;
	
	List<AdminChat> selectAdminChat(SqlSessionTemplate session, Map<String, Object> param, int cPage, int numPerPage);
	
	int selectAdminChatCount(SqlSessionTemplate session);
	
	List<AdminChat> selectAdminInChat(SqlSessionTemplate session);

	
	List<Integer> firstUsidList(SqlSessionTemplate session);

	List<Integer> secondUsidList(SqlSessionTemplate session);

	AdminMessage loadAdminMessage(SqlSessionTemplate session, HashMap<String, Integer> usidMap);
	
} 
