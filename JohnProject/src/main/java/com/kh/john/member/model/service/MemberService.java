package com.kh.john.member.model.service;

import java.util.List;
import java.util.Map;

public interface MemberService {

	List<Map<String, Object>> selectMember();

	String sendAuthKey(String email) throws Exception;

}
