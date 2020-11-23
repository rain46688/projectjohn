<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<head>
	<!-- 글씨체 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
</head>
<style>
	#container_logo{
	    margin-top: 0;
	    display: flex;
	    justify-content: center;
	    background-color:#00316D;
	}
	#side {
	    border-bottom-left-radius: 30px;
	    border-top-left-radius: 30px;
	    overflow: auto;
	    width: 18%;
	    height: 100%;
	    background-color:#00316D;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	}
	#menu::-webkit-scrollbar {
		background-color: #05135C;
		width: 8px;
	}
	#menu::-webkit-scrollbar-thumb{
		background-color: white;
	}
	#menu::-webkit-scrollbar-track {
		background-color: #05135C;
	}
	#sidebar_logo{
    	width: 70%;
	}
	#menu {
		color: white;
		font-size: 1em;
		width:100%;
		margin-top: 1em;
		overflow: auto;
	}
	img#myPageLogo{
		width: 80%;
		cursor: pointer;
		margin: 5px 10%;
	}
	ion-icon{
		font-size: 1.5em;
		color: white;
		margin-left: 1.5em;
		margin-right: 1.5em;
	}
	div.menuContainer{
		display: flex;
		flex-direction: row;
		justify-content: flex-start;
		align-items: center;
		padding-bottom: 0.5em;
 	   padding-top: 0.5em;
		font-size: 1em;
		color: white;
		font-family: 'Noto Serif KR', serif;
	}
	div.menuContainer:hover {
		background-color: #0054BA;
	}
	#menuContainer a{
		color: white;
	}
	#menuContainer a:hover{
		color: white;
		margin-right: 1.5em;
	}
</style>
<div id="side">
	<div>
		<div id="container_logo">
			<a href="${path }/board/boardList" id="anchor_logo"> <img src="${path}/resources/images/logo_long_black.png" id="sidebar_logo" alt="로고">
			</a>
		</div>
		<div id="logoContainer">
			<img src="${path}/resources/images/myPage.png" id="myPageLogo" onclick="location.href='${path}/member/myPage?usid=${loginMember.usid}'">
		</div>
	</div>
	<div id="menu">
		<div class="menuContainer">
			<ion-icon name="chatbubbles-sharp"></ion-icon>
			<a class="menuLink nav-link" href="${path}/member/myPage/messageList?usid=${loginMember.usid}">
				서신함
			</a>
		</div>
		<hr>
		<div class="menuContainer">
			<ion-icon name="build-sharp"></ion-icon>
			<a class="menuLink nav-link menuContainer" href="${path}/member/myPage/updateMemberInfo?usid=${loginMember.usid}">
				회원정보 수정하기
			</a>
		</div>
		<c:if test="${loginMember.getMemClass() eq '전문가'}">
			<div class="menuContainer">
				<ion-icon name="build-sharp"></ion-icon>
				<a class="menuLink nav-link" href="#">(전문가 info)</a>
			</div>
		</c:if>
		<hr>
		<div class="menuContainer">
			<ion-icon name="clipboard-sharp"></ion-icon>
			<a class="menuLink nav-link" href="${path}/member/myPage/counselingRequest?usid=${loginMember.usid}">
				상담 신청 내역
			</a>
		</div>
		<c:if test="${loginMember.getMemClass() eq '전문가'}">
			<div class="menuContainer">
				<ion-icon name="clipboard-sharp"></ion-icon>
				<a class="menuLink nav-link" href="${path}/member/expertPage/counselingHistory?usid=${loginMember.usid}">
					상담한 내역
				</a>
			</div>
		</c:if>
		<div class="menuContainer">
			<ion-icon name="clipboard-sharp"></ion-icon>
			<a class="menuLink nav-link" href="${path}/member/myPage/counselingHistory?usid=${loginMember.usid}">
				상담 받은 내역
			</a>
		</div>
		<hr>
		<div class="menuContainer">
			<ion-icon name="list-sharp"></ion-icon>
			<a class="menuLink nav-link" href="${path}/member/myPage/myBoard?usid=${loginMember.usid}">
				나의 게시물 내역
			</a>
		</div>
		<div class="menuContainer">
			<ion-icon name="heart-sharp"></ion-icon>
			<a class="menuLink nav-link" href="${path}/member/myPage/liked?usid=${loginMember.usid}">
				좋아요 한 게시물
			</a>
		</div>
		<div class="menuContainer">
			<ion-icon name="skull-sharp"></ion-icon>
			<a class="menuLink nav-link" href="${path}/member/myPage/myReport?usid=${loginMember.usid}">
				내 신고 내역
			</a>
		</div>
		<hr>
		<div class="menuContainer">
			<ion-icon src="${path}/resources/images/licenseIcon.svg"></ion-icon>
			<a class="menuLink nav-link" href="${path}/member/myPage/applyExpertPage?usid=${loginMember.usid}">
				전문가 신청하기
			</a>
		</div>
	</div>
</div>
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>