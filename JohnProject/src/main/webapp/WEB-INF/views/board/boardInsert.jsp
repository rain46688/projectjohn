<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<style>
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
  }
#title {
	text-align: left;
}

#imageUpload {
	border:1px  rgb(224, 224, 224) solid;
	text-align: left;
	height: 6em;
	border-radius: 7px;
}


#submitBtn>button{
	width: 100%;
	height: 2.5em;
	color: white;
	background-color: gray;
}

#submitBtn>button:hover{
	color: black;
	background-color: white;
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
	<div id="title"><h4>글쓰기</h4></div>
	<hr color="black">
	<div id="editor">
		<form id="frm" action="${path }/board/boardInsertEnd" method="POST"
			enctype="multipart/form-data">
			<input type="hidden" value="${loginMember.usid }" name="writerUsid">
			<input type="hidden" value="${loginMember.memNickname }" name="writerNickname">
			<input type="hidden" value="${loginMember.profilePic }" name="profilePic">
			<div class="input-group marginTop">
			<select class="custom-select custom-select-sm" name="bigCategory" id="boardType">
				<option value="" >게시글 타입을 선택하세요</option>
				<option value="일반게시판">일반게시판</option>
				<option value="음성게시판">음성게시판</option>
			</select>
			<select class="custom-select custom-select-sm" name="maxMems" id="maxMems">
				<option value="" >최대 수용인원을 선택하세요</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
			</select>
			<select class="custom-select custom-select-sm" name="smallCategory" id="smallCate">
				<option value="" >큰 카테고리를 선택하세요</option>
				<option value="love">연애상담</option>
				<option value="family">가족문제</option>
				<option value="work">회사문제</option>
				<option value="friend">친구문제</option>
				<option value="pet">반려견문제</option>
			</select>
			</div>
			<div class="input-group marginTop">
			<input class="form-control" type="text" name="title" id="titleInput" placeholder="제목을 입력하세요">
			</div>
			<div class="input-group marginTop">	
			</div>
			<div id="textEditor" class="marginTop">
				<textarea cols="80" id="editor1" name="content" rows="10" data-sample-short placeholder='내용을 입력해주세요'></textarea>
			</div>
			<div class="input-group marginTop">	
			<input class="form-control" type="text" name="agreeName" id="agreeName" placeholder="찬성 이름">
			<input class="form-control" type="text" name="disagreeName" id="disagreeName" placeholder="반대 이름">
			</div>
			<div id="submitBtn">
				<button class="marginTop btn btn-outline-secondary" type="button" onclick="fn_submit();">글 등록</button>
				</div>
			</form>
		</div>
	</div>
 </div>
</div>
</div>
</div>
<script>
	
	$(function(){
		CKEDITOR.replace('editor1',{
			filebrowserUploadUrl: '${path}/board/boardFileUpload',
			width: '100%',
		    height: 400
		})

		/* let oEditors = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "editor1",
			sSkinURI : "${path}/resources/js/smarteditor2/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		}) */
	})
	
	document.getElementById('boardType').addEventListener('change', function(){
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
	})

	function fn_submit(){
		let value = CKEDITOR.instances.editor1.getData();
		
		document.getElementById('editor1').value = value;
		
		if(document.getElementById('boardType').value == ""){
			alert('게시판 타입을 설정해주세요.');
			return;
		}
		
		if(document.getElementById('smallCate').value == ""){
			alert('카테고리를 설정해주세요.');
			return;
		}
		
		if(document.getElementById('titleInput').value == ""){
			alert('제목을 입력해주세요.');
			return;
		}
		
		if(document.getElementById('agreeName').value == ""){
			alert('찬성이름을 설정해주세요.');
			return;
		}
		
		if(document.getElementById('disagreeName').value == ""){
			alert('반대이름을 설정해주세요.');
			return;
		}
		
		document.getElementById('frm').submit();
	}
	
</script>
</body>
</html>