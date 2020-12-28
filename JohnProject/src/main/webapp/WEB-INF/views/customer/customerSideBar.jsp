<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
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
	color:white;
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
		<a href="${path }/board/boardList" id="anchor_logo" id="aa" class="menuLink"> <img
			src="${path}/resources/images/logo_long_black.png" id="sidebar_logo"
			alt="로고">
		</a>
	</div>
	<div id="menu">
			<%-- <a href="${path}/report/customerReport" id="aa" class="menuLink">  --%>
			<a href="#" id="aa" class="menuLink">
		<div class="menusOnSide">
			<img src="${path }/resources/images/admin/siren (1).png"
				class="menuImages">신고하기
		</div>
			</a>
			
			<a href="${path}/customer/customerNotice" id="aa" class="menuLink"> 
		<div class="menusOnSide">
			<img src="${path }/resources/images/admin/notice(1).png"
				class="menuImages">공지사항
		</div>
			</a>
			
			<a href="${path}/customer/customerFaq" id="aa" class="menuLink"> 
		<div class="menusOnSide">
			 <img class="menuImages"
				src="${path }/resources/images/admin/faq(1).png"/>FAQ
		</div>
			</a>
		
			<a href="${path}/customer/customerChat?adminUsid=31&myUsid=${loginMember.usid }" id="aa" class="menuLink"> 
		<div class="menusOnSide">
			<img class="menuImages"
				src="${path }/resources/images/admin/message.png"/>1:1문의하기
		</div>
			</a>

	</div>
</div>










