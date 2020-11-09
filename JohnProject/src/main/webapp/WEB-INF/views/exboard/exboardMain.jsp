<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>

label, input {
	max-width:200px;
}

</style>

<section id="content">
EXPERT 테스트 페이지

	<label class="input-group-text" >닉네임 </label><input type="input" name="nick" class="form-control short" /><br>
	<!-- <label class="input-group-text" >방 번호 </label><input type="input" name="num" class="form-control short" /><br> -->
	임시 로그인 : 
	<button class="btn btn-outline-success" onclick="expertChat('e');">전문가 로그인</button>
	<button class="btn btn-outline-success" onclick="expertChat('m');">유저 로그인</button>
	<br>
	<br>
	
<!-- 	<hr>
	<form action="/expertsms" method="post">
		<label class="input-group-text" > 문자내용 </label><input type="input" name="msg" class="form-control short" /><br>
		<label class="input-group-text" > 전화번호 </label><input type="input" name="phone" class="form-control short" /><br>
		<input type="submit" vale="발송"/>
		</form> -->
		
</section>

<script>

function expertChat(e){
	
	if(e == 'e'){
		location.replace('${path}/expertLogin?nick='+$("input[name=nick]").val()+"&ex=e");
	}
	else{
		location.replace('${path}/expertLogin?nick='+$("input[name=nick]").val()+"&ex=m");
	} 
	
} 



</script>