package com.kh.john.member.model.service;

import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.john.member.controller.MailHandler;
import com.kh.john.member.controller.UuidGenerator;
import com.kh.john.member.model.dao.MemberDao;
import com.kh.john.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public List<Map<String, Object>> selectMember() {
		// TODO Auto-generated method stub
		return dao.selectMember(session);
	}

	@Override
	public String sendAuthKey(String email) throws Exception {
		String authKey=new UuidGenerator().generateUuid(10);
		MailHandler sendMail=new MailHandler(mailSender);
		sendMail.setSubject("재판하는 존경장님 인증을 부탁드려요:)");
		sendMail.setText(
                new StringBuffer()
                .append("<h1>메일인증</h1>")
                .append(authKey)
                .toString());
		sendMail.setFrom("minsu87750@gmail.com", "재판하는 존경장님");
		sendMail.setTo(email);
		sendMail.send();
		return authKey;
	}

//	@Override
//	public Member selectMember(String id) {
//		return dao.selectMember(session, id);
//	}

	@Override
	public Member nickDuplicate(String nick) {
		return dao.nickDuplicate(session, nick);
	}

	@Override
	public Member phoneDuplicate(String phone) {
		return dao.phoneDuplicate(session, phone);
	}
	
	@Override
	public int signUpEnd(Member member) {
		return dao.signUpEnd(session, member);
	}

	@Override
	public Member selectMember(Member member) {
		return dao.selectMember(session, member);
	}

	@Override
	public Member selectMemberById(Map param) {
		return dao.selectMemberById(session, param);
	}

}
