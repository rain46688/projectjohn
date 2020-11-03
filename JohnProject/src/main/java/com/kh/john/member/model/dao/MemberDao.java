package com.kh.john.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface MemberDao {

	List<Map<String, Object>> selectMember(SqlSessionTemplate session);

}
