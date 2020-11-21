package com.kh.john.admin.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminMessage {
	
	private int memberUsid;
	private String nickname;
	private String profilePic;
	private Date time;
	private String latestMsg;
	private String latestDateStr;
	
}
