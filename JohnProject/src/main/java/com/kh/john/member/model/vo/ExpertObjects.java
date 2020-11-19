package com.kh.john.member.model.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class ExpertObjects {
	
	private int usid;
	private String memEmail;
	private String memPwd;
	private String memName;
	private String memNickname;
	private String gender;
	private Date birthday;
	private Date enrollDate;
	private int point;
	private boolean leaveMem;
	private int pwIsUuid;
	private String memClass;
	private String profilePic;
	private String tel;
	private int expertRating;
	private String expertGreetings;
	private String expertProfile;
	private String expertCounselArea;
	private Date expertCounselStartTime;
	private Date expertCounselEndTime;
	private String licenseFileName;
	private Date licenseDate;
	private String licenseType;
	private String licenseCompany;
	
}
