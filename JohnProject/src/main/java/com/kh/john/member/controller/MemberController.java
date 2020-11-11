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
		member.setMem_email(aes.encrypt((String) param.get("mem_email")));
		Member loginMember = service.selectMemberById(member);
		String msg = "";
		String loc = "";
		String path = "";

		if (loginMember != null) {
			if (encoder.matches((String) param.get("mem_pwd"), loginMember.getMem_pwd())) {

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
	public ModelAndView emailDuplicate(@RequestParam("mem_email") String mem_email,
			Member member, ModelAndView mv)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		// 암호화
		String id = aes.encrypt(mem_email);
		member.setMem_email(id);
		member = service.selectMemberById(member);
		mv.addObject("member", member);
		mv.setViewName("member/emailDuplicate");
		return mv;
	}

//	닉네임 중복 확인
	@RequestMapping(value = "/member/NNDuplicate", method = RequestMethod.POST)
	public ModelAndView nickDuplicate(@RequestParam("mem_nickname") String mem_nick, Member m, ModelAndView mv) {
		m.setMem_nickname(mem_nick);
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
	public String signUpEnd(@RequestParam Map param, @RequestParam("licensePic") MultipartFile[] licensePic, Member member, Model m, HttpServletRequest request)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {

		// 암호화(id,폰)
		String encodeId = aes.encrypt(param.get("mem_email").toString());
		member.setMem_email(encodeId);
		String encodePhone = aes.encrypt(param.get("tel").toString());
		member.setTel(encodePhone);
		// 암호화(pw)
		String encodePw = encoder.encode(param.get("mem_pwd").toString());
		member.setMem_pwd(encodePw);
		// 생일 합치기
		String birthdayStr = param.get("year") + "-" + param.get("month") + "-" + param.get("date");
		Date birthday = Date.valueOf(birthdayStr);
		member.setBirthday(birthday);

		int result = 0;
		String msg = "";
		String loc = "";

		// 회원구분
		String classMem = param.get("mem_class").toString();
		if (classMem == "normalUser") {
			member.setMem_class("일반유저");
			result = service.signUpEnd(member);
			if (result > 0) {
				msg = "회원가입성공";
				loc = "/";
			} else {
				msg = "회원가입실패";
				loc = "/";
			}

		} else {
			member.setMem_class("예비전문가");
			
			//license 사진 파일 올리기 lisencePic->lisenceFile
			String saveDir = request.getServletContext().getRealPath("/resources/upload/upload_license");
			File dir = new File(saveDir);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			List<License> files = new ArrayList();
			for(MultipartFile f : licensePic) {
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
					License lisenceFile=new License();
					lisenceFile.setLicense_file_name(renamedFilename);
					files.add(lisenceFile);
				}
			}
			
			String[] license1=(String[]) param.get("license1");
			String[] license2=(String[]) param.get("license2");
			String[] license3=(String[]) param.get("license3");
			
			String[][] licenseArr=new String[3][3];
			licenseArr[0][0]=(String)param.get("licenseDate1");
			licenseArr[1][0]=(String)param.get("licenseDate2");
			licenseArr[2][0]=(String)param.get("licenseDate1");
			for(int i=0; i<3; i++) {
				for(int j=1; j<3; j++) {
					if(i==0) {
						licenseArr[i][j]=license1[j-1];
					}else if(i==1) {
						licenseArr[i][j]=license2[j-1];
					}else {
						licenseArr[i][j]=license3[j-1];
					}
				}
			}
			
			int resultExpert=service.signUpExpert(member, files, licenseArr);
			
		}

		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);

		return "common/msg";
	}

//	테스트 페이지
	@RequestMapping("/member/test")
	private String testPage() {
		return "member/test";
	}
}
