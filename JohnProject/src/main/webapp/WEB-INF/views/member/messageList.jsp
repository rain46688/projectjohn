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
		<!--상대방 프로필 사진, 가장 최근 메세지, 상대방 닉네임, 날짜-->
		<c:forEach var="otherInfo" items="${otherInfo}">
		<div id="messageBox">
				<div>
					<c:out value="${otherInfo.otherProfilePic}"/>
				</div>
				<div>
					<c:out value="${otherInfo.otherNick}"/>
				</div>
				<div>
					<c:out value="${otherInfo.latestDate}"/>
				</div>
				<div>
					<c:out value="${otherInfo.latestMessage}"/>
				</div>
			</div>
		</c:forEach>
	</div>
</section>
<script>
	//클릭 했을때 약간 회색 되도록
	$("#messageBox").click(function(){
		$("#messageBox").css({"backgound-color":"#D3D3D3"});
	});
	//더블클릭 했을 때 이동하도록
	$("#messageBox").dbclick(function(){

	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>









