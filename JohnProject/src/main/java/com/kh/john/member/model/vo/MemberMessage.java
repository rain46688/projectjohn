package com.kh.john.member.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class MemberMessage {
	
	private int otherUsid;
	private String otherProfilPic;
	private String latestMessage;
	private String fromNick;
	private Date latestDate;

}
