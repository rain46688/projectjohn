<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<style>

  #aa:link { text-decoration: none; color: white;} 
  #aa:visited { text-decoration: none; color: white;}
  #aa:active { text-decoration: none; color: white;}
  #aa:hover {text-decoration:none; color: white;}
  
#side {
	font-family: 'Noto Serif KR', serif;
	background-image: url("${path}/resources/images/sideBarPattern.png");
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
	padding-bottom: 1em;
	padding-top: 1em;
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

/* a.menuLink{
	color: white;
	width: 100%;
	padding: 0;
	margin: 0.5rem auto;
}
a.menuLink:hover{
	color: white;
} */
</style>


<div id="side">
	<div id="container_logo">
		<a href="${path }/board/boardList" id="anchor_logo" class="menuLink"> <img
			src="${path}/resources/images/logo_long_black.png" id="sidebar_logo"
			alt="로고">
		</a>
	</div>
	<div id="menu">
	<a href="${path}/admin/adminMember"id="aa" class="menuLink"> 
		<div class="menusOnSide">
			<img src="${path }/resources/images/admin/personicon(1).png"
			class="menuImages">회원관리
		</div>
			</a>
			<a href="${path}/admin/adminBeforeExpert"id="aa" class="menuLink">
		<div class="menusOnSide">
			<img src="${path }/resources/images/admin/expert(1).png"
			class="menuImages"> 전문가관리
		</div>
			</a>
			<a href="${path}/admin/adminExpertCounsel0"id="aa" class="menuLink"> 
		<div class="menusOnSide">
			<img src="${path }/resources/images/admin/expertcounsel(1).png"
			class="menuImages">전문가 상담관리
		</div>
			</a>
			<a href="${path}/admin/adminBoard"id="aa" class="menuLink"> 
		<div class="menusOnSide">
			<img src="${path }/resources/images/admin/board(1).png"
			class="menuImages">게시판관리
		</div>
			</a>
			<a href="${path}/admin/adminReport"id="aa" class="menuLink"> 
		<div class="menusOnSide">
			<img src="${path }/resources/images/admin/siren (1).png"
			class="menuImages">신고관리
		</div>
			</a>
			<a href="${path}/admin/adminChatRoom"id="aa" class="menuLink"> 
		<div class="menusOnSide">
			<img class="menuImages"
			src="${path }/resources/images/admin/message.png"/>1:1 문의답변
		</div>
			</a>

	</div>
</div>








