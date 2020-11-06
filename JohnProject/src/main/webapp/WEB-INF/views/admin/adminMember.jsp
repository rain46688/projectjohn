<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value="adminMember"/>
	
</jsp:include>


	<section id="content">
	
	
	<form id="operForm" >
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
			</tr>
			
			<c:forEach items="${list }" var="m">
				<tr>
					<td><c:out value="${m.usid}"/></td>
					<td><c:out value="${m.mem_email}"/></td>
					<td><c:out value="${m.mem_name}"/></td>
					<td><c:out value="${m.mem_nickname}"/></td>
					<td><c:out value="${m.gender}"/></td>
					<td><c:out value="${m.birthday}"/></td>
					<td><c:out value="${m.enroll_date}"/></td>
					<td><c:out value="${m.point}"/></td>
					<td><c:out value="${m.leave_mem}"/></td>
					<td><c:out value="${m.mem_class}"/></td>

				</tr>
			</c:forEach>
			
		</table>
		
		     <div id="pageBar">
		        ${pageBar } 
		      </div>
		       
		       
		</form>
	</section>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
