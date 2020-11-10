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
		<input type="text" class="form-control" name="notice_id" id="notice_id" value="${notice.notice_id }" readonly> 
		<input type="hidden" class="form-control" name="notice_admin_uisd" id="notice_admin_uisd" value="${notice.notice_admin_uisd }" > 
        <input type="text" class="form-control" name="notice_admin_nickname" value="${notice.notice_admin_nickname }" readonly required>
        <input type="text" class="form-control" name="notice_title" id="notice_title"  value="${notice.notice_title }" placeholder="제목"  required>
        <input type="text" class="form-control" name="notice_enrolldate" id="notice_enrolldate" value="${notice.notice_enrolldate }" readonly> 
       
		<c:forEach items="${noticeFile}" var="a" varStatus="vs">
              <img src="${path }/resources/upload/notice/${a.notice_file_name }">      
        </c:forEach> 
        
        <textarea class="form-control" name="notice_content" placeholder="내용" required><c:out value="${notice.notice_content }"/></textarea>
        <br>
        
        
        <button class="btn btn-outline-info" onclick="noticeViewModify('${notice.notice_id}');">수정하기</button>
        <button class="btn btn-outline-info" onclick="noticeViewDelete('${notice.notice_id}');">삭제하기</button>
        
        
        
    </div>

	
	</section>
	
	<script>
		function fileDownload(oriName, reName){
			oriName=encodeURIComponent(oriName);
			location.href="${path}/board/fileDown.do?oriName="+oriName+"&reName="+reName;
		}
		
		function noticeViewModify(notice_id){
			location.href="${path}/customer/customerNoticeModify?notice_id="+notice_id;
		}
				
		function noticeViewDelete(notice_id){
			 if (confirm("정말 삭제하시겠습니까?") == true){
				 location.href="${path}/customer/customerNoticeDelete?notice_id="+notice_id;
			 }else{  
			     return;
			 }
		}
		
		
		
	
	</script>
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
