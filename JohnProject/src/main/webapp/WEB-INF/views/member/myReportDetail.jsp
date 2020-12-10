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
	<jsp:param name="title" value=""/>
</jsp:include>
<style>
	#content *{
		font-family: 'Noto Serif KR', serif;
	}
	div#reportWrapper{
		overflow: auto;
		margin: 100px auto;
		text-align: left;
	}
	div#reportTitle{
		width: 70%;
		margin: 0 auto;
		display: grid;
		grid-template-columns: 20% 80%;
		grid-auto-rows: minmax(20px, auto);
		row-gap: 5px;
	}
	div.reportLeft{
		padding: 0.5rem;
		background-color: #003478;
		color: #ffcc66;
		padding-left: 1rem;
		border-top-left-radius: 0.5rem;
		border-bottom-left-radius: 0.5rem;
	}
	div.reportRight{
		padding: 0.5rem;
		background-color: white;
		color: #003478;
		padding-left: 1rem;
		border-top-right-radius: 0.5rem;
		border-bottom-right-radius: 0.5rem;
	}
	div#reportText{
		width: 70%;
		margin: 0 auto;
	}
	div.reportTop{
		margin-top: 5px;
		padding: 0.5rem;
		background-color: #003478;
		color: #ffcc66;
		padding-left: 1rem;
		border-top-left-radius: 0.5rem;
		border-top-right-radius: 0.5rem;
	}
	div.reportBottom{
		padding: 0.5rem;
		background-color: white;
		color: #003478;
		padding-left: 1rem;
		border-bottom-left-radius: 0.5rem;
		border-bottom-right-radius: 0.5rem;
	}
</style>
<section id="content">
	<div id="reportWrapper">
		<div id="reportTitle">
			<div class="reportLeft">
				신고 타입
			</div>
			<div class="reportRight">
				${report.reportType}
			</div>
			<div class="reportLeft">
				신고 제목
			</div>
			<div class="reportRight">
				${report.reportTitle}
			</div>
			<div class="reportLeft">
				신고 대상
			</div>
			<div class="reportRight">
				${report.reportTargetNickname}
			</div>
			<div class="reportLeft">
				신고 날짜
			</div>
			<div class="reportRight">
				<fmt:formatDate value="${report.reportDate}" pattern="yyyy-MM-dd HH:mm"/>
			</div>
			<div class="reportLeft">
				신고 처리 여부
			</div>
			<div class="reportRight">
				<c:choose>
					<c:when test="${report.reportIscheck eq true}">처리</c:when>
					<c:otherwise>미처리</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div id="reportText">
			<div class="reportTop">
				신고 내용
			</div>
			<div class="reportBottom">
				${report.reportContent}
			</div>
			<div class="reportTop">
				관리자 답변
			</div>
			<div class="reportBottom">
				${report.reportAnswer}
			</div>
		</div>
	</div>
</section>
</body>
</html>