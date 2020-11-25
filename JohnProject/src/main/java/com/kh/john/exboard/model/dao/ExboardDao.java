package com.kh.john.exboard.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.john.exboard.model.vo.ExpertBoard;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.model.vo.Expert;
import com.kh.john.member.model.vo.License;
import com.kh.john.member.model.vo.Member;

public interface ExboardDao {

	List<Member> selectExpert(SqlSessionTemplate session) throws Exception;

	Expert selectExpertMem(SqlSessionTemplate session, String no) throws Exception;

	int insertExpertMemRequest(SqlSessionTemplate session, Map<String, String> map) throws Exception;

	Member selectMember(SqlSessionTemplate session, String no) throws Exception;

	ExpertRequest selectIsDuplicateReq(SqlSessionTemplate session, Map<String, String> map) throws Exception;

	int deleteExpertMemRequest(SqlSessionTemplate session, Member expert, Member mem) throws Exception;

	List<ExpertRequest> selectExpertRequest(SqlSessionTemplate session, Member mem) throws Exception;

	int insertExpertBoard(SqlSessionTemplate session, ExpertBoard exboard) throws Exception;

	List<ExpertBoard> selectExpertBoard(SqlSessionTemplate session, Member mem) throws Exception;

	int selectExBoardNum(SqlSessionTemplate session, Member expertmem, String memusid) throws Exception;

	ExpertBoard selectExpertBoard(SqlSessionTemplate session, String bnum) throws Exception;

	int updateCounselResult(SqlSessionTemplate session, String extext, String bno) throws Exception;

	String selectMemExboard(SqlSessionTemplate session, Map<String, String> map) throws Exception;

	String selectExpertExboard(SqlSessionTemplate session, Map<String, String> map) throws Exception;

	String selectExBoardNumUsid(SqlSessionTemplate session, Map<String, String> bomap) throws Exception;

	void updateCounselMemberEnd(SqlSessionTemplate session, String bno) throws Exception;

	List<License> selectExpertLicense(SqlSessionTemplate session, String string) throws Exception;

	List<ExpertBoard> selectExboardListCategory(SqlSessionTemplate session, String ca) throws Exception;

	int updateReuestCounselEnd(SqlSessionTemplate session, Map<String, String> map) throws Exception;

	List<ExpertRequest> selectExRequestList(SqlSessionTemplate session, Member m) throws Exception;

	List<String> selectLicenseKind(SqlSessionTemplate session) throws Exception;

	List<String> selectCounselKind(SqlSessionTemplate session) throws Exception;

	List<String> selectCompanyKind(SqlSessionTemplate session) throws Exception;

	void updateLicenseModify(SqlSessionTemplate session, License li) throws Exception;

	void insertLicenseModify(SqlSessionTemplate session, License li) throws Exception;

	void updateExInfoModify(SqlSessionTemplate session, Expert et) throws Exception;

}
