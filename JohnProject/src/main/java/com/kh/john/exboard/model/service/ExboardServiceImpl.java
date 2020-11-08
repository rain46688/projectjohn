package com.kh.john.exboard.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.john.exboard.model.dao.ExboardDao;
import com.kh.john.member.model.vo.Member;

@Service
public class ExboardServiceImpl implements ExboardService {

	@Autowired
	private ExboardDao dao;

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Member> selectExpert() {
		// TODO Auto-generated method stub
		return dao.selectExpert(session);
	}

}
