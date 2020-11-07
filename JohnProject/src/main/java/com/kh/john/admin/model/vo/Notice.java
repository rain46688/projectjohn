package com.kh.john.admin.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Notice {

	private int notice_id;
	private int notice_admin_usid;
	private int notice_admin_nickname;
	private String notice_title;
	private String notice_content;
	private Date notice_enrolldate;
}
