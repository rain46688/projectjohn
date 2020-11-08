package com.kh.john.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.john.member.model.vo.Member;

public interface MemberService {

	List<Map<String, Object>> selectMember();

	//이메일 인증 키 보내기
	String sendAuthKey(String email) throws Exception;

	//아이디로 멤버 찾기
//	Member selectMember(String id);
	

	//닉네임으로 멤버 찾기
	Member nickDuplicate(String nick);

//	폰번 중복 검사
	Member phoneDuplicate(String phone);

	//회원가입
	int signUpEnd(Member member);

	Member selectMember(Member member);

}
