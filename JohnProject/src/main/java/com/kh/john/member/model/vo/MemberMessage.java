package com.kh.john.member.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class MemberMessage {
	
	private int otherUsid;
	private String otherProfilePic;
	private String latestMessage;
	private String otherNick;
	private Date latestDate;

}
