package com.kh.john.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public List<Map<String, Object>> selectMember(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectMember");
	}

}
