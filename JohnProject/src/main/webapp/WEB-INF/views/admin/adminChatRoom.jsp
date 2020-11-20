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
					<th>번호</th>
					<th>날짜</th>
				</tr>
				 <c:if test="${empty memberInfoList}">
					<tr>
						<td colspan="9">조회 결과가 없습니다.</td>
					</tr>
				</c:if>
				 <c:if test="${not empty memberInfoList }">
					<c:forEach var="memberInfoList" items="${memberInfoList }">
						<tr>
							<td><a href="${path }/admin/adminChat?adminUsid=31&memberUsid=${memberInfoList.memberUsid}"><c:out value="${memberInfoList.memberUsid}"/></a></td>
							<td><c:out value="${memberInfoList.memberUsid}"/></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		       
	</section>
	
	
