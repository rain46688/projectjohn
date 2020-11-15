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

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.john.board.model.vo.Board;
import com.kh.john.common.page.PageBarFactory;
import com.kh.john.member.model.service.MemberService;
import com.kh.john.member.model.vo.License;
import com.kh.john.member.model.vo.LikeDislike;
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
	
	@Autowired
	private JavaMailSender mailSender;

//	메인 페이지로 가기
	@RequestMapping("/")
	public ModelAndView mainPage() {
		log.debug("mainPage 실행");
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("list", service.selectMember());
		return mv;
	}

//	로그인 페이지로 가기
	@RequestMapping("/memberLogin")
	public String enterPage() {
		return "member/memberLogin";
	}

//	아이디 찾기
	@RequestMapping("/findIdPage")
	public String findIdPage() {
		return "member/findId";
	}
	@RequestMapping("/findId")
	public ModelAndView findId(Member member, ModelAndView mv) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		String encPhone=aes.encrypt(member.getTel());
		member.setTel(encPhone);
		member=service.findId(member);
		if(member!=null) {
			String idStr=aes.decrypt(member.getMemEmail());
			member.setMemEmail(idStr);
			mv.addObject("findMember",member);
			mv.setViewName("member/findId");		
		}else {
			String msg = "존재하지 않는 회원입니다.";
			String script= "window.close()";
			mv.addObject("msg", msg);
			mv.addObject("script",script);
			mv.setViewName("common/msgWithScript");
		}
		return mv;
	}
	
//	비번 찾기
	@RequestMapping("/findPwPage")
	public String findPwPage() {
		return "member/findPw";
	}
	@RequestMapping("/findPw")
	public ModelAndView findPw(Member member, ModelAndView mv) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException, MessagingException {
		String encPhone=aes.encrypt(member.getTel());
		member.setTel(encPhone);
		String strId=member.getMemEmail();
		String encId=aes.encrypt(strId);
		member.setMemEmail(encId);
		member=service.findPw(member);
		
		if(member!=null) {
			UuidGenerator uuid=new UuidGenerator();
			String tempPw=uuid.generateUuid(8);
			String encTempPw=encoder.encode(tempPw);
			member.setMemPwd(encTempPw);
			member.setPwIsUuid(1);
			int result=service.tempPw(member);
			
			if(result>0) {
				MailHandler sendMail=new MailHandler(mailSender);
				sendMail.setSubject("재판하는 존경장님 임시 비밀번호가 도착했습니다:)");
				sendMail.setText(
						new StringBuffer()
						.append("<h1>임시 비밀번호</h1>")
						.append(tempPw)
						.toString());
				sendMail.setFrom("22mailme@gmail.com", "관리자");
				sendMail.setTo(strId);
				sendMail.send();
				mv.addObject("findMember",member);
				mv.setViewName("member/findPw");				
			}
		}else {
			String msg = "존재하지 않는 회원입니다.";
			String script= "window.close()";
			mv.addObject("msg", msg);
			mv.addObject("script",script);
			mv.setViewName("common/msgWithScript");
		}
		
		
		mv.addObject("findMember",member);
		mv.setViewName("member/findPw");
		return mv;
	}
	
//	로그인 로직
	@RequestMapping(value = "/memberLoginEnd", method = RequestMethod.POST)
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
					return "redirect:/expert/expertRoom"; 
				} else {
					//임시비번알림
					if(loginMember.getPwIsUuid()==1) {
						msg="임시 비밀번호를 사용 중입니다. 비밀번호를 변경해주세요.";
						loc="/board/boardList";
						path = "common/msg";
						m.addAttribute("loginMember", loginMember);	
					}else {
						path = "/board/boardList";
						m.addAttribute("loginMember", loginMember);						
					}
				}
			} else {
				msg = "아이디나 비밀번호를 확인해주세요.";
				loc = "/memberLogin";
				path = "common/msg";
			}
		} else {
			msg = "아이디나 비밀번호를 확인해주세요.";
			loc = "/memberLogin";
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
	@RequestMapping("/signUp")
	public ModelAndView signUpPage(ModelAndView mv) {
		mv.setViewName("member/signUp");
		return mv;
	}

//	이메일 인증
	@RequestMapping(value = "/certiEmail", method = RequestMethod.POST)
	public ModelAndView certiEmail(@RequestParam("email") String email, ModelAndView mv) throws Exception {
		String authKey = service.sendAuthKey(email);
		mv.addObject("authKey", authKey);
		mv.setViewName("member/certiResult");
		return mv;
	}

//	이메일 중복 확인
	@RequestMapping(value = "/emailDuplicate", method = RequestMethod.POST)
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
	@RequestMapping(value = "/NNDuplicate", method = RequestMethod.POST)
	public ModelAndView nickDuplicate(@RequestParam("memNickname") String memNick, Member m, ModelAndView mv) {
		m.setMemNickname(memNick);
		m = service.nickDuplicate(m);
		mv.addObject("member", m);
		mv.setViewName("member/nickDuplicate");
		return mv;
	}

//	핸드폰 중복 확인
	@RequestMapping(value = "/PNDuplicate", method = RequestMethod.POST)
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
	@RequestMapping("/divForExpert")
	public String divForExpert() {
		return "member/uploadLicense";
	}

//	회원가입 로직
	@RequestMapping(value = "/signUpEnd", method = RequestMethod.POST)
	public String signUpEnd(
			@RequestParam(value="licenseFileName", required = false) MultipartFile[] licenseFileNames,
			@RequestParam(value="licenseDate", required = false) Date[] licenseDates,
			@RequestParam(value="licenseType", required = false) String[] licenseTypes,
			@RequestParam(value="licenseCompany", required = false) String[] licenseCompanies,
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
				script= "window.close()";
			}

		} else {
			member.setMemClass("예비전문가");
			
			String saveDir = request.getServletContext().getRealPath("/resources/upload/upload_license");
			File dir = new File(saveDir);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			List<License> licenseList = new ArrayList<License>();
			
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
				}
			}
			
			int resultExpert=service.signUpExpert(member, licenseList);
			if(resultExpert>0) {
				msg = "회원가입완료";
				script= "window.close()";
			} else {
				msg = "회원가입실패";
				script= "window.close()";
			}
		}

		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		m.addAttribute("script",script);

		return "common/msgWithScript";
	}

//	마이페이지^^
	@RequestMapping("/member/myPage")
	private ModelAndView myPage(ModelAndView mv,@SessionAttribute("loginMember") Member loginMember) {
		Member member=service.selectMemberById(loginMember);
		mv.addObject("member",member);
		mv.setViewName("member/myPage");
		return mv;
	}
	
//	회원정보 수정하기
	@RequestMapping("/member/myPage/updateMemberInfo")
	private String updateMemberInfo() {
		return "member/updateMemberInfo";
	}

//	비밀번호 변경하기
	@RequestMapping(value="/member/myPage/updatePw", method=RequestMethod.POST)
	private ModelAndView updatePw(ModelAndView mv, @RequestParam("crtPw") String crtPw,@RequestParam("newPw") String newPw, Member member, @SessionAttribute("loginMember") Member loginMember) {

		String msg="";
		String loc="";
		
		if (encoder.matches(crtPw, loginMember.getMemPwd())) {
			member.setMemPwd(encoder.encode(newPw));
			member.setPwIsUuid(0);
			member.setUsid(loginMember.getUsid());
			int result=service.updatePw(member);
			if(result>0) {
				msg="비밀번호 변경에 성공하였습니다.";
				loc="/member/myPage?usid="+loginMember.getUsid();
				mv.addObject("msg",msg);
				mv.addObject("loc",loc);
				mv.setViewName("common/msg");
			}else {
				msg="비밀번호 변경에 실패하였습니다.";
				loc="/member/myPage?usid="+loginMember.getUsid();
				mv.addObject("msg",msg);
				mv.addObject("loc",loc);
				mv.setViewName("common/msg");
			}
		}else {
			msg="현재 비밀번호가 일치하지 않습니다.";
			loc="/member/myPage?usid="+loginMember.getUsid();
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
		}
		return mv;
	}
	
//	닉네임 변경
	@RequestMapping("/member/myPage/updateNick")
	private ModelAndView updateNick(ModelAndView mv, Member member, @SessionAttribute("loginMember") Member loginMember) {
		String msg="";
		String loc="";
		
		member.setUsid(loginMember.getUsid());
		int result=service.updateNick(member);
		
		if(result>0) {
			msg="닉네임 변경에 성공하였습니다.";
			loc="/member/myPage?usid="+loginMember.getUsid();
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
		}else {
			msg="닉네임 변경에 실패하였습니다.";
			loc="/member/myPage?usid="+loginMember.getUsid();
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
		}
		return mv;
	}
	
//	프사 변경
	@RequestMapping("/member/myPage/updatePic")
	public ModelAndView updatePic(ModelAndView mv, MultipartHttpServletRequest request, Member member, @SessionAttribute("loginMember") Member loginMember) {
		
		String saveDir=request.getServletContext().getRealPath("/resources/profile_images");
		File dir=new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		MultipartFile file=request.getFile("profilePic");
		
		if(!file.isEmpty()) {
			String originalFileName=file.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf('.')+1);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_ddHHmmssSSS");
			int rndNum = (int)(Math.random()*1000);
			String renamedFilename = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + "_john." + ext;
			try {
				file.transferTo(new File(saveDir + "/" + renamedFilename));
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			member.setProfilePic(renamedFilename);
			member.setUsid(loginMember.getUsid());
		
			int result=service.updatePic(member);
			
			if(result>0) {
				mv.addObject("msg","프로필 사진 변경에 성공했습니다.");
				mv.addObject("loc","/member/myPage?usid="+loginMember.getUsid());
				mv.setViewName("common/msg");
			}else {
				mv.addObject("msg","프로필 사진 변경에 실패했습니다.");
				mv.addObject("loc","/member/myPage?usid="+loginMember.getUsid());
				mv.setViewName("common/msg");
			}
		}else {
			mv.addObject("msg","프로필 사진 변경에 실패했습니다.");
			mv.addObject("loc","/member/myPage?usid="+loginMember.getUsid());
			mv.setViewName("common/msg");
		}
		return mv;
	}
	
//	휴대폰 변경
	@RequestMapping("/member/myPage/updatePhone")
	public ModelAndView updatePhone(ModelAndView mv, Member member, @SessionAttribute("loginMember") Member loginMember) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		String msg="";
		String loc="";
		
		String phoneStr=member.getTel();
		member.setTel(aes.encrypt(phoneStr));
		member.setUsid(loginMember.getUsid());
		int result=service.updatePhone(member);
		
		if(result>0) {
			msg="핸드폰 번호 변경에 성공하였습니다.";
			loc="/member/myPage?usid="+loginMember.getUsid();
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
		}else {
			msg="핸드폰 번호 변경에 실패하였습니다.";
			loc="/member/myPage?usid="+loginMember.getUsid();
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
		}
		return mv;	
	}
	
//	나의 게시물 리스트
	@RequestMapping("/member/myPage/myBoard")
	private ModelAndView myBoard(ModelAndView mv,@SessionAttribute("loginMember") Member loginMember,
			@RequestParam(value ="cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value ="numPerPage", required = false, defaultValue = "10") int numPerPage) {
		int usid=loginMember.getUsid();
		List<Board> boardList=service.myBoard(cPage,numPerPage,usid);
		int totalData=service.myBoardCount(usid);
		
		mv.addObject("pageBar",myPagePageBar.getPageBar(totalData, cPage, numPerPage, "myBoard", loginMember.getUsid()));
		mv.addObject("totalData", totalData);
		mv.addObject("boardList", boardList);	
		mv.setViewName("member/myBoard");
		return mv;
	}
	
//	내 게시물 상세
	@RequestMapping("/member/myPage/myBoardDetail")
	private ModelAndView myBoardDetail(ModelAndView mv, @SessionAttribute("loginMember") Member loginMember,
			@RequestParam("boardId") int boardId, Board board) {
		board.setWriterUsid(loginMember.getUsid());
		board.setBoardId(boardId);
		board=service.searchBoard(board);
		
		mv.addObject("board",board);
		mv.setViewName("member/myBoardDetail");
		return mv;
	}
	
//	좋아요 게시물 페이지
	@RequestMapping("/member/myPage/liked")
	public ModelAndView liked(ModelAndView mv, @SessionAttribute("loginMember") Member loginMember) {
		int usid=loginMember.getUsid();
		List<LikeDislike> liked=service.liked(usid);
		
		mv.addObject("liked",liked);
		mv.setViewName("member/liked");
		return mv;
	}
	
//	테스트 페이지
	@RequestMapping("/member/test")
	private String testPage() {
		return "member/test";
	}
}
