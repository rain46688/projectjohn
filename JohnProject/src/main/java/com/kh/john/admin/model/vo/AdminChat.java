package com.kh.john.admin.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminChat {

	private int adminFirstUsid;
	private int adminSecondUsid;
	private String adminChatContent;
	private Date adminChatDate;
	private String adminChatFile;
	private String adminChatSenderNickname;
}
