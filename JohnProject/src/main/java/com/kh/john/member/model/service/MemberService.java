package com.kh.john.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.john.board.model.vo.Board;
import com.kh.john.exboard.model.vo.ExpertBoard;
import com.kh.john.member.model.vo.License;
import com.kh.john.member.model.vo.LikeDislike;
import com.kh.john.member.model.vo.Member;
import com.kh.john.report.model.vo.Report;

public interface MemberService {

	List<Map<String, Object>> selectMember();

	//이메일 인증 키 보내기
	String sendAuthKey(String email) throws Exception;

	//아이디로 멤버 찾기
	Member selectMemberById(Member member);
	Member selectMemberById(Map param);

	//닉네임으로 멤버 찾기
	Member nickDuplicate(Member member);

	//폰번 중복 검사(번호로 멤버 찾기)
	Member phoneDuplicate(Member member);
	
	//회원가입
	int signUpEnd(Member member);
	int signUpExpert(Member member, List<License> licenseList);

	//이름과 폰번으로 회원 찾기
	Member findId(Member member);

	//이름과 폰번과 아이디로 회원 찾기
	Member findPw(Member member);

	//임시 비밀번호로 비번 업뎃
	int tempPw(Member member);
	
	//usid로 비밀번호 바꿔주기
	int updatePw(Member member);

	//닉네임 변경
	int updateNick(Member member);

	//프사 변경
	int updatePic(Member member);

	//번호 변경
	int updatePhone(Member member);

	//내 게시물 목록
	List<Board> myBoard(int cPage, int numPerPage, int usid);

	//내 게시물 개수
	int myBoardCount(int usid);

	//게시물 디테일
	Board searchBoard(Board board);

	//좋아요 한 게시물
	List<Board> liked(int cPage, int numPerPage, int usid);

	//좋아요 게시물 개수
	int likedCount(int usid);
	
	//신고 한 게시물
	List<Report> myReport(int cPage, int numPerPage, int usid);

	//신고한 게시물 개수
	int myReportCount(int usid);

	//신고 디테일
	Report searchReport(Report report);

	//전문가 신청하기
	int applyExpert(Member member, List<License> licenseList);

	//상담내역
	List<ExpertBoard> expertBoardList(int cPage, int numPerPage, int usid);

	//상담내역 개수
	int expertBoardCount(int usid);
	


}
