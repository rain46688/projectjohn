/**
 * 
 */
 
				'use strict';
				
				let st = "20AM_john_final";
				let ip = "wss://rclass.iptime.org/";
				
				//let st = "john";
				//let ip = "wss://192.168.219.105/"

				const alsocket = new WebSocket(ip+st+"/alsocket");

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
					if(window.location.pathname == '/'+st+'/member/myPage/expertRequestPrintList'){
						console.log("헤더 분기 1");
						alsetting(msg);
						exListsendMessage("start");
					}else if(window.location.pathname != '/'+st+'/expert/expertApply'){
						alsetting(msg);
					}
				};

				//============================
				// 알람 셋팅
				//============================
				function alsetting(msg){
						// 알람 리스트에 값을 넣어주고 새로 갱신해줌 기본이 상담 리스트를 뿌려줌
						let aldata = JSON.parse(msg.data);
						alarmList = aldata;
						//알람 종 표시
						printBell(alarmList);
						console.log("리스트 길이 : "+alarmList.length);
						printalfunc(alarmList,matchAtagHtml());
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