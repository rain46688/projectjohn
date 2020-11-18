<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
	/* 
		추후 업데이트 : 
		스크롤바 커스터마이징
		스크롤시 로고 fixed
	 */
	#side {
	    border-bottom-left-radius: 7.5px;
	    border-top-left-radius: 7.5px;
	    overflow: auto;
	    width: 18%;
	    height: 100%;
	    background-color:#05135C;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	}
	
	#side ::-webkit-scrollbar {
		background-color: #05135C;
		width: 4px;
	}
	
	#side::-webkit-scrollbar-track {
		background-color: #05135C;
	}
	
	#container_logo {
		border:1px solid red;
	}
	
	#menu {
		margin-top:1em;
		color: white;
		font-size: 1em;
		/* border:1px solid red; */
		width:100%;
	}
	
	.menusOnSide {
		cursor:pointer;
		padding-bottom: 0.5em;
		padding-top: 0.5em;
		width:100%;
		/* border:1px solid red; */
	}
	
	.menusOnSide:hover {
		background-color: #384F9C;
	}
	
	.menuImages {
		width:1.5em;
		height:1.5em;
		margin-right:2em;
		margin-left:1em;
		margin-top:0;
		padding-bottom:0.1em;
		/* border:1px solid red; */
	}
</style>
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
			<a href="${path}/member/myPage/expertCounsel?usid=${loginMember.usid}">전문가 상담 내역</a>
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
		<div>
			<a href="${path}/member/myPage/messageList?usid=${loginMember.usid}">서신함</a>
		</div>
	</div>
</div>