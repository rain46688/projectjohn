package com.kh.john.exboard.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.model.vo.Member;

@Repository
public class ExboardDaoImpl implements ExboardDao {

	@Override
	public List<Member> selectExpert(SqlSessionTemplate session) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("expert.selectExpert");
	}

	@Override
	public Member selectExpertMem(SqlSessionTemplate session, String no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("expert.selectExpertMem", no);
	}

	@Override
	public int insertExpertMemRequest(SqlSessionTemplate session, Member expert, Member mem) throws Exception {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("exusid", "" + expert.getUsid();
		map.put("exnick", expert.getMem_nickname());
		map.put("memusid", "" + mem.getUsid());
		map.put("memnick", mem.getMem_nickname());
		return session.insert("expert.insertExpertMemRequest", map);
	}

	@Override
	public Member selectMember(SqlSessionTemplate session, String nick) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("expert.selectMember", nick);
	}

	@Override
	public ExpertRequest selectIsDuplicateReq(SqlSessionTemplate session, Member expert, Member mem) throws Exception {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("exusid", "" + expert.getUsid());
		map.put("memusid", "" + mem.getUsid());
		return session.selectOne("expert.selectIsDuplicateReq", map);
	}

}
