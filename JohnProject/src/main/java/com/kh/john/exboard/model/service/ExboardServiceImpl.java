package com.kh.john.exboard.model.service;

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
import com.kh.john.exboard.model.vo.ExpertBoardListVo;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.model.vo.Expert;
import com.kh.john.member.model.vo.License;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

/**
 * @Author : cms
 * @Date : 2020. 12. 8.
 * @explain : 전문가 서비스
 */
@Service
@Slf4j
public class ExboardServiceImpl implements ExboardService {

	@Autowired
	private ExboardDao dao;

	@Autowired
	private SqlSessionTemplate session;

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 전문가 한명 정보 가져오기
	 */
	@Override
	public Expert selectExpertMem(String no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertMem(session, no);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 전문가한테 상담 신청 등록하기
	 */
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

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 닉네임으로 유저 한명 가져오기
	 */
	@Override
	public Member selectMember(String no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectMember(session, no);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 같은 전문가한테 상담 중복 신청 여부 확인하기
	 */
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

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 상담 신청 취소하기
	 */
	@Override
	public int deleteExpertMemRequest(Member expert, Member mem) throws Exception {
		// TODO Auto-generated method stub

		// 상담 게시판이 이미 생성됬는지 확인하고 생성되있으면 특정 넘버를 반환 이미 상담이 시작되어있으니 취소 못하도록 설정
		int exxbno = dao.selectExBoardNum(session, expert, "" + mem.getUsid());

		return dao.deleteExpertMemRequest(session, expert, mem);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 해당 전문가한테 온 상담 신청 리스트 출력하기
	 */
	@Override
	public List<ExpertRequest> selectExpertRequest(Member mem) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertRequest(session, mem);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 상담 게시판 개설하기
	 */
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

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 상담 게시판 리스트 가져오기 이미 상담 개설된 유저인지 판별용
	 */
	@Override
	public List<ExpertBoard> selectExpertBoard(Member mem) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertBoard(session, mem);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 상담 방에 접속할때 해당 방의 번호를 알아오는 메소드
	 */
	@Override
	public int selectExBoardNum(Member expertmem, String memusid) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExBoardNum(session, expertmem, memusid);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 전문가 상담 채팅 게시판 유저들 판별을 위해 가져오기 방에 접속할때 확인하는것, 없는 방에 접속하거나 이미 만료된 방에
	 *          접속하거나
	 */
	@Override
	public ExpertBoard selectExpertBoard(String bnum) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertBoard(session, bnum);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 상담 종료될때 상담 결과를 업데이트하는것
	 */
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

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 전문가 아이디랑 방번호로 해당 상담의 유저 usid를 알아오는것 유저나 전문가가 서로 정보를 볼때 씀 memInfo
	 */
	@Override
	public String selectMemExboard(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectMemExboard(session, map);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 위랑 비슷한데 전문가의 usid를 알아오는것 서로 정보를 볼때 씀 memInfo
	 */
	@Override
	public String selectExpertExboard(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertExboard(session, map);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : memInfo에서 방번호 가져오기 usid 사용함
	 */
	@Override
	public String selectExBoardNumUsid(Map<String, String> bomap) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExBoardNumUsid(session, bomap);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 유저가 해결완료를 누르면 expertBoardMemberend의 값을 1로 바꾸기
	 */
	@Override
	public void updateCounselMemberEnd(String bno) throws Exception {
		// TODO Auto-generated method stub
		dao.updateCounselMemberEnd(session, bno);
	}

	/*
	 * @Override public List<ExpertBoard> selectExboardListCategory(String ca)
	 * throws Exception { // TODO Auto-generated method stub
	 * 
	 * List<ExpertBoard> list = dao.selectExboardListCategory(session, ca); return
	 * list; }
	 */

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : expertApply에서 자격증 정보 넘기기
	 */
	@Override
	public List<License> selectExpertLicense(String exusid) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertLicense(session, exusid);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : ExpertListHandler에서 전문가가 자기한테 온 내역들 보고 관리하는곳 리스트 소켓으로 가져오기
	 */
	@Override
	public List<ExpertRequest> selectExRequestList(Member m) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExRequestList(session, m);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 자격증의 종류 디비에서 가져오기 (john 디비에 정의해놓은 풀에서 가져옴)
	 */
	@Override
	public List<String> selectLicenseKind() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectLicenseKind(session);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 상담의 종류 디비에서 가져오기 (john 디비에 정의해놓은 풀에서 가져옴)
	 */
	@Override
	public List<String> selectCounselKind() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectCounselKind(session);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 자격증 인증 기관 종류 디비에서 가져오기 (john 디비에 정의해놓은 풀에서 가져옴)
	 */
	@Override
	public List<String> selectCompanyKind() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectCompanyKind(session);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 자격증 정보 수정 전문가 수정 게시판
	 */
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

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 전문가 정보 수정
	 */
	@Override
	public void updateExInfoModify(Expert et) throws Exception {
		// TODO Auto-generated method stub
		dao.updateExInfoModify(session, et);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 리뷰 작성 하면 expertboard 부분 수정
	 */
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

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 리뷰 작성했는지 먼저 확인하는 작업
	 */
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

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 상담원 리스트 보는 게시판 전문가 리스트 가져오기 member랑 expert_info에서 가져옴
	 */
	@Override
	public List<ExpertBoardListVo> selectExpertBoardList() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertBoardList(session);
	}

	/**
	 * @Author : cms
	 * @Date : 2020. 12. 8.
	 * @explain : 상담원 리스트 보는 게시판 리뷰 리스트 가져오기 expertboard
	 */
	@Override
	public List<ExpertBoard> selectExpertReviewList() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectExpertReviewList(session);
	}

}
