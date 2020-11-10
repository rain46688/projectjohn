package com.kh.john.exboard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.john.exboard.model.vo.ExpertBoard;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.model.vo.Member;

public interface ExboardDao {

	List<Member> selectExpert(SqlSessionTemplate session) throws Exception;

	Member selectExpertMem(SqlSessionTemplate session, String no) throws Exception;

	int insertExpertMemRequest(SqlSessionTemplate session, Member expert, Member mem) throws Exception;

	Member selectMember(SqlSessionTemplate session, String nick) throws Exception;

	ExpertRequest selectIsDuplicateReq(SqlSessionTemplate session, Member expert, Member mem) throws Exception;

	int deleteExpertMemRequest(SqlSessionTemplate session, Member expert, Member mem) throws Exception;

	List<ExpertRequest> selectExpertRequest(SqlSessionTemplate session, Member mem) throws Exception;

	int insertExpertBoard(SqlSessionTemplate session, ExpertBoard exboard) throws Exception;

	List<ExpertBoard> selectExpertBoard(SqlSessionTemplate session, Member mem) throws Exception;

	int selectExBoardNum(SqlSessionTemplate session, Member expertmem, String memusid) throws Exception;

}
