<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영상 상담</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
.container {
	border: 1px solid black;
	border-radius: 8px;
	margin: 50px auto;
	max-width: 80%;
	text-align: center;
	padding: 2%;
}

#video2 {
	width: 60%;
	height: 70%;
	float: center;
}

#video1 {
	width: 30%;
	height: 40%;
	float: center;
}

#text {
	margin-top: 2em;
	width: 100%;
	height: 200px;
	color: white;
	text-align: center;
	font-size: 20px;
}

#board {
	border: 1px solid gray;
	background-color: rgb(200, 200, 200);
	width: 100%;
	height: 500px;
	overflow-x: hidden;
	-ms-overflow-style: none;
}

#board>div {
	font-size: 20px;
	color: yellow;
	font-weight: bold;
}
/* 스크롤 바 투명하게 만들기 */
::-webkit-scrollbar {
	display: none;
}

#textboard {
	display: inline-block;
}
</style>

<body>
	<section>
		<section class="container">
			<!-- <h3>Another</h3> -->
			<video id="video2" autoplay playsinline controls preload="metadata"></video>
			<!-- <h3>ME</h3> -->
			<video id="video1" autoplay playsinline controls preload="metadata"></video>
			<br> <br>

			<!-- 	<button type="button" class="btn btn-outline-success my-2 my-sm-0" onclick='connection();'>연결</button>
			<button type="button" class="btn btn-outline-success my-2 my-sm-0" onclick='exit();'>연결 끊기</button> -->

			<div id="textboard">
				<c:if test="${loginMember.mem_class == '전문가'}">
					<textarea id="extext" rows="20" cols="60"></textarea>
					<br>
					<button type="button" class="btn btn-outline-success my-2 my-sm-0" onclick='counselEnd();'>상담 완료</button>
				</c:if>

				<c:if test="${loginMember.mem_class != '전문가'}">
					<br>
					<textarea id="memtext" rows="20" cols="60" readonly></textarea>
					<br>
					<button type="button" class="btn btn-outline-success my-2 my-sm-0" onclick='onoff();'>카메라 조정</button>
				</c:if>
			</div>

		</section>
		<script>
			'use strict';

			//---------------------------- 설정 -------------------------------------

			//마이크 비디오 설정
			const video1 = document.getElementById('video1');
			const video2 = document.getElementById('video2');
			let flag = true;
			let pc;
			let localStream;
			let remoteStream;
			let rtc_peer_connection = null;
			let rtc_session_description = null;
			let get_user_media = null;

			//TURN & STUN 서버 등록
			const configuration = {
				'iceServers' : [ {
					'urls' : 'stun:stun.l.google.com:19302'
				}, {
					'url' : 'turn:numb.viagenie.ca',
					'credential' : 'muazkh',
					'username' : 'webrtc@live.com'
				} ]
			};

			//---------------------------- signaling 서버 -------------------------------------

			const conn = new WebSocket('wss://192.168.120.31${path}/ertc');
			//const conn = new WebSocket('wss://192.168.219.105${path}/ertc');
			//const conn = new WebSocket('wss://localhost${path}/ertc');

			conn.onopen = function() {
				console.log("onopen => signaling server 연결");
				if ("${loginMember.mem_class}" != '전문가') {
					sendMessage(new ExboardMsg("SYS",
							"${loginMember.mem_nickname}", "접속"));
				}
			};

			conn.onmessage = function(msg) {
				console.log("onmessage => 메세지 출력 : " + msg);
				let content = JSON.parse(msg.data);
				console.log("content.type : " + content.type);
				if (content.type === 'expert') {
					console.log(" === 분기 expert === ");
					start();
				} else if (content.type === 'offer') {
					console.log(" === 분기 offer === ");
					console.log(" === 분기 offer 2 === ");
					start();
					pc
							.setRemoteDescription(new rtc_session_description(
									content));
					doAnswer();
				} else if (content.type === 'answer') {
					console.log(" === 분기 answer === ");
					pc.setRemoteDescription(new rtc_session_description(
									content));
		
				} else if (content.type === 'candidate') {
					console.log(" === 분기 candidate === ");
					let candidate = new RTCIceCandidate({
						sdpMLineIndex : content.label,
						candidate : content.candidate
					});
					pc.addIceCandidate(candidate);
				} else if (content.type == 'SYS') {
					console.log(" === 분기 SYS === ");
					start();
					$("#extext").val(content.nick + "님이 접속하셨습니다.");
					// printdiv(content.nick+"님이 접속하셨습니다.");
	
				} else if (content.type == 'TXT') {
					console.log(" === 분기 TXT === ");
					$("#memtext").html("");
					$("#memtext").html(content.msg);
				}else if (content.type == 'CAM') {
					console.log(" === 분기 CAM === ");
					if(content.msg === 'off'){
						video2.srcObject = null;
					}else{
						video2.srcObject = remoteStream;
					}
				} else if (content.type == 'END') {
					console.log(" === 분기 END === ");
					exit();
					location.replace('${path}/');
				}
			};

			conn.onclose = function() {
				console.log('onclose 실행');
				sendMessage(new ExboardMsg("SYS","${loginMember.mem_nickname}", "접속"));
			};

			function sendMessage(message) {
				conn.send(JSON.stringify(message));
				console.log("메세지 보내는 함수 sendMessage");
			};

			//---------------------------- 비디오 -------------------------------------

			const constraints = {
				video : {
					width : {
						exact : 1280
					},
					height : {
						exact : 720
					}
				},
				audio : true
			};
			if (navigator.getUserMedia) {
				console.log("getUserMedia");
				get_user_media = navigator.getUserMedia.bind(navigator);
				videoStart();
				rtc_peer_connection = RTCPeerConnection;
				rtc_session_description = RTCSessionDescription;
			} else if (navigator.mozGetUserMedia) {
				console.log("mozGetUserMedia");
				get_user_media = navigator.mozGetUserMedia.bind(navigator);
				videoStart();
				rtc_peer_connection = mozRTCPeerConnection;
				rtc_session_description = mozRTCSessionDescription;
			} else if (navigator.webkitGetUserMedia) {
				console.log("webkitGetUserMedia");
				get_user_media = navigator.webkitGetUserMedia.bind(navigator);
				videoStart();
				rtc_peer_connection = webkitRTCPeerConnection;
				rtc_session_description = webkitRTCSessionDescription;
			} else {
				console.log("지원안하는 브라우저");
				alert("지원하지 않는 브라우저입니다. firefox chrome브라우저를 이용하세요");
				flag = false;
			}

			function videoStart() {
				get_user_media(constraints, function(stream) {
					console.log('stream 함수 => 스트림 요청 성공');
					localStream = stream;
					console.log("localStream : " + localStream);
					if ("${loginMember.mem_class}" == '전문가') {
						video1.srcObject = localStream;
					}
					sendMessage(new ExboardMsg("expert"));
					console.log("메세지 보냄!");
					console.log("gotStream 함수 => start 실행");
					start();
				}, function(e) {
					alert('카메라와 마이크를 허용해주세요 / 에러 : ' + e.name);
				});
			}

			//---------------------------- P2P 연결 로직 -------------------------------------

			function start() {
				if (flag && typeof localStream !== 'undefined') {
					console.log("peer 연결 부분 분기 진입");
					createPeerConnection();
					pc.addStream(localStream);
					flag = false;
					console.log("do call 실행됨 ");
					doCall();
				}
			};

			function createPeerConnection() {
				console.log("createPeerConnection 실행");
				try {
					//configuration에는 STUN & TURN 서버가 있음
					//STUN : Session Traversal Utilities for NAT의 약자로 자신의 공인 아이피를 알아오기위해 STUN 서버에 요청하고 STUN 서버는 공인 IP주소를 응답함.
					//TURN : Traversal Using Relays around NAT 의 약자 NAT 또는 방화벽에서 보조하는 프로토콜. 클라이언트는 직접 서버와 통신 하지않고 TURN 서버를 경유함.
					pc = new rtc_peer_connection(configuration);
					pc.onicecandidate = handleIceCandidate;
					pc.onaddstream = handleRemoteStreamAdded;
					pc.onremovestream = handleRemoteStreamRemoved;
					console.log(" RTCPeerConnection 생성 완료 ");
				} catch (e) {
					console.log(" RTCPeerConnection 생성 에러발생 : " + e.message);
					alert("RTCPeerConnection 에러");
					return;
				}
			};

			function handleRemoteStreamAdded(event) {
				console.log("RemoteStream 추가됨");
				//원격 스트림에 스트림을 넣어줌
				remoteStream = event.stream;
				if ("${loginMember.mem_class}" != '전문가') {
					video2.srcObject = remoteStream;
				}
			};

			function doCall() {
				console.log("createOff 함수를 통해서 통신 요청");
				pc.createOffer(setLocalAndSendMessage, handleCreateOfferError);
			};

			function doAnswer() {
				console.log('peer에게 응답 보내기.');
				pc.createAnswer().then(setLocalAndSendMessage,
						onCreateSessionDescriptionError);
			};

			//핸들러 후보 상대방 탐색
			//ICE : Interactive Connectivity Establishment의 약자로 두 단말이 서로 통신할수 있는 최적의 경로를 찾을수있도록 도와주는 프레임워크임.
			function handleIceCandidate(event) {
				console.log('icecandidate 실행 event : ' + event);
				if (event.candidate) {
					console.log('icecandidate 응답 보내기 ');
					sendMessage({
						type : 'candidate',
						label : event.candidate.sdpMLineIndex,
						id : event.candidate.sdpMid,
						candidate : event.candidate.candidate
					});
				} else {
					console.log(' handleIceCandidate 탐색 종료 ');
				}
			};

			function handleRemoteStreamRemoved(event) {
				console.log('원격 스트림 삭제됨 Event : ' + event);
			};

			function setLocalAndSendMessage(sessionDescription) {
				pc.setLocalDescription(sessionDescription);
				console.log("setLocalAndSendMessage 응답 보내기 : "
						+ sessionDescription);
				sendMessage(sessionDescription);
			};

			//연결 끊기
			function exit() {
				stop();
				console.log('연결 종료 응답 보내기 ');
				sendMessage(new ExboardMsg("END"));
			};

			function stop() {
				console.log('연결 종료');
				pc.close();
				pc = null;
			};

			//---------------------------- 잡 -------------------------------------

			function handleCreateOfferError(event) {
				console.log('Offer부분 생성 에러 error: ', event);
			};

			function onCreateSessionDescriptionError(error) {
				trace('onCreateSessionDescriptionError 에러 : '
						+ error.toString());
			}

			//메세지 객체
			function ExboardMsg(type, nick, msg, id, sdp, label, candidate) {
				this.type = type;
				this.nick = nick;
				this.msg = msg;
				this.id = id;
				this.sdp = sdp;
				this.label = label;
				this.candidate = candidate;
			};

			//엔터키 입력시 메세지 발송
			$("#extext").keyup(function(key) {
				if (key.keyCode == 13) {
					let txt = $("#extext").val();
					console.log(txt);
					sendMessage(new ExboardMsg("TXT", "", txt));
				}
			});

			//상담 종료 해당 텍스트 에어리어의 기록 디비에 저장하고 종료
			function counselEnd() {
				let form = document.createElement("form");
				form.setAttribute("charset", "UTF-8");
				form.setAttribute("method", "Post");
				form.setAttribute("action", "${path}/counselEnd");

				let hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "extext");
				hiddenField.setAttribute("value", $("#extext").val());
				form.appendChild(hiddenField);

				let hiddenField2 = document.createElement("input");
				hiddenField2.setAttribute("type", "hidden");
				hiddenField2.setAttribute("name", "bno");
				hiddenField2.setAttribute("value", "${bno}");
				form.appendChild(hiddenField2);

				document.body.appendChild(form);
				form.submit();
				exit();
				sendMessage(new ExboardMsg("END",
						"${loginMember.mem_nickname}", "종료"));
			}

			function onoff() {

				if (video1.srcObject != null) {
					//캠 켜있다.
					video1.srcObject = null;
					sendMessage(new ExboardMsg("CAM", "", "off"));
				} else {
					video1.srcObject = localStream;
					sendMessage(new ExboardMsg("CAM", "", "on"));
				}
			}
		</script>
</body>
</html>