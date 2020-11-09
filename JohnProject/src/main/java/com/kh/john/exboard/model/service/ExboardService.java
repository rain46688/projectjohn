package com.kh.john.exboard.model.service;

import java.util.List;

import com.kh.john.member.model.vo.Member;

public interface ExboardService {

	List<Member> selectExpert();

	Member selectExpertMem(String no);

}
