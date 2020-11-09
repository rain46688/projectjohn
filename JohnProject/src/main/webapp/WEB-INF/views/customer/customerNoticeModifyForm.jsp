<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value=" "/>
	
</jsp:include>
	
	<style>
	    div#board-container{width:400px; margin:0 auto; text-align:center;}
	    div#board-container input,div#board-container button{margin-bottom:15px;}
	    div#board-container label.custom-file-label{text-align:left;}
    </style>
    
	<section id="content">
		<div id="board-container">
		<h1>게시판상세화면</h1>
		
		<form name="customerNoticeModifyFrm" action="${path }/customer/customerNoticeModifyEnd" method="post">
		<input type="text" class="form-control" name="notice_id" id="notice_id" value="${notice.notice_id }" readonly> 
        <input type="text" class="form-control" value="${notice.notice_title }" placeholder="제목" name="notice_title" id="notice_title"  required>
        <input type="text" class="form-control" name="notice_admin_nickname" value="${notice.notice_admin_nickname }" readonly required>
		<c:forEach items="${noticeFile }" var="a" varStatus="vs">
                    <button type="button" 
                    class="btn btn-outline-info btn-block"
                    onclick="fileDownload('${a.originalFilename});">
                    	<c:out value="첨부파일  ${vs.count } - ${a.originalFilename }"/>
           			</button>
        </c:forEach>
        
        <textarea class="form-control" name="notice_content" placeholder="내용" required><c:out value="${notice.notice_content }"/></textarea>
        <br>
        
        <input type="submit" value="수정완료">
        <input type="reset" value="취소">
        
        </form>
        
        </div>
        
	</section>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
