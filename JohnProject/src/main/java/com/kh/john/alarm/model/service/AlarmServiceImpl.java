package com.kh.john.alarm.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.john.alarm.model.dao.AlarmDao;
import com.kh.john.alarm.model.vo.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService {

	@Autowired
	private AlarmDao dao;

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public String selectAlarmCount(int usid) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectAlarmCount(session, usid);
	}

	@Override
	public List<Alarm> selectAlarmList(int usid) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectAlarmList(session, usid);
	}

	@Override
	public int updateAlarmRead(int aid) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateAlarmRead(session, aid);
	}

	@Override
	public int insertExpertAlarm(Alarm almsg) throws Exception {
		// TODO Auto-generated method stub
		return dao.insetExpertAlarm(session, almsg);
	}

}
