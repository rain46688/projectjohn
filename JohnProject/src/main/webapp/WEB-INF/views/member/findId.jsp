<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
</head>
<style>
	body{
		background-image: url("${path}/resources/images/findPaper.png");
		background-color: #00316D;
	}
	body *{
		font-family: 'Noto Serif KR', serif;
	}
</style>
<body>
	<c:choose>
		<c:when test="${empty findMember }">
			<form id="findIdForm" action="${path}/findId" method="POST">
				<div>
					아이디 찾기
				</div>
				<div>
					<input type="text" name="memName" id="memName" placeholder="이름을 입력해주세요">
				</div>
				<div>
					<input type="text" name="tel" id="tel" placeholder="휴대폰 번호를 입력해주세요">
				</div>
				<div>
					<button type="button" onclick="fn_findId()">아이디 찾기</button>
				</div>
			</form>
		</c:when>
		<c:otherwise>
			<div>
				<div>회원님의 아이디는</div>
				<div>${findMember.getMemEmail()}입니다</div>
			</div>
		</c:otherwise>
	</c:choose>
	<script>
		function fn_findId(){
			const name=$("#memName").val().trim();
			const phone=$("#tel").val().trim();
			if(name==""){
				alert('이름을 입력해주세요');
				return false;
			}else if(phone==""){
				alert('휴대폰 번호를 입력해주세요');
				return false;
			}else{
			$("#findIdForm").submit();
			}
		}
	</script>
</body>
</html>









