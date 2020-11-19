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
		<h1>신고상세내역</h1>
		<input type="text" class="form-control" name="reportId" id="reportId" value="${report.reportId }" readonly> 
		<input type="text" class="form-control" name="reportBoardId" id="reportBoardId" value="${report.reportBoardId }" > 
        <input type="text" class="form-control" name="reportWriterUsid" value="${report.reportWriterUsid }" readonly required>
        <input type="text" class="form-control" name="reportTargetUsid" id="reportTargetUsid" value="${report.reportTargetUsid}" > 
       	<input type="text" class="form-control" name="reportType" id="reportType" value="${report.reportType}" > 
        <input type="text" class="form-control" name="reportIscheck" id="reportIscheck" value="${report.reportIscheck}" > 
        <input type="text" class="form-control" name="reportUserNickname" id="reportUserNickname" value="${report.reportUserNickname}" > 
        <input type="text" class="form-control" name="reportTargetNickname" id="reportTargetNickname" value="${report.reportTargetNickname}" > 
        <input type="text" class="form-control" name="reportUserNickname" id="reportUserNickname" value="${report.reportUserNickname}" > 
        
        <input type="text" class="form-control" name="reportTargetNickname" id="reportTargetNickname" value="${report.reportTargetNickname}" >
        <input type="text" class="form-control" name="reportAnswer" id="reportAnswer"  value="${report.reportAnswer }" placeholder="제목"  required>
        <input type="text" class="form-control" name="reportIswarning" id="reportIswarning" value="${report.reportIswarning }" readonly> 
       
		<c:forEach items="${reportFile}" var="r" varStatus="vs">
             <img src="${path }/resources/upload/report/${r.reportFileName }">
        </c:forEach> 

        <textarea class="form-control" name="reportContent" placeholder="내용" required><c:out value="${report.reportContent }"/></textarea>
        <br>
   
   
				<!-- 신고답글내역 -->
	<div class="comments-area">
		<h4>신고답글</h4>
			<div class="user justify-content-between d-flex">
					<form>
						<div class="d-flex align-items-center">
							<h3>관리자 답변</h3>
							<br>
							<p>${report.reportAnswer }</p>
							<br>
						</div>
					</form>
			</div>
	</div>
			<!-- 신고답글 -->
		<div class="comment-form">
		<h4>답글달기</h4>

		<form class="form-contact comment_form" action="${path}/report/reportAnswer?reportId=${report.reportId}"
			id="commentForm" method="post">

				<!-- 작성자 -->
			
				<input class="form-control" name="reportId"
							id="reportId" type="text"
							value="관리자" readonly>
		
				<!-- 내용 -->
				<div class="form-group">
					<textarea class="form-control w-100" name="reportAnswer"
							id="reportAnswer" cols="30" rows="9"
							placeholder="답글을 적어주세요"></textarea>
				</div>
				
			<div class="form-group">
				<button type="submit"
					class="button button-contactForm btn_1 boxed-btn"
					onclick="function validate();">답글달기</button>
			</div>

		</form>

		<script>
			function validate(){
				if ('${loginMember.memClass}' != '관리자') {
					alert("관리자만 등록할 수 있습니다!");
					return false;
				}
			};
		</script>


	</div>  

   
        <button class="btn btn-outline-info" onclick="reportWarn('${report.reportTargetUsid}');">경고주기</button>
        <button class="btn btn-outline-info" onclick="reportViewDelete('${report.reportId}');">삭제하기</button>
        
    </div>
	</section>
	
	<script>

		function reportViewDelete(reportId){
			 if (confirm("정말 삭제하시겠습니까?") == true){
				 location.href="${path}/report/adminReportDelete?reportId="+reportId;
			 }else{  
			     return;
			 }
		}
		
		var reportIswarning=document.getElementById("reportIswarning").value;
		
		function reportWarn(reportTargetUsid){
			 if (confirm("정말 경고를 주시겠습니까?") == true){
				 location.href="${path}/report/adminReportWarn?reportTargetUsid="+reportTargetUsid+"&reportIswarning="+reportIswarning;
			 }else{  
			     return;
			 }
		}
		
	</script>
	
	

	
