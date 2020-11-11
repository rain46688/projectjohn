package com.kh.john.exboard.model.vo;

import lombok.Data;

@Data
public class ExboardMsg {

	private String type;
	private String nick;
	private String msg;
	private String id;
	private String sdp;
	private String label;
	private String candidate;

}
