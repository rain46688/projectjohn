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
		<input type="text" class="form-control" name="noticeId" id="noticeId" value="${notice.noticeId }" readonly> 
        <input type="text" class="form-control" value="${notice.noticeTitle }" placeholder="제목" name="noticeTitle" id="noticeTitle"  required>
        <input type="text" class="form-control" name="noticeAdminNickname" value="${notice.noticeAdminNickname }" readonly required>
		<c:forEach items="${noticeFile }" var="a" varStatus="vs">
                    <button type="button" 
                    class="btn btn-outline-info btn-block"
                    onclick="fileDownload('${a.originalFilename});">
                    	<c:out value="첨부파일  ${vs.count } - ${a.originalFilename }"/>
           			</button>
        </c:forEach>
        
        <textarea class="form-control" name="noticeContent" placeholder="내용" required><c:out value="${notice.noticeContent }"/></textarea>
        <br>
        
        <input type="submit" value="수정완료">
        <input type="reset" value="취소">
        
        </form>
        
        </div>
        
	</section>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
