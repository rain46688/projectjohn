package com.kh.john.member.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.john.board.model.vo.Board;
import com.kh.john.exboard.model.vo.ExpertBoard;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.controller.MailHandler;
import com.kh.john.member.controller.UuidGenerator;
import com.kh.john.member.model.dao.MemberDao;
import com.kh.john.member.model.vo.License;
import com.kh.john.member.model.vo.LikeDislike;
import com.kh.john.member.model.vo.Member;
import com.kh.john.member.model.vo.MemberChat;
import com.kh.john.member.model.vo.MemberMessage;
import com.kh.john.report.model.vo.Report;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private MemberService service;

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public List<Map<String, Object>> selectMember() {
		return dao.selectMember(session);
	}

	@Override
	public String sendAuthKey(String email) throws Exception {
		String authKey=new UuidGenerator().generateUuid(10);
		MailHandler sendMail=new MailHandler(mailSender);
		sendMail.setSubject("재판하는 존경장님 인증을 부탁드려요:)");
		sendMail.setText(
                new StringBuffer()
                .append("<h1>회원가입 인증번호입니다.</h1>")
                .append("<h2>"+authKey+"</h2>")
                .toString());
		sendMail.setFrom("your.honor.2020.john@gmail.com", "관리자");
		sendMail.setTo(email);
		sendMail.send();
		return authKey;
	}
	
	@Override
	public Member selectMemberById(Member member) {
		return dao.selectMemberById(session, member);
	}
	@Override
	public Member selectMemberById(Map param) {
		return dao.selectMemberById(session, param);
	}
	
	@Override
	public Member selectMemberByUsid(Member member) {
		return dao.selectMemberByUsid(session, member);
	}

	@Override
	public Member nickDuplicate(Member member) {
		return dao.nickDuplicate(session, member);
	}

	@Override
	public Member phoneDuplicate(Member member) {
		return dao.phoneDuplicate(session, member);
	}
	
	@Override
	public int signUpEnd(Member member) {
		return dao.signUpEnd(session, member);
	}

	@Override
	@Transactional
	public int signUpExpert(Member member, List<License> licenseList) {
		int result=dao.signUpEnd(session, member);
	
		if(!licenseList.isEmpty()) {
			for(License l : licenseList) {
				dao.signUpExpert(session,l);
			}
		}
		return result;
	}

	@Override
	public Member findId(Member member) {
		return dao.findId(session, member);
	}

	@Override
	public Member findPw(Member member) {
		return dao.findPw(session, member);
	}

	@Override
	public int tempPw(Member member) {
		return dao.tempPw(session,member);
	}
	
	@Override
	public int updatePw(Member member) {
		return dao.updatePw(session,member);
	}

	@Override
	public int updateNick(Member member) {
		return dao.updateNick(session,member);
	}

	@Override
	public int updatePic(Member member) {
		return dao.updatePic(session, member);
	}

	@Override
	public int updatePhone(Member member) {
		return dao.updatePhone(session, member);
	}

	@Override
	public List<Board> myBoard(int cPage, int numPerPage, int usid) {
		return dao.myBoard(session, cPage, numPerPage, usid);
	}

	@Override
	public int myBoardCount(int usid) {
		return dao.myBoardCount(session, usid);
	}

	@Override
	public Board searchBoard(Board board) {
		return dao.searchBoard(session, board);
	}

	@Override
	public List<Board> liked(int cPage, int numPerPage, int usid) {
		return dao.liked(session, cPage, numPerPage, usid);
	}	

	@Override
	public int likedCount(int usid) {
		return dao.likedCount(session, usid);
	}

	@Override
	public List<Report> myReport(int cPage, int numPerPage, int usid) {
		return dao.myReport(session, cPage, numPerPage, usid);
	}

	@Override
	public int myReportCount(int usid) {
		return dao.myReportCount(session,usid);
	}

	@Override
	public Report searchReport(Report report) {
		return dao.searchReport(session, report);
	}

	@Override
	public int applyExpert(Member member, List<License> licenseList) {
		int result=dao.updateMemberClass(session, member);
		
		if(!licenseList.isEmpty()) {
			for(License l : licenseList) {
				dao.applyExpert(session,l);
			}
		}
		return result;
	}

	@Override
	public List<ExpertBoard> expertBoardList(int cPage, int numPerPage, int usid) {
		return dao.expertBoardList(session, cPage, numPerPage, usid);
	}

	@Override
	public int expertBoardCount(int usid) {
		return dao.expertBoardCount(session, usid);
	}

	@Override
	public int insertMemberChat(MemberChat memberChat) throws Exception {
		return dao.insertMemberChat(session, memberChat);
	}

	@Override
	public List<Integer> firstUsid(int myUsid) {
		return dao.firstUsid(session, myUsid);
	}

	@Override
	public List<Integer> secondUsid(int myUsid) {
		return dao.secondUsid(session, myUsid);
	}

	@Override
	public List<Integer> firstUsidList(int myUsid) {
		return dao.firstUsidList(session, myUsid);
	}
	
	@Override
	public List<Integer> secondUsidList(int myUsid) {
		return dao.secondUsidList(session, myUsid);
	}

	@Override
	public MemberMessage loadLatestMessage(HashMap<String, Integer> usidMap) {
		return dao.loadLatestMessage(session, usidMap);
	}

	@Override
	public List<Member> memberListByNick(String nick) {
		return dao.memberListByNick(session, nick);
	}

	@Override
	public List<MemberChat> loadAllChatList() {
		return dao.loadAllChatList(session);
	}

	@Override
	public List<ExpertBoard> expertCounselingHistory(int cPage, int numPerPage, int usid) {
		return dao.expertCounselingHistory(session, cPage, numPerPage, usid);
	}

	@Override
	public int expertCounselingHistoryCount(int usid) {
		return dao.expertCounselingHistoryCount(session,usid);
	}

	@Override
	public List<ExpertRequest> counselingRequest(int cPage, int numPerPage, int usid) {
		return dao.counselingRequest(session, cPage, numPerPage, usid);
	}

	@Override
	public int requestListCount(int usid) {
		return dao.requestListCount(session, usid);
	}

	@Override
	@Transactional
	public List<MemberChat> reloadChatList(MemberChat memberChat) {
		int result=dao.insertMemberChat(session, memberChat);
		List<MemberChat> allChatList=new ArrayList<MemberChat>();
		if(result>0) {
			allChatList=dao.loadAllChatList(session);
		}
		return allChatList;
	}

	@Override
	public int goodBye(int usid) {
		int result=dao.goodBye(session, usid);
		return result;
	}

	@Override
	public int chargePoint(Member member) {
		int result=dao.chargePoint(session, member);
		return result;
	}

	@Override
	public int signUpNaverEnd(Member member) {
		return dao.signUpNaverEnd(session, member);
	}

	@Override
	public int signUpNaverExpert(Member member, List<License> licenseList) {
		int result=dao.signUpNaverEnd(session, member);
		
		if(!licenseList.isEmpty()) {
			for(License l : licenseList) {
				dao.signUpExpert(session,l);
			}
		}
		return result;
	}


	





}
