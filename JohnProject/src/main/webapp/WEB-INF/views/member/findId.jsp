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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
	body{
		background-image: url("${path}/resources/images/findPaper.png");
		background-color: #00316D;
	}
	body *{
		font-family: 'Noto Serif KR', serif;
	}
	div#findTitle{
		font-size: 1.3rem;
		position: absolute;
		top: 7.5rem;
		left: 14rem;
	}
	div#divName{
		position: absolute;
		top: 11.5rem;
		left: 11rem;
	}
	div#divTel{
		position: absolute;
		top: 14.5rem;
		left: 11rem;
	}
	input.findInput{
		outline: none;
		background-color: white;
		border: none;
		border-bottom: 1px black solid;
		font-size: 0.9rem;
	}
	div#findBtnDiv{
		position: absolute;
		top: 17.5rem;
		left: 14.5rem;
	}
	div#result1{
		position: absolute;
		top: 12rem;
		left: 13.5rem;
	}
	div#result2{
		position: absolute;
		top: 14rem;
		left: 9rem;
		text-align: center;
		width: 17rem;
	}
</style>
<body>
	<c:choose>
		<c:when test="${empty findMember }">
			<form id="findIdForm" action="${path}/findId" method="POST">
				<div id="findTitle">
					아이디 찾기
				</div>
				<div id="divName">
					<input type="text" name="memName" id="memName" class="findInput" placeholder="이름을 입력해주세요">
				</div>
				<div id="divTel">
					<input type="text" name="tel" id="tel" class="findInput" placeholder="휴대폰 번호를 입력해주세요">
				</div>
				<div id="findBtnDiv">
					<button type="button" id="findBtn" class="btn btn-outline-dark btn-sm" onclick="fn_findId()">아이디 찾기</button>
				</div>
			</form>
		</c:when>
		<c:otherwise>
			<div>
				<div id="result1">회원님의 아이디는</div>
				<div id="result2">${findMember.getMemEmail()}입니다.</div>
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
		$('#tel').on('keypress', function(e){
            if(e.keyCode==13) {
                $("#findBtn").click();
            }
        });  
	</script>
</body>
</html>









