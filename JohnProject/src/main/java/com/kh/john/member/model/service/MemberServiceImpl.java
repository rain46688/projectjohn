package com.kh.john.member.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.john.member.controller.MailHandler;
import com.kh.john.member.controller.UuidGenerator;
import com.kh.john.member.model.dao.MemberDao;
import com.kh.john.member.model.vo.License;
import com.kh.john.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private MemberService service;

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
		sendMail.setFrom("22mailme@gmail.com", "재판하는 존경장님");
		sendMail.setTo(email);
		sendMail.send();
		return authKey;
	}
	
	@Override
	public Member selectMemberById(Member member) {
		return dao.selectMemberById(session, member);
	}
	@Override
	public Member selectMemberById(Map param) {
		return dao.selectMemberById(session, param);
	}
	
	@Override
	public Member nickDuplicate(Member member) {
		return dao.nickDuplicate(session, member);
	}

	@Override
	public Member phoneDuplicate(Member member) {
		return dao.phoneDuplicate(session, member);
	}
	
	@Override
	public int signUpEnd(Member member) {
		return dao.signUpEnd(session, member);
	}

	@Override
	@Transactional
	public int signUpExpert(Member member, List<License> files, String[][] licenseArr) {
		int resultFirst=0;
		int resultSecond=0;
		resultFirst=dao.signUpEnd(session, member);
		member=service.selectMemUsidById(member);
		if(resultFirst>0) {
			if(!files.isEmpty()) {
				for(int i=0; i<files.size(); i++) {
					License l=files.get(i);
					l.setLicense_mem_usid(member.getUsid());
					l.setLicense_date(Date.valueOf(licenseArr[i][0]));
					l.setLicense_type(licenseArr[i][1]);
					l.setLicense_company(licenseArr[i][2]);
					resultSecond=dao.signUpExpert(session,l);
				}
			}
		}
		return resultSecond;
	}

	@Override
	public Member selectMemUsidById(Member member) {
		return dao.selectMemUsidById(session, member);
	}

}
