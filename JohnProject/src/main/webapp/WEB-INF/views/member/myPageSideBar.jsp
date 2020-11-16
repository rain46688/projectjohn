<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

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
			<a href="${path}/member/myPage/myBoard?usid=${loginMember.usid}">나의 게시물 내역</a>
		</div>
		<div>
			<a href="${path}/member/expertCounsel">전문가 상담 내역</a>
		</div>
		<div>
			<a href="${path}/member/myPage/liked?usid=${loginMember.usid}">좋아요 한 게시물</a>
		</div>
		<div>
			<a href="${path}/member/myPage/myReport?usid=${loginMember.usid}">내 신고 내역</a>
		</div>
		<div>
			<a href="${path}/member/myPage/applyExpertPage?usid=${loginMember.usid}">전문가 신청하기</a>
		</div>
	</div>
</div>