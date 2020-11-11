package com.kh.john.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class License {
	
	private int license_mem_usid;
	private String license_file_name;
	private Date license_date;
	private String license_type;
	private String license_company;
}
