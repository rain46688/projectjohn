<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value=" "/>
	
</jsp:include>

<section id="content">

</section>

<script>

const adminsocket = new WebSocket("wss://localhost${path}/adminsocket");

adminsocket.onopen = function(){
	
};

adminsocket.onmessage = function(msg){
	console.log("채팅 : "+msg);
	//채팅나타나는곳
};



</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
