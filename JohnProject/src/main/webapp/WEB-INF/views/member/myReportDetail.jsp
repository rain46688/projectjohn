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
		border: 1px red solid;
	}
	div#reportTitle{
		display: grid;
		grid-template-columns: ;
	}
	div.left{
		background-color: #003478;
		color: white;
	}
	div.right{
		background-color: white;
		color: #003478;
	}
</style>
<section id="content">
	<div id="reportWrapper">
		<div id="reportTitle">
			<div class="left">
				신고 타입
			</div>
			<div class="right">
				${report.reportType}
			</div>
			<div class="left">
				신고 제목
			</div>
			<div class="right">
				${report.reportTitle}
			</div>
			<div class="left">
				신고 대상
			</div>
			<div class="right">
				${report.reportTargetNickname}
			</div>
			<div class="left">
				신고 날짜
			</div>
			<div class="right">
				${report.reportDate}
			</div>
			<div class="left">
				신고 처리 여부
			</div>
			<div class="right">
				<c:choose>
					<c:when test="${report.reportIscheck eq true}">처리</c:when>
					<c:otherwise>미처리</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div id="reportText">
			<div>
				신고 내용
			</div>
			<div>
				${report.reportContent}
			</div>
			<div>
				관리자 답변
			</div>
			<div>
				${report.reportAnswer}
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>









