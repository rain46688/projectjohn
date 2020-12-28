<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value=" "/>
	
</jsp:include>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');


  a:link { text-decoration: none; color: black;} 
 .alink:visited { text-decoration: none; color: black;}
  a:active { text-decoration: none; color: black;}
  a:hover {text-decoration:underline; color: black;}


.board_list_wrap {
    padding-right: 20%;
    padding-bottom:40%;
    padding-left:20%;
    padding-top:5%;
    font-family: 'Noto Serif KR', serif;
 
}

.board_list_head,
.board_list_body .item {
    padding: 10px 0;
    font-size: 0;
}

.board_list_head {
    border-top: 3px solid #003478;
    border-bottom: 2px solid #003478;
    background-color:#003478;
    color:#ffcc66;
    border-radius:10px;
    font-family: 'Noto Serif KR', serif;
}

.board_list_body .item {
    border-bottom: 2px solid #eeeeee;
    background-color:white;
    border-radius:10px;
    font-family: 'Noto Serif KR', serif;
    opacity: 0.7;
}

.board_list_head > div,
.board_list_body .item > div {
    display: inline-block;
    text-align: center;
    font-size: 15px; /*본문글자크기*/
}

.board_list_head > div {
    font-weight: 600;
}

.board_list .col {
    width: 40%; 
    padding-top:1%;
    padding-bottom:1%;
    font-size:20px; /*헤드글자크기*/
    /*바꾸지마셈*/
}


.item:hover { 
	opacity: 2.5; 
	border-bottom: 2px solid #ffcc66;
}









</style>		
		
	<section id="content">
	
	
			<div class="board_list_wrap">
			<div class="board_list">
			<div class="board_list_head">
					<div class="col"><img src="${path }/resources/images/admin/message.png" width="35px" height="30px"/>&nbsp;&nbsp;1:1 문의 답변하기</div>
					<!-- <div class="col">번호</div>
					<div class="col">이름</div>
					<div class="col">내용</div>
					<div class="col">날짜</div> -->
			</div>
				 <c:if test="${empty memberInfoList}">
					
						<div class="col">조회 결과가 없습니다.</div>
					
				</c:if>
				 <c:if test="${not empty memberInfoList }">
					<c:forEach var="memberInfoList" items="${memberInfoList }">
						<div class="board_list_body">
						<a href="${path }/admin/adminChat?adminUsid=31&memberUsid=${memberInfoList.memberUsid}" 
						class="alink">
						<div class="item">
							<div class="col" ><img src="${path }/resources/profile_images/${memberInfoList.profilePic}" width="100px" height="100px" style="border-radius:50%;"/></div>
							<%-- <div class="col"><c:out value="${memberInfoList.memberUsid}"/></div> --%>
							<div class="col" style="font-size:20px"><c:out value="${memberInfoList.latestMsg}"/></div>
							<div class="col" style="font-size:17px"><c:out value="${memberInfoList.nickname}"/></div>
 							<div class="col"><fmt:formatDate value="${memberInfoList.time}" pattern="yyyy.MM.dd HH:mm"/></div>
 							
 						
						</div>
						</a>
					</div>
						
					</c:forEach>
				</c:if>
		
			</div>
		</div>
		
		       
	</section>
	
	
