package com.kh.john.exboard.model.service;

import java.util.List;

import com.kh.john.member.model.vo.Member;

public interface ExboardService {

	List<Member> selectExpert() throws Exception;

	Member selectExpertMem(String no) throws Exception;

	Member selectMember(String nick) throws Exception;

	int insertExpertMemRequest(Member expert, Member mem) throws Exception;

	Boolean selectIsDuplicateReq(Member expert, Member mem) throws Exception;

	int deleteExpertMemRequest(Member expert, Member mem) throws Exception;

}
