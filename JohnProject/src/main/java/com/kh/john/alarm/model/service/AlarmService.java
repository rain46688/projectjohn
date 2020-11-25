package com.kh.john.alarm.model.service;

import java.util.List;

import com.kh.john.alarm.model.vo.Alarm;

public interface AlarmService {

	List<Alarm> selectAlarmList(int usid) throws Exception;

	int updateAlarmRead(List<Alarm> ll) throws Exception;

	int insertExpertAlarm(Alarm almsg) throws Exception;
}
