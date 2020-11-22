<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" " />
</jsp:include>

<style>
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em,
	ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
	caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby,
	section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
}

#content * {
	border: 1px solid red;
}

#content {
	display: flex;
	justify-content: center;
	padding-top: 3vh;
}

#mainDiv {
	width: 60%;
	height: auto;
	border: 1px solid #C6C5C5;
	background-color: #BACADE;
}

#upDiv {
	height: 15%;
	width: 100%;
	background-color: #0054BA;
	padding: 1.5%;
	display: flex;
}

#upDiv>h2 {
	font-size: 5vh;
	height: 100%;
	width: 50%;
	font-weight: bold;
	color: white;
}

#upFlag {
	width: 50%;
	height: 100%;
	display: flex;
	justify-content: flex-end;
	align-items: flex-end;
	color: white;
}

#upFlag>p {
	cursor: pointer;
}

#basicInfo-tab {
	color: black;
}

#profileDiv {
	margin-top: 3%;
	width: 100%;
	height: 30%;
	display: flex;
	padding: 1%;
}

#imgDiv {
	z-index: 0;
	width: 30%;
	height: 100%;
}

#mirrorimgDiv {
	z-index: 1;
	width: 30%;
	height: 100%;
	display: none;
	justify-content: center;
	align-items: center;
	background-color: rgba(200, 200, 200, 0.6);
	position: relative;
	left: -30%;
	cursor: pointer;
}

#mirrorimgDiv>p {
	font-size: 10vh;
	color: black;
}

#imgProfile {
	width: 100%;
	height: 100%;
}

#downDiv {
	width: 100%;
	height: 55%;
	margin: 1% 1% 0 1%;
	padding: 1%;
}

.rowDiv {
	width: 100%;
	height: 25%;
	display: flex;
}

.rowDiv div {
	margin: 0 1% 0 1%;
}

.leftDiv {
	width: 50%;
	height: 100%;
}

.rightDiv {
	width: 50%;
	height: 100%;
}

#buttonDiv {
	display: flex;
	justify-content: center;
}

p {
	font-size: 3vh;
	font-weight: bold;
}

input {
	height: 40%;
	width: 40%;
}

select {
	width: 100%;
	height: 40%;
}

/* 위 텍스트 영역 눌르면 옆에 테두리 생기는거 지우는 용도 */
textarea:focus {
	outline: none;
}

textarea {
	resize: none;
}

#exTextArea {
	width: 100%;
	height: 100%;
}

#careerleftDiv {
	width: 100%;
	height: 50%;
	display: flex;
}

#exinput {
	width: 30%;
	height: 100%;
}

#exinput2 {
	width: 70%;
	height: 100%;
}

h6 {
	font-size: 3vh;
	font-weight: bold;
}

#licenseModifyDiv{
	width: 60%;
	height: auto;
	border: 1px solid #C6C5C5;
	background-color: #BACADE;
	display:none;
	opacity: 0;
}

.appear {
  animation: fade-in 1s;
  animation-fill-mode: forwards;
  display: flex;
}

.disappear {
  animation: fade-out 1s;
  animation-fill-mode: forwards;
}

@keyframes fade-in {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes fade-out {
  from {
    opacity: 1;

  }
  to {
    opacity: 0;
  }
}


/*  */

#licenseupDiv {
	height: 15%;
	width: 100%;
	background-color: #0054BA;
	padding: 1.5%;
	display: flex;
}

#licenseupDiv>h2 {
	font-size: 5vh;
	height: 100%;
	width: 50%;
	font-weight: bold;
	color: white;
}

#licenseupFlag {
	width: 50%;
	height: 100%;
	display: flex;
	justify-content: flex-end;
	align-items: flex-end;
	color: white;
}

#licenseupFlag>p {
	cursor: pointer;
}

</style>
<!-- https://unordinarydays.tistory.com/99 참고 -->
<!-- 멀티파트 폼 넣어야됨 -->
<section id="content">
	<div id="mainDiv">
		<!-- up -->
		<div id="upDiv">
			<h2>전문가 정보 수정</h2>
			<div id="upFlag">
				<p>라이센스 수정</p>
			</div>
		</div>
		<!-- <hr> -->
		<!-- profile -->
		<div id="profileDiv">
			<div id="imgDiv">
				<img src="${path }/resources/images/expert.png" id="imgProfile" class="img-thumbnail" />
			</div>
			<div id="mirrorimgDiv">
				<p>+</p>
			</div>
		</div>
		<!-- downDiv -->
		<div id="downDiv">
			<!--  -->
			<div class="rowDiv">
				<div class="leftDiv">
					<p>경력</p>
					<div id="careerleftDiv">
						<div id="exinput">
							<input type="number" name="career" class="form-control short" />
						</div>
						<div id="exinput2">
							<h6>년</h6>
						</div>
					</div>
				</div>
				<div class="rightDiv">
					<p>전문 분야</p>
					<select id="counselSelect" name="counselSelect" required>
						<option value="부부 상담" selected>부부 상담</option>
						<option value="연애 상담">연애 상담</option>
						<option value="직장 상담">직장 상담</option>
						<option value="심리 상담">심리 상담</option>
						<option value="자녀 상담">자녀 상담</option>
						<option value="진로 상담">진로 상담</option>
					</select>
				</div>
			</div>
			<div class="rowDiv">
				<div class="leftDiv">
					<p>상담 가능 시간</p>
					<input name="fistTime" type="time"> ~ <input name="seTime" type="time">
				</div>
				<div class="rightDiv">
					<p>인사말</p>
					<textarea id="exTextArea" name="modiText"></textarea>
				</div>
			</div>
			<div class="rowDiv">
				<div class="leftDiv"></div>
				<div class="rightDiv"></div>
			</div>
			<!--  -->
			<div id="buttonDiv">
				<button class="btn btn-outline-success" onclick="modify();">수정완료</button>
			</div>
			<input type="file" id="profileUpload" style="display: none;">
		</div>
	</div>
	
	<div id="licenseModifyDiv">
			<div id="licenseupDiv">
			<h2>라이센스 수정</h2>
			<div id="licenseupFlag">
				<p>전문가 정보 수정</p>
			</div>
		</div>
	
	
	</div>
</section>


<script>

'use strict;'

$("#upFlag").click(e=>{
	$("#mainDiv").stop(true).animate({'opacity': 0}, 300, function() {
        $(this).css({'display': 'none'})
        $('#licenseModifyDiv').stop(true).css({'display': 'block', 'opacity': 0}).animate({'opacity': 1}, 300)
    });
});


$("#licenseupFlag").click(e=>{
	$("#licenseModifyDiv").stop(true).animate({'opacity': 0}, 300, function() {
        $(this).css({'display': 'none'})
        $('#mainDiv').stop(true).css({'display': 'block', 'opacity': 0}).animate({'opacity': 1}, 300)
    });
});



function modify(){
	console.log("수정 완료");
	let frm2 = $("#profileUpload")[0].files[0];
	console.log("frm2 : "+frm2);
	const career = $("input[name=career]").val();
	const counselSelect = $("#counselSelect option:selected").val()
	const fistTime = $("input[name=fistTime]").val()
	const seTime = $("input[name=seTime]").val()
	const modiText = $("#exTextArea").val()
	console.log("career : "+career);
	console.log("counselSelect : "+counselSelect);
	console.log("fistTime : "+fistTime);
	console.log("seTime : "+seTime);
	console.log("modiText : "+modiText);
	let formData = new FormData();
	formData.append('upFile',frm2,frm2.name);
	formData.append('career',career);
	formData.append('counselSelect',counselSelect);
	formData.append('fistTime',fistTime);
	formData.append('seTime',seTime);
	formData.append('modiText',modiText);
 	$.ajax({
		url : '${path}/expert/modifyEx',
		data : formData,
		type : 'post',
		contentType : false,
		processData : false,
		dataType : "json",
		success : function(data) {
			console.log("수정 data : " + data);
			
		}
	});
	
}

$("#mirrorimgDiv").click(e => {
	console.log("이미지 눌릠");
	 $("#profileUpload").click();

	
});

$("#profileUpload").change(function(e){

    e.preventDefault();
	console.log("이미지 선택됨");
	console.log("files : " + $("#profileUpload").val());
	let file2 = $("#profileUpload").val();
	
	let f = (file2).substring((file2).lastIndexOf('.'),(file2).length);
	console.log(f);
	
	if(f != '.png' && f != '.jpg' && f != '.jpeg' && f != '.gif'){
	alert('이미지 파일만 업로드 가능합니다.');
	return false;
	}else{
		
		
	let file = this.files[0];
    reader = new FileReader();
    reader.onload = function (event) {
        let img = new Image();
        img.src = event.target.result;
        console.log($("#imgProfile").width()+" "+$("#imgProfile").height());
          img.width = $("#imgProfile").width();
          img.height = $("#imgProfile").height();
        $('#imgDiv').empty();
        $('#imgDiv').append(img);
    };
    reader.readAsDataURL(file);
    return false;
	}
});



$('#imgDiv').hover(function(){
    $('#mirrorimgDiv').css('display','flex');
}, function() {
	$('#mirrorimgDiv').css('display','none');
});

$('#mirrorimgDiv').hover(function(){
    $('#mirrorimgDiv').css('display','flex');
}, function() {
	$('#mirrorimgDiv').css('display','none');
});


</script>
