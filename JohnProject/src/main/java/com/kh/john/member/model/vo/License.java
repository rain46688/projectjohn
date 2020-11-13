package com.kh.john.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class License {
	
	private int licenseMemUsid;
	private String licenseFileName;
	private Date licenseDate;
	private String licenseType;
	private String licenseCompany;
}
