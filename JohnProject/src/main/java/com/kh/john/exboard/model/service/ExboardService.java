package com.kh.john.exboard.model.service;

import java.util.List;

import com.kh.john.exboard.model.vo.SessionVo;
import com.kh.john.member.model.vo.Member;

public interface ExboardService {

	List<Member> selectExpert() throws Exception;

	Member selectExpertMem(String no) throws Exception;

	int insertExpertMemRequest(String no, SessionVo mem) throws Exception;

}
