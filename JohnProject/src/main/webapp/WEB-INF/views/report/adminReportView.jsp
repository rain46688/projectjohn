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
		<input type="text" class="form-control" name="report_id" id="report_id" value="${report.report_id }" readonly> 
		<input type="text" class="form-control" name="report_board_id" id="report_board_id" value="${report.report_board_id }" > 
        <input type="text" class="form-control" name="report_writer_usid" value="${report.report_writer_usid }" readonly required>
        <input type="text" class="form-control" name="report_target_usid" id="report_target_usid" value="${report.report_target_usid}" > 
       	<input type="text" class="form-control" name="report_type" id="report_type" value="${report.report_type}" > 
        <input type="text" class="form-control" name="report_ischeck" id="report_ischeck" value="${report.report_ischeck}" > 
        <input type="text" class="form-control" name="report_user_nickname" id="report_user_nickname" value="${report.report_user_nickname}" > 
        <input type="text" class="form-control" name="report_target_nickname" id="report_target_nickname" value="${report.report_target_nickname}" > 
        <input type="text" class="form-control" name="report_user_nickname" id="report_user_nickname" value="${report.report_user_nickname}" > 
        <input type="text" class="form-control" name="report_target_nickname" id="report_target_nickname" value="${report.report_target_nickname}" >
        <input type="text" class="form-control" name="report_answer" id="report_answer"  value="${report.report_answer }" placeholder="제목"  required>
        <input type="text" class="form-control" name="notice_iswarning" id="notice_iswarning" value="${notice.notice_iswarning }" readonly> 
       
		<c:forEach items="${reportFile}" var="a" varStatus="vs">
                    <button type="button" 
                    class="btn btn-outline-info btn-block"
                    onclick="fileDownload('${a.report_file_name}');">
                    	<c:out value="첨부파일  ${vs.count } - ${a.report_file_name }"/>
           			</button>
        </c:forEach> 
        
        <textarea class="form-control" name="report_content" placeholder="내용" required><c:out value="${report.report_content }"/></textarea>
        <br>
        
        
        <button class="btn btn-outline-info" onclick="reportViewDelete('${report.report_id}');">삭제하기</button>
        
        
        
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
	
