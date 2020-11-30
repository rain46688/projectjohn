package com.kh.john.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Expert {

	private int expertUsid;
	private int expertRating;
	private String expertGreetings;
	private String expertProfile;
	private String expertCounselArea;
	private String expertCounselStartTime;
	private String expertCounselEndTime;
	private int expertReviewCount;
}
