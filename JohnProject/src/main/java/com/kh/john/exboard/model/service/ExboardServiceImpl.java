package com.kh.john.exboard.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.john.common.exception.RequestDuplicateException;
import com.kh.john.exboard.model.dao.ExboardDao;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.model.vo.Member;

@Service
public class ExboardServiceImpl implements ExboardService {

	@Autowired
	private ExboardDao dao;

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Member> selectExpert() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpert(session);
	}

	@Override
	public Member selectExpertMem(String no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertMem(session, no);
	}

	@Override
	public int insertExpertMemRequest(Member expert, Member mem) throws Exception {
		// TODO Auto-generated method stub
		// 이미 등록됬는지 확인
		ExpertRequest result = dao.selectIsDuplicateReq(session, expert, mem);

		if (result != null) {
			return dao.insertExpertMemRequest(session, expert, mem);
		} else {
			throw new RequestDuplicateException();
		}
	}

	@Override
	public Member selectMember(String nick) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectMember(session, nick);
	}

}
