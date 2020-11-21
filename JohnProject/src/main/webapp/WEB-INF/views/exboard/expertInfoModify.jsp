<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
<jsp:param name="title" value=" "/>
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
	
}

#content *{
	 border: 1px solid red;
}

#content{
	display:flex;
	justify-content:center;
	padding-top:3vh;
}

#mainDiv{
	width:60%;
	height:auto;
}

#upDiv{
	height:10%;
	width:100%;
}

#upDiv>h2{
	font-size:6vh;
	height:100%;
	font-weight:bold;
}

#profileDiv{
	width:100%;
	height:30%;
	display:flex;
}

#imgDiv{
	z-index:0;
	width:30%;
	height:100%;
}

#mirrorimgDiv{
	z-index:1;
	width:30%;
	height:100%;
	display:none;
	justify-content:center;
	align-items:center;
	background-color:rgba(200,200,200,0.6);
	position:relative;
	left:-30%;
	cursor:pointer;
}

#mirrorimgDiv>p{
	font-size:10vh;
	color:black;
}

#imgProfile{
	width:100%;
	height:100%;
}

#downDiv{
	width:100%;
	 height:55%; 
	 margin:1% 1% 0 1%;
}

.rowDiv{
	width:100%;
	height:25%;
	display:flex;
}

.rowDiv div{
	margin:0 1% 0 1%;
}

.leftDiv{
	width:50%;
	height:100%;
}

.rightDiv{
	width:50%;
	height:100%;
}

#buttonDiv{
	display:flex;
	justify-content:center;
}

p{
	font-size:4vh;
	font-weight:bold;
}

input{
	height:40%;
	width:40%;
}

select{
	width:100%;
	height:40%;
}

/* 위 텍스트 영역 눌르면 옆에 테두리 생기는거 지우는 용도 */
textarea:focus {
	outline: none;
}

textarea {
    resize: none;
}

#exTextArea{
	width:100%;
	height:100%;
}

#careerleftDiv{
	width:100%;
	height:50%;
	display:flex;
}

#exinput{
	width:30%;
	height:100%;
}

#exinput2{
	width:70%;
	height:100%;
}

h6{
	font-size:3vh;
	font-weight:bold;
}

</style>
<!-- https://unordinarydays.tistory.com/99 참고 -->
<!-- 멀티파트 폼 넣어야됨 -->
<section id="content">
	<div id="mainDiv">
		<div id="upDiv">
			<h2>전문가 정보 수정</h2>
		</div>
			<hr>
		<div id="profileDiv">
			<div id="imgDiv"><img src="${path }/resources/images/expert.png" id="imgProfile" class="img-thumbnail" /></div>
			<div id="mirrorimgDiv"><p>+</p></div>
		</div>
		<div id="downDiv">
		<!--  -->
			<div class="rowDiv">
				<div class="leftDiv">
				<p>경력</p>
				<div id="careerleftDiv">
					<div id="exinput"><input type="input" name="career" class="form-control short" /> </div>
					<div id="exinput2"><h6>년</h6></div>
					</div>
				</div>
				<div class="rightDiv">
				<p>전문 분야</p>
				<select id="counselSelect" name="counselSelect" required>
						<option value="req"  selected>부부 상담</option> 
						<option value="on" >연애 상담</option>
						<option value="off" >직장 상담</option>
						<option value="off" >심리 상담</option>
						<option value="off" >자녀 상담</option>
						<option value="off" >진로 상담</option>
					</select>
				</div>
			</div>
			<div class="rowDiv">
				<div class="leftDiv">
				<p>상담 가능 시간</p>
				<input name="time" type="time" value="xxx" min="mm" max="zzz"> ~
				<input name="time" type="time" value="xxx" min="mm" max="zzz">
				</div>
				<div class="rightDiv">
				<p>인사말</p>
				<textarea id="exTextArea" name="applyText"></textarea>
				</div>
			</div>
			<div class="rowDiv">
				<div class="leftDiv"></div>
				<div class="rightDiv"></div>
			</div>
			<!--  -->
			<div id="buttonDiv"><button class="btn btn-outline-success" onclick="location.href='${path}/expert/expertRequestPrintList'">수정완료</button></div>
		</div>	
	</div>
</section>


<script>

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
