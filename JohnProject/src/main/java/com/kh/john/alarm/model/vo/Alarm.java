package com.kh.john.alarm.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Alarm {

	private int ALARM_ID;
	private int ALARM_SEND_MEM_USID;
	private int ALARM_RECEIVE_MEM_USID;
	private String ALARM_TYPE;
	private String ALARM_MSG_CONTENT;
	private String ALARM_SEND_MEM_NICKNAME;
	private Date ALARM_DATE;
	private Boolean ALARM_ISCHECKED;

}
