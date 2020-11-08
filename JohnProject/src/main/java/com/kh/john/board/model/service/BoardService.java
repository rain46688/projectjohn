package com.kh.john.board.model.service;

import java.util.List;

import com.kh.john.board.model.vo.Board;
import com.kh.john.board.model.vo.BoardFile;

public interface BoardService {
	List<Board> boardList();
	int boardInsert(List<BoardFile> files, Board b);
}
