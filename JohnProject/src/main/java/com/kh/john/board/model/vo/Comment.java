package com.kh.john.board.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Comment {
	
	private int comId;
	private int comBoardId;
	private int comWriterUsid;
	private String comContent;
	private String comWriterNickname;
	private String comProfilePic;
	private Date comEnrollDate;
	
}
