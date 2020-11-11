package com.kh.john.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Expert {
	
	private int expert_usid;
	private int expert_rating;
	private String expert_greetings;
	private String expert_profile;
	private String expert_counsel_area;
	private Date expert_counsel_start_time;
	private Date expert_counsel_end_time;
}
