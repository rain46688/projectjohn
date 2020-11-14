package com.kh.john.report.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Report {
	
	private int reportId;
	private int reportBoardId;
	private int reportWriterUsid;
	private int reportTargetUsid;
	private String reportType;
	private String reportTitle;
	private String reportContent;
	private Date reportDate;
	private boolean reportIscheck;
	private String reportUserNickname;
	private String reportTargetNickname;
	private String reportAnswer;
	private int reportIswarning;
	
}
