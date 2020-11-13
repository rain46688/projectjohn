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
	
	<table class="table">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">이메일</th>
				<th scope="col">이름</th>
				<th scope="col">닉네임</th>
				<th scope="col">성별</th>
				<th scope="col">생일</th>
				<th scope="col">가입날짜</th>
				<th scope="col">포인트</th>
				<th scope="col">탈퇴여부</th>
				<th scope="col">구분</th>
				<th scope="col">전화번호</th>
			</tr>
			<c:if test="${empty list}">
			<tr>
				<td colspan="11">조회 결과가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="m" items="${list }">
				<tr>
					<td><c:out value="${m['usid']}"/></td>
					<td><c:out value="${m['memEmail']}"/></td>
					<td><c:out value="${m['memName']}"/></td>
					<td><c:out value="${m['memNickname']}"/></td>
					<td><c:out value="${m['gender'] eq 'M' ? 'M' : 'F' }"/></td>
					<td><c:out value="${m['birthday']}"/></td>
					<td><c:out value="${m['enrollDate']}"/></td>
					<td><c:out value="${m['point']}"/></td>
					<td><c:out value="${m['leaveMem']}"/></td>
					<td><c:out value="${m['memClass']}"/></td>
					<%-- <td><c:out value="${m['tel']}"/></td> --%>
				</tr>
			</c:forEach>
		</c:if>
		
		</table>
		
		     <div id="pageBar">
		        ${pageBar } 
		      </div>
		       
	
	</section>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
