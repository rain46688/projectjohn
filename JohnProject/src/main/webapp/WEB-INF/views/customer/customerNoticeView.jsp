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
		<input type="text" class="form-control" name="notice_id" id="noticeId" value="${notice.noticeId }" readonly> 
		<input type="hidden" class="form-control" name="noticeAdminUisd" id="noticeAdminUisd" value="${notice.noticeAdminUisd }" > 
        <input type="text" class="form-control" name="noticeAdminNickname" value="${notice.noticeAdminNickname }" readonly required>
        <input type="text" class="form-control" name="noticeTitle" id="noticeTitle"  value="${notice.noticeTitle }" placeholder="제목"  required>
        <input type="text" class="form-control" name="noticeEnrolldate" id="noticeEnrolldate" value="${notice.noticeEnrolldate }" readonly> 
       
		<c:forEach items="${noticeFile}" var="a" varStatus="vs">
              <img src="${path }/resources/upload/notice/${a.noticeFileName }">      
        </c:forEach> 
        
        <textarea class="form-control" name="noticeContent" placeholder="내용" required><c:out value="${notice.noticeContent }"/></textarea>
        <br>
        
        
        <button class="btn btn-outline-info" onclick="noticeViewModify('${notice.noticeId}');">수정하기</button>
        <button class="btn btn-outline-info" onclick="noticeViewDelete('${notice.noticeId}');">삭제하기</button>
        
    </div>

	
	</section>
	
	<script>
		function fileDownload(oriName, reName){
			oriName=encodeURIComponent(oriName);
			location.href="${path}/board/fileDown.do?oriName="+oriName+"&reName="+reName;
		}
		
		function noticeViewModify(noticeId){
			location.href="${path}/customer/customerNoticeModify?noticeId="+noticeId;
		}
				
		function noticeViewDelete(noticeId){
			 if (confirm("정말 삭제하시겠습니까?") == true){
				 location.href="${path}/customer/customerNoticeDelete?noticeId="+noticeId;
			 }else{  
			     return;
			 }
		}
		
	</script>
	
	

	
