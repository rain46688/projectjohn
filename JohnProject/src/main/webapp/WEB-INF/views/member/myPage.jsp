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
	<!-- 글씨체 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
</head>
<style>
div#content *{
	/* border: 1px red solid; */
	font-family: 'Noto Serif KR', serif;
}
div#myInfoBox{
	width: 45%;
	margin: 3% auto;
}
div#myInfoHeader{
	background-color: #003478;
	color: #ffcc66;
	font-weight: bolder;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
	text-align: left;
	padding: 5px 15px;
	font-size: 1.5rem;
}
div#myInfoContainer{
	background-color: white;
	border-bottom-left-radius: 15px;
	border-bottom-right-radius: 15px;
	display: flex;
	padding: 5px;
}
div#myProfilePic{
	width: 40%;
	display: flex;
	float: left;
	padding: auto;
}
div#myProfilePic *{
	width: 10em;
	height: 10em;
	border-radius: 15px;
	display: flex;
	margin: auto;
	max-width: 100%;
}
div#myInfo{
	width: 50%;
	display: flex;
	float: right;
	margin: 0px 10px;
	padding: 10px;
	flex-direction: column;
}
div#myInfo *{
	text-align: left;
	margin: 3px;
	font-weight: bolder;
}
div#boards{
	clear: both;
	width: 60%;
	margin: auto;
	margin-bottom: 100px;
	border-radius: 10px;
	display: grid;
	grid-template-columns: repeat(3,minmax(30%,auto));
	column-gap: 1rem;
	text-align: center;
}
div.board{
	background-color: white;
	border: black 1px solid;
	margin-top: 1.5rem;
	padding: 1rem;
}
ion-icon.pageIcon{
	font-size: 5rem;
}
div.boardTitle{
	font-size: 1.2rem;
	margin: 1rem;
}
div.boardTitle *{
	text-align: left;
}
div.board button{
	margin: 1%;
	margin-top: 0;
}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<div id="content">
	<div>
		<div id="myInfoBox">
			<div id="myInfoHeader">
				내 정보
			</div>
			<div id="myInfoContainer">
				<div id="myProfilePic">
					<img src="${path }/resources/profile_images/${member.getProfilePic()}">
				</div>
				<div id="myInfo">
					<div>
						이름: ${member.memName}
					</div>
					<div>
						생년월일: ${member.getBirthday() }
					</div>
					<div>
						성별: 
						<c:choose>
							<c:when test="${loginMember.getGender() eq 'F' }">여</c:when>
							<c:otherwise>남</c:otherwise>
						</c:choose>
					</div>
					<div>
						닉네임: ${member.getMemNickname() }
					</div>
					<div>
						회원구분: ${member.getMemClass() }
					</div>
					<div>
						가입일: ${member.getEnrollDate() }
					</div>
					<div>
						포인트: ${member.getPoint() }
					</div>
				</div>
			</div>
		</div>
		<div id="boards">
			<div class="board">
				<ion-icon name="chatbubbles-sharp" class="pageIcon"></ion-icon>
				<div class="boardTitle">
					서신함
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/messageList?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<ion-icon name="build-sharp" class="pageIcon"></ion-icon>
				<div class="boardTitle">
					회원정보 수정하기
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/updateMemberInfo?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<c:if test="${loginMember.getMemClass() eq '전문가'}">
				<div class="board">
					<ion-icon name="build-sharp" class="pageIcon"></ion-icon>
					<div class="boardTitle">
						전문가 정보 수정하기
					</div>
					<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/expertInfoModify?usid=${loginMember.usid}'">이동하기</button>
				</div>
			</c:if>
			<div class="board">
				<ion-icon name="clipboard-sharp" class="pageIcon"></ion-icon>
				<div class="boardTitle">
					상담 신청 내역
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/counselingRequest?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<c:if test="${loginMember.getMemClass() eq '전문가'}">
				<div class="board">
					<ion-icon name="clipboard-sharp" class="pageIcon"></ion-icon>
					<div class="boardTitle">
						상담한 내역
					</div>
					<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/exCounselingHistory?usid=${loginMember.usid}'">이동하기</button>
				</div>
			</c:if>
			<div class="board">
				<ion-icon name="clipboard-sharp" class="pageIcon"></ion-icon>
				<div class="boardTitle">
					상담 받은 내역
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/counselingHistory?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<ion-icon name="list-sharp" class="pageIcon"></ion-icon>
				<div class="boardTitle">
					나의 게시물 내역
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/myBoard?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<ion-icon name="heart-sharp" class="pageIcon"></ion-icon>
				<div class="boardTitle">
					좋아요 한 게시물
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/liked?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<ion-icon name="skull-sharp" class="pageIcon"></ion-icon>
				<div class="boardTitle">
					내 신고 내역
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/myReport?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<ion-icon src="${path}/resources/images/licenseIcon.svg" class="pageIcon"></ion-icon>
				<div class="boardTitle">
					전문가 신청하기	
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/applyExpertPage?usid=${loginMember.usid}'">이동하기</button>
			</div>
		</div>
	</div>
</div>