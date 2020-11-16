package com.kh.john.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.john.board.model.vo.Board;
import com.kh.john.member.model.vo.License;
import com.kh.john.member.model.vo.LikeDislike;
import com.kh.john.member.model.vo.Member;
import com.kh.john.report.model.vo.Report;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public List<Map<String, Object>> selectMember(SqlSessionTemplate session) {
		return session.selectList("member.selectMember");
	}
	
	@Override
	public Member selectMemberById(SqlSessionTemplate session, Member member) {
		return session.selectOne("member.selectMemberById",member);
	}
	@Override
	public Member selectMemberById(SqlSessionTemplate session, Map param) {
		return session.selectOne("member.selectMemberById",param);
	}

	@Override
	public Member nickDuplicate(SqlSessionTemplate session, Member member) {
		return session.selectOne("member.selectMemberByNick", member);
	}

	@Override
	public Member phoneDuplicate(SqlSessionTemplate session, Member member) {
		return session.selectOne("member.selectMemberByPhone", member);
	}
	
	@Override
	public int signUpEnd(SqlSessionTemplate session, Member member) {
		return session.insert("member.signUpEnd",member);
	}

	@Override
	public int signUpExpert(SqlSessionTemplate session, License l) {
		return session.insert("member.signUpExpert",l);
	}

	@Override
	public Member findId(SqlSessionTemplate session, Member member) {
		return session.selectOne("member.findId",member);
	}

	@Override
	public Member findPw(SqlSessionTemplate session, Member member) {
		return session.selectOne("member.findPw",member);
	}

	@Override
	public int tempPw(SqlSessionTemplate session, Member member) {
		return session.update("member.tempPw",member);
	}

	@Override
	public int updatePw(SqlSessionTemplate session, Member member) {
		return session.update("member.updatePw",member);
	}

	@Override
	public int updateNick(SqlSessionTemplate session, Member member) {
		return session.update("member.updateNick",member);
	}

	@Override
	public int updatePic(SqlSessionTemplate session, Member member) {
		return session.update("member.updatePic",member);
	}

	@Override
	public int updatePhone(SqlSessionTemplate session, Member member) {
		return session.update("member.updatePhone",member);
	}

	@Override
	public List<Board> myBoard(SqlSessionTemplate session, int cPage, int numPerPage, int usid) {
		return session.selectList("member.selectMyBoard",usid,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int myBoardCount(SqlSessionTemplate session, int usid) {
		return session.selectOne("member.myBoardCount",usid);
	}

	@Override
	public Board searchBoard(SqlSessionTemplate session, Board board) {
		return session.selectOne("member.searchBoard",board);
	}

	@Override
	public List<Board> liked(SqlSessionTemplate session, int cPage, int numPerPage, int usid) {
		return session.selectList("member.liked",usid,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}	

	@Override
	public int likedCount(SqlSessionTemplate session, int usid) {
		return session.selectOne("member.likedCount",usid);
	}

	@Override
	public List<Report> myReport(SqlSessionTemplate session, int cPage, int numPerPage, int usid) {
		return session.selectList("member.myReport",usid,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int myReportCount(SqlSessionTemplate session, int usid) {
		return session.selectOne("member.myReportCount",usid);
	}

	@Override
	public Report searchReport(SqlSessionTemplate session, Report report) {
		return session.selectOne("member.searchReport",report);
	}


}
