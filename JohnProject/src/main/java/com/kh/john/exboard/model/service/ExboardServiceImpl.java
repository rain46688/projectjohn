package com.kh.john.exboard.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.john.common.exception.ExpertReviewException;
import com.kh.john.common.exception.RequestDuplicateException;
import com.kh.john.exboard.model.dao.ExboardDao;
import com.kh.john.exboard.model.vo.ExpertBoard;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.model.vo.Expert;
import com.kh.john.member.model.vo.License;
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
	public List<Map<String, Object>> selectExpert(String ca) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> maplist = new ArrayList<Map<String, Object>>();

		// 전문가 리스트를 가져옴
		List<Member> list = dao.selectExpert(session);
		for (Member m : list) {
			// 전문가 리스트로 전문가 정보를 가져옴
			Map<String, Object> temp = new HashMap<String, Object>();
			// 리스트 안에 넣을 맵을 선언하고 전문가 정보 객체를 가져옴
			Expert exx = dao.selectExpertMem(session, "" + m.getUsid());
			// 카테고리랑 맞는지 비교후 맞는 사람들만 맵에 넣음
			if (exx != null && exx.getExpertCounselArea().equals(ca)) {
				temp.put("mem", m);
				temp.put("ex", exx);
				maplist.add(temp);
			}
			// temp.put("exLicense", dao.selectExpertLicense(session, "" + m.getUsid()));
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
		// 종료되지 않은 상담중에 중복해서 신청한 내역이있나 확인하고 안되게 막음!

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
	public int insertExpertBoard(String memusid, String memnic, Member expertmem) throws Exception {
		// TODO Auto-generated method stub
		ExpertBoard exboard = new ExpertBoard();
		exboard.setExpertBoardUsid(expertmem.getUsid());
		exboard.setExpertBoardMemUsid(Integer.parseInt(memusid));
		exboard.setExpertBoardExNick(expertmem.getMemNickname());
		exboard.setExpertBoardMemNick(memnic);
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
		int result = 1;

		try {
			ExpertBoard eb = dao.selectExpertBoard(session, bno);
			dao.updateCounselResult(session, extext, bno);
			Map<String, String> map = new HashMap<String, String>();
			map.put("musid", "" + eb.getExpertBoardMemUsid());
			map.put("eusid", "" + eb.getExpertBoardUsid());
			dao.updateReuestCounselEnd(session, map);
		} catch (Exception e) {
			// TODO: handle exception
			result = 0;
		}

		return result;
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

	@Override
	public List<ExpertBoard> selectExboardListCategory(String ca) throws Exception {
		// TODO Auto-generated method stub

		List<ExpertBoard> list = dao.selectExboardListCategory(session, ca);
//		for (ExpertBoard eb : list) {
//			// 여기 수정좀 해야됨 expertBoardMemNick 추가했으니
//			eb.setExpertBoardMemNick(dao.selectMember(session, "" + eb.getExpertBoardMemUsid()).getMemNickname());
//		}
		return list;
	}

	@Override
	public List<License> selectExpertLicense(String exusid) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertLicense(session, exusid);
	}

	@Override
	public List<ExpertRequest> selectExRequestList(Member m) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExRequestList(session, m);
	}

	@Override
	public List<String> selectLicenseKind() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectLicenseKind(session);
	}

	@Override
	public List<String> selectCounselKind() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectCounselKind(session);
	}

	@Override
	public List<String> selectCompanyKind() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectCompanyKind(session);
	}

	@Override
	public void updateLicenseModify(List<License> paramlist) throws Exception {
		// TODO Auto-generated method stub

		for (License li : paramlist) {
			if (li.getLicenseId() > 0) {
				// 업데이트
				dao.updateLicenseModify(session, li);
				log.debug("updateLicenseModify 업데이트");
			} else if (li.getLicenseId() == -1) {
				// 인서트
				dao.insertLicenseModify(session, li);
				log.debug("updateLicenseModify 인서트");
			} else {
				// 오류
				log.debug("updateLicenseModify 오류");
			}
		}

	}

	@Override
	public void updateExInfoModify(Expert et) throws Exception {
		// TODO Auto-generated method stub
		dao.updateExInfoModify(session, et);
	}

	@Override
	public void updateExpertBoardReview(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		// 전문가 게시글 정보 업데이트
		dao.updateExpertBoardReview(session, map);
		// 전문가 usid를 bno랑 memusid로 얻어옴
		map.put("exusid", dao.selectExpertExboard(session, map));
		log.debug("exusid : " + map.get("exusid"));
		// 카운트 계산
		map.put("count", dao.selectExpertBoardReviewCount(session, map));
		if (map.get("exusid") == null || map.get("count") == null) {
			throw new ExpertReviewException("전문가 부분 null");
		}
		// 전문가 정보 업데이트
		dao.updateExpertInfoReview(session, map);
	}

	@Override
	public int expertReviewWriteCheck(String bno) throws Exception {
		// TODO Auto-generated method stub
		int result = -1;
		log.debug("result1 : " + result);
		try {
			result = dao.expertReviewWriteCheck(session, bno);
			log.debug("result2 : " + result);
		} catch (Exception e) {
			// TODO: handle exception
		}
		log.debug("result3 : " + result);

		return result;
	}

}
