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
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
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
			<button type="button" onclick="location.href='${path}/member/myPage/expertCounsel?usid=${loginMember.usid}'">이동하기</button>
		</div>
		<div>
			좋아요 한 게시물
			<button type="button" onclick="location.href='${path}/member/myPage/liked?usid=${loginMember.usid}'">이동하기</button>
		</div>
		<div>
			내 신고 내역
			<button type="button" onclick="location.href='${path}/member/myPage/myReport?usid=${loginMember.usid}'">이동하기</button>
		</div>
		<div>
			전문가 신청하기
			<button type="button" onclick="location.href='${path}/member/myPage/applyExpertPage?usid=${loginMember.usid}'">이동하기</button>
		</div>
		<div>
			서신함
			<button type="button" onclick="location.href='${path}/member/myPage/messageList?usid=${loginMember.usid}'">이동하기</button>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>