package com.kh.john.admin.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Notice {

	private int noticeId;
	private int noticeAdminUisd;
	private String noticeAdminNickname;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeEnrolldate;
}
