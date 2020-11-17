package com.kh.john.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberChat {
	
	private int mchatFirstUsid;
	private int mchatSecondUsid;
	private String mchatContent;
	private Date mchatDate;
	private String mchatFile;
}
