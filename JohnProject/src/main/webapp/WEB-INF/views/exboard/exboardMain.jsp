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
EXPERT
	<label class="input-group-text" >닉네임 </label><input type="input" name="nick" class="form-control short" /><br>
	<label class="input-group-text" >방 번호 </label><input type="input" name="num" class="form-control short" /><br>
	<button class="btn btn-outline-success" onclick="expertChat('e');">전문가 접속</button>
	<button class="btn btn-outline-success" onclick="expertChat('m');">일반인 입장</button>
	<br>
	<hr>
	<br>
	<div id="expertList">
	
	</div>
</section>

<script>

function expertChat(e){
	if(e == 'e'){
		location.replace('${path}/expertRtc?nick='+$("input[name=nick]").val()+"&num="+$("input[name=num]").val()+"&ex=e");
	}
	else{
		location.replace('${path}/expertRtc?nick='+$("input[name=nick]").val()+"&num="+$("input[name=num]").val()+"&ex=m");
	}
}



</script>