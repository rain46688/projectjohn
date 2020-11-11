package com.kh.john.alarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.john.alarm.model.service.AlarmService;

@Controller
public class AlarmController {

	@Autowired
	private AlarmService service;

}
