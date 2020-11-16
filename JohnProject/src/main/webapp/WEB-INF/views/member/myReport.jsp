<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="myReportPage"/>
</jsp:include>
	<section id="content">
		<div>
			<div>
				신고 타입
			</div>
			<div>
				신고 제목
			</div>
			<div>
				신고 대상
			</div>
			<div>
				신고 날짜
			</div>
			<div>
				신고 처리 여부
			</div>
		</div>
		<div>
			<c:forEach var="myReport" items="${myReport}">
				<div>
					<c:out value="${myReport.reportType}"/>
				</div>
				<div>
					<a href="${path}/member/myPage/myReportDetail?reportId=${myReport.reportId}&usid=${loginMember.usid}">
						<c:out value="${myReport.reportTitle}"/>
					</a>
				</div>
				<div>
					<c:out value="${myReport.reportTargetNickname}"/>
				</div>
				<div>
					<c:out value="${myReport.reportDate}"/>
				</div>
				<div>
					<c:choose>
						<c:when test="${myReport.reportIscheck eq true}">처리</c:when>
						<c:otherwise>미처리</c:otherwise>
					</c:choose>
				</div>
			</c:forEach>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>









