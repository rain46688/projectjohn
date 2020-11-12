package com.kh.john.admin.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminChat {

	private int admin_usid;
	private int admin_chat_mem_usid;
	private String admin_chat_content;
	private Date admin_chat_date;
	private String admin_chat_file;
}

