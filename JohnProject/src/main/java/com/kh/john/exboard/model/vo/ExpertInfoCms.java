package com.kh.john.exboard.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ExpertInfoCms {

	private int EXPERT_USID;
	private int EXPERT_RATING;
	private String EXPERT_GREETINGS;
	private String EXPERT_PROFILE;
	private String EXPERT_COUNSEL_AREA;
	private Date EXPERT_COUNSEL_START_TIME;
	private Date EXPERT_COUNSEL_END_TIME;
}
