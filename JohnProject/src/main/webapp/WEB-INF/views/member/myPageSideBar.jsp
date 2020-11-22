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
	    /* background-image: url('${path}/resources/images/logo_dot.png');
	    background-repeat: repeated; */
	    opcaity:0.5;
	}
	
	#side ::-webkit-scrollbar {
		background-color: #05135C;
		width: 4px;
	}
	
	#side::-webkit-scrollbar-track {
		background-color: #05135C;
	}
	
	#sidebar_logo{
    	width: 80%;
	}
	
	#menu {
		margin-top:1em;
		color: white;
		font-size: 1em;
		/* border:1px solid red; */
		width:100%;
	}
	
</style>
<div id="side">
	<div id="container_logo">
		<a href="${path }/board/boardList" id="anchor_logo"> <img src="${path}/resources/images/logo_long_black.png" id="sidebar_logo" alt="로고">
		</a>
	</div>
	<div id="menu">
		<div class="menuLink nav-link">
			<a href="${path}/member/myPage?usid=${loginMember.usid}">마이페이지 홈</a>
		</div>
		<div class="menuLink nav-link">
			<a href="${path}/member/myPage/updateMemberInfo?usid=${loginMember.usid}">회원정보 수정하기</a>
		</div>
		<c:if test="${loginMember.getMemClass() eq '전문가'}">
			<div class="menuLink nav-link">
				<a href="#">민수의 무언가가 들어갈 곳(전문가 info)</a>
			</div>
			<div class="menuLink nav-link">
				<a href="${path}/member/expertPage/counselingHistory?usid=${loginMember.usid}">상담한 내역</a>
			</div>
		</c:if>
		<div class="menuLink nav-link">
			<a href="${path}/member/myPage/myBoard?usid=${loginMember.usid}">나의 게시물 내역</a>
		</div>
		<div class="menuLink nav-link">
			<a href="${path}/member/myPage/liked?usid=${loginMember.usid}">좋아요 한 게시물</a>
		</div>
		<div class="menuLink nav-link">
			<a href="${path}/member/myPage/counselingRequest?usid=${loginMember.usid}">상담 신청 내역</a>
		</div>
		<div class="menuLink nav-link">
			<a href="${path}/member/myPage/counselingHistory?usid=${loginMember.usid}">전문가 상담 내역</a>
		</div>
		<div class="menuLink nav-link">
			<a href="${path}/member/myPage/myReport?usid=${loginMember.usid}">내 신고 내역</a>
		</div>
		<div class="menuLink nav-link">
			<a href="${path}/member/myPage/applyExpertPage?usid=${loginMember.usid}">전문가 신청하기</a>
		</div>
		<div class="menuLink nav-link">
			<a href="${path}/member/myPage/messageList?usid=${loginMember.usid}">서신함</a>
		</div>
	</div>
</div>