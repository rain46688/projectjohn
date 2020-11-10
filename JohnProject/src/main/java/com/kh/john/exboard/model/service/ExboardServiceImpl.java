package com.kh.john.exboard.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.john.common.exception.RequestDuplicateException;
import com.kh.john.exboard.model.dao.ExboardDao;
import com.kh.john.exboard.model.vo.ExpertBoard;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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

		if (result == null) {
			log.debug("result 널 아님");
			return dao.insertExpertMemRequest(session, expert, mem);
		} else {
			log.debug("result 널");
			throw new RequestDuplicateException();
		}
	}

	@Override
	public Member selectMember(String nick) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectMember(session, nick);
	}

	@Override
	public Boolean selectIsDuplicateReq(Member expert, Member mem) throws Exception {
		// TODO Auto-generated method stub
		ExpertRequest result = dao.selectIsDuplicateReq(session, expert, mem);
		if (result == null) {
			// 신청한적 없음
			return false;
		} else {
			// 신청한적 있음
			return true;
		}
	}

	@Override
	public int deleteExpertMemRequest(Member expert, Member mem) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteExpertMemRequest(session, expert, mem);
	}

	@Override
	public List<ExpertRequest> selectExpertRequest(Member mem) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertRequest(session, mem);
	}

	@Override
	public int insertExpertBoard(String memusid, Member expertmem) throws Exception {
		// TODO Auto-generated method stub
		ExpertBoard exboard = new ExpertBoard();
		exboard.setEXPERT_BOARD_USID(expertmem.getUsid());
		exboard.setEXPERT_BOARD_MEM_USID(Integer.parseInt(memusid));
		log.debug("방넘버 : " + exboard.getEXPERT_BOARD_ID());
		int result = dao.insertExpertBoard(session, exboard);
		log.debug("방넘버 후 : " + exboard.getEXPERT_BOARD_ID());
		if (result > 0) {
			return exboard.getEXPERT_BOARD_ID();
		} else {
			return 0;
		}

	}

	@Override
	public List<ExpertBoard> selectExpertBoard(Member mem) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertBoard(session, mem);
	}

	@Override
	public int selectExBoardNum(Member expertmem, String memusid) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExBoardNum(session, expertmem, memusid);
	}

}
