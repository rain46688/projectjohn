<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>


<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="title" value=" " />

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
    font-family: 'Noto Sans KR', sans-serif;
    
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


/* #submitBtn>button{
	width: 100%;
	height: 2.5em;
	color: white;
	background-color: gray;
}

#submitBtn>button:hover{
	color: black;
	background-color: white; */
	
#bbtn{
margin-top:3%;
border-color: #ffcc66;
   color: white; 
   background-color: #003478;

}

#bbtn:hover,
#bbtn:focus {
    background-color: #ffcc66;
    border-color: #003478;
    color: #003478; 

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

</style>


	<div id="content">
  <div id="wrapper">
	<div id="title"><h4><img src="${path }/resources/images/admin/pencil.png" width="24px" height="29px">&nbsp;글쓰기</h4></div>
	<hr color="black">
	<div id="editor">
		<form id="frm" action="${path}/customer/customerNoticeFormEnd" method="POST"
			enctype="multipart/form-data">
		
			<div class="input-group marginTop">
			<input class="form-control" type="text" name="noticeTitle" id="titleInput" placeholder="제목을 입력하세요">
			</div>
			
			<div id="textEditor" class="marginTop">
				<textarea cols="80" id="editor1" name="noticeContent" rows="10" data-sample-short placeholder='내용을 입력해주세요'></textarea>
			</div>


				<div id="submitBtn">
				<button class="marginTop btn btn-outline-secondary" type="button" onclick="fn_submit();" id="bbtn">글 등록</button>
				<input type="reset" class="marginTop btn btn-outline-secondary" value="취소" id="bbtn">
				</div>
			</form>
		</div>
	</div>
 </div>

<script>
	
	$(function(){
		CKEDITOR.replace('editor1',{
			filebrowserUploadUrl: '${path}/customer/customerNoticeFileUpload',
			width: '100%',
		    height: 400
		})


	})
	


	function fn_submit(){
		let value = CKEDITOR.instances.editor1.getData();
		
		document.getElementById('editor1').value = value;
		
		document.getElementById('frm').submit();
	}
	
</script>




