package com.kh.john.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.john.member.model.service.MemberService;
import com.kh.john.member.model.vo.License;
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
	@RequestMapping(value = "/member/memberLoginEnd", method = RequestMethod.POST)
	public String loginPage(@RequestParam Map param, Member member, Model m, HttpSession session,
			RedirectAttributes redirectAttributes)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		member.setMemEmail(aes.encrypt((String) param.get("memEmail")));
		Member loginMember = service.selectMemberById(member);
		String msg = "";
		String loc = "";
		String path = "";

		if (loginMember != null) {
			if (encoder.matches((String) param.get("memPwd"), loginMember.getMemPwd())) {

				if (session.getAttribute("bnum") != null) {
					String bo = (String) session.getAttribute("bnum");
					log.debug("bo : " + bo);
					session.removeAttribute("bnum");
					m.addAttribute("loginMember", loginMember);
					redirectAttributes.addAttribute("bno", bo);
					return "redirect:/expertRoom";
				} else {
					path = "/board/boardList";
					m.addAttribute("loginMember", loginMember);
				}
			} else {
				msg = "아이디나 비밀번호를 확인해주세요.";
				loc = "/member/memberLogin";
				path = "common/msg";
			}
		} else {
			msg = "아이디나 비밀번호를 확인해주세요.";
			loc = "/member/memberLogin";
			path = "common/msg";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		return path;
	}

//	로그아웃 로직
	@RequestMapping("/member/logout")
	public String memberLogout(HttpSession session, SessionStatus status) {
		if (!status.isComplete()) {
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
	@RequestMapping(value = "/member/certiEmail", method = RequestMethod.POST)
	public ModelAndView certiEmail(@RequestParam("email") String email, ModelAndView mv) throws Exception {
		String authKey = service.sendAuthKey(email);
		mv.addObject("authKey", authKey);
		mv.setViewName("member/certiResult");
		return mv;
	}

//	이메일 중복 확인
	@RequestMapping(value = "/member/emailDuplicate", method = RequestMethod.POST)
	public ModelAndView emailDuplicate(@RequestParam("memEmail") String memEmail,
			Member member, ModelAndView mv)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		// 암호화
		String id = aes.encrypt(memEmail);
		member.setMemEmail(id);
		member = service.selectMemberById(member);
		mv.addObject("member", member);
		mv.setViewName("member/emailDuplicate");
		return mv;
	}

//	닉네임 중복 확인
	@RequestMapping(value = "/member/NNDuplicate", method = RequestMethod.POST)
	public ModelAndView nickDuplicate(@RequestParam("memNickname") String memNick, Member m, ModelAndView mv) {
		m.setMemNickname(memNick);
		m = service.nickDuplicate(m);
		mv.addObject("member", m);
		mv.setViewName("member/nickDuplicate");
		return mv;
	}

//	핸드폰 중복 확인
	@RequestMapping(value = "/member/PNDuplicate", method = RequestMethod.POST)
	public ModelAndView phoneDuplicate(@RequestParam("tel") String phoneStr, Member m, ModelAndView mv)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		String phone = aes.encrypt(phoneStr);
		m.setTel(phone);
		m = service.phoneDuplicate(m);
		mv.addObject("member", m);
		mv.setViewName("member/phoneDulicate");
		return mv;
	}

//	전문가용 div로 가는 길
	@RequestMapping("/member/divForExpert")
	public String divForExpert() {
		return "member/divForExpert";
	}

//	회원가입 로직
	@RequestMapping(value = "/member/signUpEnd", method = RequestMethod.POST)
	public String signUpEnd(
			@RequestParam("licenseFileName") MultipartFile[] licenseFileNames,
			@RequestParam("licenseDate") Date[] licenseDates,
			@RequestParam("licenseType") String[] licenseTypes,
			@RequestParam("licenseCompany") String[] licenseCompanies,
			@RequestParam Map param, Member member, Model m, HttpServletRequest request)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		
		// 암호화(id,폰)
		String encodeId = aes.encrypt(param.get("memEmail").toString());
		member.setMemEmail(encodeId);
		String encodePhone = aes.encrypt(param.get("tel").toString());
		member.setTel(encodePhone);
		// 암호화(pw)
		String encodePw = encoder.encode(param.get("memPwd").toString());
		member.setMemPwd(encodePw);
		// 생일 합치기
		String birthdayStr = param.get("year") + "-" + param.get("month") + "-" + param.get("date");
		Date birthday = Date.valueOf(birthdayStr);
		member.setBirthday(birthday);

		int result = 0;
		String msg = "";
		String loc = "";
		String script="";

		// 회원구분
		String classMem = param.get("memClass").toString();
		if (classMem == "normalUser") {
			member.setMemClass("일반유저");
			result = service.signUpEnd(member);
			if (result > 0) {
				msg = "회원가입완료";
				script= "window.close()";
			} else {
				msg = "회원가입실패";
				script= "history.back()";
			}

		} else {
			member.setMemClass("예비전문가");
			
			
			//사진
			String saveDir = request.getServletContext().getRealPath("/resources/upload/upload_license");
			File dir = new File(saveDir);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			List<License> licenseList = new ArrayList<License>();
			
//			for(MultipartFile f : licenseFileNames) {
			for(int i=0; i<licenseFileNames.length; i++) {
				License license=new License();
				MultipartFile f = licenseFileNames[i];
				if(!f.isEmpty()) {
					String originalFilename = f.getOriginalFilename();
					String ext = originalFilename.substring(originalFilename.lastIndexOf('.')+1);
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_ddHHmmssSSS");
					int rndNum = (int)(Math.random()*1000);
					String renamedFilename = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + "_john." + ext;
					try {
						f.transferTo(new File(saveDir + "/" + renamedFilename));
					}catch(IOException e) {
						e.printStackTrace();
					}
					license.setLicenseFileName(renamedFilename);
					license.setLicenseDate(licenseDates[i]);
					license.setLicenseType(licenseTypes[i]);
					license.setLicenseCompany(licenseCompanies[i]);
					licenseList.add(license);
//					files.add(lisenceFile);
				}
			}
			
//			//날짜
//			for(Date d : licenseDates) {
//				licenseFile.setLicenseDate(d);
//				licenseList.add(licenseFile);
//			}
//			//종류
//			for(String s : licenseTypes) {
//				licenseFile.setLicenseType(s);
//				licenseList.add(licenseFile);
//			}
//			//발급기관
//			for(String s : licenseCompanies) {
//				licenseFile.setLicenseCompany(s);
//				licenseList.add(licenseFile);
//			}
			
//			License license=new License();
			
			//회원정보 설정
//			String[] license1 = new String[2];
//			String[] license2 = new String[2];
//			String[] license3 = new String[2];
//			List<License> list=new ArrayList<License>();
//			if(files.size()==1) {
//				license1[0]=(String) param.get("licenseType1");
//				license1[1]=(String) param.get("licenseCompany1");
//			}else if(files.size()==2) {
//				license1[0]=(String) param.get("licenseType1");
//				license1[1]=(String) param.get("licenseCompany1");
//				license2[0]=(String) param.get("licenseType2");
//				license2[1]=(String) param.get("licenseCompany2");
//			}else {
//				license1[0]=(String) param.get("licenseType1");
//				license1[1]=(String) param.get("licenseCompany1");
//				license2[0]=(String) param.get("licenseType2");
//				license2[1]=(String) param.get("licenseCompany2");
//				license3[0]=(String) param.get("licenseType3");
//				license3[1]=(String) param.get("licenseCompany3");
//			}
//			
//			String[][] licenseArr=new String[3][3];
//			licenseArr[0][0]=(String)param.get("licenseDate1");
//			licenseArr[1][0]=(String)param.get("licenseDate2");
//			licenseArr[2][0]=(String)param.get("licenseDate3");
//			for(int i=0; i<3; i++) {
//				for(int j=1; j<3; j++) {
//					if(i==0) {
//						licenseArr[i][j]=license1[j-1];
//					}else if(i==1) {
//						licenseArr[i][j]=license2[j-1];
//					}else {
//						licenseArr[i][j]=license3[j-1];
//					}
//				}
//			}
			int resultExpert=service.signUpExpert(member, licenseList);
			if(resultExpert>0) {
				msg = "회원가입완료";
				script= "window.close()";
			} else {
				msg = "회원가입실패";
				script= "history.back()";
			}
		}

		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		m.addAttribute("script",script);

		return "common/msgWithScript";
	}

//	테스트 페이지
	@RequestMapping("/member/test")
	private String testPage() {
		return "member/test";
	}
}
