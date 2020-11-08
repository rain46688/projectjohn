<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value=" "/>
	
</jsp:include>
	
<section id="content" >
		           
		        <%-- <table id="tbl-board" class="table table-striped table-hover">
		            <tr>
		                <th>번호</th>
		                <th>제목</th>
		                <th>닉네임</th>
		                <th>날짜</th>
		                
		            </tr>
		            <c:forEach items="${list }" var="n">
		           <tr>
            		<td><c:out value="${n.notice_id }"/></td> 
            		<td><c:out value="${n.notice_admin_nickname }"/></td> 
            		<td><c:out value="${n.notice_title }"/></td> 
            		<td><c:out value="${n.notice_enrolldate }"/></td> 
            		
            	</tr>
		            </c:forEach>
		        </table> 
		        
	
		        
		       <div id="pageBar">
		        ${pageBar } 
		       </div> --%>
		      
		      </section>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
