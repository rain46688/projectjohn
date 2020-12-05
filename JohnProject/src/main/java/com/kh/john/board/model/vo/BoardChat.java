package com.kh.john.board.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardChat {

	int boardId;
	int usid;
	String userNick;
	String userImg;
	String message;
	Date enrollDate;
}
