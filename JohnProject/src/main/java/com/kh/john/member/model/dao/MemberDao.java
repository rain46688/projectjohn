package com.kh.john.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.john.member.model.vo.Member;

public interface MemberDao {

	List<Map<String, Object>> selectMember(SqlSessionTemplate session);

	Member selectMemberById(SqlSessionTemplate session, Member member);
	Member selectMemberById(SqlSessionTemplate session, Map param);

	Member nickDuplicate(SqlSessionTemplate session, String nick);

	Member phoneDuplicate(SqlSessionTemplate session, String phone);
	
	int signUpEnd(SqlSessionTemplate session, Member member);


}
