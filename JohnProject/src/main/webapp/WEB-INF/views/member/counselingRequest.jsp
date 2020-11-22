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
			<div>
				상담 신청 날짜
			</div>
			<div>
				전문가 닉네임
			</div>
			<div>
				상담 희망 시간
			</div>
			<div>
				상담 요구사항
			</div>
			<div>
				상담 완료 여부
			</div>
		</div>
		<div>
			<c:choose>
				<c:when test="${requestList eq null}">
					<div>
						상담 신청 내역이 존재하지 않습니다.
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="requestList" items="${requestList}">
						<div>
							<c:out value="${requestList.expertDate}"/>
						</div>
						<div>
							<c:out value="${requestList.expertRequetExNick}"/>
						</div>
						<div>
							<c:out value="${requestList.expertCounselTime}"/>
						</div>
						<div>
							<c:out value="${requestList.expertCounselRequire}"/>
						</div>
						<c:choose>
							<c:when test="${requestList.expertIscounsel == 1}">
								<div>상담완료</div>
							</c:when>
							<c:otherwise>
								<div>상담대기</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>









