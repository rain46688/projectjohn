package com.kh.john.exboard.model.vo;

import lombok.Data;

@Data
public class SessionVo {

	private int sessionUsid;
	private String nickname;
	private String curRoomBid;
	private boolean expert;
}
