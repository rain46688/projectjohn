<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<head>
	<!-- 글씨체 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
	<script type="module" src="https://unpkg.com/ionicons@5.2.3/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule="" src="https://unpkg.com/ionicons@5.2.3/dist/ionicons/ionicons.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<style>
	#container_logo{
	    margin-top: 0;
	    display: flex;
	    justify-content: center;
	    background-color:#00316D;
	}
	#side {
		background-image: url("${path}/resources/images/sideBarPattern.png");
		background-repeat: repeated;
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
		background-color: black;
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
	img.sideIcon{
		width: 1.5rem;
		height: 1.5rem;
		margin-left: 2.5rem;
		margin-right: 2rem;
	}
	div.menuContainer{
		display: flex;
		flex-direction: row;
		justify-content: flex-start;
		align-items: center;
		padding: 1rem 0;
		font-size: 1em;
		color: white;
		font-family: 'Noto Serif KR', serif;
	}
	div.menuContainer:hover {
		background-color: rgb(255,255,255,0.1);
	}
	a.menuLink{
		color: white;
		width: 100%;
		padding: 0;
		margin: 0.5rem auto;
	}
	a.menuLink:hover{
		color: white;
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
		<a class="menuLink nav-link" href="${path}/member/myPage/messageList?usid=${loginMember.usid}">
			<div class="menuContainer">
				<img src="${path}/resources/images/chat-wh.png" class="sideIcon">
				서신함
			</div>
		</a>
			<hr>
		<a class="menuLink nav-link menuContainer" href="${path}/member/myPage/updateMemberInfo?usid=${loginMember.usid}">
			<div class="menuContainer">
				<img src="${path}/resources/images/build-wh.png" class="sideIcon">
				회원정보 수정하기
			</div>
		</a>
		<c:if test="${loginMember.getMemClass() eq '전문가'}">
			<a class="menuLink nav-link" href="${path}/member/myPage/expertInfoModify?usid=${loginMember.usid}">
				<div class="menuContainer">
					<img src="${path}/resources/images/build-wh.png" class="sideIcon">
					전문가 정보 수정하기
				</div>
			</a>
		</c:if>
		<hr>
		<c:if test="${loginMember.getMemClass() eq '전문가'}">
			<a class="menuLink nav-link" href="${path}/member/myPage/expertRequestPrintList?usid=${loginMember.usid}">
				<div class="menuContainer">
					<img src="${path}/resources/images/clipboard-wh.png" class="sideIcon">
					상담 신청받은 내역
				</div>
			</a>
		</c:if>
		<a class="menuLink nav-link" href="${path}/member/myPage/counselingRequest?usid=${loginMember.usid}">
			<div class="menuContainer">
				<img src="${path}/resources/images/clipboard-wh.png" class="sideIcon">
				상담 신청한 내역
			</div>
		</a>
		<a class="menuLink nav-link" href="${path}/member/myPage/counselingHistory?usid=${loginMember.usid}">
			<div class="menuContainer">
				<img src="${path}/resources/images/clipboard-wh.png" class="sideIcon">
				상담 받은 내역
			</div>
		</a>
		<hr>
		<a class="menuLink nav-link" href="${path}/member/myPage/myBoard?usid=${loginMember.usid}">
			<div class="menuContainer">
				<img src="${path}/resources/images/list-wh.png" class="sideIcon">
				나의 게시물 내역
			</div>
		</a>
		<a class="menuLink nav-link" href="${path}/member/myPage/liked?usid=${loginMember.usid}">
			<div class="menuContainer">
				<img src="${path}/resources/images/heart-wh.png" class="sideIcon">
				좋아요 한 게시물
			</div>
		</a>
		<a class="menuLink nav-link" href="${path}/member/myPage/myReport?usid=${loginMember.usid}">
			<div class="menuContainer">
				<img src="${path}/resources/images/skull-wh.png" class="sideIcon">
				내 신고 내역
			</div>
		</a>
		<hr>
		<c:if test="${loginMember.getMemClass() eq '일반유저'}">
			<a class="menuLink nav-link" href="${path}/member/myPage/applyExpertPage?usid=${loginMember.usid}">
				<div class="menuContainer">
					<img src="${path}/resources/images/driver-license-wh.png" class="sideIcon">
					전문가 신청하기
				</div>
			</a>
		</c:if>
	</div>
</div>
