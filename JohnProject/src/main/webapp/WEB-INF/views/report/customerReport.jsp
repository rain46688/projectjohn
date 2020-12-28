<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value=" "/>
	
</jsp:include>
	
<style>

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
	
#wrapper {
    margin: 0 auto;
    margin-top: 2em;
    padding: 1em;
    width: 52.5em;
    text-align: center;
    align-items: center;
    margin-bottom: 3em;
/*     border: 0.5px solid rgb(224, 224, 224); */
    border-radius: 1em;
    overflow: auto;
     background-color:#ffcc66;
    font-family: 'Noto Serif KR', serif;
  }
#title {
	text-align: left;
}

.form-control, #cke_editor1{
	border-radius:10px;
}

#imageUpload {
	border:1px  rgb(224, 224, 224) solid;
	text-align: left;
	height: 6em;
	border-radius: 7px;
}


#imageUpload {
	text-align: left;
	overflow: hidden;
}
#imageUpload>label {
	height: 100%;
	width: 6em;
	float: left;
	font-size: larger;
}

#imageUpload>label>p{
	margin-top: 0.1em;
}

#image-prev {
	width: 35.25em;
	height: 6em;
	border-radius: 5px;
	overflow: hidden;
	float: left;
}

#image-prev>img {
	width: 7.05em;
	height: 100%;
}

.marginTop{
	margin-top: 0.5em;
}

#maxMems {
	display:none;
}





#bbtn{
	border-color: #ffcc66;
    color: white; 
    background-color: #003478;
    margin-top:3%;

}

#bbtn:hover,
#bbtn:focus {
    background-color: #ffcc66;
    border-color: #003478;
    color: #003478; 

}


.marginTop1{
	margin-top: 0.5em;
	margin-bottom:0.5em;
	margin-left:1%;
	width:48%;
	float:left;
	font-size:20px;
	color:black;
}

.marginTop2{
	margin-top: 0.5em;
	margin-bottom:0.5em;
	margin-left:1%;
	width:48%;
	float:left;
	font-size:20px;
	color:black;
}




</style>
    
	<div id="content">
  <div id="wrapper">
	<div id="title"><h4><img src="${path }/resources/images/admin/siren.png" width="30px" height="27px">&nbsp;신고하기</h4></div>
	<hr color="black">
	<div id="editor">

			<form id="frm" action="${path}/report/customerReportEnd" method="POST"
			enctype="multipart/form-data">
			<div class="input-group marginTop1">
			<img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;신고대상 게시물&nbsp;:&nbsp;<c:out value="${b.boardId}"/> <!-- 신고대상게시물번호 --><!-- 변경요망 -->
			</div>
			<div class="input-group marginTop2">
			<img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;신고대상 회원&nbsp;:&nbsp;<c:out value="${b.writerNickname}"/><!-- 변경요망 -->
			</div>
			<div class="input-group marginTop">
			<select class="custom-select custom-select-sm" name="reportType" id="reportType">
				<option value="" selected disabled>신고유형을 선택하세요</option>
				<option value="홍보성">홍보성</option>
				<option value="권리침해">권리침해</option>
				<option value="선정성">선정성</option>
				<option value="인신공격">인신공격</option>
				<option value="기타">기타</option>
			</select>
			</div>
			
			<div class="input-group marginTop">
			<input class="form-control" type="text" name="reportTitle" id="reportTitle" placeholder="제목을 입력하세요">
			</div>
			
			<input type="hidden"  name="reportWriterUsid" value="${loginMember.getUsid()}">
 			<input type="hidden"  name="reportTargetUsid" value="${b.writerUsid}"><!-- 변경요망 -->
 			<input type="hidden"  name="reportUserNickname" value="${loginMember.getMemNickname() }">
	 		<input type="hidden" name="reportBoardId" value="${b.boardId }">
	 		<input type="hidden" name="reportTargetNickname" value="${b.writerNickname }">
 
			<div id="textEditor" class="marginTop">
				<textarea cols="80" id="editor1" name="reportContent" rows="10" data-sample-short placeholder='내용을 입력해주세요'></textarea>
			</div>
	
			<div id="submitBtn">
				<button class="marginTop btn btn-outline-secondary" type="button" onclick="fn_submit();" id="bbtn">글 등록</button>
				 <input type="reset" class="marginTop btn btn-outline-secondary" value="취소" id="bbtn">
				</div>
			</form>
			<%-- </c:if> --%>
			
		</div>
	</div>
 </div>

<script>
	
	$(function(){
		CKEDITOR.replace('editor1',{
			filebrowserUploadUrl: '${path}/report/customerReportFileUpload',
			width: '100%',
		    height: 400
		})

	})
	
	/* document.getElementById('boardType').addEventListener('change', function(){
		let value = document.getElementById('boardType').value;
		if(value=='일반게시판') {
			document.getElementById('maxMems').style.display = 'none';
			document.getElementById('textEditor').style.display = 'block';
		}
		else {
			document.getElementById('maxMems').style.display = 'block';
			document.getElementById('textEditor').style.display = 'none';	
			document.getElementById('editor1').value = '';
		}
	}) */

	function fn_submit(){
		let value = CKEDITOR.instances.editor1.getData();
		
		document.getElementById('editor1').value = value;
		
		document.getElementById('frm').submit();
	}
	
</script>
	

	
