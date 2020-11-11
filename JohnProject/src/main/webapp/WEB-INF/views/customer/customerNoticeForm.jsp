<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="title" value=" " />

</jsp:include>

<style>
div#board-container {
	width: 400px;
	margin: 0 auto;
	text-align: center;
}

div#board-container input {
	margin-bottom: 15px;
}
</style>

<section id="content">
	<div id="board-container">
		<form name="boardFrm" action="${path}/customer/customerNoticeFormEnd"
			method="post" enctype="multipart/form-data">
			
		<%-- <input type="text" class="form-control" name="notice_id" id="notice_id" value="${notice.notice_id }" readonly>  --%>

				<!-- <input type="text" class="form-control" 
					name="notice_id" id="notice_id" value="" readonly>  -->

				<input type="text" class="form-control" 
					name="notice_title" id="notice_title" placeholder="제목을 입력하세요"  required>
						
				
				<%-- <input type="text" class="form-control"  
				name="notice_admin_nickname" value="${loginMember.userId}" readonly required> --%>

	
			<div class="input-group mb-3" style="padding: 0px;">
				<div class="input-group-prepend" style="padding: 0px;">
					<span class="input-group-text">첨부파일1</span>
				</div>
				<div class="custom-file">
					<input type="file" class="custom-file-input" name="upFile" id="upFile1"> 
						<label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
				</div>
			</div>

			
			<div class="input-group mb-3" style="padding: 0px;">
				<div class="input-group-prepend" style="padding: 0px;">
					<span class="input-group-text">첨부파일2</span>
				</div>
				<div class="custom-file">
					<input type="file" class="custom-file-input" name="upFile" id="upFile2"> 
					<label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
				</div>
			</div>


			<textarea class="form-control" name="notice_content" placeholder="내용" required></textarea>
			<br /> 
			<input type="submit" class="btn btn-outline-info" value="저장" onclick="submit();">
		</form>

		<script>
        $(function(){
        	$('[name=upFile]').change(e=>{
        		const fileName=$(e.target)[0].files[0].name; 
        		$(e.target).next(".custom-file-label").html(fileName);
        		
        	})
        })
        
        
        function submit(){
        	alert("등록되었습니다");
        }
        
        </script>


	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

