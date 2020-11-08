<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="title" value=" " />

</jsp:include>

<section id="content">

	<table id="tbl-board" class="table table-striped table-hover">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>닉네임</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>대분류</th>
			<th>소분류</th>
			<th>종료여부</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="9">조회 결과가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="b" items="${list }">
				<tr>
					<td><c:out value="${b['board_id']}" /></td>
					<td><c:out value="${b['writer_usid']}" /></td>
					<td><c:out value="${b['writer_nickname']}" /></td>
					<td><c:out value="${b['title']}" /></td>
					<td><c:out value="${b['enroll_date']}" /></td>
					<td><c:out value="${b['hit']}" /></td>
					<td><c:out value="${b['big_category']}" /></td>
					<td><c:out value="${b['small_category']}" /></td>
					<td><c:out value="${b['isclose']}" /></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	<div id="pageBar">${pageBar }</div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

