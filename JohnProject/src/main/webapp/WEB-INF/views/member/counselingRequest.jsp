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
	<jsp:param name="title" value="counselingRequest"/>
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
	.page-item.active .page-link { /*현재피이지*/
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
				상담 신청 날짜
			</div>
			<div class="titleInner">
				전문가 닉네임
			</div>
			<div class="titleInner">
				상담 희망 시간
			</div>
			<div class="titleInner">
				상담 요구사항
			</div>
			<div class="titleInner lastTitle">
				상담 완료 여부
			</div>
		</div>
		<div id="textContainer">
			<c:choose>
				<c:when test="${requestList eq null}">
					<div>
						상담 신청 내역이 존재하지 않습니다.
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="requestList" items="${requestList}">
						<div class="textInner firstText">
							<c:out value="${requestList.expertDate}"/>
						</div>
						<div class="textInner">
							<c:out value="${requestList.expertRequetExNick}"/>
						</div>
						<div class="textInner">
							<c:out value="${requestList.expertCounselTime}"/>
						</div>
						<div class="textInner">
							<c:out value="${requestList.expertCounselRequire}"/>
						</div>
						<c:choose>
							<c:when test="${requestList.expertIscounsel == 1}">
								<div class="textInner lastText">상담완료</div>
							</c:when>
							<c:otherwise>
								<div class="textInner lastText">상담대기</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="pageBar">
			${pageBar}
		</div>
	</div>
</section>









