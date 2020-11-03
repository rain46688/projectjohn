package com.kh.john.member.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.john.member.model.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Map<String, Object>> selectMember() {
		// TODO Auto-generated method stub
		return dao.selectMember(session);
	}

}
