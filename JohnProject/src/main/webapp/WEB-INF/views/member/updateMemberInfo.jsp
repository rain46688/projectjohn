<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<style>
	input[type=file]{
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
		display: block;
	}
	.file{
		visibility: hidden;
		position: relative;
	}
	#fileNameField{
        outline: none;
        border: black solid 1px;
        background-color: white;
        width: 59%;
        height: 36px;
        margin: 0 10px 15px;
        padding: 5px;
        box-sizing: border-box;
        font-size: 14px;
    }
	div.profilePicDiv{
		position: relative;
		width: 30%;
		float: left;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	#profilePicField,#imgPreview{
		position: relative;
		margin: auto;
		border-radius: 70%;
		height: 10em;
		width: 10em;
		border: 1px black thin;
		display: flex;
		justify-content: center;
		align-items: center;
		margin-left: 1em;
		margin-right: 1em;
	}
	button.pcbtn{
        outline: none;
        background: #735020;
        min-width: 100px;
        width: 15%;
        height: 36px;
        border: none;
        padding: 5px;
        color: #FFFFFF;
        font-size: 14px;
        cursor: pointer;
        text-align: center;
        margin: 0 0 15px 10px;
    }
</style>
	<section id="content">
		<div>
			<div>
				비밀번호 변경하기
			</div>
			<div>
				<form action="${path}/member/myPage/updatePw?usid=${loginMember.usid }" method="POST" id="updatePwForm">
					<input type="password" id="crtPw" name="crtPw" placeholder="현재 비밀번호">
					<div class="constrain" id="crtPwConstrain"></div>
					<input type="password" id="newPw" name="newPw" placeholder="새로운 비밀번호">
					<div class="constrain" id="newPwConstrain"></div>
					<input type="password" id="newPw2" name="newPw2" placeholder="새로운 비밀번호 확인">
					<div class="constrain" id="newPwConstrain2"></div>
					<button type="button" onclick="fn_updatePw()">변경하기</button>
				</form>
			</div>
		</div>
		<div>
			<div>
				닉네임 변경하기
			</div>
			<div>
				<form action="${path}/member/myPage/updateNick?usid=${loginMember.usid }" method="POST" id="updateNickForm">
					<input type="text" placeholder="변경할 닉네임을 입력해주세요." class="input" id="nickname" name="memNickname" maxlength="10">
					<div class="constrain" id="nnConstrain"></div><br>
					<div class="constrain" id="nickDuplicateAjax"></div>
					<button type="button" class="nnbtn" onclick="fn_updateNick();">변경하기</button>
				</form>
			</div>
		</div>
		<div>
			<div>
				프로필 사진 변경하기
			</div>
			<div>
				<div>
					<div>
						현재 프로필 사진
					</div>
					<img src="${path }/resources/profile_images/${loginMember.getProfilePic()}">
				</div>
				<div>
					<div>
						새로운 프로필 사진
					</div>
					<form id="updateProfilePicForm" action="${path}/member/myPage/updatePic?usid=${loginMember.usid }" enctype="multipart/form-data" method="post">
						<div>
							<div class="profilePicDiv" style="min-width: 180px; border: none;">
								<img id="imgPreview">
							 </div>
						</div>
						<br>
						<input type="file" name="profilePic" id="real-input" class="file">
						<div class="input-group col-xs-12">
							<input type="text" class="inputFile" id="fileNameField" disabled placeholder="이미지를 업로드 하세요.">
							<button type="button" class="browse pcbtn" onclick="fn_browseFile();">
								파일찾기
							</button>
						</div>
						<button type="button" class="pcbtn" onclick="fn_updatePic();">변경하기</button>
					</form>
				</div>
			</div>
		</div>
		<div>
			<div>
				전화번호 수정하기
			</div>
			<div>
				<form action="${path}/member/myPage/updatePhone?usid=${loginMember.usid }" id="updatePhoneForm" method="POST">
					<input type="tel" placeholder="휴대폰" class="input checkLength" id="phone" name="tel" maxlength="11">
					<div class="constrain" id="pnConstrain"></div>
					<div class="constrain" id="phoneDuplicateAjax"></div>
					<button type="button" onclick="fn_updatePhone()">변경하기</button>
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
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>









