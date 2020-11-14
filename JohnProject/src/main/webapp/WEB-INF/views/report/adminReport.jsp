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
		                <th>신고유형</th>
		                <th>제목</th>
		                <th>날짜</th>
		                <th>처리유무</th>
		                <th>신고자 닉네임</th>
		                <th>피신고자 닉네임</th>
		                <th>경고</th>
		            </tr>
		            
		            <c:forEach items="${list }" var="r">
		           <tr>
            		<td><c:out value="${r.reportId }"/></td> 
            		<td><c:out value="${r.reportType }"/></td> 
            		<td><a href="${path }/report/adminReportView?reportId=${r.reportId }"><c:out value="${r.reportTitle }"/></a></td> 
            		<td><c:out value="${r.reportDate }"/></td> 
            		<td><c:out value="${r.reportIscheck }"/></td> 
            		<td><c:out value="${r.reportUserNickname }"/></td> 
            		<td><c:out value="${r.reportTargetNickname }"/></td> 
            		<td><c:out value="${r.reportIswarning }"/></td> 
            	</tr>
		            </c:forEach>
		        </table> 
		        
	
		        
		       <div id="pageBar">
		        ${pageBar } 
		       </div>
		      
		      
	</section>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
