<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script> -->
<script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/decoupled-document/ckeditor.js"></script>

<style>

/* 초기화 */
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em,
	ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
	caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby,
	section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
}

/* 배경 */
#headerAndContent {
	background-color: #062449;
}

#content {
	/* background-color: #F1F3F3;  */
	background-color: #062449;
}

#content * {
	/* border:1px solid red; */
	font-family: 'Noto Serif KR', serif;
}

/* 상단 영역 */
#upDiv {
	height: 83.2%;
	width: 100%;
	display: flex;
	padding: 1%;
}

/* 상단 영역 비디오 상대방 뷰*/
#video2 {
	z-index: 1;
	width: 100%;
	height: 100%;
	/* 	border: 2px solid #FFCC66; */
}

/* 상단 영역 비디오 자신 뷰*/
#video1 {
	z-index: 2;
	/* position: relative; */
	position: absolute;
	left: 53%;
	top: 60%;
	object-fit: cover;
	border: 2px solid #FFCC66;
	width: 25vh;
}

/* 상단 영역 비디오 div */
#videoDiv {
	padding: 1%;
	height: 100%;
	width: 60%;
	background-color: white;
	border-radius: 8px;
	margin-right: 1%;
	border: 10px solid #FFCC66;
}

/* 상단 텍스트 div */
#textAreaDiv {
	height: 100%;
	width: 40%;
	background-color: white;
	border-radius: 8px;
	border: 10px solid #FFCC66;
}

/* 상단 텍스트 영역 */
#extext {
	width: 100%;
	height: 100%;
	display: inline-block;
	border-radius: 8px;
	font-size: 20px;
	padding: 3%;
	/* 스크롤 바 투명하게 만들기 */
	overflow-x: hidden;
	-ms-overflow-style: none;
}

/* 스크롤 바 투명하게 만들기 */
::-webkit-scrollbar {
	display: none;
}

/* 위 텍스트 영역 눌르면 옆에 테두리 생기는거 지우는 용도 */
textarea:focus {
	outline: none;
}

textarea {
	resize: none;
}

/* 드래그 드롭용 div 영역 */
#dragImg {
	width: 100%;
	height: 100%;
	display: none;
	border-radius: 8px;
	background-image: url(${path }/resources/images/expertimg3.png);
	background-repeat: no-repeat;
	background-size: 100%;
	z-index: 2;
	padding-top: 20%;
	background-color: #E2E2E8;
}

/* ------------------------------------------ */

/* 하단 영역 div */
#bottomDiv {
	height: 15%;
	display: flex;
}

/* 왼쪽 버튼 영역 div */
#buttonDiv {
	height: 100%;
	width: 30%;
	text-align: right;
	padding-right: 1%;
	display: flex;
}

/* 전문가 버튼 영역 div */
#buttonDiv>.exBtn {
	display: inline-block;
	width: 48%;
	height: 100%;
	border-radius: 8px;
	font-size: 30px;
	font-weight: bold;
}

/* 유저 버튼 영역 div */
#buttonDiv>.memBtn {
	display: inline-block;
	width: 32%;
	height: 100%;
	border-radius: 8px;
	font-size: 30px;
	font-weight: bold;
}

/* 이미지 영역 div */
#imgDiv {
	border: 2vh solid white;
	border-radius: 8px;
	background-color: white;
	height: 100%;
	width: 77%;
	margin: 0% 1% 1%;
	display: inline-block;
	overflow-x: hidden;
	-ms-overflow-style: none;
	padding-top: 2%;
	border: 10px solid #FFCC66;
}

#imgDiv>p {
	font-size: 100%;
	color: black;
	text-align: center;
}

.upload {
	width: 10%;
	height: 100%;
	margin: 1%;
}

/* 전문가 빨강 버튼 */
.button-8 {
	width: 50%;
	height: 100%;
	border: 2px solid #DC3545;
	text-align: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 1%;
}

.button-8 .johnbtn {
	font-size: 3vh;
	font-weight: bold;
	color: #FFCC66;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
	/*  */
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.eff-8 {
	width: 100%;
	height: 100%;
	border: 90px solid #DC3545;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
	box-sizing: border-box;
}

.button-8:hover .eff-8 {
	border: 0px solid #DC3545;
}

.button-8:hover .johnbtn {
	color: #DC3545;
}

/* 전문가 초록 버튼 */
.button-7 {
	width: 50%;
	height: 100%;
	border: 2px solid #28A745;
	text-align: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 1%;
}

.button-7 .johnbtn {
	font-size: 3vh;
	font-weight: bold;
	color: #FFCC66;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
	/*  */
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.eff-7 {
	width: 100%;
	height: 100%;
	border: 90px solid #28A745;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
	box-sizing: border-box;
}

.button-7:hover .eff-7 {
	border: 0px solid #28A745;
}

.button-7:hover .johnbtn {
	color: #28A745;
}

/*  */
#edit {
	width: 100%;
	height: 92.8%;
	overflow-x: hidden;
	-ms-overflow-style: none;
}

#toolbar-container {
	width: 100%;
}
</style>

<div id="content">

	<div id="upDiv">
		<div id="videoDiv">
			<video id="video2" autoplay playsinline controls preload="metadata"></video>
			<video id="video1" autoplay playsinline controls preload="metadata"></video>
		</div>
		<div id="textAreaDiv">
			<div id="dragImg"></div>
			<div id="toolbar-container"></div>
			<div id="edit"></div>
		</div>
	</div>
	<!--  -->

	<div id="bottomDiv">
		<div id="imgDiv">
			<p>왼쪽 상단 박스에 드래그하여 이미지를 전송 후 이 박스에 표시되며 클릭하여 이미지를 확대할수있습니다.</p>
		</div>
		<div id="buttonDiv">
			<c:if test="${loginMember.memClass == '전문가'}">
				<c:if test="${eb.expertBoardMemberend == 1}">
					<div class="button-8">
						<div class="eff-8"></div>
						<a class="johnbtn" onclick='counselEnd();'>완료</a>
					</div>
				</c:if>
				<c:if test="${eb.expertBoardMemberend == 0}">
					<div class="button-8">
						<div class="eff-8"></div>
						<a class="johnbtn" onclick="alert('유저가 해결 버튼을 클릭 후\n상담 종료가 가능합니다.');">상담중</a>
					</div>
				</c:if>
				<div class="button-7">
					<div class="eff-7"></div>
					<a class="johnbtn" onclick='memInfoView();'>정보</a>
				</div>
			</c:if>
			<c:if test="${loginMember.memClass != '전문가'}">

				<div class="button-7">
					<div class="eff-7"></div>
					<a class="johnbtn" onclick='onoff();'>카메라</a>
				</div>

				<c:if test="${eb.expertBoardMemberend == 0}">
					<div class="button-7">
						<div class="eff-7"></div>
						<a class="johnbtn" onclick='counselMemberEnd();'>해결</a>
					</div>
				</c:if>
				<c:if test="${eb.expertBoardMemberend == 1}">
					<div class="button-8">
						<div class="eff-8"></div>
						<a class="johnbtn" onclick="alert('상담사 분이 완료를 누르면 상담이 정상 종료됩니다.');">종료중</a>
					</div>
				</c:if>
				<div class="button-7">
					<div class="eff-7"></div>
					<a class="johnbtn" onclick='memInfoView();'>정보</a>
				</div>
			</c:if>
		</div>
	</div>
</div>

<script>

	'use strict';
	
	//---------------------------- 드래그 파일 -------------------------------------
	
	// ============================
	//드래그 파일을 담기 위한 배열
	//드래그 위치 ckeditor DIV
	// ============================
	let uploadFiles = [];
	let $drop = $("#edit");
	
	// ============================
	//드래그 이벤트 
	// ============================
	$drop.on("dragenter", function(e) {
		$(this).addClass('drag-over');
		$("#toolbar-container").css({
			"display" : "none"
		});
		$("#edit").css({
			"display" : "none"
		});
		$("#dragImg").css({
			"display" : "inline-block"
		});
	});
	
	
	// ============================
	//드래그 처리
	// ============================
	let $drop2 = $("#dragImg");
	
	$drop2.on("dragenter", function(e) {
		$(this).addClass('drag-over');
	}).on("dragleave", function(e) {
		$(this).removeClass('drag-over');
		$("#dragImg").css({
			"display" : "none"
		});
		$("#edit").css({
			"display" : "inline-block"
		});
		$("#toolbar-container").css({
			"display" : "inline-block"
		});
	}).on("dragover", function(e) {
		e.stopPropagation();
		e.preventDefault();
	}).on('drop', function(e) {
		e.preventDefault();
		$(this).removeClass('drag-over');
		$("#dragImg").css({
			"display" : "none"
		});
		$("#edit").css({
			"display" : "inline-block"
		});
		$("#toolbar-container").css({
			"display" : "inline-block"
		});
		let files = e.originalEvent.dataTransfer.files;
		console.log("files : " + files);
		for (let i = 0; i < files.length; i++) {
			let file = files[i];
			let size = uploadFiles.push(file); 
			console.log("확인 : "+file);
		}
		
		// ============================
		// 드래그 파일 전송
		// ============================
		let formData = new FormData();
		$.each(uploadFiles, function(i, file) {
		console.log("파일 이름 : "+file.name);
		
		let f = (file.name).substring((file.name).lastIndexOf('.'),(file.name).length);
		
		if(f != '.png' && f != '.jpg' && f != '.jpeg' && f != '.gif'){
			console.log("업로드 안됨 파일 이름 : "+file.name);
			alert('이미지 파일만 업로드 가능합니다.');
		}else{
			//formData.append('upFile', file, file.name);
			console.log("file : "+file);
			console.log("업로드 됨 파일 이름 : "+file.name);
			// ============================
			// 소켓을 이용해서 이미지 전송
			// ============================
			socketUpload(file);
		}
		
		});

		// ============================
		//마지막에 비워줘야 기존 전송했던 이미지 내역이 사라짐
		// ============================
		uploadFiles = [];
	});
	
	// ============================
	// 소켓 이미지 업로드 웹소켓에 바이너리로 전송하는것 
	// ============================
	function socketUpload(file){
		let fileReader = new FileReader();
		    fileReader.onload = function() {
            let arrayBuffer = this.result;
            conn.send(arrayBuffer);
        };
        fileReader.readAsArrayBuffer(file);
	};
	
	// ============================
	// 웹소켓용 하단에 전송후 수신자 송신자 둘다 이미지 출력 
	// ============================
	function imgDivPrint2(msg){
		let imgprint = "";
		imgprint+="<img  class='upload' src='${path}/resources/upload_images/"+msg+"' title='"+msg+"' onclick='imgView(event);' style='cursor: pointer'/>";
		
		if($("#imgDiv").children().html() != ''){
			console.log("빔");
			$("#imgDiv").html("");
		}
		
		let con = $("#imgDiv").html()+imgprint;
		$("#imgDiv").html("");
		$("#imgDiv").html(con);
		$("#imgDiv").scrollTop($("#imgDiv")[0].scrollHeight);
		imgprint="";
	}
	
	// ============================
	// 사진 크게 보기
	// ============================
	function imgView(e){
		window.open('${path}/resources/upload_images/'+$(e.target).attr( 'title' ),'이미지','width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes');
	};
	
	//---------------------------- 상담 마이크 비디오 설정 -------------------------------------

	// ============================
	// 필요한 변수 등록
	// ============================
	const video1 = document.getElementById('video1');
	const video2 = document.getElementById('video2');
	let flag = true;
	let pc;
	let localStream;
	let remoteStream;
	let rtc_peer_connection = null;
	let rtc_session_description = null;
	let get_user_media = null;
	let user_usid;
	let counselText="";

	// ============================
	// TURN & STUN 서버 등록
	// ============================
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
			
			// ============================
			// 핸들러 위치
			// package com.kh.john.exboard.socket.ExpertHandler
			// ============================
				
			const conn = new WebSocket('wss://rclass.iptime.org${path}/ertc');

			conn.onopen = function() {
				console.log("onopen => signaling server 연결");
				if ("${loginMember.memClass}" != '전문가') {
					sendMessage(new ExboardMsg("SYS",
							"${loginMember.memNickname}", "접속",
							"${loginMember.usid}"));
				}
			};

			// ============================
			// 받은 메세지를 분기 처리해서 나눔
			// ============================
			conn.onmessage = function(msg) {
				console.log("onmessage => 메세지 출력 : " + msg);
				let content = JSON.parse(msg.data);
				console.log("content.type : " + content.type);
				if (content.type === 'expert') {
					console.log(" === 분기 expert === ");
					start();
				} else if (content.type === 'offer') {
					console.log(" === 분기 offer === ");
					start();
					pc
							.setRemoteDescription(new rtc_session_description(
									content));
					doAnswer();
				} else if (content.type === 'answer') {
					console.log(" === 분기 answer === ");
					pc
							.setRemoteDescription(new rtc_session_description(
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
					user_usid = content.id;
				} else if (content.type == 'TXT') {
					console.log(" === 분기 TXT === ");
					$("#edit").html(content.msg);
					$("#edit").scrollTop($("#edit")[0].scrollHeight);
				} else if (content.type == 'CAM') {
					console.log(" === 분기 CAM === ");
					if (content.msg === 'off') {
						video2.srcObject = null;
					} else {
						video2.srcObject = remoteStream;
					}
				} else if (content.type == 'FILE2') {
					console.log(" === 분기 FILE2 === ");
					//웹소켓 업로드 일반용 다음 구현한거
					console.log("content : " + content.msg);
					imgDivPrint2(content.msg);
				} else if (content.type == 'END') {
					console.log(" === 분기 END === ");
					location.replace('${path}/board/boardList');
				}else if(content.type == 'MEMEND'){
					console.log(" === 분기 MEMEND === ");
					let experthtml = "";
					
					experthtml += "<div class='button-8'> <div class='eff-8'></div><a class='johnbtn' onclick='counselEnd();'>완료</a></div>";
					experthtml += "<div class='button-7'><div class='eff-7'></div><a class='johnbtn' onclick='memInfoView();'>정보</a></div>";
					$("#buttonDiv").html(experthtml);
				}
			};

			conn.onclose = function() {
				console.log('onclose 실행');
			};

			function sendMessage(message) {
				conn.send(JSON.stringify(message));
				console.log("메세지 보내는 함수 sendMessage");
			};

			//---------------------------- 비디오 적합 여부 설정 -------------------------------------

		// ============================
		// 비디오 오디오 설정, 막 설정하면 안되고 지원이 되는지 보고 높여야된다.
		// ============================
		const constraints = {
					  video: {width: {exact: 1280}, height: {exact: 720}},
				    audio : true
				}; 
			
		// ============================
		// 브라우저 적합성 확인
		// ============================
			if (navigator.getUserMedia) {
				console.log("getUserMedia");
				get_user_media = navigator.getUserMedia.bind(navigator);
				//get_user_media = navigator.mediaDevices.getUserMedia(constraints);
				console.log("navigator : "+navigator);
				console.log("navigator.getUserMedia.bind(navigator) : "+navigator.getUserMedia.bind(navigator));
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

			// ============================
			// 오디오나 비디오 사용여부 확인 NOT FOUND가 뜨면 장치 설정에 문제가 있을수있다. 드라이버를 다시 받아보거나 삽질해보기
			// ============================
		 	function videoStart() {
				console.log("constraints : "+constraints);
				console.log("get_user_media : "+get_user_media);
				get_user_media(constraints, function(stream) {
					console.log('stream 함수 => 스트림 요청 성공');
					localStream = stream;
					console.log("localStream : " + localStream);
					if ("${loginMember.memClass}" == '전문가') {
						video1.srcObject = localStream;
					}
					sendMessage(new ExboardMsg("expert"));
					console.log("메세지 보냄!");
					console.log("gotStream 함수 => start 실행");
					start();
				}, function(e) {
					alert('카메라 오류 : ' + e+" \n 메세지 : "+e.message);
				});
			};
			
	
			//---------------------------- P2P 연결 로직 -------------------------------------

			// ============================
			// 상담이 시작될때 실행되는 메소드
			// ============================
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

			// ============================
			// PeerConnection객체를 생성하고 Media Capability 정보를 교환 sdp(Session Description Protocol) 형식을 따르는 blob인 offer와 answer를 주고 받으며 교환함
			// ============================
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

			// ============================
			// createPeerConnection 함수에서 호출함
			// ============================
			function handleRemoteStreamAdded(event) {
				console.log("RemoteStream 추가됨");
				//원격 스트림에 스트림을 넣어줌
				remoteStream = event.stream;
				if ("${loginMember.memClass}" != '전문가') {
					video2.srcObject = remoteStream;
				}
				/* else{
					if(user_cam != false){
						video2.srcObject = remoteStream;
					} 
				}
				 */
			};

			// ============================
			// start 함수에서 호출함
			// ============================
			function doCall() {
				console.log("createOff 함수를 통해서 통신 요청");
				pc.createOffer(setLocalAndSendMessage, handleCreateOfferError);
			};

			// ============================
			// 소켓 메세지 에서 분기 처리로 호출함
			// ============================
			function doAnswer() {
				console.log('peer에게 응답 보내기.');
				pc.createAnswer().then(setLocalAndSendMessage,
						onCreateSessionDescriptionError);
			};

		
			// ============================
			//핸들러 후보 상대방 탐색
			//ICE : Interactive Connectivity Establishment의 약자로 두 단말이 서로 통신할수 있는 최적의 경로를 찾을수있도록 도와주는 프레임워크임.
			// ============================
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
					console.log('handleIceCandidate 탐색 종료');
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

			//---------------------------- 잡다한 메소드 -------------------------------------

			function handleCreateOfferError(event) {
				console.log('Offer부분 생성 에러 error: ', event);
			};

			function onCreateSessionDescriptionError(error) {
				trace('onCreateSessionDescriptionError 에러 : '
						+ error.toString());
			}

			// ============================
			// ExboardMsg 메세지 객체
			// ============================
			function ExboardMsg(type, nick, msg, id, sdp, label, candidate) {
				this.type = type;
				this.nick = nick;
				this.msg = msg;
				this.id = id;
				this.sdp = sdp;
				this.label = label;
				this.candidate = candidate;
			};

			// ============================
			//엔터키 입력시 메세지 발송
			// ============================
			$("#edit").keyup(function(key) {
				if (key.keyCode == 13) {
					let txt = $("#edit").html();
					//$("#extext").val("");
					console.log("메세지 : "+txt);
					sendMessage(new ExboardMsg("TXT", "", txt));
					//counselText = txt.replaceAll("\n",'<br>');
					//console.log(counselText);
					//$("#expertTextDiv").html($("#expertTextDiv").html()+"<p>"+txt+"</p>");
					//$("#expertTextDiv").scrollTop($("#expertTextDiv")[0].scrollHeight);
				}
			});

			// ============================
			//상담 종료 해당 텍스트 에어리어의 기록 디비에 저장하고 종료
			// ============================
			function counselEnd() {
				console.log("user_usid : " + user_usid);
				let result = confirm("해당 회원과 상담을 종료 하시겠습니까?");
				if (result) {
					let form = document.createElement("form");
					form.setAttribute("charset", "UTF-8");
					form.setAttribute("method", "Post");
					form.setAttribute("action", "${path}/expert/counselEnd");
					//
					let hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("name", "extext");
					hiddenField.setAttribute("value", $("#edit").html());
					form.appendChild(hiddenField);
					//
					let hiddenField2 = document.createElement("input");
					hiddenField2.setAttribute("type", "hidden");
					hiddenField2.setAttribute("name", "bno");
					hiddenField2.setAttribute("value", "${bno}");
					form.appendChild(hiddenField2);
					//
					document.body.appendChild(form);
					form.submit();
			 		//exit(); 
					sendMessage(new ExboardMsg("END","${loginMember.memClass}", "종료"));
					//알람 발송 - 상담이 완료됬다는 알람 - 페이지가 넘어가기때문에 바로 변경해줄 사항 없음
					console.log("usid : ${loginMember.usid}"+" 유저 usid : "+user_usid+" bno : ${bno}"+"닉 : ${loginMember.memNickname}");
					sendAlarm("${loginMember.usid}",user_usid,"expertend","${bno}","${loginMember.memNickname}");
					result = false;
				}
			}

			// ============================
			//캠 온 오프 기능
			// ============================
			function onoff() {
				if (video1.srcObject != null) {
					video1.srcObject = null;
					sendMessage(new ExboardMsg("CAM", "", "off"));
				} else {
					video1.srcObject = localStream;
					sendMessage(new ExboardMsg("CAM", "", "on"));
				}
			};
	
			//---------------------------- 회원 정보 보기 -------------------------------------
			
			// ============================
			// 회원 정보 보기 실행 오른쪽 하단 버튼 , 전문가는 회원의 회원은 전문가의 정보를 볼수있음
			// ============================
			function memInfoView(e){
				window.open('${path}/expert/memInfo?bno=${bno}&usid=${loginMember.usid}&musid='+user_usid,'회원','width=800, height=550, toolbar=no, menubar=no, scrollbars=no, resizable=no');
			};
	
			// ============================
			// 고민해결 버튼 이걸 눌러야 상담사가 상담을 끝낼수있음
			// ============================
			function counselMemberEnd(){
				
				let result = confirm("해결 버튼을 누르시면 상담사 분이 확인 후 상담이 종료됩니다.\n한번 완료하시면 취소가 불가능합니다.");
				
				if(result){
				$.ajax({
					url : "${path}/expert/counselMemberEnd",
					type : 'post',
					data : {"bno":"${bno}"},
					dataType : "json",
					success : function(data){
						console.log("data : "+data);
						if(data == '1'){
							let memhtml="";
						
							memhtml += "<div class='button-7'><div class='eff-7'></div><a class='johnbtn' onclick='onoff();'>카메라</a></div>";
							memhtml += "<div class='button-8'><div class='eff-8'></div><a class='johnbtn' onclick='endAlert();'>종료중</a></div>";
							memhtml += "<div class='button-7'><div class='eff-7'></div><a class='johnbtn' onclick='memInfoView();'>정보</a></div>";
							
							$("#buttonDiv").html(memhtml);
							sendMessage(new ExboardMsg("MEMEND","${loginMember.memClass}", "유저 종료"));
							console.log("성공");
						}else{
								
							console.log("실패");
						}
					}
				})
				}
			};

			// ============================
			// 에디터 설정 라이브러리 전문가냐 일반 유저냐에 따라 다르게
			// ============================
			if("${loginMember.memClass}" == "전문가"){
		        DecoupledEditor
		        .create( document.querySelector( '#edit' ) )
		        .then( editor => {
		            const toolbarContainer = document.querySelector( '#toolbar-container' );

		            toolbarContainer.appendChild( editor.ui.view.toolbar.element );
		        } )
		        .catch( error => {
		            console.error( error );
		        } );
			}else{
				 $("#edit").css({'padding':'1%'});
			}

			// ============================
			// counselMemberEnd에서 onclick 호출로 alert이 이상하게 안되서 함수를 만듬 ㅅㅂ ㅋㅋㅋㅋ;
			// ============================
			function endAlert(){
				let st = '상담사 분이 완료를 누르면 상담이 정상 종료됩니다.';
				alert(st);
			}

	
</script>