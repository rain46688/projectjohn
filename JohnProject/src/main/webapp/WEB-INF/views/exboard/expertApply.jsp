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
<br>
상담 신청 페이지 임시 테스트용
<br>
<img id="expertimg" alt="ㅈ문가" src="${path }/resources/images/expert.png"><br>
전문가 인사말 :<br>
전문가 경력 : <br>
전문 상담 분야 : <br>
<br>
<div id="exbtn">
<button class="btn btn-outline-success" onclick="expertRequest();">상담 신청하기</button>
<c:if test="${requestIsDuplicate == true}">
<button class="btn btn-outline-success" onclick="expertRequestCancel();">상담 취소하기</button>
</c:if>
</div>
</section>


<script>

function expertRequest(){
	console.log("상담 신청, ${expert.usid}");
	/* 
	location.replace('${path}/expertRequest?no=${expert.usid}&nic=${expert.mem_nickname}');
	 */
    $.ajax({
 	   type:"GET",
 	   data:{
 		   "no":"${expert.usid}",
 		   "nic":"${expert.mem_nickname}"
 	   },
 	   url:"${path}/expertRequest",
 	   success:function (data){
 		   if(data == 1){
 			   console.log("상담 신청 성공");
 			   alert("상담 신청 성공");
 			   $("#exbtn").html( $("#exbtn").html()+"<button class='btn btn-outline-success' onclick='expertRequestCancel();''>상담 취소하기</button>");
 		   }else if(data == 2){
 			  console.log("이미 상담 신청을 하셨습니다");
 			 alert("이미 상담 신청을 하셨습니다");
 		   }
 		   else{
 			   console.log("상담 신청 실패");
 			  alert("상담 신청 실패");
 		   }
 	   }
    }); 
};

function expertRequestCancel(){
	console.log("상담 취소, ${expert.usid}");
    $.ajax({
  	   type:"GET",
  	   data:{
  		   "no":"${expert.usid}",
  		   "nic":"${expert.mem_nickname}"
  	   },
  	   url:"${path}/expertRequestCancel",
  	   success:function (data){
  		   if(data == 1){
  			   console.log("상담 취소 성공");
  			   alert("상담 취소 성공");
  			   $("#exbtn").html("<button class='btn btn-outline-success' onclick='expertRequest();''>상담 신청하기</button>");
  		   }
  		   else{
  			   console.log("상담 취소 실패");
  			  alert("상담 취소 실패");
  		   }
  	   }
     }); 
}


</script>
