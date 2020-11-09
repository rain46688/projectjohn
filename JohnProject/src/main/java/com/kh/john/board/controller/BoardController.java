package com.kh.john.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.board.model.service.BoardService;
import com.kh.john.board.model.vo.Board;
import com.kh.john.board.model.vo.BoardFile;
import com.kh.john.board.model.vo.Comment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
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
	public ModelAndView boardPage(ModelAndView mv) {
		int boardNo = 10;
		
		Board b = service.boardSelectOne(boardNo);
		
		mv.addObject("currBoard", b);
		mv.setViewName("/board/boardPage");
		
		return mv;
	}
	
	@RequestMapping("board/boardCommentList")
	public void boardCommentList(int currBoardNo) {
		System.out.println(currBoardNo);
		List<Comment> list = service.commentSelectList(currBoardNo);
	}
}
