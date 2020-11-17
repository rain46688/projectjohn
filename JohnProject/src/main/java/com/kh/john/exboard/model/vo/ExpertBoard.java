package com.kh.john.exboard.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ExpertBoard {

	private int expertBoardId;
	private int expertBoardUsid;
	private int expertBoardMemUsid;
	private String expertBoardAdviceResult;
	private int expertBoardRating;
	private Date expertBoardDate;
	private String expertBoardExNick;

}
