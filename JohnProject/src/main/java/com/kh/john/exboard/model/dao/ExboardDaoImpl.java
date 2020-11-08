package com.kh.john.exboard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.john.member.model.vo.Member;

@Repository
public class ExboardDaoImpl implements ExboardDao {

	@Override
	public List<Member> selectExpert(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("expert.selectExpert");
	}

}
