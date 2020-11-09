package com.kh.john.member.model.vo;

import java.sql.Date;

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
	private String profile_pic;
	private int expert_rating;
	private String expert_greetings;
	private String expert_profile;
	private String expert_counsel_area;
	private String tel;
	private Date expert_counsel_end_time;
	private Date expert_counsel_start_time;
}
