package com.kh.john.alarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.john.alarm.model.service.AlarmService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AlarmController {

	@Autowired
	private AlarmService service;

	@ResponseBody
	@RequestMapping("/alarm/alarmCount")
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

	@RequestMapping("/alarm/alarmList")
	public ModelAndView alarmList(int usid) {
		log.info("alarmList 실행");
		ModelAndView mv = new ModelAndView("/alarm/alarm");

//		List<Alarm> list = null;
//		try {
//			list = service.selectAlarmList(usid);
//
//			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//
//			for (Alarm a : list) {
//				String date = fmt.format(a.getAlarmDate());
//				log.debug("date : " + date);
//				a.setTmpDate(date);
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
// mv.addObject("list", list);

		return mv;
	}

	/*
	
	
	
	
	*/

//	@RequestMapping("/alarm/alarmList")
//	public ModelAndView alarmList(int usid) {
//		log.info("alarmCheck 실행");
//
//		List<Alarm> list = null;
//		try {
//			list = service.selectAlarmList(usid);
//
//			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//
//			for (Alarm a : list) {
//				String date = fmt.format(a.getAlarmDate());
//				log.debug("date : " + date);
//				a.setTmpDate(date);
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		ModelAndView mv = new ModelAndView("/alarm/alarm");
//		mv.addObject("list", list);
//		return mv;
//	}
//
//	@ResponseBody
//	@RequestMapping("/alarm/alarmRead")
//	public int alarmRead(int aid) {
//		log.info("alarmRead 실행");
//		int result = 0;
//		try {
//			result = service.updateAlarmRead(aid);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return result;
//	}
//
//	@ResponseBody
//	@RequestMapping("/alarm/selectAlarmItem")
//	public String selectAlarmItem(String item, String usid) {
//		log.info("selectAlarmItem 실행");
//
//		log.debug("item : " + item + " usid : " + usid);
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("item", item);
//		map.put("usid", usid);
//
//		String result = "";
//
//		try {
//			List<Alarm> list = service.selectAlarmItem(map);
//			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//
//			for (Alarm a : list) {
//				String date = fmt.format(a.getAlarmDate());
//				log.debug("date : " + date);
//				a.setTmpDate(date);
//			}
//			result = new ObjectMapper().writeValueAsString(list);
//		} catch (JsonProcessingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		return result;
//	}

}
