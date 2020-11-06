package com.kh.john.admin.model.service;

import java.util.List;

import com.kh.john.board.model.vo.Board;
import com.kh.john.member.model.vo.Member;

public interface AdminService {

	List<Member> selectMemberList(int cPage, int numPerPage);
	
	int selectMemberCount();
	
	List<Board> selectBoardList(int cPage, int numPerPage);	
	
	int selectBoardCount();
	

}
