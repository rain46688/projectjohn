package com.kh.john.member.model.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberChat {
	
	private int mchatFirstUsid;
	private int mchatSecondUsid;
	private String mchatContent;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Date mchatDate;
	private String mchatFile;
}
