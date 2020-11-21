<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<style>
#side {
	border-bottom-left-radius: 30px;
	border-top-left-radius: 30px;
	overflow: auto;
	width: 18%;
	height: 100%;
	background-color: #00316D;
	display: flex;
	flex-direction: column;
	align-items: center;
	/* background-image: url('${path}/resources/images/logo_dot.png');
	    background-repeat: repeated; */
	opcaity: 0.5;
}

/* #side::before {
		content:"";
		background-image:url('${path}/resources/images/logo_dot.png');
		background-repeat: repeated;
		position: absolute;
		top: 0px;
		right: 0px;
		bottom: 0px;
		left: 0px;
		opacity: 0.75;
	} */
#side ::-webkit-scrollbar {
	background-color: #05135C;
	width: 4px;
}

#side::-webkit-scrollbar-track {
	background-color: #05135C;
}

#container_logo {
	margin-top: 0;
	display: flex;
	justify-content: center;
	background-color: #00316D;
}

#menu, a {
	margin-top: 1em;
	color: white;
	font-size: 1em;
	/* border:1px solid red; */
	width: 100%;
}

.menusOnSide {
	cursor: pointer;
	padding-bottom: 0.5em;
	padding-top: 0.5em;
	width: 100%;
	/* border:1px solid red; */
}

.menusOnSide:hover {
	background-color: #0054BA;
}

.menuImages {
	width: 1.5em;
	height: 1.5em;
	margin-right: 2em;
	margin-left: 2em;
	margin-top: 0;
	padding-bottom: 0.1em;
	/* border:1px solid red; */
}

#sidebar_logo {
	width: 80%;
}
</style>


<div id="side">
	<div id="container_logo">
		<a href="${path }/board/boardList" id="anchor_logo"> <img
			src="${path}/resources/images/logo_long_black.png" id="sidebar_logo"
			alt="로고">
		</a>
	</div>
	<div id="menu">
		<div class="menusOnSide">
			<a href="${path}/admin/adminMember"> <img class="menuImages"
				src="${path}/resources/images/home.png">회원관리
			</a> 
		</div>
		<div class="menusOnSide">
			<a href="${path}/admin/adminBeforeExpert"> <img class="menuImages"
				src="${path}/resources/images/home.png">전문가관리
			</a>
		</div>
		<div class="menusOnSide">
			<a href="${path}/admin/adminExpertCounsel0"> <img class="menuImages"
				src="${path}/resources/images/home.png">전문가 상담관리
			</a>
		</div>
		<div class="menusOnSide">
			<a href="${path}/admin/adminBoard"> <img class="menuImages"
				src="${path}/resources/images/home.png">게시판관리
			</a>
		</div>
		<div class="menusOnSide">
			<a href="${path}/report/adminReport"> <img class="menuImages"
				src="${path}/resources/images/home.png">신고관리
			</a>
		</div>
		<div class="menusOnSide">
			<a href="${path}/admin/adminChatRoom"> <img class="menuImages"
				src="${path}/resources/images/home.png">1:1 문의답변
			</a>
		</div>

	</div>
</div>








