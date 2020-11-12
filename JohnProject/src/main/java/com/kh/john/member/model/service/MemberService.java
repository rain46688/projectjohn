package com.kh.john.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.john.member.model.vo.License;
import com.kh.john.member.model.vo.Member;

public interface MemberService {

	List<Map<String, Object>> selectMember();

	//이메일 인증 키 보내기
	String sendAuthKey(String email) throws Exception;

	//아이디로 멤버 찾기
	Member selectMemberById(Member member);
	Member selectMemberById(Map param);

	//닉네임으로 멤버 찾기
	Member nickDuplicate(Member member);

	//폰번 중복 검사(번호로 멤버 찾기)
	Member phoneDuplicate(Member member);
	
	//회원가입
	int signUpEnd(Member member);
//	int signUpExpert(Member member, List<License> files, String[][] licenseArr);
	int signUpExpert(Member member, List<License> licenseList);

//	//아이디로 usid 찾기
//	Member selectMemUsidById(Member member);

}
