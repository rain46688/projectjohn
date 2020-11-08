package com.kh.john.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.john.admin.model.vo.Notice;
import com.kh.john.board.model.vo.Board;
import com.kh.john.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao {

	//멤버관련
	@Override
	public List<Member> selectMemberList(SqlSessionTemplate session, int cPage, int numPerPage) {
		return session.selectList("admin.selectMemberList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectMemberCount(SqlSession session) {
		return session.selectOne("admin.selectMemberCount");
	}

	@Override
	public int deleteMember(SqlSessionTemplate session, Member m) {
		return session.delete("admin.deleteMember",m);
	}
	
	@Override
	public List<Member> searchMemberList(SqlSessionTemplate session, Map<String,Object> param, int cPage,
			int numPerPage) {
		return session.selectList("admin.searchMemberList",param,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int searchMemberListCount(SqlSession session, Map<String,Object> param) {
		return session.selectOne("admin.searchMemberListCount",param);
	}


	
	//게시판관련
	@Override
	public List<Board> selectBoardList(SqlSessionTemplate session, int cPage, int numPerPage) {
		return session.selectList("admin.selectBoardList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectBoardCount(SqlSession session) {
		return session.selectOne("admin.selectBoardCount");
	}
	
	//전문가관련
	@Override
	public List<Member> selectExpertList(SqlSessionTemplate session, int cPage, int numPerPage) {
		return session.selectList("admin.selectExpertList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectExpertCount(SqlSession session) {
		return session.selectOne("admin.selectExpertCount");
	}

	@Override
	public List<Member> selectBeforeExpertList(SqlSessionTemplate session, int cPage, int numPerPage) {
		return session.selectList("admin.selectBeforeExpertList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));

	}

	@Override
	public int selectBeforeExpertCount(SqlSession session) {
		return session.selectOne("admin.selectBeforeExpertCount");

	}

	@Override
	public Member updateMemberToExpert(SqlSessionTemplate session, Map param) {
		return session.selectOne("admin.updateMemberToExpert",param);
	}


	
	
	
	//공지관련
//	@Override
//	public List<Notice> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerPage) {
//		return session.selectList("admin.selectNoticeList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
//	}
//
//	@Override
//	public int selectNoticeCount(SqlSession session) {
//		return session.selectOne("admin.selectNoticeCount");
//	}
	
	
	
}
