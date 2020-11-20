package com.kh.john.member.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class MemberMessage {
	
	private int otherUsid;
	private int myUsid;
	private String otherProfilePic;
	private String otherNick;
	private String latestMessage;
	private Date latestDate;
	private String latestDateStr;
	
}
