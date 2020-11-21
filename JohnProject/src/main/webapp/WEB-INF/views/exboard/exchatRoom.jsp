<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}

#content{
	
	/* background-color: #121212; */
	background-color: #F1F3F3; 

}

/* 상단 영역 */
#upDiv {
	height: 83.2%;
	width: 100%;
	/* border: 1px solid red; */
	display: flex;
	padding: 1%;
}

/* 상단 영역 비디오 상대방 뷰*/
#video2 {
	z-index: 1;
	width: 100%;
	height: 100%;
	border: 2px solid #FFCC66;
}

/* 상단 영역 비디오 자신 뷰*/
#video1 {
	z-index: 2;
	position: absolute;
	right: 25.5%;
	/* top: 50.7%; */
	top: 65.5%;
	border: 2px solid #FFCC66;
	width: 10%;
}

/* 상단 영역 비디오 div */
#videoDiv {
	/* padding: 3%; */
	padding:1%;
/* 	border: 1px solid gray; */
	height: 100%;
	width: 80%;
	/* background-color:#05135C; */
	/* background-color: rgba(5, 19, 92, 0.96); */
/* 	background-color: gray; */
	/* background-color: #121212; */
	background-color: white;
	border-radius: 8px;
	margin-right: 1%;
	/* box-shadow: 8px 8px 8px rgba(0, 0, 0, 0.8); */
}

/* 상단 텍스트 div */
#textAreaDiv {
	/* border: 1px solid green; */
	height: 100%;
	width: 30%;
	/* background-color:#05135C; */
	/* background-color: rgba(5, 19, 92, 0.96); */
	/* background-color: gray; */
/* 	background-color: #121212; */
	background-color: white;
	border-radius: 8px;
	padding: 1%;
	/* box-shadow: 8px 8px 8px rgba(0, 0, 0, 0.8); */
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
	/* background-color:#FFCC66; */
	/* display:none; */
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
	/* 	background-color: #E2E2E8; */
	background-image: url(${path }/resources/images/expertimg.png);
	background-repeat: no-repeat;
	background-size: 100%;
	z-index: 2;
	padding-top: 20%;
}

/* #dragImg>img {
	display: block;
	width: 50%;
	height: 50%;
	margin-left: auto;
	margin-right: auto;
}

#dragImg p {
	font-size: 25px;
	text-align: center;
	font-weight: bold;
} */

/* ------------------------------------------ */

/* 하단 영역 div */
#bottomDiv {
	height: 15%;
/* 	border: 1px solid blue; */
	display: flex;
}

/* 왼쪽 버튼 영역 div */
#buttonDiv {
	/* border: 1px solid brown; */
	height: 100%;
	width: 30%;
	text-align: right;
	padding-right:1%;
}

/* 전문가 버튼 영역 div */
#buttonDiv>.exBtn{
	display:inline-block;
	width:48%;
	height:100%;
	border-radius: 8px;
	/* box-shadow: 8px 8px 8px rgba(0, 0, 0, 0.8); */
	 font-size:30px;
	font-weight: bold; 
}

/* 유저 버튼 영역 div */
#buttonDiv>.memBtn{
	display:inline-block;
	width:32%;
	height:100%;
	border-radius: 8px;

	/* box-shadow: 8px 8px 8px rgba(0, 0, 0, 0.8); */
	 font-size:30px;
	font-weight: bold; 
}

/* 이미지 영역 div */
#imgDiv {
	/* border: 25px solid rgba(5, 19, 92, 0.96); */

	/* border: 25px solid #121212; */
	 border: 25px solid white;
	border-radius: 8px;
	/* background-color:#05135C; */
	/* background-color: rgba(5, 19, 92, 0.96); */
	background-color:white;
	height: 100%;
	width: 77%;
	/* box-shadow: 8px 8px 8px rgba(0, 0, 0, 0.8); */
	margin: 0% 1% 1%;
	display:inline-block;
	/* padding:2%; */
	overflow-x: hidden;
	-ms-overflow-style: none;
	padding-top:2%;
}

#imgDiv>p{
 font-size:100%;
 color:gray;
 text-align:center;
/* padding:2%; */
}

.upload{
	width:10%;
	height:100%;
	margin:1%;
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
				<c:if test="${loginMember.memClass == '전문가'}">
					<textarea id="extext"></textarea>
				</c:if>
				<c:if test="${loginMember.memClass != '전문가'}">
					<textarea id="extext" readonly></textarea> 
				</c:if>
		</div>
	</div>
<!--  -->
	<div id="bottomDiv">
	<div id="imgDiv"><p> "${bno}"왼쪽 상단 박스에 드래그하여 이미지를 전송 후  이 박스에 표시되며 클릭하여 이미지를 확대할수있습니다.</p></div>
		<div id="buttonDiv">
			<c:if test="${loginMember.memClass == '전문가'}">
				<c:if test="${eb.expertBoardMemberend == 1}">
				<button type="button" class="exBtn btn btn-outline-success my-2 my-sm-0" onclick='counselEnd();'>상담 완료</button>
				</c:if>
				<c:if test="${eb.expertBoardMemberend == 0}">
				<button type="button" class="exBtn btn btn-outline-danger my-2 my-sm-0" onclick="alert('상담 받는 유저가 고민 해결 버튼을 클릭 후\n상담 종료가 가능합니다.');">상담 진행중</button>
				</c:if>
				<button type="button" class="exBtn btn btn-outline-success my-2 my-sm-0" onclick='memInfoView();'>회원 정보</button>
			</c:if>
			<c:if test="${loginMember.memClass != '전문가'}">
				<button type="button" class="memBtn btn btn-outline-success my-2 my-sm-0" onclick='onoff();'>캠 온오프</button>
				<c:if test="${eb.expertBoardMemberend == 0}">
				<button type="button" class="memBtn btn btn-outline-success my-2 my-sm-0" onclick='counselMemberEnd();'>고민 해결</button>
				</c:if>
				<c:if test="${eb.expertBoardMemberend == 1}">
					<button type="button" class="memBtn btn btn-outline-danger my-2 my-sm-0" onclick="alert('상담사 분이 상담 완료를 누르면 상담이 정상 종료됩니다.');">상담 종료중</button>
				</c:if>
				<button type="button" class="memBtn btn btn-outline-success my-2 my-sm-0" onclick='memInfoView();'>상담사 정보</button>
			</c:if>
		</div>
	</div>
</div>

<script defer>

	'use strict';
	
	//---------------------------- 드래그 파일 -------------------------------------

	let uploadFiles = [];
	let $drop = $("#extext");

	$drop.on("dragenter", function(e) {
		$(this).addClass('drag-over');
		$("#extext").css({
			"display" : "none"
		});
		$("#dragImg").css({
			"display" : "inline-block"
		});
	});

	let $drop2 = $("#dragImg");

	$drop2.on("dragenter", function(e) {
		$(this).addClass('drag-over');
	}).on("dragleave", function(e) {
		$(this).removeClass('drag-over');
		$("#dragImg").css({
			"display" : "none"
		});
		$("#extext").css({
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
		$("#extext").css({
			"display" : "inline-block"
		});
		let files = e.originalEvent.dataTransfer.files;
		console.log("files : " + files);
		for (let i = 0; i < files.length; i++) {
			let file = files[i];
			let size = uploadFiles.push(file); 
			console.log("확인 : "+file);
		}
		
		//---------------------------- 드래그 파일 전송 -------------------------------------
		
		let formData = new FormData();
		$.each(uploadFiles, function(i, file) {
		console.log("파일 이름 : "+file.name);
		
		let f = (file.name).substring((file.name).lastIndexOf('.'),(file.name).length);
		
		console.log("f : "+f);
		
		if(f != '.png' && f != '.jpg' && f != '.jpeg' && f != '.gif'){
			console.log("업로드 안됨 파일 이름 : "+file.name);
			alert('이미지 파일만 업로드 가능합니다.');
		}else{
			formData.append('upFile', file, file.name);
			console.log("업로드 됨 파일 이름 : "+file.name);
		}
		
		});
		
	 	$.ajax({
			url : '${path}/expert/upload',
			data : formData,
			type : 'post',
			contentType : false,
			processData : false,
			dataType : "json",
			success : function(data) {
				console.log("파일 업로드 완료 data : " + data);
				let msg = "";
				$.each(data, function(i, item) {
					console.log("i : " + i + ", item : " + item);
					msg += item + "|";
				});
				console.log(msg);
				sendMessage(new ExboardMsg("FILE", "", msg));
				$("#previewImg").html("");
				imgDivPrint(msg);
				//배열 초기화 안그러면 계속 들어감..
				uploadFiles = [];
			}
		});
	});
	
	function imgDivPrint(msg){
		console.log("msg : "+msg);
		let list = msg.split('|');
		let imgprint = "";
		for(let i in list){
			console.log(list[i]);
			if(i == list.length-1){
				break;
			}
			imgprint+="<img  class='upload' src='${path}/resources/upload_images/"+list[i]+"' title='"+list[i]+"' onclick='imgView(event);' style='cursor: pointer'/>";
		}
		
		if($("#imgDiv").children().html() != ''){
			console.log("빔");
			$("#imgDiv").html("");
		}
		
		let con = $("#imgDiv").html()+imgprint;
		$("#imgDiv").html("");
		$("#imgDiv").html(con);
		$("#imgDiv").scrollTop($("#imgDiv")[0].scrollHeight);
		list="";
		imgprint="";
		console.log("msg2 : "+msg);
	}
	
	//---------------------------- 사진 크게 보기 -------------------------------------
	
	function imgView(e){
		window.open('${path}/resources/upload_images/'+$(e.target).attr( 'title' ),'이미지','width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes');
	};
	
	
	//---------------------------- 상담 설정 -------------------------------------

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
	//let user_cam=null;
	let user_usid;
	let counselText="";

	/* 		let cam = _.once = function(func){
				console.log("once");
				return false;
			}; 
			user_cam = cam();
			console.log("user_cam : "+user_cam); */

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

			//const conn = new WebSocket('wss://192.168.120.31${path}/ertc');
			const conn = new WebSocket('wss://192.168.219.105${path}/ertc');
			//const conn = new WebSocket('wss://localhost${path}/ertc');

			conn.onopen = function() {
				console.log("onopen => signaling server 연결");
				if ("${loginMember.memClass}" != '전문가') {
					sendMessage(new ExboardMsg("SYS",
							"${loginMember.memNickname}", "접속",
							"${loginMember.usid}"));
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
					//$("#expertTextDiv").html("<p>"+content.nick + "님이 접속하셨습니다.</p><br>");
				} else if (content.type == 'TXT') {
					console.log(" === 분기 TXT === ");
					$("#extext").val(content.msg);
				/* 	$("#expertTextDiv").html($("#expertTextDiv").html()+"<p>"+content.msg+"</p>");
					$("#expertTextDiv").scrollTop($("#expertTextDiv")[0].scrollHeight); */
				} else if (content.type == 'CAM') {
					console.log(" === 분기 CAM === ");
					if (content.msg === 'off') {
						video2.srcObject = null;
						//$("#expertTextDiv").html($("#expertTextDiv").html() + "<br><p>유저가 카메라를 끄셨습니다.</p>");
						//user_cam = false;
					} else {
						video2.srcObject = remoteStream;
						//$("#expertTextDiv").html($("#expertTextDiv").html() + "<br><p>유저가 카메라를 키셨습니다.</p>");
						//user_cam = true;
					}
				} else if (content.type == 'FILE') {
					console.log(" === 분기 FILE === ");
					console.log("content : " + content.msg);
					imgDivPrint(content.msg);
				} else if (content.type == 'END') {
					console.log(" === 분기 END === ");
					/* 	exit(); */
					location.replace('${path}/board/boardList');
				}else if(content.type == 'MEMEND'){
					console.log(" === 분기 MEMEND === ");
					let experthtml = "";
					experthtml += "<button type='button' class='exBtn btn btn-outline-success my-2 my-sm-0' onclick='counselEnd();'>상담 완료</button>";
					experthtml += "<button type='button' class='exBtn btn btn-outline-success my-2 my-sm-0' onclick='memInfoView();'>회원 정보 보기</button>";
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

			//---------------------------- 비디오 설정 -------------------------------------

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
					if ("${loginMember.memClass}" == '전문가') {
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
				pc = null;
			};

			//---------------------------- 잡다한 메소드 -------------------------------------

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
					//$("#extext").val("");
					//console.log(txt);
					sendMessage(new ExboardMsg("TXT", "", txt));
					counselText = txt.replaceAll("\n",'<br>');
					console.log(counselText);
					//$("#expertTextDiv").html($("#expertTextDiv").html()+"<p>"+txt+"</p>");
					//$("#expertTextDiv").scrollTop($("#expertTextDiv")[0].scrollHeight);
				}
			});

			//상담 종료 해당 텍스트 에어리어의 기록 디비에 저장하고 종료
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
					hiddenField.setAttribute("value", counselText);
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
					sendAlarm("${loginMember.usid}",user_usid,"expertend","${bno}","${loginMember.memNickname}");
					result = false;
				}
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
			};
	
			//---------------------------- 회원 정보 보기 -------------------------------------
			
			function memInfoView(e){
				window.open('${path}/expert/memInfo?bno=${bno}&usid=${loginMember.usid}&musid='+user_usid,'회원','width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes');
			};
	
			
			function counselMemberEnd(){
				
				let result = confirm("고민 해결을 완료하시면 상담사 분이 확인 후 종료됩니다.\n한번 완료하시면 취소가 불가능합니다.");
				
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
							memhtml += "<button type='button' class='memBtn btn btn-outline-success my-2 my-sm-0' onclick='onoff();'>캠 온오프</button>";
							memhtml += "<button type='button' class='memBtn btn btn-outline-danger my-2 my-sm-0' onclick='alert('상담사 분이 상담 완료를 누르면 상담이 정상 종료됩니다.');'>상담 종료중</button>";
							memhtml += "<button type='button' class='memBtn btn btn-outline-success my-2 my-sm-0' onclick='memInfoView();'>상담사 정보 보기</button>";
							$("#buttonDiv").html(memhtml);
							sendMessage(new ExboardMsg("MEMEND","${loginMember.memClass}", "유저 종료"));
							console.log("성공");
						}else{
							
							console.log("실패");
						}
					}
				})
				}
				
				
			}
			
			
			
			
			
			
			
			
	
</script>