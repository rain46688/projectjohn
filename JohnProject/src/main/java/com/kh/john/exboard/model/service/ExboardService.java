package com.kh.john.exboard.model.service;

import java.util.List;

import com.kh.john.exboard.model.vo.ExpertBoard;
import com.kh.john.exboard.model.vo.ExpertRequest;
import com.kh.john.member.model.vo.Member;

public interface ExboardService {

	List<Member> selectExpert() throws Exception;

	Member selectExpertMem(String no) throws Exception;

	Member selectMember(String nick) throws Exception;

	int insertExpertMemRequest(Member expert, Member mem) throws Exception;

	Boolean selectIsDuplicateReq(Member expert, Member mem) throws Exception;

	int deleteExpertMemRequest(Member expert, Member mem) throws Exception;

	List<ExpertRequest> selectExpertRequest(Member mem) throws Exception;

	int insertExpertBoard(String memusid, Member expertmem) throws Exception;

	List<ExpertBoard> selectExpertBoard(Member mem) throws Exception;

	int selectExBoardNum(Member expertmem, String no) throws Exception;

	ExpertBoard selectExpertBoard(String bnum) throws Exception;

}
