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
  	  div#board-container input{margin-bottom:15px;}
    </style>
    
	<section id="content">
	  
		<div id="board-container">
	        <form name="boardFrm" action="${path}/report/customerReportEnd"   method="post" enctype="multipart/form-data" > <!-- 파일업로드시 enctype 멀티파트 써주는거 잊지말기!!!!!!!!!!!! -->
	           
	          
	            <input type="text" class="form-control" name="report_board_id" id="report_board_id" value="23" > <!-- 신고대상게시물번호 --><!-- 변경요망 -->
	            <input type="text" class="form-control" placeholder="제목" name="report_title" id="report_title" required> <!-- 제목 -->
	            <input type="text" class="form-control" name="report_target_nickname" id="report_target_nickname"  
	            	value="홍잭슨" readonly><!-- 신고할회원 --><!-- 변경요망 -->
	 		
	 			<input type="hidden"  name="report_writer_usid" value="${loginMember.getUsid()}">
	 			<input type="hidden"  name="report_target_usid" value="9"><!-- 변경요망 -->
	 			<input type="hidden"  name="report_user_nickname" value="${loginMember.getMem_nickname() }">
	 			
	 			<hr>
	        
	            <select name="report_type" id="report_type" class="form-control" >
				  <option value="" selected disabled>-- 신고유형 --</option>
				  <option value="홍보성">홍보성</option>
				  <option value='권리침해'>권리침해</option>
				  <option value='선정성'>선정성</option>
				  <option value='인신공격'>인신공격</option>
				  <option value='기타'>기타</option>
				</select>
				
				<hr>
				
	            <div class="input-group mb-3" style="padding:0px;">
	                <div class="input-group-prepend" style="padding:0px;">
	                    <span class="input-group-text">첨부파일1</span>
	                </div>
	            <div class="custom-file">
	                    <input type="file" class="custom-file-input" name="upFile" id="upFile1">
	                    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
	                </div>
	            </div>
	            
	   
	             <div class="input-group mb-3" style="padding:0px;">
	                <div class="input-group-prepend" style="padding:0px;">
	                    <span class="input-group-text">첨부파일2</span>
	                </div>
	                <div class="custom-file">
	                    <input type="file" class="custom-file-input" name="upFile" id="upFile2">
	                    <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
	                </div>
	            </div>
	            
	            
	            <textarea class="form-control" name="report_content" placeholder="내용" required></textarea>
	            <br />
	            <input type="submit" class="btn btn-outline-info" value="신고하기" >
	            <input type="reset" class="btn btn-outline-info" value="취소" >
	        </form>
	        
	        <script>
	        $(function(){
	        	$('[name=upFile]').change(e=>{
	        		//console.log($(e.target)[0].files[0].name); //발생한 객체(e)의 0번 파일의 이름 이 콘솔에 찍힘
	        		const fileName=$(e.target)[0].files[0].name; //분기처리 해보기
	        		$(e.target).next(".custom-file-label").html(fileName);//'파일을 선택하세요'가 이 이름으로 바뀜
	        		
	        	})
	        })
	        
	   		
			
	        </script>
	        
	        
	    </div>
	</section>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
