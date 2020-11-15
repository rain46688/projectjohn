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
</head>
<body>
	<c:choose>
		<c:when test="${empty findMember }">
			<form id="findPwForm" action="${path}/findPw" method="POST">
				<div>ㅠㅇㅠ비밀번호 찾기ㅠㅇㅠ</div>
				<div>
					<input type="text" name="memName" id="memName" placeholder="이름을 입력해주세요.">
				</div>
				<div>
					<input type="text" name="tel" id="tel" placeholder="휴대폰 번호를 입력해주세요.">
				</div>
				<div>
					<input type="text" name="memEmail" id="memEmail" placeholder="아이디를 입력해주세요.">
				</div>
				<div>
					<button type="button" onclick="fn_findPw()">비밀번호 찾기</button>
				</div>
			</form>
		</c:when>
		<c:otherwise>
			<div>
				해당 아이디로 임시 비밀번호를 전송했습니다. 로그인 후 비밀번호를 바꿔주세요!
			</div>
		</c:otherwise>
	</c:choose>
	<script>
		function fn_findPw(){
			const name=$("#memName").val().trim();
			const phone=$("#tel").val().trim();
			const id=$("#memEmail").val().trim();
			if(name==""){
				alert('이름을 입력해주세요');
				return false;
			}else if(phone==""){
				alert('휴대폰 번호를 입력해주세요');
				return false;
			}else if(id==""){
				alert('아이디를 입력해주세요');
				return false;
			}else{
			$("#findPwForm").submit();
			}
		}
	</script>
</body>
</html>