<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<head>
	<!-- 글씨체 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<style>
	#content *{
		/* border: 1px red solid; */
		font-family: 'Noto Serif KR', serif;
	}
	div.field{
		overflow: auto;
		width: 50%;
		margin: 50px auto;
		background-color: white;
	}
	div.titleContainer{
		font-size: 1.2rem;
		font-weight: bold;
		margin: 1.5em 1rem;
		margin-bottom: 0;
	}
	hr.infoHr{
		color: black;
		width: 40%;
		margin-top: 0.2rem;
		margin-left: 1rem;
		border: 1px black solid;
	}
	div.constrain{
		display: none;
		font-size: 0.8rem;
		color: red;
		margin: 0 21%;
		text-align: left;
	}
	input.textField{
        outline: none;
        border: black solid 1px;
        background-color: white;
        width: 60%;
        height: 2.5rem;
        margin: 10px 20%;
		margin-bottom: 5px;
        padding: 5px;
        box-sizing: border-box;
        font-size: 1rem;
    }
	div.formContainer{
		text-align: center;
	}
	button.formBtn{
        min-width: 100px;
        width: 10%;
        padding: 5px;
        font-size: 0.9rem;
        cursor: pointer;
        text-align: center;
        margin: 1rem auto;
    }
	div.formDivided{
		width: 50%;
		float: left;
	}
	div.formDivided *{
		display: flex;
		justify-content: center;
		align-items: center;
	}
	div.profilePicDiv{
		position: relative;
		min-width: 10em;
		float: left;
		display: flex;
		justify-content: center;
		align-items: center;
		border: none;
		margin: 1rem auto;
	}
	div.profilePicDiv img{
		border: none;
		position: relative;
		margin: auto;
		border-radius: 15px;
		height: 10em;
		width: 10em;
		max-width: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		margin-left: 1em;
		margin-right: 1em;
	}
	input[type=file]{
		border: 1px blue solid;
		position: relative;
		top: 0;
		right: 0;
		min-width: 100%;
		min-height: 100%;
		font-size: 10px;
		text-align: right;
		filter: alpha(opacity=0);
		opacity: 0;
		outline: none;
		background: white;
 		cursor: inherit;
		display: none;
	}
	.file{
		visibility: hidden;
		position: relative;
 	}
	input#fileNameField{
		width: 45%;
		margin: 12px 5% 10px 20%;
	}
	button#findFile{
		float: left;
		margin: 1rem 0;
	}
</style>
<section id="content">
	<c:if test="${loginMember.socialLogin eq false}">
		<div class="field">
			<div class="titleContainer">
				비밀번호 변경하기
			</div>
			<hr class="infoHr">
			<div class="formContainer">
				<form action="${path}/member/myPage/updatePw?usid=${loginMember.usid }" method="POST" id="updatePwForm">
					<input type="password" id="crtPw" name="crtPw" class="textField" placeholder="현재 비밀번호">
					<div class="constrain" id="crtPwConstrain"></div>
					<input type="password" id="newPw" name="newPw" class="textField" placeholder="새로운 비밀번호">
					<div class="constrain" id="newPwConstrain"></div>
					<input type="password" id="newPw2" name="newPw2" class="textField" placeholder="새로운 비밀번호 확인">
					<div class="constrain" id="newPwConstrain2"></div>
					<button type="button" class="formBtn btn btn-outline-dark" onclick="fn_updatePw()">변경하기</button>
				</form>
			</div>
		</div>
	</c:if>
	<div class="field">
		<div class="titleContainer">
			닉네임 변경하기
		</div>
		<hr class="infoHr">
		<div class="formContainer">
			<form action="${path}/member/myPage/updateNick?usid=${loginMember.usid }" method="POST" id="updateNickForm">
				<input type="text" placeholder="변경할 닉네임을 입력해주세요."  class="textField" id="nickname" name="memNickname" maxlength="10">
				<div class="constrain" id="nnConstrain"></div><br>
				<div class="constrain" id="nickDuplicateAjax"></div>
				<button type="button" class="nnbtn formBtn btn btn-outline-dark" onclick="fn_updateNick();">변경하기</button>
			</form>
		</div>
	</div>
	<div class="field">
		<div class="titleContainer">
			프로필 사진 변경하기
		</div>
		<hr class="infoHr">
		<div class="formContainer">
			<div class="formDivided">
				<div>
					현재 프로필 사진
				</div>
				<div>
					<div class="profilePicDiv">
						<img src="${path }/resources/profile_images/${member.getProfilePic()}">
					</div>
				</div>
			</div>
			<div class="formDivided">
				<div>
					새로운 프로필 사진
				</div>
				<form id="updateProfilePicForm" action="${path}/member/myPage/updatePic?usid=${loginMember.usid }" enctype="multipart/form-data" method="post">
					<div>
						<div class="profilePicDiv">
							<img id="imgPreview">
						</div>
					</div>
			</div>
			<div>
				<input type="file" name="filePic" id="real-input" class="file">
					<div class="input-group col-xs-12">
						<input type="text" class="inputFile textField" id="fileNameField" disabled placeholder="이미지를 업로드 하세요.">
						<button type="button" id="findFile" class="browse pcbtn formBtn btn btn-outline-dark" onclick="fn_browseFile();">
							파일찾기
						</button>
					</div>
					<button type="button" class="pcbtn formBtn btn btn-outline-dark" onclick="fn_updatePic();">변경하기</button>
				</form>
			</div>
		</div>
	</div>
	<div class="field">
		<div class="titleContainer">
			전화번호 수정하기
		</div>
		<hr class="infoHr">
		<div class="formContainer">
			<form action="${path}/member/myPage/updatePhone?usid=${loginMember.usid }" id="updatePhoneForm" method="POST">
				<input type="tel" placeholder="휴대폰" class="input checkLength textField" id="phone" name="tel" maxlength="11">
				<div class="constrain" id="pnConstrain"></div>
				<div class="constrain" id="phoneDuplicateAjax"></div>
				<button type="button" class="formBtn btn btn-outline-dark" onclick="fn_updatePhone()">변경하기</button>
			</form>
		</div>
	</div>
	<div class="field">
		<div class="titleContainer">
			회원 탈퇴하기
		</div>
		<hr class="infoHr">
		<div class="formContainer">
			<form action="${path}/member/goodBye" id="goodBye" method="POST">
				정말 탈퇴하시겠습니까?<br>
				<button type="button" class="formBtn btn btn-outline-dark" onclick="fn_goodBye()" style="width: 10rem;">네, 탈퇴하겠습니다.</button>
				<input type="text" name="goodByeUsid" value="${loginMember.usid}" readonly style="display: none;">
			</form>
		</div>
	</div>
</section>
<script>
	//비밀번호 제약조건
	var pwPattern = /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{4,16}$/;
	$(function(){
		$("#crtPw").blur(e=>{
			const crtPw=$("#crtPw").val().trim();
			if(crtPw===""){
				$("#crtPwConstrain").html("필수 입력 항목입니다.");
				$("#crtPwConstrain").css({"display":"block"});
			}else{
				$("#crtPwConstrain").css({"display":"none"});
			}
		});
		$("#crtPw").keyup(function(e){
			const crtPw=$("#crtPw").val().trim();
			if(crtPw===""){
				$("#crtPwConstrain").html("필수 입력 항목입니다.");
				$("#crtPwConstrain").css({"display":"block"});
			}else{
				$("#crtPwConstrain").css({"display":"none"});
			}
		});
		$("#newPw").blur(e=>{
			const newPw=$("#newPw").val().trim();
			if(newPw===""){
				$("#newPwConstrain").html("필수 입력 항목입니다.");
				$("#newPwConstrain").css({"display":"block"});
			}
		})
		$("#newPw").keyup(function(e){
			const newPw=$("#newPw").val().trim();
			const newPw2=$("#newPw2").val().trim();
			if(!pwPattern.test(newPw)){
				$("#newPwConstrain").html("4~16자 영문, 숫자를 혼합하여 입력해주세요");
				$("#newPwConstrain").css({"display":"block"});
			}else{
				$("#newPwConstrain").css({"display":"none"});
			}				
			if(newPw!=newPw2){
				$("#newPwConstrain2").html("비밀번호 확인을 해주세요.");
				$("#newPwConstrain2").css({"display":"block"});
			}
		});
		$("#newPw2").blur(e=>{
			const newPw=$("#newPw").val().trim();
			const newPw2=$("#newPw2").val().trim();
			if(newPw2===""){
				$("#newPwConstrain2").html("비밀번호 확인을 해주세요.");
				$("#newPwConstrain2").css({"display":"block"});
			}else if(newPw!=newPw2){
				$("#newPwConstrain2").html("비밀번호가 일치하지 않습니다.");
				$("#newPwConstrain2").css({"display":"block"});
			}
		})
		$("#newPw2").keyup(function(e){
			const newPw=$("#newPw").val().trim();
			const newPw2=$("#newPw2").val().trim();
			if(newPw!=newPw2){
				$("#newPwConstrain2").html("비밀번호가 일치하지 않습니다.");
				$("#newPwConstrain2").css({"display":"block"});
			}else{
				$("#newPwConstrain2").css({"display":"none"});
			}
		});
	});
	function fn_updatePw(){
		const crtPw=$("#crtPw").val().trim();
		const newPw=$("#newPw").val().trim();
		const newPw2=$("#newPw2").val().trim();
		if(crtPw!=="" && (newPw!==""&&pwPattern.test(newPw)) && (newPw2!==""&&newPw===newPw2)){
			$("#updatePwForm").submit();
		}else{
			alert("필수 입력 항목을 확인해주세요.");
		}
	};

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


	function fn_updateNick(){
		let nn=$("#nickname").val().trim();
		if(nn.length==0 || !nnPattern.test(nn)){
			alert("닉네임을 입력해주세요.");
		}else if($("#checkNNhidden").val()=='existed'){
			alert('닉네임 중복 확인을 해주세요.');
		}else{
			$("#updateNickForm").submit();
		};
	}

	//파일관련
	$(document).on('click','.browse',function(){
		var file=$(this).parent().parent().find('.file');
		file.trigger('click');
	});
	$(document).on('change','.file',function(){
		$(this).parent().find('.inputFile').val($(this).val().replace(/C:\\fakepath\\/i,''));
	});

	function fn_updatePic(){
		$("#updateProfilePicForm").submit();
	}

	$(document).ready(function(){
		function readURL(input) { 
			if (input.files && input.files[0]) { 
				var reader = new FileReader(); 
				reader.onload = function (e) { 
					$('#imgPreview').attr('src', e.target.result); 
			} 
			reader.readAsDataURL(input.files[0]); 
			} 
		}
		$("#real-input").change(function(){ 
			readURL(this); 
		}); 
	});

	//폰
	var pnPattern = /^[0-9]{10,11}$/;
	$(function(){
		$("#phone").blur(e=>{
			const phone=$("#phone").val().trim();
			if(phone===""){
				$("#pnConstrain").html("필수 입력 항목입니다.");
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

	function fn_updatePhone(){
		let pn=$("#phone").val().trim();
		if(pn.length==0 || !pnPattern.test(pn)){
			alert("휴대폰 번호를 입력해주세요.");
		}else if($("#checkPNhidden").val()=='existed'){
			alert('휴대폰 번호 중복 확인을 해주세요.');
		}else{
			$("#updatePhoneForm").submit();
		};
	}

	function fn_goodBye(){
		$("#goodBye").submit();
	}
</script>
</body>
</html>