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
	max-width: 200px;
}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" " />
</jsp:include>

<section id="content">
<br>
	EXPERT 임시 테스트 페이지
<br>
<br>
	<p>세션 닉네임 : ${loginMember.memNickname}</p>
	<p>유저 타입 : ${loginMember.memClass}</p>
	<p>USID : ${loginMember.usid}</p>
	<p>패스 : ${pageContext.request.requestURI}</p>
	<br>
	<button class="btn btn-outline-success" onclick="location.href='${path}/expert/expertPrintList?ca=직장 상담'">유저가 전문가 리스트 보기</button>
	<c:if test="${loginMember.memClass == '전문가'}">
		<button class="btn btn-outline-success" onclick="location.href='${path}/expert/expertRequestPrintList'">전문가가 상담할 유저 리스트 보기</button>
	</c:if>
	
	
	
	<!-- 
	
	진행 순서
	
	유저가 전문가 리스트를 보고 상담 신청을 클릭 -> 상담신청이 완료됨
	
	전문가는 상담 신청 리스트를 보고 상담을 시작할수있음 -> 
	
	시작시 방이 개설되고 이메일로 알람이감 -> 
	
	상담시작함
	
	-------------------------------------------------------
	
	
	1, 리스트에서 이미 룸이 생성된 유저는 생성이 아니라 입장으로 버튼 바꾸기

	2, 유저나 전문가가 입장할때 판별해서 그외에 다른사람 못들어오게 하기

	3, 방번호랑 링크를 이메일로 해당 유저한테 보내주기
	
	
	-------------------------------------------------------
	
	1, 상담 완료 후 디비에 들어갈때 띄어쓰기 넣어보기 <br>
	
	2, 상담 유저 리스트 보일때 결과가 null이 아니면 setEndCounsel 값넣어서 상담 시작 못들어가게 바꾸기
	
	3, 상담 종료될때 유저한테도 메세지를 보내서 그 메세지를 받으면 유저가 다른 페이지로 리다이렉트 되게 만들기
	
	
	
	 -->

	<!-- 	
<label class="input-group-text" >닉네임 </label><input type="input" name="nick" class="form-control short" /><br>
	<label class="input-group-text" >방 번호 </label><input type="input" name="num" class="form-control short" /><br>
	임시 로그인 : 
	<button class="btn btn-outline-success" onclick="expertChat();">로그인</button>
	<br>
	<br> 
 	<hr>
	<form action="/expertsms" method="post">
		<label class="input-group-text" > 문자내용 </label><input type="input" name="msg" class="form-control short" /><br>
		<label class="input-group-text" > 전화번호 </label><input type="input" name="phone" class="form-control short" /><br>
		<input type="submit" vale="발송"/>
		</form> 
-->

</section>

<script>
	/* function expertChat(){

	 location.replace('${path}/expertLogin?nick='+$("input[name=nick]").val());
	
	 }  */
</script>