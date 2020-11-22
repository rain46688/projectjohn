<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="counselingHistory"/>
</jsp:include>
	<section id="content">
		<div>
			<div>
				<div>
					상담 날짜
				</div>
				<div>
					상담사 닉네임
				</div>
				<div>
					상담 결과
				</div>
				<div>
					상담 평점
				</div>
				<div>
					상담 후기
				</div>
			</div>
			<div>
				<c:forEach var="expertBoardList" items="${expertBoardList}">
					<div>
						<c:out value="${expertBoardList.expertBoardDate}"/>
					</div>
					<div>
						<c:out value="${expertBoardList.expertBoardExNick}"/>
					</div>
					<div>
						<c:out value="${expertBoardList.expertBoardAdviceResult}"/>
					</div>
					<div>
						<c:out value="${expertBoardList.expertBoardRating}"/>
					</div>
					<div>
						<c:out value="${expertBoardList.expertBoardReview}"/>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>









