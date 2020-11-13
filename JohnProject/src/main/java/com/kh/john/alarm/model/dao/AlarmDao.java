package com.kh.john.alarm.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.john.alarm.model.vo.Alarm;

public interface AlarmDao {

	String selectAlarmCount(SqlSessionTemplate session, int usid) throws Exception;

	List<Alarm> selectAlarmList(SqlSessionTemplate session, int usid) throws Exception;

	int updateAlarmRead(SqlSessionTemplate session, int aid) throws Exception;

	int insetExpertAlarm(SqlSessionTemplate session, Alarm almsg) throws Exception;

}
