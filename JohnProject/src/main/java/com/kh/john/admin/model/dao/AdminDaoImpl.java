package com.kh.john.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.john.admin.model.vo.AdminChat;
import com.kh.john.admin.model.vo.Notice;
import com.kh.john.admin.model.vo.NoticeFile;
import com.kh.john.board.model.vo.Board;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.model.vo.License;
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


	
	@Override
	public Member selectMemberById(SqlSessionTemplate session, Member member) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemberById",member);
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
	
	@Override
	public List<Board> searchBoardList(SqlSessionTemplate session, Map<String, Object> param, int cPage,
			int numPerPage) {
		return session.selectList("admin.searchBoardList",param,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int searchBoardListCount(SqlSession session, Map<String, Object> param) {
		return session.selectOne("admin.searchBoardListCount",param);
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

	@Override
	public List<License> updateMemberToExpertLicense(SqlSessionTemplate session, Map param) {
		return session.selectList("admin.updateMemberToExpertLicense",param);
	}

	@Override
	public List<Member> searchExpertList(SqlSessionTemplate session, Map<String, Object> param, int cPage,
			int numPerPage) {
		return session.selectList("admin.searchExpertList",param,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int searchExpertListCount(SqlSession session, Map<String, Object> param) {
		return session.selectOne("admin.searchExpertListCount",param);
	}

	@Override
	public int updateMemberToExpertEnd(SqlSession session, Member m) {
		return session.update("admin.updateMemberToExpertEnd",m);
	}

	@Override
	public List<ExpertRequest> selectAdminExpertCounsel(SqlSessionTemplate session,int cPage,
			int numPerPage) {
		return session.selectList("admin.selectAdminExpertCounsel",new RowBounds((cPage-1)*numPerPage, numPerPage));
	}
	
	@Override
	public List<ExpertRequest> selectAdminExpertCounsel2(SqlSessionTemplate session,int cPage,
			int numPerPage) {
		return session.selectList("admin.selectAdminExpertCounsel2",new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectAdminExpertCounselCount(SqlSession session) {
		return session.selectOne("admin.selectAdminExpertCounselCount");
	}

	//공지관련
	@Override
	public List<Notice> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerPage) {
		return session.selectList("admin.selectNoticeList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectNoticeCount(SqlSession session) {
		return session.selectOne("admin.selectNoticeCount");
	}

	@Override
	public int insertNotice(SqlSession session, Notice n) {
		return session.insert("admin.insertNotice",n);
	}

	@Override
	public int insertNoticeFile(SqlSession session, NoticeFile file) {
		System.out.println("dao"+file);
		return session.insert("admin.insertNoticeFile",file);
		
	}

	@Override
	public Notice selectOneNotice(SqlSessionTemplate session, int notice_id) {
		return session.selectOne("admin.selectOneNotice",notice_id);
	}

	@Override
	public List<NoticeFile> selectNoticeFile(SqlSession session, int notice_id) {
		return session.selectList("admin.selectNoticeFile",notice_id);
	}

	@Override
	public Notice noticeModify(SqlSessionTemplate session, Map param) {
		return session.selectOne("admin.noticeModify",param);
	}

	@Override
	public int noticeModifyEnd(SqlSessionTemplate session, Notice n) {
		return session.update("admin.noticeModifyEnd",n);
	}
	
	@Override
	public int noticeModifyFile(SqlSession session, NoticeFile file) {
		return session.update("admin.noticeModifyFile",file);
	}


	@Override
	public int deleteNotice(SqlSessionTemplate session, Notice n) {
		return session.delete("admin.deleteNotice",n);
	}
	
	
	
	//1:1 문의관련
	
	@Override
	public int insertAdminChat(SqlSessionTemplate session, AdminChat ac) throws Exception {
		return session.insert("admin.insertAdminChat",ac);
	}

	@Override
	public List<AdminChat> selectAdminChat(SqlSessionTemplate session, Map<String, Object> param, int cPage, int numPerPage) {
		return session.selectList("admin.selectAdminChat",param,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectAdminChatCount(SqlSessionTemplate session) {
		return session.selectOne("admin.selectAdminChatCount");
	}

	@Override
	public List<AdminChat> selectAdminInChat(SqlSessionTemplate session, int AdminUsid) {
		return session.selectList("admin.selectAdminInChat",AdminUsid);
	}



	
	
	
}
