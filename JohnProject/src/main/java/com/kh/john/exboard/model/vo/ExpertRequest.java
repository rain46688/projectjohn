package com.kh.john.exboard.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ExpertRequest {

	private int EXPERT_REQUET_EX_USID;
	private int EXPERT_REQUEST_MEM_USID;
	private String EXPERT_REQUET_EX_NICK;
	private String EXPERT_REQUEST_MEM_NICK;
	private int EXPERT_ISCOUNSEL;
	private Date EXPERT_DATE;
	private Boolean startCounsel;
	private Boolean endCounsel;

}
