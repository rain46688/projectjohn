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
<script defer src="${path}/resources/js/header.js"></script>
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<link rel="stylesheet" href="${path}/resources/css/layout.css">
</head>
<style>
.containerJohn {
	background-image: url("${path}/resources/images/background_pattern.png");
	background-repeated: repeated;
	/* background-color: rgb(201, 193, 181); */
}

#headerAndContent {
    width: 82%;
}
#header {
    border-top-right-radius: 30px;
    width: 100%;
    height: 9%; 
    background-color: #0054BA;
/*     border-left: 1px solid rgb(98, 98, 98); */
    padding-right:3em;
}

#header > button {
	float:right;
}

#al {
	z-index: 2;
	position: relative;
	text-align: center;
	width: 25px;
	height: 25px;
	top: 55%;
	left:10%;
	font-size: 15px; font-weight : bold;
	color: yellow;
	background-color: red;
	border-radius: 70%;
	border: 1px solid black;
	box-shadow: 1px 1px 1px 1px gray;
	font-weight: bold;
}

#bell {
}

#profileCon {
	border-radius:25px;
	width:35px;
	height:35px;
	overflow:hidden
}

#profileImage {	
	width:40px;
	height:40px;
	object-fit:cover;
}

#headerList {
	list-style-type: none;
	display: flex;
	align-items: center;
	flex-direction: row-reverse;
	height:100%;
}

#headerList>li {
	margin:0.5em;
	margin-right:0;
	padding:0.5em;
	padding-right:0;
}

#myPageDrop {
  position: relative;
  display: inline-block;
  cursor:pointer;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 4;
  padding-right:30px;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

#myPageDrop:hover .dropdown-content {display: block;}

#search {
	float:left;
	margin:0.5em;
	margin-top:0;
	padding:0.5em;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: row;
	height: 100%;
}

#search #searchText {
	width:12em;
	height:2em;
	border:1px white solid;
	border-radius:8px;
	border-top-right-radius: 0%;
	border-bottom-right-radius: 0%;
}

#search #searchBtn {
	display: flex;
	align-items: center;
	justify-content: center;
	border:1px white solid;
}

#search ion-icon{
	font-size: 30px;
	color: white;
}

#headerList ion-icon{
	font-size: 35px;
	color: white;
}

#headerList li {
	display: flex;
	align-items: center;
	justify-content: center;
}

#headerList li>a {
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
<body>
	<div class="containerJohn">
		<div class="box">
			<!-- 사이드바 -->
			<c:choose>
				<c:when test="${sideBar eq 'member' }">
					<%@ include file="/WEB-INF/views/member/myPageSideBar.jsp"%>
				</c:when>
				<c:when test="${sideBar eq 'admin' }">
					<%@ include file="/WEB-INF/views/admin/adminSideBar.jsp"%>
				</c:when>
				<c:when test="${sideBar eq 'customer' }">
					<%@ include file="/WEB-INF/views/customer/customerSideBar.jsp"%>
				</c:when>
				<c:otherwise>
					<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>			
				</c:otherwise>
			</c:choose>
			<div id="headerAndContent">
				<div id="header">
					
					<!-- 알람 및 마이페이지 버튼 -->
					<div id="search">
						<input type="text" id="searchText">
						<div id="searchBtn">
							<ion-icon name="search-circle-outline"></ion-icon>
						</div>
					</div>
					<ul id="headerList">
						<li>
							<div id="myPageDrop" tabindex="1">
								<div id="profileCon">
									<img id="profileImage" src="${path}/resources/profile_images/${loginMember.profilePic}">
								</div>
								<div class="dropdown-content">
								  <a href="${path }/member/myPage?usid=${loginMember.usid}">마이페이지</a>
								  <a href="${path}/customer/customerNotice">고객센터</a>
								  <a href="${path}/admin/adminMember">ADMIN</a>
								  <a href="${path}/board/boardInsert">글쓰기</a>
								  <a href="${path}/member/logout">로그아웃</a>
								</div>
							</div>
						</li>
						<li>
							<c:if test="${loginMember.usid != null}">
								<a id="bell" class="bell2" href="${path }/alarm/alarmList?usid=${loginMember.usid }"><ion-icon name="notifications-circle-outline"></ion-icon></a>
								<c:if test="${loginMember.usid != null}">
									<a id="number" href="${path }/alarm/alarmList?usid=${loginMember.usid }"></a>
								</c:if>
							</c:if>
						</li>
					</ul>
					<!-- 전문과 관련 페이지 접근용 임시 포탈 -->
					<%-- <button onclick="location.href='${path}/expert'">전문가</button> --%>
					<!-- 알람 임시 위치 & 이미지 나중에 수정해야됨 -->
					
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
				sessionStorage.clear();
		 		sessionStorage.setItem('lousid', "${loginMember.usid}");
		 		sessionStorage.setItem('path', "${path}");
				</script>