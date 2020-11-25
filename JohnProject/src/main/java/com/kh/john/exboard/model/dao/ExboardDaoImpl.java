package com.kh.john.exboard.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.john.exboard.model.vo.ExpertBoard;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.model.vo.Expert;
import com.kh.john.member.model.vo.License;
import com.kh.john.member.model.vo.Member;

@Repository
public class ExboardDaoImpl implements ExboardDao {

	@Override
	public List<Member> selectExpert(SqlSessionTemplate session) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("expert.selectExpert");
	}

	@Override
	public Expert selectExpertMem(SqlSessionTemplate session, String no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("expert.selectExpertMem", no);
	}

	@Override
	public int insertExpertMemRequest(SqlSessionTemplate session, Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("expert.insertExpertMemRequest", map);
	}

	@Override
	public Member selectMember(SqlSessionTemplate session, String no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("expert.selectMember", no);
	}

	@Override
	public ExpertRequest selectIsDuplicateReq(SqlSessionTemplate session, Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("expert.selectIsDuplicateReq", map);
	}

	@Override
	public int deleteExpertMemRequest(SqlSessionTemplate session, Member expert, Member mem) throws Exception {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("exusid", "" + expert.getUsid());
		map.put("memusid", "" + mem.getUsid());
		return session.delete("expert.deleteExpertMemRequest", map);
	}

	@Override
	public List<ExpertRequest> selectExpertRequest(SqlSessionTemplate session, Member mem) throws Exception {
		// TODO Auto-generated method stub
		RowBounds r = new RowBounds((1 - 1) * 10, 10);
		return session.selectList("expert.selectExpertRequest", mem, r);
	}

	@Override
	public int insertExpertBoard(SqlSessionTemplate session, ExpertBoard exboard) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("expert.insertExpertBoard", exboard);
	}

	@Override
	public List<ExpertBoard> selectExpertBoard(SqlSessionTemplate session, Member mem) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("expert.selectExpertBoard", mem);
	}

	@Override
	public int selectExBoardNum(SqlSessionTemplate session, Member expertmem, String memusid) throws Exception {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("exusid", "" + expertmem.getUsid());
		map.put("memusid", "" + memusid);
		return session.selectOne("expert.selectExBoardNum", map);
	}

	@Override
	public ExpertBoard selectExpertBoard(SqlSessionTemplate session, String bnum) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("expert.selectExpertBoardbnum", bnum);
	}

	@Override
	public int updateCounselResult(SqlSessionTemplate session, String extext, String bno) throws Exception {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("extext", extext);
		map.put("bno", "" + bno);
		return session.insert("expert.updateCounselResult", map);
	}

	@Override
	public String selectMemExboard(SqlSessionTemplate session, Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("expert.selectMemExboard", map);
	}

	@Override
	public String selectExpertExboard(SqlSessionTemplate session, Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("expert.selectExpertExboard", map);
	}

	@Override
	public String selectExBoardNumUsid(SqlSessionTemplate session, Map<String, String> bomap) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("expert.selectExBoardNumUsid", bomap);
	}

	@Override
	public void updateCounselMemberEnd(SqlSessionTemplate session, String bno) throws Exception {
		// TODO Auto-generated method stub
		session.update("expert.updateCounselMemberEnd", bno);
	}

	@Override
	public List<License> selectExpertLicense(SqlSessionTemplate session, String exusid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("expert.selectExpertLicense", exusid);
	}

	@Override
	public List<ExpertBoard> selectExboardListCategory(SqlSessionTemplate session, String ca) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("expert.selectExboardListCategory", ca);
	}

	@Override
	public int updateReuestCounselEnd(SqlSessionTemplate session, Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return session.update("expert.updateReuestCounselEnd", map);
	}

	@Override
	public List<ExpertRequest> selectExRequestList(SqlSessionTemplate session, Member m) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("expert.selectExRequestList", m);
	}

	@Override
	public List<String> selectLicenseKind(SqlSessionTemplate session) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("expert.selectLicenseKind");
	}

	@Override
	public List<String> selectCounselKind(SqlSessionTemplate session) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("expert.selectCounselKind");
	}

	@Override
	public List<String> selectCompanyKind(SqlSessionTemplate session) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("expert.selectCompanyKind");
	}

	@Override
	public void updateLicenseModify(SqlSessionTemplate session, License li) throws Exception {
		// TODO Auto-generated method stub
		session.update("expert.updateLicenseModify", li);
	}

	@Override
	public void insertLicenseModify(SqlSessionTemplate session, License li) throws Exception {
		// TODO Auto-generated method stub
		session.update("expert.insertLicenseModify", li);
	}

	@Override
	public void updateExInfoModify(SqlSessionTemplate session, Expert et) throws Exception {
		// TODO Auto-generated method stub
		session.update("expert.updateExInfoModify", et);
	}

}
