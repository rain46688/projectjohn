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
	font-family: 'Noto Serif KR', serif;
}

#content * {
	/*  border: 1px solid red; */
	/* font-family: 'Noto Serif KR', serif; */
	
}


#headerAndContent{
	background-color:#062449;
}

/* 기본 배경 */
#content {
	display: flex;
	justify-content: center;
	padding-top: 1vh;
	background-color:#062449;
}

/*  */
/*  */
/*  */
/* 전문가 정보 영역 */
/*  */
/*  */
/*  */
#mainDiv {
	width: 60%;
	height: 98%;
	/* border: 1px solid #C6C5C5; */
	border-radius: 1em;
	/* 	background-color: #BACADE; */
	background-color: white;
	border: 10px solid #FFCC66;
}

/* 위 영역 제목 부분*/
#upDiv {
	height: 15%;
	width: 100%;
	/* background-color: #0054BA; */
	background-color: #003478;
	padding: 1.5%;
	display: flex;
	border: 1px solid #C6C5C5;
	border-radius: 1em 1em 0 0;
}

/* 프로필 영역 중간부분 */
#profileDiv {
	margin-top: 1%;
	width: 100%;
	height: 30%;
	display: flex;
	padding: 0 0 0 3%;
	margin: 3% 0 0 0;
}

/* 아래부분 인사말 */
#downDiv {
	width: 100%;
	height: 45%;
	margin: 1% 1% 0 1%;
	padding: 0 4% 0 1%;
}

/* 제목 */
#upDiv>h2 {
	font-size: 5vh;
	height: 100%;
	width: 50%;
	font-weight: bold;
	color: white;
}

/* 누르면 자격증으로 넘어가는거 */
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

/* 프로필 이미지 영역 */
#imgDiv {
	z-index: 0;
	width: 40%;
	height: 100%;
	background-color: rgba(255, 255, 255, 1);
	border-radius: 2%;
	border: 1px solid #AEAEAE;
}

#mirrorimgDiv {
	z-index: 1;
	width: 40%;
	height: 100%;
	display: none;
	justify-content: center;
	align-items: center;
	background-color: rgba(255, 255, 255, 1);
	position: relative;
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

/* 중간 오른쪽 영역  */
#upRightDiv {
	width: 60%;
	height: 100%;
	margin: 0 2% 2% 2%;
	border: 1px solid #AEAEAE;
	border-radius: 1%;
	display: flex;
	/*위에서 아래로 수직 배치*/
	flex-direction: column;
	justify-content: center;
}

.rowDiv {
	width: 100%;
	height: 30%;
	display: flex;
}

.rowDiv div {
	margin: 0 1% 0 1%;
}

.leftDiv {
	width: 44%;
	height: 100%;
}

.timeleftDiv {
	padding-top:2%;
	width: 100%;
	height: 100%;
}

#time {
	display: flex;
}

#time input {
	margin: 0 1% 0 0;
	width: 40%;
}

#time p{
	width:8%;
	height:100%:
}

.timeleftDiv input {
	width: 50%;
	height: 100%;
}

/* 시간 주의사항 */
/* #timeWarning {
	text-align:center;
	font-size:1.5vh;
	color:black;
	font-weight:bold;
	font-style:italic;
} */

.rightDiv {
	width: 50%;
	height: 100%;
	padding-right: 9%;
	padding-left:2%;
}

#careerleftDiv {
	width: 100%;
	height: 50%;
	display: flex;
}

/* 년 */
h6 {
	font-size: 2vh;
	font-weight: bold;
}

#exinput {
	width: 40%;
	height: 100%;
}

#exinput2 {
	width: 60%;
	height: 100%;
}

/* 각 소제목들 p태그 */
#mainDiv p {
	font-size: 2vh;
	font-weight: bold;
	padding: 1% 0 1% 2%;
}

.licenseTitle p {
	font-size: 2vh;
	font-weight: bold;
	padding: 1% 0 1% 0;
}

/* 텍스트 에어리어 태그 */
#exTextArea {
	width: 100%;
	height: 100%;
	font-size: 2vh;
	font-weight: bold;
	padding: 1% 0 0 3%;
	margin:0 2% 0 1.2%;
	border: 1px solid #AEAEAE;
}

#textArearowDiv {
	width: 100%;
	height: 70%
}

textarea {
	resize: none;
	border-radius: 1%;
}

/* 위 텍스트 영역 눌르면 옆에 테두리 생기는거 지우는 용도 */
textarea:focus {
	outline: none;
}

/* 버튼 */
#buttonDiv {
	display: flex;
	justify-content: center;
	/* align-items: flex-end; */
	align-items: center;
	height: 50%;
	width: 100%;
}

/*  */
/* 일반 버튼  */
.button-7{
  width:20%;
  height:30%;
  border:2px solid #00316D;
  display:flex;
  justify-content:center;
  align-items:center;
  cursor:pointer;
  position:relative;
  box-sizing:border-box;
  overflow:hidden;
  margin:2%;
}

.button-7 .johnbtn{
  font-size:2vh;
  color:#FFCC66;
  text-decoration:none;
  line-height:50px;
  transition:all .5s ease;
  z-index:2;
  position:relative;
       /*  */
  width:100%;
  height:100%;
  display:flex;
   justify-content:center;
  align-items:center;
}

.eff-7{
  width:100%;
  height:50px;
  border:90px solid #00316D;
  position:absolute;
  transition:all .5s ease;
  z-index:1;
  box-sizing:border-box;
}

.button-7:hover .eff-7{
  border:0px solid #00316D;
}

.button-7:hover .johnbtn{
  color:#00316D;
}

</style>
<section id="content">
	<div id="mainDiv">
		<!-- up -->
		<div id="upDiv">
			<h2>전문가 정보 수정</h2>
			<div id="upFlag">
				<p>자격증 정보 수정</p>
			</div>
		</div>
		<!-- <hr> -->
		<!-- profile -->
		<div id="profileDiv">
			<div id="imgDiv">
				<img src="${path }/resources/profile_images/${mem.profilePic}" id="imgProfile" class="img-thumbnail" />
			</div>
			<div id="mirrorimgDiv">
				<p>+</p>
			</div>
			<!-- <div id="mirrorimgDiv2"></div> -->
			<div id="upRightDiv">

				<div class="rowDiv">
					<div class="leftDiv">
						<p>경력</p>
						<div id="careerleftDiv">
							<div id="exinput">
								<input type="number" name="career" class="form-control short" min="1" max="99" value="${expert.expertProfile }" />
							</div>
							<div id="exinput2">
								<h6>년</h6>
							</div>
						</div>
					</div>
					<div class="rightDiv">
						<p>전문 분야</p>
						<select id="counselSelect" name="counselSelect" required class="form-control short">
							<c:forEach items="${coukindList }" var="counselList" varStatus="status">
								<option value="${counselList}" ${expert.expertCounselArea == counselList ? 'selected="selected"' : '' }>${counselList}</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="rowDiv">
					<div class="timeleftDiv">
						<p>상담 가능 시간</p>
						<div id="time">
							<input name="fistTime" type="time" class="form-control times" value="${expert.expertCounselStartTime }">
							<p>~</p>
							<input name="seTime" type="time" class="form-control times" value="${expert.expertCounselEndTime }">
						</div>
					</div>
				</div>
				<!-- 	<div id="timeWarning">주말 공휴일 제외</div> -->
			</div>
		</div>
		<!-- downDiv -->
		<div id="downDiv">
			<div id="textArearowDiv">
				<div id="textAreaDiv">
					<p>인사말</p>
					<textarea id="exTextArea" name="modiText">${expert.expertGreetings}</textarea>
				</div>
			</div>
			<div id="buttonDiv">
													 <div class="button-7">
												    <div class="eff-7"></div>
												    <a class="johnbtn" onclick="modify();">수정 완료</a>
												  </div>	
												  
				<!-- <button class="btn btn-outline-success" onclick="modify();">수정완료</button> -->
				<input id="profileUpload" type="file" style="display: none;">
				<!-- style="display: none;" -->
			</div>
		</div>
	</div>

	<style>

/*  */
/*  */
/*  */
/* 라이센스 영역 */
/*  */
/*  */
/*  */
#licenseModifyDiv {
	width: 60%;
	height: 99%;
/* 	border: 1px solid #C6C5C5; */
	border: 10px solid #FFCC66;
	border-radius: 1em;
	/* 	background-color: #BACADE; */
	background-color: white;
	/*  */
	display: none;
	opacity: 0;
	padding-bottom: 2%;
}

#licenseupDiv {
	height: 15%;
	width: 100%;
	/* background-color: #0054BA; */
	background-color: #003478;
	padding: 1.5%;
	display: flex;
	border: 1px solid #C6C5C5;
	border-radius: 1em 1em 0 0;
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
	font-weight: bold;
}

#licenseDownDiv {
	height: 85%;
	width: 100%;
}

.licenseDiv {
	width: 100%;
	height: 30%;
	display: flex;
	padding: 2%;
	border-bottom: 1px solid #AEAEAE;
}

.licenseImg {
	z-index: 0;
	width: 30%;
	height: 100%;
}

.licenseInfo {
	width: 70%;
	height: 100%;
	margin: 1%;
}

.licenseType {
	width: 100%;
	height: 35%;
	display: flex;
}

.licenseDate {
	width: 100%;
	height: 35%;
	display: flex;
}

.licenseCompany {
	width: 100%;
	height: 35%;
	display: flex;
}

.licenseTitle {
	height: 100%;
	width: 40%;
	text-align: center;
}

.licenseContent {
	height: 100%;
	width: 60%;
}

#licenseButtonDiv {
	width: 100%;
	height: 10%;
	display: flex;
	justify-content: center;
	align-items: flex-end;
	padding-top: 1%;
}

.licenseImgView {
	z-index: 1;
	width: 30%;
	height: 100%;
	display: none;
	justify-content: center;
	align-items: center;
	position: relative;
	cursor: pointer;
	background-color: white;
	border:1px solid gray;
}

.licenseImgView>p {
	font-size: 8vh;
	color: black;
}

.licenseImgs {
	width: 100%;
	height: 100%;
}

/* 수정완료 버튼 */
#licenseButtonDiv .button-7{
height:100%;
	margin:0;
}

</style>

	<div id="licenseModifyDiv">
		<div id="licenseupDiv">
			<h2>자격증 정보 수정</h2>
			<div id="licenseupFlag">
				<p>전문가 정보 수정</p>
			</div>
		</div>
		<div id="licenseDownDiv">

			<c:forEach items="${license }" var="license" varStatus="status">
				<input type="hidden" value="${license.licenseId }" class="licenseIdInput" />
				<div class="licenseDiv">
					<div class="licenseImg" id="licenseImg${status.count}">
						<img src="${path }/resources/upload/upload_license/${license.licenseFileName }" id="imgLicense${status.count}" class="img-thumbnail licenseImgs" />
					</div>
					<div class="licenseImgView" id="licenseImgView${status.count}">
						<p>+</p>
					</div>
					<div class="licenseInfo">
						<div class="licenseType">
							<div class="licenseTitle">
								<p>자격증 타입</p>
							</div>
							<div class="licenseContent">
								<select id="licenseTypeSelect${status.count}" name="licenseTypeSelect${status.count}" required class="form-control short licenseTypeSelect">
									<c:forEach items="${likindList }" var="lity">
										<option value="${lity}" ${license.licenseType == lity ? 'selected="selected"' : '' }>${lity}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="licenseDate">
							<div class="licenseTitle">
								<p>자격증 발급 날짜</p>
							</div>
							<div class="licenseContent">
								<input name="licenseTime${status.count}" id="licenseTime${status.count}" type="date" class="form-control times licenseTime"
									value="${license.licenseDate}">
							</div>
						</div>
						<div class="licenseCompany">
							<div class="licenseTitle">
								<p>자격증 발급 기관</p>
							</div>
							<div class="licenseContent">
								<select id="licenseCompanySelect${status.count}" name="licenseCompanySelect${status.count}" required
									class="form-control short licenseCompanySelect">
									<c:forEach items="${comkindList }" var="comli" varStatus="status">
										<option value="${comli}" ${license.licenseCompany == comli ? 'selected="selected"' : '' }>${comli}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

			<c:set var="num" value="${fn:length(license) + 1}" />
			<c:forEach var="i" begin="1" end="${3 - (fn:length(license))}">

				<div class="licenseDiv">
					<div class="licenseImg" id="licenseImg${num}">
						<img src="${path }/resources/upload/upload_license/nolicense.png" id="imgLicense${num}" class="img-thumbnail licenseImgs" />
					</div>
					<div class="licenseImgView" id="licenseImgView${num}">
						<p>+</p>
					</div>
					<div class="licenseInfo">
						<div class="licenseType">
							<div class="licenseTitle">
								<p>자격증 타입</p>
							</div>
							<div class="licenseContent">
								<select id="licenseTypeSelect${num}" name="licenseTypeSelect${num}" required class="form-control short licenseTypeSelect">
									<option value="선택 안함" selected>선택 안함</option>
									<c:forEach items="${likindList }" var="lity" varStatus="status">
										<option value="${lity}">${lity}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="licenseDate">
							<div class="licenseTitle">
								<p>자격증 발급 날짜</p>
							</div>
							<div class="licenseContent">
								<input name="licenseTime${num}" id="licenseTime${num}" type="date" class="form-control times licenseTime">
							</div>
						</div>
						<div class="licenseCompany">
							<div class="licenseTitle">
								<p>자격증 발급 기관</p>
							</div>
							<div class="licenseContent">
								<select id="licenseCompanySelect${num}" name="licenseCompanySelect${num}" required class="form-control short licenseCompanySelect">
									<option value="선택 안함" selected>선택 안함</option>
									<c:forEach items="${comkindList }" var="comli" varStatus="status">
										<option value="${comli}">${comli}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</div>
				<c:set var="num" value="${num + 1}" />
			</c:forEach>

			<div id="licenseButtonDiv">
					 <div class="button-7">
												    <div class="eff-7"></div>
												    <a class="johnbtn" onclick="modify();">수정 완료</a>
												  </div>	
				<!-- <button class="btn btn-outline-success" onclick="modifyLicense();">수정완료</button> -->
				<!-- ${fn:length(license) + 1}/${3 - (fn:length(license))} -->
				<input id="licenseUpload1" type="file" class="licenseUpload" style="display: none;"> <input id="licenseUpload2" type="file"
					class="licenseUpload" style="display: none;"> <input id="licenseUpload3" type="file" class="licenseUpload" style="display: none;">
				<!-- style="display: none;" -->
			</div>
		</div>

	</div>
	
	
</section>


<script>

'use strict;'

//이미지 h w 값 변수 생성

let proWith;
let proHeight;
let liWith1;
let liHeight1;
let liWith2;
let liHeight2;
let liWith3;
let liHeight3;

//가운데 화면 스위칭

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


// 자격증 수정 완료 버튼

function modifyLicense(){
	console.log("자격증 수정 완료");
	let formData = new FormData();
	let frm = $(".licenseUpload");
	let type = $(".licenseTypeSelect");
	let date = $(".licenseTime");
	let comp = $(".licenseCompanySelect");
	let idinput = $(".licenseIdInput");
 	for(let i = 0; i < 3; i++){
 		console.log(" ============================== ")
 		console.log("자격증 id : "+$(idinput[i]).val());
 		console.log("자격증 타입 : "+$(type[i]).val());
 		console.log("자격증 날짜 : "+$(date[i]).val());
 		console.log("자격증 기관 : "+$(comp[i]).val());
		if(frm[i].files[0] != null){
		console.log("이미지 선택함 : "+(frm[i].files[0]).name);
		formData.append('upFile',frm[i].files[0],(frm[i].files[0]).name);
		formData.append('types',$(type[i]).val());
		formData.append('dates',$(date[i]).val());
		formData.append('linum',$(idinput[i]).val());
		formData.append('companys',$(comp[i]).val());
		}else{
			console.log("이미지 선택 안함 : ");
			
			if($(type[i]).val() != '선택 안함' && $(comp[i]).val() != '선택 안함'){
				alert('수정하시려면 자격증 이미지는 필수로 선택해주세요');
				return false;
			}
		}
		console.log(" ============================== ")
	}
 	console.log("서버 전송 직전 출력");
	$.ajax({
		url : '${path}/expert/modifyLicense',
		data : formData,
		type : 'post',
		contentType : false,
		processData : false,
		dataType : "json",
		success : function(data) {
			console.log("전송 완료 후 출력 data : " + data);
			if(data == 1){
				alert("수정 완료 되었습니다.");
			}else{
				alert("수정 실패 관리자에게 문의하세요");
			}
		}
	});
}

// 수정완료 버튼

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
	console.log("z :  "+frm2);
	if(frm2 == undefined){
		formData.append('beforeProfile',"${loginMember.profilePic}");
	}else{
	formData.append('upFile',frm2,frm2.name);
	}
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
			if(data == 1){
				alert("수정 완료 되었습니다.");
			}else{
				alert("수정 실패 관리자에게 문의하세요");
			}
		}
	});
}

//호버 이미지 섬네일 변경 & 업로드
for(let i = 1; i < 4; i++){
	$('#licenseImg'+i).hover(function(){
		liWith1 =  $("#imgLicense"+i).width();
		liHeight1 =  $("#imgLicense"+i).height();
	    $('#licenseImgView'+i).css('display','flex');
	   $("#licenseImg"+i).css('display','none');
	}, function() {
		$('#licenseImgView'+i).css('display','none');
		   $("#licenseImg"+i).css('display','flex');
	});

	$('#licenseImgView'+i).hover(function(){
	    $('#licenseImgView'+i).css('display','flex');
	   $("#licenseImg"+i).css('display','none');
	}, function() {
		$('#licenseImgView'+i).css('display','none');
		   $("#licenseImg"+i).css('display','flex');
	});
	
	$("#licenseImgView"+i).click(e => {
		 $("#licenseUpload"+i).click();
	});
	
	$("#licenseUpload"+i).change(function(e){
	    e.preventDefault();
		console.log("이미지 선택됨");
		console.log("files : " + $("#licenseUpload"+i).val());
		let file2 = $("#licenseUpload"+i).val();
		
		let f = (file2).substring((file2).lastIndexOf('.'),(file2).length);
		console.log(f);
		fileViewUpload(f,liWith1,liHeight1,$('#licenseImg'+i),this)
	});
}


function fileViewUpload(f,w,h,im,up){
	if(f != '.png' && f != '.jpg' && f != '.jpeg' && f != '.gif'){
		alert('이미지 파일만 업로드 가능합니다.');
		return false;
		}else{
		let file = up.files[0];
	    reader = new FileReader();
	    reader.onload = function (event) {
	        let img = new Image();
	        img.src = event.target.result;
	        img.width = w;
	        img.height = h;
	        im.empty();
	        im.append(img);
	    };
	    reader.readAsDataURL(file);
	    return false;
		}
}
</script>
