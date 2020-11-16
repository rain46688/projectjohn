<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
	<section id="content">
		<div>
			신고 타입
		</div>
		<div>
			${report.reportType}
		</div>
		<div>
			신고 제목
		</div>
		<div>
			${report.reportTitle}
		</div>
		<div>
			신고 대상
		</div>
		<div>
			${report.reportTargetNickname}
		</div>
		<div>
			신고 날짜
		</div>
		<div>
			${report.reportDate}
		</div>
		<div>
			신고 처리 여부
		</div>
		<div>
			<c:choose>
				<c:when test="${report.reportIscheck eq true}">처리</c:when>
				<c:otherwise>미처리</c:otherwise>
			</c:choose>
		</div>
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
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>









