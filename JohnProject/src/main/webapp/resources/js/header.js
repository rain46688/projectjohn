/**
 * 
 */
 
				'use strict';

				// 서버 주소 잘 확인하기!
				//const alsocket = new WebSocket("wss://localhost/john/alsocket");
				//const alsocket = new WebSocket("wss://192.168.120.31path/alsocket");
				const alsocket = new WebSocket("wss://192.168.219.105/john/alsocket");

				//============================
				// 소켓 오픈 하면서 알람 리스트 가져오기
				//============================
				alsocket.onopen = function() {
					console.log('오픈');
					alsocket.send('list');
				};

				//============================
				// 메세지에서 분기 처리 알람이 오면 RequestPrintList 바로 갱신해주기위해 분기 넣음
				//============================
				alsocket.onmessage = function(msg) {
					console.log("알람 온 메세지 onmessage 실행됨");
					//각각 페이지에 따라 분기 처리 
					if(window.location.pathname == '/john/member/myPage/expertRequestPrintList'){
						console.log("헤더 분기 1");
						exListsendMessage("start");
					}else if(window.location.pathname != '/john/expert/expertApply'){
						let aldata = JSON.parse(msg.data);
						// 알람 리스트에 값을 넣어주고 새로 갱신해줌 기본이 상담 리스트를 뿌려줌
						alarmList = aldata;
						//알람 종 표시
						printBell(alarmList);
						console.log("리스트 길이 : "+alarmList.length);
						printalfunc(alarmList,matchAtagHtml());
					}
				};

				//============================
				// 알람 발송 함수
				//============================
				function sendAlarm(send_usid, receive_usid, type, msg,
						send_nick) {
					alsocket.send(JSON.stringify(new Alarm(send_usid,
							receive_usid, type, msg, send_nick)));
				};

				//============================
				// 알람 객체 
				//============================
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