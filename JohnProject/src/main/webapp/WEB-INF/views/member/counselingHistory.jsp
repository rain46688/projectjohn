<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<head>
	<!-- 글씨체 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="counselingHistory"/>
</jsp:include>
<style>
	#content *{
		font-family: 'Noto Serif KR', serif;
	}
	div#container{
		overflow: auto;
		margin: 50px auto;
		text-align: center;
	}
	div#titleContainer{
		width: 70%;
		margin: 0 auto;
		margin-bottom: 2px;
		display: grid;
		grid-template-columns: repeat(5, 1fr);
		grid-auto-rows: minmax(20px, auto);
	}
	div.titleInner{
		padding: 0.5rem;
		background-color: #003478;
		color: #ffcc66;
	}
	div.firstTitle{
		border-top-left-radius: 0.5rem;
		border-bottom-left-radius: 0.5rem;
	}
	div.lastTitle{
		border-top-right-radius: 0.5rem;
		border-bottom-right-radius: 0.5rem;
	}
	div#textContainer{
		overflow: auto;
		width: 70%;
		margin: 0 auto;
		margin-bottom: 5rem;
		display: grid;
		grid-template-columns: repeat(5, 1fr);
		grid-auto-rows: minmax(20px, auto);
		row-gap: 2px;
	}
	div.textInner{
		padding: 0.5rem;
		background-color: white;
		color: #003478;
	}
	div.firstText{
		border-top-left-radius: 0.5rem;
		border-bottom-left-radius: 0.5rem;
	}
	div.lastText{
		border-top-right-radius: 0.5rem;
		border-bottom-right-radius: 0.5rem;
	}
	div#pageBar{
		width: 20%;
		margin: 0 auto;
		display: grid;
	}
	/*페이지바*/
	.page-item.active .page-link { /*현재페이지*/
		background-color: #003478;
		color: #ffcc66;
		border: none;
	}
	.page-link{
		color: #003478;
	}
	.pagination a:hover:not(.active) { /*호버*/
		background-color: #ffcc66;
		color: #003478;
	}
</style>
<section id="content">
	<div id="container">
		<div id="titleContainer">
			<div class="titleInner firstTitle">
				상담 날짜
			</div>
			<div class="titleInner">
				상담사 닉네임
			</div>
			<div class="titleInner">
				상담 결과
			</div>
			<div class="titleInner">
				상담 평점
			</div>
			<div class="titleInner lastTitle">
				상담 후기
			</div>
		</div>
		<div id="textContainer">
			<c:forEach var="expertBoardList" items="${expertBoardList}">
				<div class="textInner firstText">
					<c:out value="${expertBoardList.expertBoardDate}"/>
				</div>
				<div class="textInner">
					<c:out value="${expertBoardList.expertBoardExNick}"/>
				</div>
				<div class="textInner">
					<c:out value="${expertBoardList.expertBoardAdviceResult}"/>
				</div>
				<div class="textInner">
					<c:out value="${expertBoardList.expertBoardRating}"/>
				</div>
				<div class="textInner lastText">
					<c:out value="${expertBoardList.expertBoardReview}"/>
				</div>
			</c:forEach>
		</div>
		<div id="pageBar">
			${pageBar}
		</div>
	</div>
</section>









