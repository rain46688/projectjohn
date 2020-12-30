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
<link rel="stylesheet" href="${path}/resources/css/layout.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
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
		margin: 2rem auto;
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
			<form id="memberEnrollFrm" name="memberEnrollFrm" action="${path}/signUpEnd" method="post" enctype="multipart/form-data">
				<input type="email" id="id" name="memEmail" class="input" placeholder="이메일" required style="width: 59%;">
				<input type="button" class="button" id="certibtn" value="인증번호 전송" style="text-align: center;"><br>
				<div class="constrain" id="idConstrain"></div>
				<div class="constrain" id="idDuplicateAjax"></div>
				<div style="display:none;" id="certiDiv">
					<input type="text" class="input" id="certiNum" name="certiNum" placeholder="인증번호를 입력해주세요." required>
					<div style="display:none;" id="certiResult"></div>
					<div class="constrain" id="certiDuplicate"></div>
				</div>

				<input type="password" placeholder="비밀번호" class="input" id="pw" name="memPwd" minlength="4" maxlength="16" required>
				<div class="constrain" id="pwConstrain"></div>
				<input type="password" placeholder="비밀번호 확인" class="input" id="pw2">
				<div class="constrain" id="pw2Constrain"></div>
				
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
						<input type="radio" class="gender" name="gender" id="male" value="M"><label for="gender0">&nbsp;남</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="gender" name="gender" id="female" value="F"><label for="gender1">&nbsp;여</label>
					</div>
				</div>
				<div class="constrain" id="gdConstrain"></div>
				
				<div class="dividedForm" style="margin-bottom: 0;">
					<div class="dividedTitle">
						생년월일
					</div>
					<div class="dividedText">
						<input type="text" class="input birthdate" id="year" name="year" maxlength="4" placeholder="년(4자)" style="width: 33%;">
						<select class="input birthdate" id="month" name="month" style="width: 32%;">
							<option>월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>                                    
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						<input type="text" class="input birthdate" id="date" name="date" maxlength="2" placeholder="일" style="width: 32%;">
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
		// id제약조건
		var idPattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		const id=$("#id").val().trim();
		$(function(){
			$("#id").blur(e=>{
				const id=$("#id").val().trim();
				if(id===""){
					$("#idConstrain").html("필수 입력 항목입니다.");
					$("#idConstrain").css({"display":"block"});
				}
			})
			$("#id").keyup(function(e){
				const id=$("#id").val().trim();
				$("input[name=checked_id]").val('');
				if(id.length!=0&&!idPattern.test(id)){
					$("#idConstrain").html("이메일 형식을 지켜주세요.");
					$("#idConstrain").css({"display":"block"});
				}
				else{
					$("#idConstrain").css({"display":"none"});
				}
			});
		});
		$("#id").keyup(e=>{
			$.ajax({
				url:"${path}/emailDuplicate",
				data:{"memEmail":$("#id").val().trim()},
				type:"post",
				dataType:"html",
				success: function(data){
					$("#idDuplicateAjax").html(data);
					$("#idDuplicateAjax").css({"display":"block"});
				}
			});
		});

		$("#certibtn").click(e=>{
			const id=$("#id").val().trim();
			if(id==="" || !idPattern.test(id)){
				alert("이메일 주소를 입력해주세요.")
			}else if($("#checkIdhidden").val()=='existed'){
				alert("중복된 아이디는 사용할 수 없습니다.")
			}else{
				$.ajax({
					url: "${path}/certiEmail",
					data: {"email":$("#id").val()},
					type: "post",
					dataType: "html",
				success:function(data){
					$("#certiDiv").css({"display":"block"});
					$("#certiResult").html(data);
					alert("인증번호를 발송했습니다. 메일함을 확인해주세요.");
				}
				});
			};
		});

		$("#certiNum").keyup(e=>{
			if($("#certiKey").val().trim()==$("#certiNum").val().trim()){
				$("#certiDuplicate").html("인증번호가 일치합니다.");
				$("#certiDuplicate").css({"display":"block"});
				$("#certiDuplicate").css({"color":"green"});
			}else{
				$("#certiDuplicate").html("인증번호가 일치하지 않습니다.");
				$("#certiDuplicate").css({"display":"block"});
				$("#certiDuplicate").css({"color":"red"});
			}
		})

		$("#id").keyup(e=>{
			$("#certiNum").val('');
			$("#certiDuplicate").html('');
			$("#certiResult").html('');
		});

		$('#id').on('keypress', function(e){
			if(e.keyCode==13) {
				$("#certibtn").click();
			}
		});  

		// pw제약조건
		var pwPattern = /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{4,16}$/;
		$(function(){
			$("#pw").blur(e=>{
				const pw=$("#pw").val().trim();
				if(pw===""){
					$("#pwConstrain").html("필수 입력 항목입니다.");
					$("#pwConstrain").css({"display":"block"});
				}
			})
			$("#pw").keyup(function(e){
				const pw=$("#pw").val().trim();
				const pw2=$("#pw2").val().trim();
				if(!pwPattern.test(pw)){
					$("#pwConstrain").html("4~16자 영문, 숫자를 혼합하여 입력해주세요");
					$("#pwConstrain").css({"display":"block"});
				}else{
					$("#pwConstrain").css({"display":"none"});
				}				
				if(pw!=pw2){
					$("#pw2Constrain").html("비밀번호 확인을 해주세요.");
					$("#pw2Constrain").css({"display":"block"});
				}
			});
			$("#pw2").blur(e=>{
				const pw=$("#pw").val().trim();
				const pw2=$("#pw2").val().trim();
				if(pw2===""){
					$("#pw2Constrain").html("비밀번호 확인을 해주세요.");
					$("#pw2Constrain").css({"display":"block"});
				}else if(pw!=pw2){
					$("#pw2Constrain").html("비밀번호가 일치하지 않습니다.");
					$("#pw2Constrain").css({"display":"block"});
				}
			})
			$("#pw2").keyup(function(e){
				const pw=$("#pw").val().trim();
				const pw2=$("#pw2").val().trim();
				if(pw!=pw2){
					$("#pw2Constrain").html("비밀번호가 일치하지 않습니다.");
					$("#pw2Constrain").css({"display":"block"});
				}else{
					$("#pw2Constrain").css({"display":"none"});
				}

			});
		});

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

		//성별
		$("#male").click(function(e){
			$("#gdConstrain").css({"display":"none"});
		});
		$("#female").click(function(e){
			$("#gdConstrain").css({"display":"none"});
		});

		//생년월일 제약조건
		var yyPattern=/[0-9]{4}$/;
		var ddPattern=/[0-9]{2}$/;
		$(function(){
			$("#year").keyup(function(e){
				const yy=$("#year").val().trim();
				const mm=$("#month").val();
				if(!yyPattern.test(yy)){
					$("#bdConstrain").html("태어난 년도 네 자리를 입력해주세요");
					$("#bdConstrain").css({"display":"block"});
				}else if(yyPattern.test(yy)&& (mm==="월"||mm==="")){
					$("#bdConstrain").html("태어난 월을 선택해주세요");
					$("#bdConstrain").css({"display":"block"});
				}else{
					$("#bdConstrain").css({"display":"none"});
				}
			});
			$("#date").keyup(function(e){
				const mm=$("#month").val();
				const dd=$("#date").val().trim();
				if(mm==="01" || mm==="03" || mm==="05" || mm==="07" || mm==="08" || mm==="10" || mm==="12"){
					if(!ddPattern.test(dd) || Number(dd)>31){
						$("#bdConstrain").html("태어난 날을 두 자리로 입력해주세요");
						$("#bdConstrain").css({"display":"block"});
					}else{
						$("#bdConstrain").css({"display":"none"});
					}
				}else if(mm==="02"){
					if(!ddPattern.test(dd) || Number(dd)>29){
						$("#bdConstrain").html("태어난 날을 두 자리로 입력해주세요");
						$("#bdConstrain").css({"display":"block"});
					}else{
						$("#bdConstrain").css({"display":"none"});
					}
				}else{
					if(!ddPattern.test(dd) || Number(dd)>30){
						$("#bdConstrain").html("태어난 날을 두 자리로 입력해주세요");
						$("#bdConstrain").css({"display":"block"});
					}else{
						$("#bdConstrain").css({"display":"none"});
					}
				}
			});
			$(".birthdate").blur(e=>{
				const yy=$("#year").val().trim();
				const mm=$("#month").val().trim();
				const dd=$("#date").val().trim();
				if(yy==="" || mm==="" || dd==="" || mm=="월"){
					$("#bdConstrain").html("필수 입력 항목입니다.");
					$("#bdConstrain").css({"display":"block"});
					$("#bdConstrain").css({"color":"red"});
				}else if(!yyPattern.test(yy)){
					$("#bdConstrain").html("태어난 년도 네 자리를 입력해주세요.");
					$("#bdConstrain").css({"display":"block"});
					$("#bdConstrain").css({"color":"red"});
				}else if(yy!==""&&(mm==="01" || mm==="03" || mm==="05" || mm==="07" || mm==="08" || mm==="10" || mm==="12")){
					if(!ddPattern.test(dd) || Number(dd)>31){
						$("#bdConstrain").html("태어난 날을 두 자리로 입력해주세요");
						$("#bdConstrain").css({"display":"block"});
					}else{
						$("#bdConstrain").css({"display":"none"});
					}
				}else if(yy!==""&&mm==="02"){
					if(!ddPattern.test(dd) || Number(dd)>29){
						$("#bdConstrain").html("태어난 날을 두 자리로 입력해주세요");
						$("#bdConstrain").css({"display":"block"});
					}else{
						$("#bdConstrain").css({"display":"none"});
					}
				}else{
					if(!ddPattern.test(dd) || Number(dd)>30){
						$("#bdConstrain").html("태어난 날을 두 자리로 입력해주세요");
						$("#bdConstrain").css({"display":"block"});
					}else{
						$("#bdConstrain").css({"display":"none"});
					}
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
			//아이디
			const id=$("#id").val().trim();
			if(id===""){
				$("#idConstrain").html("필수 입력 항목입니다.");
				$("#idConstrain").css({"display":"block"});
			}
			//비밀번호
			const pw=$("#pw").val().trim();
			if(pw===""){
				$("#pwConstrain").html("필수 입력 항목입니다.");
				$("#pwConstrain").css({"display":"block"});
			}
			//비밀번호 확인
			const pw2=$("#pw2").val().trim();
			if(pw2===""){
				$("#pw2Constrain").html("비밀번호 확인을 해주세요.");
				$("#pw2Constrain").css({"display":"block"});
			}
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
			//성별
			const gender=$('input:radio[name="gender"]:checked').val();
			if(gender==null){
				$("#gdConstrain").html("필수 선택 항목입니다.");
				$("#gdConstrain").css({"display":"block"});
				$("#gdConstrain").css({"color":"red"});
			}
			//생년월일
			const yy=$("#year").val().trim();
			const mm=$("#month").val().trim();
			const dd=$("#date").val().trim();
			if(yy==="" || mm==="" || dd==="" || mm=="월"){
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
			if($("#checkIdhidden").val()=='existed'){
				alert('아이디 중복 확인을 해주세요.');
			}
			if($("#certiKey").val()!=$("#certiNum").val()){
				alert('이메일 인증을 확인해주세요.');
			}
			if($("#checkNNhidden").val()=='existed'){
				alert('닉네임 중복 확인을 해주세요.');
			}
			if($("#checkPNhidden").val()=='existed'){
				alert('휴대폰 번호 중복 확인을 해주세요.');
			}

			//제약조건을 만족했나요
			if(id!=="" && (pw!==""&&pwPattern.test(pw)) && (pw2!==""&&pw===pw2) && (nn!==""&&nnPattern.test(nn))
				&& (memClass==10||memClass.length>1) && (name!==""&&namePattern.test(name))
				&& (gender.length==1||gender.length>1)
				&& (yy!=="" && yyPattern.test(yy)) && mm!=="" && mm!=="월" && (dd!==""&&ddPattern.test(dd)) 
				&& (phone!==""&&pnPattern.test(phone))
				&& $("#checkIdhidden").val()!='existed' && $("#checkNNhidden").val()!='existed' 
				&& $("#checkPNhidden").val()!='existed' && $("#certiKey").val().trim()==$("#certiNum").val().trim()
			){
				$("#memberEnrollFrm").submit();
			}else{
				alert("필수 입력 항목을 확인해주세요.");
			}

		}

	</script>
</section>
</body>
</html>









