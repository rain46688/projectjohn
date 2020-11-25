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
	<jsp:param name="title" value="myReport"/>
</jsp:include>
<style>
	#content *{
		font-family: 'Noto Serif KR', serif;
	}
	div#container{
		overflow: auto;
		margin: 100px auto;
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
				신고 타입
			</div>
			<div class="titleInner">
				신고 제목
			</div>
			<div class="titleInner">
				신고 대상
			</div>
			<div class="titleInner">
				신고 일시
			</div>
			<div class="titleInner lastTitle">
				신고 처리 여부
			</div>
		</div>
		<div id="textContainer">
			<c:forEach var="myReport" items="${myReport}">
				<div class="textInner firstText">
					<c:out value="${myReport.reportType}"/>
				</div>
				<div class="textInner">
					<a href="${path}/member/myPage/myReportDetail?reportId=${myReport.reportId}&usid=${loginMember.usid}">
						<c:out value="${myReport.reportTitle}"/>
					</a>
				</div>
				<div class="textInner">
					<c:out value="${myReport.reportTargetNickname}"/>
				</div>
				<div class="textInner">
					<fmt:formatDate value="${myReport.reportDate}" pattern="yyyy-MM-dd HH:mm"/>
				</div>
				<c:choose>
					<c:when test="${myReport.reportIscheck eq true}">
						<div class="textInner lastText">
							처리
						</div>
					</c:when>
					<c:otherwise>
						<div class="textInner lastText">
							미처리
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<div id="pageBar">
			${pageBar}
		</div>
	</div>
</section>









