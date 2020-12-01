package com.kh.john.alarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.alarm.model.service.AlarmService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AlarmController {

	@Autowired
	private AlarmService service;

	// 알람 리스트 뿌려주기 웹소켓으로 처리
	@RequestMapping("/alarm/alarmList")
	public ModelAndView alarmList(int usid) {
		log.info("alarmList 실행");
		ModelAndView mv = new ModelAndView("/alarm/alarm");
		return mv;
	}
}
