<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재판하는존경장님</title>
<link rel="icon" type="image/png" href="${path }/resources/images/favicon.ico">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/layout.css">
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<!-- 네이버 sdk -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<style>
	body *{
		font-family: 'Noto Serif KR', serif;
	}
	#signUpBox {
		width: 780px;
		margin: auto;
	}
	#signUpField {
		position: relative;
		background: #FFFFFF;
		max-width: 80%;
		margin: 0 auto;
		padding: 20px 45px 20px 45px;
		text-align: center;
	}
	#signUpField .input {
		outline: none;
		border: black solid 1px;
		background-color: white;
		width: 80%;
		margin: 0 0 15px;
		padding: 15px;
		box-sizing: border-box;
		font-size: 14px;
	}
	#signUpField button{
		outline: none;
		background: #00316D;
		width: 80%;
		border: none;
		margin: 0 0 15px;
		padding: 15px;
		color: #FFFFFF;
		font-size: 14px;
		cursor: pointer;
	}
	#signUpField > form:nth-child(2) input.button{
		outline: none;
		background: #00316D;
		width: 20%;
		border: none;
		margin: 0 0 15px;
		padding: 15px 0;
		color: #FFFFFF;
		font-size: 14px;
		cursor: pointer;
		text-align: center;

	}
	div.dividedForm{
		display: flex;
		width: 80%;
		margin: 0 15px 15px 56px;
		padding: 0;
		align-items: flex-start;
	}
	div.dividedTitle{
		position: relative;
		width: 20%;
		float: left;
		text-align: left;
	}
	div.dividedText{
		position: relative;
		width: 80%;
		float: right;
		text-align: left;
	}
	div.constrain{
		margin-top: -10px;
		margin-bottom: 15px;
		margin-left: 60px;
		font-size: 12px;
		color: red;
		display: none;
		text-align: left;
	}
	div.divForExpert, div#forExpertTitle{
		display: none;
	}
	div.addLicenseDiv,div.removeLicenseDiv{
		display: none;
	}
	div.divForExpert{
		width: 100%;
		margin: 2.5rem auto;
		margin-top: 0;
		padding: 1rem;
		background-color: white;
	}
	div.divForExpert input.inputUL{
		width: 80%;
	}
	#signUpField div.input-group button.browse{
		padding: 0;
		margin: 1rem auto 5px;
	}
	div.divForExpert div.input-group input.inputUL{
		width: 50%;
		margin-right: 0;
	}
</style>
<body>
<section>
	<div id="signUpBox">
		<div id="signUpField">
			<h2 style="margin-bottom: 50px;">회원가입</h2>
			<form id="memberEnrollFrm" name="memberEnrollFrm" action="${path}/signUpNaverEnd" method="post" enctype="multipart/form-data">
				<input type="email" id="id" name="memEmail" class="input" readonly>
				
				<input type="text" placeholder="닉네임" class="input" id="nickname" name="memNickname" maxlength="10" required>
				<div class="constrain" id="nnConstrain"></div>
				<div class="constrain" id="nickDuplicateAjax"></div>

				<input type="text" placeholder="이름" class="input checkLength" id="name" name="memName" minlength="2" maxlength="5" required>
				<div class="constrain" id="nameConstrain"></div>
				
				<div class="dividedForm">
					<div class="dividedTitle">
						성별
					</div>
					<div class="dividedText">
						<input type="hidden" class="gender input" name="gender" id="gender" readonly>
						<input type="text" class="gender input" id="gender2" readonly>
					</div>
				</div>
				
				<div class="dividedForm" style="margin-bottom: 0;">
					<div class="dividedTitle">
						생년월일
					</div>
					<div class="dividedText">
						<input type="text" class="input birthdate" id="year" name="year" maxlength="4" placeholder="년(4자)" style="width: 33%;">
						<input type="text" class="input birthdate" id="month" name="month" style="width: 32%;" readonly>
						<input type="text" class="input birthdate" id="date" name="date" maxlength="2" placeholder="일" style="width: 32%;" readonly>
					</div>
				</div>
				<div class="constrain" id="bdConstrain"></div>

				<input type="tel" placeholder="휴대폰" class="input checkLength" id="phone" name="tel" maxlength="11">
				<div class="constrain" id="pnConstrain"></div>
				<div class="constrain" id="phoneDuplicateAjax"></div>
				
				<div class="dividedForm">
					<div class="dividedTitle">
						회원구분
					</div>
					<div class="dividedText">
						<input type="radio" class="memClass" name="memClass" id="normalUser" value="normalUser"><label for="normalUser">&nbsp;일반유저</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="memClass" name="memClass" id="expertUser" value="expertUser"><label for="expertUser">&nbsp;전문가</label>
					</div>
				</div>
				<div class="constrain" id="classConstrain"></div>
				<div class="constrain" id="mcConstrain"></div>
				
				<div id="forExpertTitle">
						자격증 정보
						<p style="font-size: 14px;">
							자격증 정보는 노출되지 않으며<br>
							관리자가 회원님이 상담전문가임을 확인하는 용도에만 쓰입니다.<br>
							자격증은 총 세 개까지 업로드 가능합니다.
						</p>
				</div>
				<div id="forExpert1" class="divForExpert"></div>
				<div id="forExpert2" class="divForExpert"></div>
				<div id="forExpert3" class="divForExpert"></div>
				<div class="addLicenseDiv" id="addLicenseDiv1">
					<button type="button" class="addLicenseBtn licenseBtn" id="addLicenseBtn1">추가</button>
				</div>
				<div class="addLicenseDiv" id="addLicenseDiv2">
					<button type="button" class="addLicenseBtn licenseBtn" id="addLicenseBtn2">추가</button>
				</div>
				<div class="removeLicenseDiv" id="removeLicenseDiv1">
					<button type="button" class="removeLicenseBtn licenseBtn" id="removeLicenseBtn1">삭제</button>
				</div>
				<div class="removeLicenseDiv" id="removeLicenseDiv2">
					<button type="button" class="removeLicenseBtn licenseBtn" id="removeLicenseBtn2">삭제</button>
				</div>

				<button class="bottombtns" type="button" style="width:40%; margin-top: 30px;" onclick="fn_enroll();">가입</button>
				<button class="bottombtns" type="reset" style="width:40%; margin-top: 30px;">취소</button>

			</form>
		</div>
	</div>
	<script>
		// 닉네임 제약조건
		var nnPattern= /[0-9]|[a-z]|[A-Z]|[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{1,10}/;
		$(function(){
			$("#nickname").blur(e=>{
				const nn=$("#nickname").val().trim();
				if(nn===""){
					$("#nnConstrain").html("필수 입력 항목입니다.");
					$("#nnConstrain").css({"display":"block"});
					$("#nnConstrain").css({"color":"red"});
				}else{
					$("#nnConstrain").css({"display":"none"});
				}
			});
			$("#nickname").keyup(function(e){
				const nn=$("#nickname").val().trim();
				$("input[name=checked_nn]").val('');
				if(nn!==""){
					$("#nnConstrain").html("10자 이하의 입력이 가능합니다.");
					$("#nnConstrain").css({"display":"block"});
					$("#nnConstrain").css({"color":"green"});
				}
			});
		});

		const nn=$("#nickname").val().trim();
		$("#nickname").keyup(e=>{
			$.ajax({
				url:"${path}/NNDuplicate",
				data:{"memNickname":$(e.target).val()},
				type:"post",
				dataType:"html",
				success:function(data){
					$("#nickDuplicateAjax").html(data);
					$("#nickDuplicateAjax").css({"display":"block"});
				}
			});
		});

		//이름 제약조건
		var namePattern= /[a-zA-Z가-힣]{2,5}$/;
		$(function(){
			$("#name").blur(e=>{
				const name=$("#name").val().trim();
				if(name===""){
					$("#nameConstrain").html("필수 입력 항목입니다.");
					$("#nameConstrain").css({"display":"block"});
					$("#nameConstrain").css({"color":"red"});
				}else if(name!==""&&!namePattern.test(name)){
					$("#nameConstrain").html("2~5자의 한글, 영문 입력이 가능합니다.");
					$("#nameConstrain").css({"display":"block"});
					$("#nameConstrain").css({"color":"green"});
				}else{
					$("#nameConstrain").css({"display":"none"});
				}
			});
			$("#name").keyup(function(e){
				const name=$("#name").val().trim();
				if(!namePattern.test(name)){
					$("#nameConstrain").html("2~5자의 한글, 영문 입력이 가능합니다.");
					$("#nameConstrain").css({"display":"block"});
					$("#nameConstrain").css({"color":"green"});
				}else{
					$("#nameConstrain").css({"display":"none"});
				}
			});
		});

		//회원구분
		$("#normalUser").click(function(e){
			$("#mcConstrain").css({"display":"none"});
		});
		$("#expertUser").click(function(e){
			$("#mcConstrain").css({"display":"none"});
		});

		// 파일관련
		$(document).on('click','.browse',function(){
			var file=$(this).parent().parent().find('.file');
			file.trigger('click');
		});
		$(document).on('change','.file',function(){
			$(this).parent().find('.inputFile').val($(this).val().replace(/C:\\fakepath\\/i,''));
		});

		//addLicense1
		$("input:radio[id='expertUser']").click(function(e){
			$("#forExpertTitle").css({"display":"block"});
			$.ajax({
				url: "${path}/divForExpert",
				type: "get",
				dataType: "html",
			success:function(data){
				$("#forExpert1").html(data);
				$("#forExpert1").css({"display":"block"});
				$("#addLicenseDiv1").css({"display":"block"});
			}
			})
		});

		//addLicense2
		$("#addLicenseBtn1").click(function(e){
			$("#addLicenseDiv1").css({"display":"none"})
			$.ajax({
				url: "${path}/divForExpert",
				type: "get",
				dataType: "html",
			success:function(data){
				$("#forExpert2").html(data);
				$("#forExpert2").css({"display":"block"});
				$("#addLicenseDiv2").css({"display":"block"});
				$("#removeLicenseDiv1").css({"display":"block"});
			}
			});
		});

		//addLicense3
		$("#addLicenseBtn2").click(function(e){
			$("#addLicenseDiv2").css({"display":"none"});
			$("#removeLicenseDiv1").css({"display":"none"});
			$.ajax({
				url: "${path}/divForExpert",
				type: "get",
				dataType: "html",
			success:function(data){
				$("#forExpert3").html(data);
				$("#forExpert3").css({"display":"block"});
				$("#removeLicenseDiv2").css({"display":"block"});
			}
			});
		});

		//removeLicense3
		$("#removeLicenseBtn2").click(function(e){
			$("#forExpert3").html('');
			$("#forExpert3").css({"display":"none"});
			$("#removeLicenseDiv2").css({"display":"none"});
			$("#addLicenseDiv2").css({"display":"block"});
			$("#removeLicenseDiv1").css({"display":"block"});
		});

		//removeLicense2
		$("#removeLicenseBtn1").click(function(e){
			$("#forExpert2").html('');
			$("#forExpert2").css({"display":"none"});
			$("#removeLicenseDiv1").css({"display":"none"});
			$("#addLicenseDiv2").css({"display":"none"});
			$("#addLicenseDiv1").css({"display":"block"});
		});

		// 아니라면
		$("input:radio[id='normalUser']").click(function(e){
			$("#forExpertTitle").css({"display":"none"});
			$(".divForExpert").html('');
			$(".divForExpert").css({"display":"none"});
			$(".addLicenseDiv").css({"display":"none"});
			$(".removeLicenseDiv").css({"display":"none"});
		});

		//생년월일 제약조건
		var yyPattern=/[0-9]{4}$/;
		$(function(){
			$("#year").keyup(function(e){
				const yy=$("#year").val().trim();
				if(!yyPattern.test(yy)){
					$("#bdConstrain").html("태어난 년도 네 자리를 입력해주세요");
					$("#bdConstrain").css({"display":"block"});
				}else{
					$("#bdConstrain").css({"display":"none"});
				}
			});
			
			$(".birthdate").blur(e=>{
				const yy=$("#year").val().trim();
				if(yy===""){
					$("#bdConstrain").html("필수 입력 항목입니다.");
					$("#bdConstrain").css({"display":"block"});
					$("#bdConstrain").css({"color":"red"});
				}else if(!yyPattern.test(yy)){
					$("#bdConstrain").html("태어난 년도 네 자리를 입력해주세요.");
					$("#bdConstrain").css({"display":"block"});
					$("#bdConstrain").css({"color":"red"});
				}else{
					$("#bdConstrain").css({"display":"none"});
				}
			});	
		});

		//전화번호 제약조건
		var pnPattern = /^[0-9]{10,11}$/;
		$(function(){
			$("#phone").blur(e=>{
				const phone=$("#phone").val().trim();
				if(phone===""){
					$("#pnConstrain").html("필수 입력 항목입니다.");
					$("#pnConstrain").css({"display":"block"});
					$("#pnConstrain").css({"color":"red"});
				}else if(!pnPattern.test(phone)){
					$("#pnConstrain").html("10-11자의 휴대폰 번호를 입력해주세요.");
					$("#pnConstrain").css({"display":"block"});
					$("#pnConstrain").css({"color":"red"});
				}else{
					$("#pnConstrain").css({"display":"none"});
				}
			});
			$("#phone").keyup(function(e){
				const phone=$("#phone").val().trim();
				$("input[name=checked_pn]").val('');
				if(phone!==""){
					$("#pnConstrain").html("-를 제외하고 11자 이하로 입력해주세요.");
					$("#pnConstrain").css({"display":"block"});
					$("#pnConstrain").css({"color":"green"});
				}
			});
		});
		const phone=$("#phone").val().trim();
		$("#phone").keyup(e=>{
			$.ajax({
				url:"${path}/PNDuplicate",
				data:{"tel":$(e.target).val()},
				type:"post",
				dataType:"html",
				success:function(data){
					$("#phoneDuplicateAjax").html(data);
					$("#phoneDuplicateAjax").css({"display":"block"});
				}
			});
		});
		

		//유효성 확인
		function fn_enroll(){
			//닉네임
			const nn=$("#nickname").val().trim();
			if(nn===""){
				$("#nnConstrain").html("필수 입력 항목입니다.");
				$("#nnConstrain").css({"display":"block"});
				$("#nnConstrain").css({"color":"red"});
			}
			//이름
			const name=$("#name").val().trim();
			if(name===""){
				$("#nameConstrain").html("필수 입력 항목입니다.");
				$("#nameConstrain").css({"display":"block"});
				$("#nameConstrain").css({"color":"red"});
			}
			//회원구분
			const memClass=$('input:radio[name="memClass"]:checked').val();
			if(memClass==null){
				$("#mcConstrain").html("필수 선택 항목입니다.");
				$("#mcConstrain").css({"display":"block"});
				$("#mcConstrain").css({"color":"red"});
			}
			//생년월일
			const yy=$("#year").val().trim();
			if(yy===""){
				$("#bdConstrain").html("필수 입력 항목입니다.");
				$("#bdConstrain").css({"display":"block"});
				$("#bdConstrain").css({"color":"red"});
			}
			//휴대폰
			const phone=$("#phone").val().trim();
			if(phone===""){
				$("#pnConstrain").html("필수 입력 항목입니다.");
				$("#pnConstrain").css({"display":"block"});
			}
			//중복확인을 했나요
			if($("#checkNNhidden").val()=='existed'){
				alert('닉네임 중복 확인을 해주세요.');
			}
			if($("#checkPNhidden").val()=='existed'){
				alert('휴대폰 번호 중복 확인을 해주세요.');
			}

			//제약조건을 만족했나요
			if((nn!==""&&nnPattern.test(nn))
				&& (memClass==10||memClass.length>1) && (name!==""&&namePattern.test(name))
				&& (yy!=="" && yyPattern.test(yy)) && (phone!==""&&pnPattern.test(phone))
				&& $("#checkNNhidden").val()!='existed' 
				&& $("#checkPNhidden").val()!='existed'
			){
				$("#memberEnrollFrm").submit();
			}else{
				alert("필수 입력 항목을 확인해주세요.");
			}

		}

	</script>
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "AMmEekjxUV4y7wrTtNF7",
				/*callbackUrl: "https://localhost/john/callBackNaver",*/
				callbackUrl: "https://rclass.iptime.org/20AM_john_final/callBackNaver",
				isPopup: false,
				callbackHandle: false
			}
		);
		naverLogin.init();
	
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				var email = naverLogin.user.getEmail();
				var gender = naverLogin.user.getGender();
				var birthday = naverLogin.user.getBirthday();
				var uniqId = naverLogin.user.getId();
				$("#id").val(email);
				$("#gender").val(gender);
				if(gender=='F'){
					$("#gender2").val('여성');
				}else{
					$("#gender2").val('남성');
				}
				var birthmm=birthday.substring(0,2);
				var birthdd=birthday.substring(3);
				$("#month").val(birthmm);
				$("#date").val(birthdd);
			} else {
				console.log("AccessToken이 올바르지 않습니다.");
			}
		});
	</script>
</section>
</body>
</html>









