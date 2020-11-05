package com.kh.john.member.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Member {
	private int usid;
	private String mem_email;
	private String mem_pwd;
	private String mem_name;
	private String mem_nickname;
	private String gender;
	private Date birthday;
	private Date enroll_date;
	private int point;
	private boolean leave_mem;
	private int pw_is_uuid;
	private String mem_class;
	private String proifle_pic;
	private int expert_rating;
}
