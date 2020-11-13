package com.kh.john.admin.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminChat {

	private int adminUsid;
	private int adminChatMemUsid;
	private String adminChatContent;
	private Date adminChatDate;
	private String adminChatFile;
}

