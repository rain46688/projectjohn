<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담</title>
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

video {
	width: 40%;
	height: 50%;
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
</style>

<body>
	<section>
		<section class="container">
			<!-- muted="muted" 상태가 아니면 오토 플레이가 되지않는다! -->
				<p>세션 : ${loginMember.mem_nickname}</p><br>
				<p>전문가 : ${loginMember.mem_class}</p><br>
				<p>USID : ${loginMember.usid}</p><br>
				<p>방번호 : ${bno}</p><br>
				
			<br>
			<video id="video1" autoplay playsinline controls preload="metadata" muted="muted"></video>
			<br> <br>
				<c:if test="${loginMember.mem_class == '전문가'}">
				<button type="button" class="btn btn-outline-success my-2 my-sm-0" onclick='host();'>방송시작</button>
				<button type="button" class="btn btn-outline-success my-2 my-sm-0" onclick='exit();'>연결 끊기</button>
			</c:if>
			<br> <br>
			<div id="board"></div>
		</section>
		<script>
		
			//---------------------------- 설정 -------------------------------------

			'use strict';

			//마이크 비디오 설정
			const video1 = document.getElementById('video1');
			//수정
			let pc = new Array();
			let localStream;
			let remoteStream;
			const configuration = {
					  'iceServers': [
						    {
						      url: 'stun:stun.l.google.com:19302'
						    },
						    {
						    	url: 'turn:numb.viagenie.ca',
						    	credential: 'muazkh',
						    	username: 'webrtc@live.com'
						    }
						  ]
				};

			//---------------------------- signaling 서버 -------------------------------------

			const conn = new WebSocket('wss://localhost/ertc');
			//const conn = new WebSocket('wss://192.168.219.105/ertc');

			conn.onopen = function() {
				printdiv("signaling server 연결");
				printdiv("닉네임 : ${loginMember.mem_nickname}, 방번호 : ${bno}, 전문가 여부 : ${loginMember.mem_class}");
				if("${loginMember.mem_class}" === '전문가'){
					gotStream();			
				}
			};

			conn.onmessage = function(msg) {
				printdiv("onmessage 실행");
				let content = JSON.parse(msg.data);
				printdiv("content : "+content.type);
					 if(content.type  === 'offer'){
						 createPeerConnection();
							for(var i=0;i<pc.length;i++){
								 pc[i].setRemoteDescription(new RTCSessionDescription(content));
							}
						 doAnswer();
					 }else if(content.type  === 'answer'){
						 try{
							 for(var i=0;i<pc.length;i++){
								 pc[i].setRemoteDescription(new RTCSessionDescription(content));
							 }
						 }catch(e){
							 printdiv("e : "+e);
						 }
					 }else if(content.type  === 'candidate'){
						  var candidate = new RTCIceCandidate({
						        sdpMLineIndex: content.label,
						        candidate: content.candidate
						      });
						  for(var i=0;i<pc.length;i++){
							  pc[i].addIceCandidate(candidate);
						  }
					 }else if(content.type  === 'bye'){
					     handleRemoteHangup();
					 }
			};

			conn.onclose = function() {
				printdiv("onclose 실행");
				exit();
			};

			function sendMessage(message) {
				conn.send(JSON.stringify(message));
			};
			
			//---------------------------- 비디오 -------------------------------------
			
			const constraints = {
			  video: {width: {exact: 1280}, height: {exact: 720}},
		    audio : true
		};
	
		function gotStream(stream){
		printdiv("미디어 불러오기");
		navigator.mediaDevices.getUserMedia(constraints)
		.then(function(stream){
			//스트림 요청 성공
			printdiv("스트림 획득 성공");
			localStream = stream;
			console.log("localStream : "+localStream);
		})
		  //스트림 요청 실패
		  .catch(function(e) { 
				printdiv("스트림 획득 실패");
			    alert('카메라와 마이크를 허용해주세요 / 에러 : '+e.name);
		    });
		};

			//---------------------------- P2P 연결 로직 -------------------------------------
			
			function host(){
				printdiv("host() 실행");
				video1.srcObject = localStream;
				createPeerConnection();
				for(var i=0;i<pc.length;i++){
					console.log("pc "+i+" : "+pc[i]);
					pc[i].addStream(localStream);
				}
				doCall();
			};
	

	function createPeerConnection(){
		printdiv("createPeerConnection 실행");
		try{
			//수정
			pc.push(new RTCPeerConnection(configuration));
			printdiv("PC 객체 생성 : "+pc.length);
			for(var i=0;i<pc.length;i++){
				pc[i].onicecandidate = handleIceCandidate;
				pc[i].onaddstream = handleRemoteStreamAdded;
			}
			console.log(" RTCPeerConnection 생성 완료 ");
		}catch(e){
			printdiv("RTCPeerConnection 생성 에러발생 : "+e.message);
			alert("RTCPeerConnection 에러");
			return;
		}
	};
	
	function handleIceCandidate(event) {
		printdiv("handleIceCandidate 실행");
		  if (event.candidate) {
				printdiv("event.candidate 분기문 진입");
		    sendMessage({
		      type: 'candidate',
		      label: event.candidate.sdpMLineIndex,
		      id: event.candidate.sdpMid,
		      candidate: event.candidate.candidate
		    });
		  } else {
			printdiv("handleIceCandidate 탐색 종료");
		  }
	};
	
	function handleRemoteStreamAdded(event){
		//원격 스트림에 스트림을 넣어줌
		remoteStream = event.stream;
		video1.srcObject = remoteStream;
		printdiv("스트림 받아와서 VIDEO에 넣음");
	};
	
	function doCall(){
		printdiv("doCall 실행");
		for(var i=0;i<pc.length;i++){
			pc[i].createOffer(setLocalAndSendMessage, handleCreateOfferError);
		}
	};
	
	function doAnswer() {
		printdiv("doAnswer 실행");
		
		for(var i=0;i<pc.length;i++){
		  pc[i].createAnswer().then(
		    setLocalAndSendMessage,
		    onCreateSessionDescriptionError
		  );
		}
		  
		};
	
	function setLocalAndSendMessage(sessionDescription) {
		printdiv("setLocalAndSendMessage 실행");
		printdiv("sessionDescription : "+sessionDescription);
		for(var i=0;i<pc.length;i++){
		  pc[i].setLocalDescription(sessionDescription);
		}
		  sendMessage(sessionDescription);
		};
	
		
		//연결 끊기
			function handleRemoteHangup() {
				printdiv("Session 종료");
				  stop();
				  isInitiator = false;
				};
				
		function exit() {
			  stop();
				printdiv("연결 종료 응답 보내기");
			  sendMessage({type:'bye'});
			};
	
		function stop() {
			printdiv("연결 종료");
				for(var i=0;i<pc.length;i++){
					  pc[i].close();
					  pc[i] = null;
				}
			};

			//---------------------------- 잡 -------------------------------------
			
			
		function handleCreateOfferError(event) {
			printdiv("Offer부분 생성 에러 error:"+event);
		};	
				
		function onCreateSessionDescriptionError(error) {
				printdiv("onCreateSessionDescriptionError 에러 :"+ error.toString());
			};

			function printdiv(msg) {
				console.log(msg);
				$("#board").append("<div>" + msg + "</div>");
				$("#board").scrollTop($("#board")[0].scrollHeight);
			};
			
			
		</script>
</body>
</html>