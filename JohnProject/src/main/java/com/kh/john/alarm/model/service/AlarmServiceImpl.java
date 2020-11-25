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
	public List<Alarm> selectAlarmList(int usid) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectAlarmList(session, usid);
	}

	@Override
	public int updateAlarmRead(List<Alarm> list) throws Exception {
		// TODO Auto-generated method stub
		int result;
		try {
			for (Alarm a : list) {
				dao.updateAlarmRead(session, a.getAlarmId());
			}
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
			result = 0;
		}

		return result;
	}

	@Override
	public int insertExpertAlarm(Alarm almsg) throws Exception {
		// TODO Auto-generated method stub
		return dao.insetExpertAlarm(session, almsg);
	}

}
