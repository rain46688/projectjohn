/**
 * 
 */
 
				'use strict';

				// 서버 주소 잘 확인하기!
				//const alsocket = new WebSocket("wss://localhost/john/alsocket");
				//const alsocket = new WebSocket("wss://192.168.120.31path/alsocket");
				const alsocket = new WebSocket("wss://192.168.219.105/john/alsocket");

				alsocket.onopen = function() {
					console.log('오픈');
					alsocket.send('list');
				};

				alsocket.onmessage = function(msg) {
					console.log("onmessage 실행됨");
					let aldata = JSON.parse(msg.data);
					// 알람 리스트에 값을 넣어주고 새로 갱신해줌 기본이 상담 리스트를 뿌려줌
					alarmList = aldata;
					//알람 종 표시
					printBell(alarmList);
					console.log("리스트 길이 : "+alarmList.length);
					printalfunc(alarmList,matchAtagHtml());
					//각각 페이지에 따라 분기 처리 
					if(window.location.pathname == '/john/expert/expertRequestPrintList'){
						console.log("헤더 분기 1");
						exListsendMessage("start");
					}
				};

				function sendAlarm(send_usid, receive_usid, type, msg,
						send_nick) {
					alsocket.send(JSON.stringify(new Alarm(send_usid,
							receive_usid, type, msg, send_nick)));
				};

				function Alarm(alarmSendMemUsid, alarmReceiveMemUsid,
						alarmType, alarmMsgContent,
						alarmSendMemNickname, alarmDate,
						alarmIscheked) {
					this.alarmSendMemUsid = alarmSendMemUsid;
					this.alarmReceiveMemUsid = alarmReceiveMemUsid;
					this.alarmType = alarmType;
					this.alarmMsgContent = alarmMsgContent;
					this.alarmSendMemNickname = alarmSendMemNickname;
					this.alarmDate = alarmDate;
					this.alarmIscheked = alarmIscheked;
				};