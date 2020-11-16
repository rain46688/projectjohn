<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="likedPage"/>
</jsp:include>
	<section id="content">
		<div>
			<div>
				세부 카테고리
			</div>
			<div>
				제목
			</div>
			<div>
				날짜
			</div>
			<div>
				조회수
			</div>
			<div>
				종료여부
			</div>
		</div>
		<div>
			<c:forEach var="liked" items="${liked}">
				<div>
					<c:out value="${liked.smallCategory}"/>
				</div>
				<div>
					<a>
						<c:out value="${liked.title}"/>
					</a>
				</div>
				<div>
					<c:out value="${liked.enrollDate}"/>
				</div>
				<div>
					<c:out value="${liked.hit}"/>
				</div>
				<div>
					<c:choose>
						<c:when test="${liked.isclose eq true }">종료됨</c:when>
						<c:otherwise>진행중</c:otherwise>
					</c:choose>
				</div>
			</c:forEach>
		</div>
		<div>
			${pageBar}
		</div>	
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>









