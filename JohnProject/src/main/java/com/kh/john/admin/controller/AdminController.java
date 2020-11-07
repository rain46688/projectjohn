package com.kh.john.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.admin.model.service.AdminService;
import com.kh.john.board.model.vo.Board;
import com.kh.john.common.page.PageBarFactory;
import com.kh.john.member.model.vo.Member;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	

	//어드민 메뉴화면 이동(임시)
	@RequestMapping("/admin/adminPage")
	public String adminPage() {
		return "/admin/adminPage";
	}
	
	
	//멤버 리스트 불러오기
	@RequestMapping("/admin/adminMember")
	public ModelAndView adminMember(ModelAndView mv, @RequestParam(value="cPage",required=false, defaultValue="1") int cPage,
																						@RequestParam(value="numPerPage",required=false, defaultValue="10")int numPerPage) {
		List<Member> list = service.selectMemberList(cPage, numPerPage);
		int totalData = service.selectMemberCount();
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "adminMember"));
		
		mv.addObject("totalData",totalData);
		
		mv.addObject("list",list);
		mv.setViewName("admin/adminMember");
		return mv;
	}
	
	//멤버 탈퇴시키기
	@RequestMapping(value="/admin/adminDeleteMember")
	public ModelAndView deleteMember(Member m, ModelAndView mv) {
		
		int result = service.deleteMember(m);
		
		String msg = "";
		
		if(result>0) {
			msg="탈퇴 완료";
		}else{
			msg="탈퇴 실패";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc","/admin/adminMember");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
	//게시판 리스트 불러오기
	@RequestMapping("/admin/adminBoard")
	public ModelAndView adminBoard(ModelAndView mv, 
			@RequestParam(value="cPage",required=false, defaultValue="1")int cPage,
			@RequestParam(value="numPerPage",required=false, defaultValue="10")int numPerPage) {
		
		List<Board> list = service.selectBoardList(cPage, numPerPage);
		int totalData = service.selectBoardCount(); 
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "adminBoard")); //페이지바 PageBarFactory에서 가져오기
		
		mv.addObject("totalData",totalData);
		
		mv.addObject("list", list);
		mv.setViewName("admin/adminBoard");
		return mv;
	}
	
	//전문가 리스트 불러오기 
	@RequestMapping("/admin/adminExpert")
	public ModelAndView adminExpert(ModelAndView mv, @RequestParam(value="cPage",required=false, defaultValue="1") int cPage,
																						@RequestParam(value="numPerPage",required=false, defaultValue="10")int numPerPage) {
		List<Member> list = service.selectExpertList(cPage, numPerPage);
		int totalData = service.selectExpertCount();
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "adminExpert"));
		
		mv.addObject("totalData",totalData);
		
		mv.addObject("list",list);
		mv.setViewName("admin/adminExpert");
		return mv;
	}
	
	//승인 전 전문가 리스트 불러오기 -- 향후 mapper 수정할것임
	@RequestMapping("/admin/adminBeforeExpert")
	public ModelAndView adminBeforeExpert(ModelAndView mv, @RequestParam(value="cPage",required=false, defaultValue="1") int cPage,
																						@RequestParam(value="numPerPage",required=false, defaultValue="10")int numPerPage) {
		List<Member> list = service.selectBeforeExpertList(cPage, numPerPage);
		int totalData = service.selectBeforeExpertCount();
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "adminBeforeExpert"));
		
		mv.addObject("totalData",totalData);
		
		mv.addObject("list",list);
		mv.setViewName("admin/adminBeforeExpert");
		return mv;
	}
	
	//전문가 승인해주기
	@RequestMapping("/admin/adminUpdateMemberToExpert")
	public ModelAndView adminUpdateMemberToExpert(@RequestParam Map param, ModelAndView mv) {
		Member m = service.updateMemberToExpert(param);
		mv.addObject("member",m);
		mv.setViewName("admin/adminMemberUpdate");
		
		return mv;
		
	}

	
	//1:1 채팅답변 불러오기
	
	
	
	
}
