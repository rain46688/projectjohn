<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="No-Cache"> 
<meta http-equiv="Pragma" content="No-Cache"> 
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
<script type="module" src="https://unpkg.com/ionicons@5.2.3/dist/ionicons/ionicons.esm.js"></script>
<script nomodule="" src="https://unpkg.com/ionicons@5.2.3/dist/ionicons/ionicons.js"></script>
<link rel="stylesheet" href="${path}/resources/css/layout.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
</head>
<style>
.containerJohn {
	background-image: url("${path}/resources/images/special_back.jpg");
	background-repeat: no-repeat;
	  background-attachment: fixed;
	  background-size: cover;
	/* background-repeated: repeated; */
	/* background-color: rgb(201, 193, 181); */
	/* background-color:#000941; */
}

#headerAndContent {
    width: 82%;
}
#header {
    border-top-right-radius: 30px;
    width: 100%;
    height: 6%; 
    /* background-color: #415a9c; */
   	background-color:white;
/*     border-left: 1px solid rgb(98, 98, 98); */
    padding-right:3em;
    border-bottom:1px solid rgba(0,0,0,.1);
}

#header > button {
	float:right;
}

#profileCon {
	border-radius:25px;
	width:35px;
	height:35px;
	overflow:hidden
}

#profileImage {	
	width:35px;
	height:35px;
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
    padding-right: 0;
    min-width: 7rem;
    left: -110%;
    top: 103%;
}

.dropdown-content a {
  color: black;
  padding: 12px 14px;
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
	border:1px gray solid;
	border-radius:8px;
	border-top-right-radius: 0%;
	border-bottom-right-radius: 0%;
}

#search #searchBtn {
	display: flex;
	align-items: center;
	justify-content: center;
	border:1px gray solid;
	background-color:#ffc55b;
}

#search ion-icon{
	font-size: 30px;
	color: black;
}

#headerList ion-icon{
	font-size: 35px;
	color: black;
}

#headerList li {
	display: flex;
	align-items: center;
	justify-content: center;
	height:70%;
}

#headerList li>a {
	display: flex;
	align-items: center;
	justify-content: center;
}

#bellDiv{
	display:flex;
	width:100%;
	height:100%;
	align-items: center;
}

#alarmDropdownDiv{
	position: absolute;
	z-index:4;
	background-color:white;
	top:9%;
	right:4%;
	padding:0.5%;
	display:none;
	font-weight:bold;
	width:25%;
	height:auto;
	min-height:30%;
	overflow-x: hidden;
	-ms-overflow-style: none;
	height:auto;
	max-height:60%;
}

#al {
	z-index: 2;
	position: relative;
	text-align: center;
	width: 25px;
	height: 25px;
	right:50%;
	font-size: 15px; font-weight : bold;
	color: white;
	background-color: #F13F36;
	border-radius: 70%;
	border: 1px solid black;
	/* box-shadow: 1px 1px 1px 1px gray; */
	font-weight: bold;
	cursor:pointer;
}

#bellDiv{
	/* border:1px red solid; */
	display:flex;
	width:100%;
	height:100%;
}

#bell {
	cursor:pointer;
}

#bellDiv:hover #alarmDropdownDiv{
	display:flex;
}

#number:hover #alarmDropdownDiv{
	display:flex;
}

#profileCon {
	pointer:cursor;
}

#searchBtn {
	pointer:cursor;
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
						<div id="searchBtn" onclick="fn_search();">
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
								  <c:if test="${loginMember.memNickname eq '관리자' }">
								  <a href="${path}/admin/adminMember">ADMIN</a>
								  </c:if>
								  <a href="${path}/board/boardInsert">글쓰기</a>
								  <a href="${path}/member/logout">로그아웃</a>
								</div>
							</div>
						</li>
						<li>
						<!--  호버 -->
								<div id="bellDiv">
										<c:if test="${loginMember.usid != null}">
											<a id="bell" ><ion-icon name="notifications-circle-outline"></ion-icon></a>
											<a id="number"></a>
										</c:if>
										<!-- <div id="alarmDropdownDiv" class="shadow p-3 mb-5 bg-white rounded">  -->
									<div id="alarmDropdownDiv" class="shadow p-3 mb-5  rounded"> 
										<%@ include file="/WEB-INF/views/alarm/alarm.jsp"%>
								</div> 
							</div>
						<!--  -->	
						</li>
					</ul>
				</div>
<script>
	function fn_search(){
		let keyword = document.getElementById('searchText').value;
		document.getElementById('searchText').value = "";
		location.href='${path}/board/boardSearch?keyword='+keyword;
	}
	
	document.getElementById('searchText').addEventListener("keypress", function(event){
		if(event.keyCode===13){
			document.getElementById('searchBtn').click();
		}
	})
</script>

