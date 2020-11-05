package com.kh.john.board.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	
	private int board_id;
	private int writer_usid;
	private String writer_nickname;
	private String title;
	private String content;
	private Date enroll_data;
	private int hit;
	private String big_category;
	private String small_category;
	private boolean isclose;
	private int max_mems;
	private String agree_name;
	private String disagree_name;
	
}
