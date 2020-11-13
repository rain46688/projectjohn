<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
#wrapper {
    margin: 0 auto;
    margin-top: 3em;
    padding: 1em;
    width: 45em;
    text-align: center;
    align-items: center;
    margin-bottom: 3em;
    border: 0.5px solid rgb(224, 224, 224);
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

</style>
<div id="content">
  <div id="wrapper">
	<div id="title"><h4>글쓰기</h4></div>
	<hr color="black">
	<div id="editor">
		<form id="frm" action="${path }/board/boardInsertEnd" method="POST"
			enctype="multipart/form-data">
			<div class="input-group marginTop">
			<select class="custom-select custom-select-sm" name="bigCategory" id="category">
				<option value="" >게시글 타입을 선택하세요</option>
				<option value="일반게시판">일반게시판</option>
				<option value="음성게시판">음성게시판</option>
			</select>
			<select class="custom-select custom-select-sm" name="smallCategory" id="category">
				<option value="" >큰 카테고리를 선택하세요</option>
				<option value="연애상담">연애상담</option>
				<option value="가족문제">가족문제</option>
				<option value="회사문제">회사문제</option>
				<option value="친구문제">친구문제</option>
				<option value="반려견문제">반려견문제</option>
			</select>
			</div>
			<select class="custom-select custom-select-sm marginTop" name="" id="category">
				<option value="" >게시판을 선택하세요 (수정예정)</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
			<div class="input-group marginTop">
			<input class="form-control" type="text" name="title" id="titleInput" placeholder="제목을 입력하세요">
			</div>
			<div class="input-group marginTop">	
			<!-- <input class="form-control" type="text" name="price" id="price" placeholder="가격">
			<select class="custom-select custom-select-md" name="maxMems" id="maxMems">
				<option value="" selected>희망 참여 인원</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
			</select> -->
			</div>
			<div id="textEditor" class="marginTop">
				<textarea name="content" id="content" rows="20" cols="80" placeholder=" 내용을 입력해주세요."></textarea>
			</div>
			<div id="imageUpload" class="marginTop">
				<label id="uploadBtn" class="btn btn-lg btn-outline-secondary" for="file"><p>이미지</p>업로드</label>
				<input style="display: none;" type="file" name="upFiles" id="file" multiple="true">
				<div id="image-prev">
					<!-- 이미지 미리보기 -->
				</div>
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
	function fn_submit(){
		document.getElementById('frm').submit();
	}
</script>
</body>
</html>