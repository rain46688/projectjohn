<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<style>
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
			<a href="${path}/admin/adminMember">회원관리</a>
		</div>
		<div>
			<a href="${path}/admin/adminBeforeExpert">전문가관리</a>
		</div>
		<div>
			<a href="${path}/admin/adminExpertCounsel0">전문가 상담관리</a>
		</div>
		<div>
			<a href="${path}/admin/adminBoard">게시판관리</a>
		</div>
		<div>
			<a href="${path}/report/adminReport">신고관리</a>
		</div>
		<div>
			<a href="${path}/admin/adminChatRoom">1:1 문의답변</a>
		</div>

	</div>
</div>








