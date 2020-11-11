package com.kh.john.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.kh.john.board.model.service.BoardService;
import com.kh.john.board.model.vo.Board;
import com.kh.john.board.model.vo.BoardFile;
import com.kh.john.board.model.vo.Comment;
import com.kh.john.board.model.vo.Subscribe;
import com.kh.john.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/board/boardList")
	public ModelAndView boardList(ModelAndView mv) {
		mv.setViewName("board/boardList");
		return mv;
	}
	
	@RequestMapping("/board/boardInsert")
	public ModelAndView boardInsert(ModelAndView mv) {
		
		mv.setViewName("/board/boardInsert");
		
		return mv;
	}
	
	@RequestMapping(value="/board/boardInsertEnd")
	public ModelAndView boardInsertEnd(MultipartFile[] upFiles, Board b, ModelAndView mv, HttpServletRequest request) {
		String saveDir = request.getServletContext().getRealPath("resources/upload_images/board");
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		List<BoardFile> files = new ArrayList();
		for(MultipartFile f : upFiles) {
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
				BoardFile boardFile = new BoardFile();
				boardFile.setBoard_file_name(renamedFilename);
				files.add(boardFile);
			}
		}
		int result = service.boardInsert(files, b);
		
		if(result>0) {
			mv.setViewName("/board/boardInsertSuccess");
		}else {
			mv.addObject("msg", "글 등록에 실패했습니다");
			mv.addObject("loc", "/board/boardList");
		}
		
		return mv;
	}

	@RequestMapping("board/boardPage")
	public ModelAndView boardPage(ModelAndView mv, int boardNo) {
		
		Board b = service.boardSelectOne(boardNo);
		
		mv.addObject("currBoard", b);
		mv.setViewName("/board/boardPage");
		
		return mv;
	}
	@ResponseBody
	@RequestMapping("board/boardCommentList")
	public List<Comment> boardCommentList(int currBoardNo)
			throws JsonMappingException, JsonGenerationException, IOException{
		
		List<Comment> list = service.commentSelectList(currBoardNo);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("board/boardCommentInsert")
	public Map boardCommentInsert(@RequestParam Map param) throws JsonMappingException, JsonGenerationException, IOException {
		
		Map<String,String> result = new HashMap();
		
		int intResult = service.boardCommentInsert(param);
		
		if(intResult > 0) {
			result.put("result","success");
		}else {
			result.put("result","fail");
		}
		return result;
	}
	//세션 만들기
	@RequestMapping("board/boardSession")
	public ModelAndView boardSession(ModelAndView mv, HttpServletRequest request) {
		
		Member m = (Member) request.getSession().getAttribute("loginMember");
		System.out.println(m);
		Subscribe s1 = new Subscribe(99, "연애상담");
		Subscribe s2 = new Subscribe(99, "가족문제");
		Subscribe s3 = new Subscribe(99, "회사문제");
		
		List<Subscribe> list = new ArrayList();
		list.add(s1);
		list.add(s2);
		list.add(s3);
		
		mv.addObject("loginMember", m);
		mv.addObject("subList", list);
		mv.setViewName("/board/boardList");
		
		return mv;
	}
	
	//작은 카테고리 조회
	@RequestMapping("/board/boardListSmall")
	public ModelAndView boardListSmall(String boardTitle, ModelAndView mv) {
		
		log.debug(boardTitle);
		
		List<Board> list = service.boardSelectCate(boardTitle);
		
		mv.addObject("list", list);
		mv.setViewName("/board/boardListSmall");
		
		return mv;
	}
}
