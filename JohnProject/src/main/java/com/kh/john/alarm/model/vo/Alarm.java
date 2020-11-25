package com.kh.john.alarm.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Alarm {

	private int alarmId;
	private int alarmSendMemUsid;
	private int alarmReceiveMemUsid;
	private String alarmType;
	private String alarmMsgContent;
	private String alarmSendMemNickname;
	private String alarmDate;
	private Boolean alarmIscheked;
}
