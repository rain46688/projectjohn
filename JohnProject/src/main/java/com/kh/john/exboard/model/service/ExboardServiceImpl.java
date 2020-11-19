package com.kh.john.exboard.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.john.common.exception.RequestDuplicateException;
import com.kh.john.exboard.model.dao.ExboardDao;
import com.kh.john.exboard.model.vo.ExpertBoard;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.model.vo.Expert;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ExboardServiceImpl implements ExboardService {

	@Autowired
	private ExboardDao dao;

	@Autowired
	private SqlSessionTemplate session;

	// 전문가인 멤버 리스트 가져오기
	@Override
	public List<Map<String, Object>> selectExpert() throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> maplist = new ArrayList<Map<String, Object>>();

		List<Member> list = dao.selectExpert(session);
		for (Member m : list) {
			Map<String, Object> temp = new HashMap<String, Object>();
			temp.put("mem", m);
			temp.put("ex", dao.selectExpertMem(session, "" + m.getUsid()));
			// temp.put("exLicense", dao.selectExpertLicense(session, "" + m.getUsid()));
			maplist.add(temp);
		}
		return maplist;
	}

	// 전문가 한명 정보 가져오기
	@Override
	public Expert selectExpertMem(String no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertMem(session, no);
	}

	// 전문가한테 상담 신청 등록하기
	@Override
	public int insertExpertMemRequest(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		// 이미 등록됬는지 확인
		ExpertRequest result = dao.selectIsDuplicateReq(session, map);

		if (result == null) {
			log.debug("result 널 아님");
			return dao.insertExpertMemRequest(session, map);
		} else {
			log.debug("result 널");
			throw new RequestDuplicateException();
		}
	}

	// 닉네임으로 유저 한명 가져오기
	@Override
	public Member selectMember(String no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectMember(session, no);
	}

	// 같은 전문가한테 상담 중복 신청 여부 확인하기
	@Override
	public Boolean selectIsDuplicateReq(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		ExpertRequest result = dao.selectIsDuplicateReq(session, map);
		if (result == null) {
			// 신청한적 없음
			return false;
		} else {
			// 신청한적 있음
			return true;
		}
	}

	// 상담 신청 취소하기
	@Override
	public int deleteExpertMemRequest(Member expert, Member mem) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteExpertMemRequest(session, expert, mem);
	}

	// 해당 전문가한테 온 상담 신청 리스트 출력하기
	@Override
	public List<ExpertRequest> selectExpertRequest(Member mem) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertRequest(session, mem);
	}

	// 상담 게시판 개설하기
	@Override
	public int insertExpertBoard(String memusid, Member expertmem) throws Exception {
		// TODO Auto-generated method stub
		ExpertBoard exboard = new ExpertBoard();
		exboard.setExpertBoardUsid(expertmem.getUsid());
		exboard.setExpertBoardMemUsid(Integer.parseInt(memusid));
		exboard.setExpertBoardExNick(expertmem.getMemNickname());
		int result = dao.insertExpertBoard(session, exboard);
		if (result > 0) {
			return exboard.getExpertBoardId();
		} else {
			return 0;
		}

	}

	// 상담 게시판 리스트 가져오기 이미 상담 개설된 유저인지 판별용
	@Override
	public List<ExpertBoard> selectExpertBoard(Member mem) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertBoard(session, mem);
	}

	// 방 번호 가져오기
	@Override
	public int selectExBoardNum(Member expertmem, String memusid) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExBoardNum(session, expertmem, memusid);
	}

	// 전문가 상담 채팅 게시판 유저들 판별을 위해 가져오기
	@Override
	public ExpertBoard selectExpertBoard(String bnum) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertBoard(session, bnum);
	}

	@Override
	public int updateCounselResult(String extext, String bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateCounselResult(session, extext, bno);
	}

	@Override
	public String selectMemExboard(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectMemExboard(session, map);
	}

	@Override
	public String selectExpertExboard(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertExboard(session, map);
	}

	@Override
	public String selectExBoardNumUsid(Map<String, String> bomap) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExBoardNumUsid(session, bomap);
	}

	@Override
	public void updateCounselMemberEnd(String bno) throws Exception {
		// TODO Auto-generated method stub
		dao.updateCounselMemberEnd(session, bno);
	}

}
