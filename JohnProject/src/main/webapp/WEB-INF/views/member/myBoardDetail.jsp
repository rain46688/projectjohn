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
			세부 카테고리
		</div>
		<div>
			${board.smallCategory}
		</div>
		<div>
			제목
		</div>
		<div>
			${board.title}
		</div>
		<div>
			날짜
		</div>
		<div>
			${board.enrollDate}
		</div>
		<div>
			조회수
		</div>
		<div>
			${board.hit}
		</div>
		<div>
			종료여부
		</div>
		<div>
			<c:choose>
				<c:when test="${board.isclose eq true }">종료됨</c:when>
				<c:otherwise>진행중</c:otherwise>
			</c:choose>
		</div>
		<div>
			내용
		</div>
		<div>
			${board.content}
		</div>
	</section>
</body>
</html>









