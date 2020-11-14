package com.kh.john.alarm.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.john.alarm.model.vo.Alarm;

@Repository
public class AlarmDaoImpl implements AlarmDao {

	@Override
	public String selectAlarmCount(SqlSessionTemplate session, int usid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("alarm.selectAlarmCount", usid);
	}

	@Override
	public List<Alarm> selectAlarmList(SqlSessionTemplate session, int usid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("alarm.selectAlarmList", usid);
	}

	@Override
	public int updateAlarmRead(SqlSessionTemplate session, int aid) throws Exception {
		// TODO Auto-generated method stub
		return session.update("alarm.updateAlarmRead", aid);
	}

	@Override
	public int insetExpertAlarm(SqlSessionTemplate session, Alarm almsg) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("alarm.insetExpertAlarm", almsg);
	}

}
