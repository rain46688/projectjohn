package com.kh.john.alarm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.alarm.model.service.AlarmService;
import com.kh.john.alarm.model.vo.Alarm;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AlarmController {

	@Autowired
	private AlarmService service;

	@ResponseBody
	@RequestMapping("/alarmCount")
	public String alarmCount(int usid) {
		log.info("alarmCount 실행");
		String count = "0";
		try {
			count = "" + service.selectAlarmCount(usid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.info("count : " + count);
		return count;
	}

	@RequestMapping("/alarmList")
	public ModelAndView alarmList(int usid) {
		log.info("alarmCheck 실행");

		List<Alarm> list = null;
		try {
			list = service.selectAlarmList(usid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ModelAndView mv = new ModelAndView("/alarm/alarm");
		mv.addObject("list", list);
		return mv;
	}

	@ResponseBody
	@RequestMapping("/alarmRead")
	public int alarmRead(int aid) {
		log.info("alarmRead 실행");
		int result = 0;
		try {
			result = service.updateAlarmRead(aid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
