package com.kh.john.alarm.model.service;

import java.util.List;

import com.kh.john.alarm.model.vo.Alarm;

public interface AlarmService {

	String selectAlarmCount(int usid) throws Exception;

	List<Alarm> selectAlarmList(int usid) throws Exception;

	int updateAlarmRead(int aid) throws Exception;

}
