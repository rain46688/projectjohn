/**
 * 
 */
 
 	'use strict';
 	//세션 스토리지
	let usid = sessionStorage.getItem('lousid');
	let path = sessionStorage.getItem('path');
	console.log("세션 스토리지 => usid : "+usid+" path : "+path);	 		

				function alarmPrint() {

					if (usid != "") {
						$.ajax({
							type : "GET",
							data : {
								"usid" : usid
							},
							dataType : "json",
							url : path+"/alarm/alarmCount",
							success : function(data) {
								console.log("data : " + data);
								if (data > 0) {
									$("#number").html(
											"<div id='al'>!</div>");
								} else {
									$("#bell").removeClass('bell2');
								}
							}
						});
					} else {
						console.log("로그인이 안되있습니다.");
					}
				};

				// 서버 주소 잘 확인하기!
				//const alsocket = new WebSocket("wss://localhost/john/alsocket");
				//const alsocket = new WebSocket("wss://192.168.120.31path/alsocket");
				const alsocket = new WebSocket("wss://192.168.219.105"+path+"/alsocket");

				alsocket.onopen = function() {
					console.log('오픈');
					alsocket.send('list');
				};

				alsocket.onmessage = function(msg) {
					console.log("msg 콘솔 : " + msg);
					let aldata = JSON.parse(msg.data);
					console.log("aldata : "+$(aldata));
					console.log("타입 : "+typeof aldata);
					//알람 종 표시
					printBell();
					// 알람 리스트에 값을 넣어주고 새로 갱신해줌 기본이 상담 리스트를 뿌려줌
					alarmList = aldata;
					if(alarmList.length > 0){
						console.log("프린트 리스트, "+usid);
						printalfunc(alarmList,'expert');
					}
					//각각 페이지에 따라 분기 처리 
					if(window.location.pathname == '/john/expert/expertRequestPrintList'){
						console.log("헤더 분기 1");
						exListsendMessage("start");
					}
					//else if(window.location.pathname == '/john/alarm/alarmList'){
					//}
				
				};

				function printBell(){
					if (usid != "") {
						console.log("로그인 되있음");
						if(alarmList.length > 0){
							console.log("느낌표");
							$("#number").html("<div id='al'>!</div>");
							}
					} else {
						console.log("로그인이 안되있습니다.");
					}
				}

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