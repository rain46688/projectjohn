<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
	<section id="content">
		<div>
			<div>
				비밀번호 변경하기
			</div>
			<div>
				<form action="${path}/member/myPage/updatePw" method="POST" id="updatePwForm">
					<input type="password" id="crtPw" name="crtPw" placeholder="현재 비밀번호">
					<input type="password" id="newPw" name="newPw" placeholder="새로운 비밀번호">
					<input type="password" id="newPw2" name="newPw2" placeholder="새로운 비밀번호 확인">
					<button type="button" onclick="fn_updatePw()">변경하기</button>
				</form>
			</div>
		</div>
		<div>
			<div>
				닉네임 수정하기
			</div>
			<div>
				<form action="${path}/member/myPage/updateNick" method="POST" id="modifyNickForm">
					<input type="text" id="memNickname" name="memNickname" placeholder="변경할 닉네임">
					<button type="button" onclick="fn_modifyNick()">변경하기</button>
				</form>
			</div>
		</div>
		<div>
			<div>
				프로필 사진 수정하기
			</div>
			<div>
				<form action="${path}/member/myPage/modifyNick" method="POST" id="modi"></form>
			</div>
		</div>
		<div>
			<div>
				전화번호 수정하기
			</div>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>









