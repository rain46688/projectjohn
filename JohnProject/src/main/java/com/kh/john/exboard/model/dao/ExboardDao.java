package com.kh.john.exboard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.john.member.model.vo.Member;

public interface ExboardDao {

	List<Member> selectExpert(SqlSessionTemplate session);

	Member selectExpertMem(SqlSessionTemplate session, String no);

}
