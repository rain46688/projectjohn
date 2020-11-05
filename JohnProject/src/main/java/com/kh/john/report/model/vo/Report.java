package com.kh.john.report.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Report {
	
	private int report_id;
	private int report_board_id;
	private int report_writer_usid;
	private int report_target_usid;
	private String report_type;
	private String report_title;
	private String report_content;
	private Date report_date;
	private boolean report_ischeck;
	private String report_user_nickname;
	private String report_target_nickname;
	private String report_answer;
	private int report_iswarning;
	
}
