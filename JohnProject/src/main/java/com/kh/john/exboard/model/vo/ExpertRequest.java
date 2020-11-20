package com.kh.john.exboard.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ExpertRequest {

	private int expertRequetExUsid;
	private int expertRequestMemUsid;
	private String expertRequetExNick;
	private String expertRequestMemNick;
	private int expertIscounsel;
	private Date expertDate;
	private Boolean startCounsel;
	private Boolean endCounsel;
	private String expertCounselTime;
	private String expertCounselRequire;
	private String expertDateTmp;

}
