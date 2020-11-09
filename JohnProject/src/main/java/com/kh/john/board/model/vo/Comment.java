package com.kh.john.board.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Comment {
	
	private int com_id;
	private int com_board_id;
	private int com_writer_usid;
	private String com_content;
	private String com_writer_nickname;
	private String com_profile_pic;
	private Date com_enroll_date;
	
}
