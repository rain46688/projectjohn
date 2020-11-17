<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value=" "/>
	
</jsp:include>
	
	<section id="content">
	
	<table id="tbl-board" class="table table-striped table-hover">
		<tr>
			<th>전문가번호</th>
			<th>상담신청유저번호</th>
			<th>전문가닉네임</th>
			<th>상담신청유저닉네임</th>
			<th>상담완료유무</th>
			<th>상담신청날짜</th>
			<th>상담요구사항</th>
		
		</tr>
		<c:forEach items="${list }" var="ex">
			<tr>
				<td><c:out value="${ex.expertRequetExUsid }" /></td>
				<td><c:out value="${ex.expertRequestMemUsid }" /></td>
				<td><c:out value="${ex.expertRequetExNick }" /></td>
				<td><c:out value="${ex.expertRequestMemNick }" /></td>
				<td><c:out value="${ex.expertIscounsel }" /></td>
				<td><c:out value="${ex.expertDate}" /></td>
				<td><c:out value="${ex.expertCounselTime }" /></td>
				<td><c:out value="${ex.expertCounselRequire }" /></td>
			</tr>
		</c:forEach>
	</table>



	<div id="pageBar">${pageBar }</div>
	
	</section>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
