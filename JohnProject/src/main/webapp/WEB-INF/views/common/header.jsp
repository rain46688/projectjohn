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
            </div>
            <div id="headerAndContent">
                <div id="header">
                    <!-- 알람 및 마이페이지 버튼 -->
                    <button onclick="location.href='${path}/customer/customerPage'">고객센터</button>
                    <button>알람</button>
                    <button onclick="location.href='${path}/member/memberPage'">마이페이지</button>
                    <button onclick="location.href='${path}/admin/adminPage'">ADMIN</button>
                    <button onclick="location.href='${path}/member/logout'">로그아웃</button>
                </div>
