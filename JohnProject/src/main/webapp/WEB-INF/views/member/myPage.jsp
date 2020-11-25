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
	background-color: white;
	width: 60%;
	margin: auto;
	padding: 10px;
	margin-bottom: 100px;
	border-radius: 10px;
}
div.board{
	max-width: 100%;
	border-top: black 1px solid;
}
div.board:last-child{
	border-bottom: black 1px solid;
}
div.boardTitle{
	font-size: 1.2rem;
	margin: 1%;
	width: 30%;
}
div.boardText{
	font-size: 1rem;
	margin: 1%;
}
div.boardTitle *, div.boardText *{
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
				<div class="boardTitle">
					서신함
				</div>
				<div class="boardText">
					다른 존경장님들과 주고 받은 서신을 확인할 수 있습니다.
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/messageList?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<div class="boardTitle">
					회원정보 수정하기
				</div>
				<div class="boardText">
					회원 정보를 수정할 수 있습니다.
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/updateMemberInfo?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<c:if test="${loginMember.getMemClass() eq '전문가'}">
				<div class="board">
					<div class="boardTitle">
						전문가 정보 수정하기
					</div>
					<div class="boardText">
						전문가 정보를 수정할 수 있습니다.
					</div>
					<button type="button" class="btn btn-outline-dark btn-sm">이동하기</button>
				</div>
				<div class="board">
					<div class="boardTitle">
						상담한 내역
					</div>
					<div class="boardText">
						상담 제공 내역 상세 페이지로 이동합니다.
					</div>
					<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/expertPage/counselingHistory?usid=${loginMember.usid}'">이동하기</button>
				</div>
			</c:if>
			<div class="board">
				<div class="boardTitle">
					나의 게시물 내역
				</div>
				<div class="boardText">
					내가 쓴 게시물 내역으로 이동합니다.
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/myBoard?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<div class="boardTitle">
					상담 신청 내역
				</div>
				<div class="boardText">
					상담 신청 내역 상세 페이지로 이동합니다.
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/counselingRequest?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<div class="boardTitle">
					상담 받은 내역
				</div>
				<div class="boardText">
					전문가에게 상담을 받은 내역 상세 페이지로 이동합니다.
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/counselingHistory?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<div class="boardTitle">
					좋아요 한 게시물
				</div>
				<div class="boardText">
					좋아요 한 게시물 목록으로 이동합니다.
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/liked?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<div class="boardTitle">
					내 신고 내역
				</div>
				<div class="boardText">
					신고한 내역 상세 페이지로 이동합니다.
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/myReport?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<div class="boardTitle">
					전문가 신청하기	
				</div>
				<div class="boardText">
					상담 전문가 신청 페이지로 이동합니다.
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/applyExpertPage?usid=${loginMember.usid}'">이동하기</button>
			</div>
		</div>
	</div>
</div>