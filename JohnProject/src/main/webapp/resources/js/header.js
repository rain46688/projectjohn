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

				//const alsocket = new WebSocket("wss://localhost/john/alsocket");
				//const alsocket = new WebSocket("wss://192.168.120.31path/alsocket");
				const alsocket = new WebSocket("wss://192.168.219.105"+path+"/alsocket");

				alsocket.onopen = function() {
					console.log('오픈');
					alarmPrint();
					alsocket.send('list');
				};

				alsocket.onmessage = function(msg) {
					/* 기본적으로 실행되는 로직 알람이 왔다는 표시를 해줌 */
					console.log("msg 콘솔 : " + msg);
					let aldata = JSON.parse(msg.data);
					console.log("aldata : "+aldata);
					$("#number").html("");
					$("#number").html("<div id='al'>!</div>");
					$("#bell").addClass('bell2');
					/*  */
					if(window.location.pathname == '/john/expert/expertRequestPrintList'){
						console.log("신청");
						if(aldata['alarmType'] == 'expertApply'){
							console.log("유저로 부터 상담 신청 들어옴");
							exListsendMessage("start");  1
						}else if(aldata['alarmType'] == 'expertApplyCancel'){
							console.log("유저로 부터 상담 신청 삭제됨");
							exListsendMessage("start");
						}
					}
					//else if(window.location.pathname == '/john/alarm/alarmList'){
					//	console.log('들어옴?');
					//	alarmList = aldata;
					//	printalfunc(alarmList,'expert');
					//}
					
					alarmList = aldata;
					printalfunc(alarmList,'expert');
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

				$('#alarmdiv').hover(function() {
					$(this).css({
						"height" : "110%",
						"width" : "62px"
					});
				}, function() {
					$(this).css({
						"height" : "100%",
						"width" : "60px"
					});
				});