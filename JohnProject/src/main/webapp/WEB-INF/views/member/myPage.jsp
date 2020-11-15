<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재판하는존경장님</title>
<link rel="icon" type="image/png" href="${path }/resources/images/favicon.ico">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script defer src="http://localhost:3000/socket.io/socket.io.js"></script>
<script defer src="${path}/resources/js/script.js"></script>
<link rel="stylesheet" href="${path}/resources/css/layout.css">
</head>
<style>
.containerJohn {
	background-image: url("${path}/resources/images/background_pattern.png");
	background-repeated: repeated;
}

#alarmdiv {
	display: inline-flex;
	/* border: 1px solid red; */
	height: 100%;
	width: 50px;
}

#alarmdiv>#bell>img {
	z-index: 1;
	/* border: 1px solid black; */
	height: 100%;
	width: 200%;
}

#al {
	z-index: 2;
	position: relative;
	text-align: center;
	width: 25px;
	height: 25px;
	top:50%;
	font-size: 15px;
	font-weight: bold;
	color: yellow;
	background-color: red;
	border-radius: 70%;
	border: 1px solid black;
	box-shadow: 1px 1px 1px 1px gray;
}

</style>
<body>
	<div class="containerJohn">
		<div class="box">
			<div id="side">
				<div id="container_logo">
					<a href="${path }/board/boardList" id="anchor_logo"> <img src="${path}/resources/images/logo_long_black.png" id="sidebar_logo" alt="로고">
					</a>
				</div>
				<div id="menu">
					<div>
						<a href="${path}/member/myPage?usid=${loginMember.usid}">마이페이지 홈</a>
					</div>
					<div>
						<a href="${path}/member/myPage/updateMemberInfo?usid=${loginMember.usid}">회원정보 수정하기</a>
					</div>
					<div>
						<a href="${path}/member/myBoard">나의 게시물 내역</a>
					</div>
					<div>
						<a href="${path}/member/expertCounsel">전문가 상담 내역</a>
					</div>
					<div>
						<a href="${path}/member/liked">좋아요 한 게시물</a>
					</div>
					<div>
						<a href="${path}/member/myReport">내 신고 내역</a>
					</div>
					<div>
						<a href="${path}/member/applyExpert">전문가 신청하기</a>
					</div>
				</div>
			</div>
			<div id="headerAndContent">
				<div id="header">
					<!-- 알람 및 마이페이지 버튼 -->
					<button onclick="location.href='${path}/customer/customerPage'">고객센터</button>
					<button onclick="location.href='${path}/member/memberPage'">마이페이지</button>
					<button onclick="location.href='${path}/admin/adminPage'">ADMIN</button>
					<button onclick="location.href='${path}/member/logout'">로그아웃</button>
					<!-- 알람 임시 위치 & 이미지 나중에 수정해야됨 -->
					<div id="alarmdiv">
						<c:if test="${loginMember.usid != null}">
							<a id="bell" class="bell2" href="${path }/alarmList?usid=${loginMember.usid }"><img src="${path }/resources/images/bell.png"></a>
							<c:if test="${loginMember.usid != null}">
								<a id="number" href="${path }/alarmList?usid=${loginMember.usid }"></a>
							</c:if>
						</c:if>
					</div>
				</div>
				<div id="content">
					<div>
						<div>
							<div>
								<img src="${path }/resources/profile_images/${member.getProfilePic()}">
							</div>
							이름: ${member.memName}
							닉네임: ${member.getMemNickname() }
							성별: 
							<c:choose>
								<c:when test="${loginMember.getGender() eq 'F' }">여</c:when>
								<c:otherwise>남</c:otherwise>
							</c:choose>
							생년월일: ${member.getBirthday() }
							가입일: ${member.getEnrollDate() }
							포인트: ${member.getPoint() }
							회원구분: ${member.getMemClass() }
							
							
						</div>
						<div>
							회원정보 수정하기
							<button type="button" onclick="location.href='${path}/member/myPage/updateMemberInfo?usid=${loginMember.usid}'">이동하기</button>
						</div>
						<div>
							나의 게시물 내역
							<button type="button" onclick="location.href='${path}/member/myPage/myBoard?usid=${loginMember.usid}'">이동하기</button>
						</div>
						<div>
							전문가 상담 내역
							<button>이동하기</button>
						</div>
						<div>
							좋아요 한 게시물
							<button>이동하기</button>
						</div>
						<div>
							내 신고 내역
							<button>이동하기</button>
						</div>
						<div>
							전문가 신청하기
							<button>이동하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		'use strict';

		let num = 1;

		function alarmPrint() {
			if ("${loginMember.usid}" != "") {
				$.ajax({
					type : "GET",
					data : {
						"usid" : "${loginMember.usid}"
					},
					dataType : "json",
					url : "${path}/alarmCount",
					success : function(data) {
						console.log("data : " + data);
						num = data;
						if (num > 0) {
							console.log("0보다 큼")
							$("#number").append(
									"<div id='al'>" + num
											+ "</div>");
						} else {
							console.log("0보다 안큼")
							$("#bell").removeClass('bell2');
						}
					}
				});
			} else {
				console.log("로그인이 안되있습니다.");
			}
		};
		alarmPrint();

		//const alsocket = new WebSocket("wss://localhost${path}/alsocket");
		//const alsocket = new WebSocket("wss://192.168.120.31${path}/alsocket");
		const alsocket = new WebSocket(
				"wss://192.168.219.105${path}/alsocket");

		alsocket.onopen = function() {

		};

		alsocket.onmessage = function(msg) {
			console.log("msg 콘솔 : " + msg);
			num++;
			console.log("num : " + num);
			$("#number").html("");
			$("#number").append("<div id='al'>" + num + "</div>");
			$("#bell").addClass('bell2');
		};

		function sendAlarm(send_usid, receive_usid, type, msg,
				send_nick) {
			alsocket.send(JSON.stringify(new Alarm(send_usid,
					receive_usid, type, msg, send_nick)));
		};

		function Alarm(ALARM_SEND_MEM_USID, ALARM_RECEIVE_MEM_USID,
				ALARM_TYPE, ALARM_MSG_CONTENT,
				ALARM_SEND_MEM_NICKNAME, ALARM_DATE,
				ALARM_ISCHECKED) {
			this.alarmSendMemUsid = ALARM_SEND_MEM_USID;
			this.alarmReceiveMemUsid = ALARM_RECEIVE_MEM_USID;
			this.alarmType = ALARM_TYPE;
			this.alarmMsgContent = ALARM_MSG_CONTENT;
			this.alarmSendMemNickname = ALARM_SEND_MEM_NICKNAME;
			this.alarmDate = ALARM_DATE;
			this.alarmIscheked = ALARM_ISCHECKED;
		};
	</script>
</body>
</html>