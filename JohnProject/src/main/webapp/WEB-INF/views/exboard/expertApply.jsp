<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
<jsp:param name="title" value=" "/>
</jsp:include>

<section id="content">
상담 신청 페이지

전문가 인사말 : ${expert.expert_greetings }<br>
전문가 경력 : ${expert.expert_profile }<br>
전문 상담 분야 : ${expert.expert_counsel_area }<br>

<button class="btn btn-outline-success" onclick="expertCounsel();">상담 신청하기</button>

</section>


<script>

function expertCounsel(){

	console.log("상담 신청");
	
};


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />