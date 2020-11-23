package com.kh.john.exboard.model.service;

import java.util.List;
import java.util.Map;

import com.kh.john.exboard.model.vo.ExpertBoard;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.model.vo.Expert;
import com.kh.john.member.model.vo.License;
import com.kh.john.member.model.vo.Member;

public interface ExboardService {

	List<Map<String, Object>> selectExpert(String ca) throws Exception;

	Expert selectExpertMem(String no) throws Exception;

	Member selectMember(String usid) throws Exception;

	int insertExpertMemRequest(Map<String, String> map) throws Exception;

	Boolean selectIsDuplicateReq(Map<String, String> map) throws Exception;

	int deleteExpertMemRequest(Member expert, Member mem) throws Exception;

	List<ExpertRequest> selectExpertRequest(Member mem) throws Exception;

	int insertExpertBoard(String memusid, Member expertmem) throws Exception;

	List<ExpertBoard> selectExpertBoard(Member mem) throws Exception;

	int selectExBoardNum(Member expertmem, String no) throws Exception;

	ExpertBoard selectExpertBoard(String bnum) throws Exception;

	int updateCounselResult(String extext, String bno) throws Exception;

	String selectMemExboard(Map<String, String> map) throws Exception;

	String selectExpertExboard(Map<String, String> map) throws Exception;

	String selectExBoardNumUsid(Map<String, String> bomap) throws Exception;

	void updateCounselMemberEnd(String bno) throws Exception;

	List<ExpertBoard> selectExboardListCategory(String ca) throws Exception;

	List<License> selectExpertLicense(String no) throws Exception;

	List<ExpertRequest> selectExRequestList() throws Exception;

	List<String> selectLicenseKind() throws Exception;

}
