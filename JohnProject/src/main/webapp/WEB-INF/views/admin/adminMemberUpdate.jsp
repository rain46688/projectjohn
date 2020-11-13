<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="title" value=" " />

</jsp:include>

<style>
div#board-container {
	width: 400px;
	margin: 0 auto;
	text-align: center;
}

div#board-container input, div#board-container button {
	margin-bottom: 15px;
}

div#board-container label.custom-file-label {
	text-align: left;
}

ul{
	list-style:none;
}
</style>

<section id="content">

	<div id="board-container">
		<h1>게시판상세화면</h1>

		<form name="memberEnrollFrm"
			action="${path }/admin/adminUpdateMemberToExpertEnd" method="post">
			<ul>
				<li>번호<input type="text" name="usid" id="usid" value="${member.usid }"readonly></li> 
				
				<li>이름<input type="text" name="memName" id="memName"value="${member.memName}"></li> 
				
				<li>닉네임<input type="text"name="memNickname" id="memNickname"value="${member.memNickname }"></li> 
				
				<li>성별<input type="text" name="gender " id="gender" value="${member.gender}"></li>
				
				<li>생일<input type="text" name="birthday" id="birthday"value="${member.birthday }"></li> 
				
				<li>가입날짜<input type="text"name="enrollDate" id="enrollDate" value="${member.enrollDate }"></li>
				
				<li>멤버등급<input type="text" name="memClass" id="memClass" value="${member.memClass }"></li> 
			</ul>	
				
				<h3>자격증</h3>
				
				<c:forEach items="${list }" var="l">
      			<ul>
					<li>자격증번호<c:out value="${l.licenseMemUsid}"/></li>
					<li>자격증사진<img src="${path }/resources/upload/upload_license/<c:out value="${l.licenseFileName }"/>"></li>
					<li>자격증발급날짜<c:out value="${l.licenseDate}"/></li>
					<li>자격증급수<c:out value="${l.licenseType}"/></li>
					<li>자격증발급기관<c:out value="${l.licenseCompany}"/></li>
				</ul>
				</c:forEach>
					
			 <input type="submit" value="전문가 승인하기">
					
					
		</form>

	</div>

</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />

