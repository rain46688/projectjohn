<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
<link rel="stylesheet" href="${path}/resources/css/layout.css">
</head>
<style>
	.containerJohn{
		background-image:url("${path}/resources/images/background_pattern.png");
		background-repeated:repeated;
	}
	
	#alarmdiv{
	display:inline-block;
	/* border:1px solid black; */
	width:50px;
	height:40px;
	overflow:hidden;
	}
	
	#al {
	width: 20px;
	height: 20px;
	display: inline-block;
	color: yellow;
	background-color: red;
	border-radius: 70%;
	font-weight: bold;
	position: relative;
	z-index: 2;
/* 	top: 20px;
	left: -2px;
	right: 4px; */
	bottom:18px;
	left:15px;
	border:1px solid black;
	text-align: center;
	font-size: 12px;
	 box-shadow: 1px 1px 1px 1px gray;
}

#bell {
	z-index: 1;
	position: relative;
	/* border:1px solid black;  */
}

#bell>img{
	width: 35px; 
	height: 35px;
}

</style>
<body>
    <div class="containerJohn">
        <div class="box">
            <div id="side">
                <div id="container_logo">
                <a href="${path }/board/boardList" id="anchor_logo">
                	<img src="${path}/resources/images/logo_long_black.png" id="sidebar_logo" alt="로고">
                </a>
                </div>
                    <!-- 사이드바 메뉴 -->
                    <!-- <button onclick="">이게 인생이냐</button>
                    <button onclick="">이게 사랑이냐</button>
                    <button onclick="">이게 회사냐</button>
                    <button onclick="">이게 집사냐</button>
                    <button onclick="">이게 코리안 뷰티</button>
                    <button onclick="">세상에 이런 일이</button> -->
                    <div id="menu">
                   	이게 인생이냐<br>
                   	<a href="${path }/board/boardListSmall?boardTitle=10대이야기">10대 이야기</a><br>
                   	<a href="${path }/board/boardListSmall?boardTitle=20대이야기">20대 이야기</a><br>
                   	<a href="${path }/board/boardListSmall?boardTitle=30대이야기">30대 이야기</a><br>
                   	<a href="${path }/board/boardListSmall?boardTitle=40대이야기">40대 이야기</a><br>
                   	<a href="${path }/board/boardListSmall?boardTitle=50대이야기">50대 이야기</a><br>
                   	<a href="${path }/board/boardListSmall?boardTitle=60대이야기">60대 이야기</a><br>
                   	<a href="${path }/board/boardListSmall?boardTitle=싱글이야기">싱글 이야기</a><br>
                   	</div>
                   	
            </div>
            <div id="headerAndContent">
                <div id="header">
                    <!-- 알람 및 마이페이지 버튼 -->
                    <button onclick="location.href='${path}/customer/customerPage'">고객센터</button>
                    <button onclick="location.href='${path}/member/memberPage'">마이페이지</button>
                    <button onclick="location.href='${path}/admin/adminPage'" >ADMIN</button>
                    <button onclick="location.href='${path}/member/logout'">로그아웃</button>
                    <div id="alarmdiv">
                     	<c:if test="${loginMember.usid != null}">
						<a id="bell" class="bell2" href="/alarmList?usid=${loginMember.usid }"><img src="${path }/resources/images/bell.png" ></a>
						<c:if test="${loginMember.usid != null}">
						<a id="number" href="${path }/alarmList?usid=${loginMember.usid }"></a>
						</c:if>
					</c:if>
                    </div>
                </div>
                
                
                <!-- 이게 인생이냐
					10대 ~ 50대, 싱글
					
					세상에 이런 일이
					 - 억울해요
					 - 신기한 일
					 - 개념 상실한 인간덜
					 - 이게 나라냐
					
					이게 사랑이냐
					 - 남편 대 아내
					 - 남자들끼리
					 - 여자들끼리
					 - 결혼/시집/친정
					 - 임신/출산/육아
					
					이게 회사냐
					 - 취업/면접
					 - 알바 경험당
					 - 나는 백수다
					
					이게 집사냐
					 - 강아지 집사방
					 - 고양이 집사방
					
					이게 코리아 뷰티다
					 - 뷰티/스타일
					 - 건강/다이어트
					 - 여행추천
                 -->
                 
                 <script>
                 
                 'use strict';
                 
                 let num = 1;
         		
         		function alarmPrint(){
         			if("${loginMember.usid}" != ""){
         			$.ajax({
         			    type: "GET",
         			    data: {
         			      "usid": "${loginMember.usid}"
         			    },
         			      dataType: "json",
         			      url: "${path}/alarmCount",
         			    success: function (data) {
         			    	console.log("data : "+data);
         			    	num = data;
         					if(num > 0){
         						console.log("0보다 큼")
         						$("#number").append("<div id='al'>"+num+"</div>");
         					}else{
         						console.log("0보다 안큼")
         						$("#bell").removeClass('bell2');
         					}
         			    }
         			  });
         			}else{
         				console.log("로그인이 안되있습니다.");
         			}
         		};
         		alarmPrint();
                 
                 const alsocket = new WebSocket("wss://192.168.219.105${path}/alsocket");
                 
                 alsocket.onopen = function(){
        			
        		};
        		
        		alsocket.onmessage = function(msg){
        			console.log("msg 콘솔 : "+msg);
        			console.log("num : "+num++);
        			console.log("num2 : "+num);
        			$("#number").html("");
        			$("#number").append("<div id='al'>"+num+"</div>");
        			$("#bell").addClass('bell2');
        		};
        		
        		function sendAlarm(send_usid,receive_usid,type,msg,send_nick){
        			alsocket.send(JSON.stringify(new Alarm("",send_usid,receive_usid,type,msg,send_nick)));
        		};
        		
        		function Alarm(ALARM_ID,ALARM_SEND_MEM_USID,ALARM_RECEIVE_MEM_USID,ALARM_TYPE,ALARM_MSG_CONTENT,ALARM_SEND_MEM_NICKNAME,ALARM_DATE,ALARM_ISCHECKED){
        			this.ALARM_ID = ALARM_ID;
        			this.ALARM_SEND_MEM_USID = ALARM_SEND_MEM_USID;
        			this.ALARM_RECEIVE_MEM_USID = ALARM_RECEIVE_MEM_USID;
        			this.ALARM_TYPE = ALARM_TYPE;
        			this.ALARM_MSG_CONTENT = ALARM_MSG_CONTENT;
        			this.ALARM_SEND_MEM_NICKNAME = ALARM_SEND_MEM_NICKNAME;
        			this.ALARM_DATE = ALARM_DATE;
        			this.ALARM_ISCHECKED = ALARM_ISCHECKED;
        		};
                 
                 </script>
       
