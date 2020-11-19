package com.kh.john.board.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	
	private int boardId;
	private int writerUsid;
	private String writerNickname;
	private String title;
	private String content;
	private Date enrollDate;
	private int hit;
	private String bigCategory;
	private String smallCategory;
	private boolean isclose;
	private String maxMems;
	private String agreeName;
	private String disagreeName;
	
}
