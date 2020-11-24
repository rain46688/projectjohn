package com.kh.john.member.model.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberChat {
	
	private int mchatFirstUsid;
	private int mchatSecondUsid;
	private String mchatContent;
	private Date mchatDate;
	private String mchatDateString;
	private String mchatFile;
	private String firstProfilePic;
	private String secondProfilePic;
	private String firstNick;
	private String secondNick;
}
