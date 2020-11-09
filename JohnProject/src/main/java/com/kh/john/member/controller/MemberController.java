package com.kh.john.member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.john.member.model.service.MemberService;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes("loginMember")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private AES256Util aes;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
//	메인 페이지로 가기
	@RequestMapping("/")
	public ModelAndView mainPage() {
		log.debug("mainPage 실행");
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("list", service.selectMember());
		return mv;
	}
	
//	로그인 페이지로 가기
	@RequestMapping("/member/memberLogin")
	public String enterPage() {
		return "/member/memberLogin";
	}
	
//	로그인 로직
	@RequestMapping(value="/member/memberLoginEnd", method = RequestMethod.POST)
	public String loginPage(@RequestParam Map param, Member member, Model m) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		member.setMem_email(aes.encrypt((String)param.get("mem_email")));
		Member loginMember=service.selectMemberById(member);
		String msg="";
		String loc="";
		String path="";
		
		if(loginMember!=null) {
			if(encoder.matches((String)param.get("mem_pwd"), loginMember.getMem_pwd())) {
				path="/board/boardList";
				m.addAttribute("loginMember",loginMember);
			}else {
				msg="아이디나 비밀번호를 확인해주세요.";
				loc="/member/memberLogin";
				path="common/msg";
			}
		}else {
			msg="아이디나 비밀번호를 확인해주세요.";
			loc="/member/memberLogin";
			path="common/msg";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return path;
	}
	
//	로그아웃 로직
	@RequestMapping("/member/logout")
	public String memberLogout(HttpSession session, SessionStatus status) {
		if(!status.isComplete()) {
			status.setComplete();
		}
		
		return "redirect:/";
	}
	
//	회원가입 페이지로 가기
	@RequestMapping("/member/signUp")
	public ModelAndView signUpPage(ModelAndView mv) {
		mv.setViewName("/member/signUp");
		return mv;
	}
	
//	이메일 인증
	@RequestMapping(value= "/member/certiEmail", method = RequestMethod.POST)
	public ModelAndView certiEmail(@RequestParam("email") String email, ModelAndView mv) throws Exception {
		String authKey=service.sendAuthKey(email);
        mv.addObject("authKey",authKey);
        mv.setViewName("member/certiResult");
		return mv;
	}

//	이메일 중복 확인
	@RequestMapping(value= "/member/emailDuplicate", method = RequestMethod.POST)
	public ModelAndView emailDuplicate(@RequestParam(value="mem_email",required=false) String mem_email, Member member, ModelAndView mv) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		//암호화
		String id=aes.encrypt(mem_email);
		System.out.println(mem_email);
		System.out.println(id);
		member.setMem_email(id);
		member=service.selectMemberById(member);
		mv.addObject("member",member);
		mv.setViewName("member/emailDuplicate");
		return mv;
	}
	
//	닉네임 중복 확인
	@RequestMapping(value="/member/NNDuplicate", method = RequestMethod.POST)
	public ModelAndView nickDuplicate(@RequestParam("nick") String nick, ModelAndView mv) {
		Member m=service.nickDuplicate(nick);
		mv.addObject("member",m);
		mv.setViewName("member/nickDuplicate");
		return mv;
	}
	
//	핸드폰 중복 확인
	@RequestMapping(value="/member/PNDuplicate", method = RequestMethod.POST)
	public ModelAndView phoneDuplicate(@RequestParam("phone") String phoneStr, ModelAndView mv) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		String phone=aes.encrypt(phoneStr);
		Member m=service.phoneDuplicate(phone);
		mv.addObject("member",m);
		mv.setViewName("member/phoneDulicate");
		return mv;
	}
	
//	회원가입 로직
	@RequestMapping(value="/member/signUpEnd", method = RequestMethod.POST)
	public String signUpEnd(@RequestParam Map param, Member member, Model m) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		System.out.println(member.getMem_email());
		System.out.println(member.getMem_pwd());
		System.out.println(member.getMem_nickname());
		System.out.println(member.getMem_class());
		System.out.println(member.getMem_name());
		System.out.println(member.getGender());
		System.out.println(member.getTel());
		
		//암호화(id,폰)
		String encodeId=aes.encrypt(param.get("mem_email").toString());
		member.setMem_email(encodeId);
		String encodePhone=aes.encrypt(param.get("tel").toString());
		member.setTel(encodePhone);
		//암호화(pw)
		String encodePw=encoder.encode(param.get("mem_pwd").toString());
		member.setMem_pwd(encodePw);
		//생일 합치기
		String birthdayStr=param.get("year")+"-"+param.get("month")+"-"+param.get("date");
		Date birthday=Date.valueOf(birthdayStr);
		member.setBirthday(birthday);
		
		System.out.println(member.getBirthday());

		//회원구분
		String classMem=param.get("mem_class").toString();
		if(classMem=="normalUser") {
			member.setMem_class("일반유저");
		}else {
			member.setMem_class("전문가");
		}
		System.out.println("*********"+member.getMem_class());
		
		int result=service.signUpEnd(member);
	
		String msg="";
		String loc="";
		if(result>0) {
			msg="회원가입성공";
			loc="/";
		}
		else {
			msg="회원가입실패";
			loc="/";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		
		return "common/msg";
	}
}
