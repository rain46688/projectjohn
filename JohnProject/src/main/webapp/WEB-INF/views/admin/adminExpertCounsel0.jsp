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
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap')
	;
	
/*탭*/

.tabs{
	font-family: 'Noto Serif KR', serif;
	
}

.alinkEx1:visited{
	color:#ffcc66;
	
}

.alinkEx2:visited{
	color:#003478;
}

ul.tabs {
    margin: 0;
    padding: 0;
    float: left;
    list-style: none;
    height: 32px;
   /*  border-bottom: 1px solid #eee; */
    border-left: 1px solid #eee;
    width: 100%;

}
ul.tabs li { /*승인탭*/
    float: left;
    text-align:center;
    cursor: pointer;
    width:82px;
    height: 31px;
    line-height: 31px;
    border: 1px solid #eee;
    border-left: none;
    font-weight: bold;
    background: #fafafa;
    overflow: hidden;
    position: relative;
    margin-top:7%;
}
ul.tabs li.active { /*미승인탭*/
    background:  white ;
    border-bottom: 1px solid  white  ;
	border: 3px solid white  ;
    margin-top:7%;
}
.tab_container {
    border: none;
    border-top: none;
    clear: both;
    float: left;
    width: 100%;
    background: white;
    margin-top:7%;


}
.tab_content {
    padding: 5px;
/*     font-size: 12px; */
    display: none;
}

tab_content2{
    padding: 5px;
/*     font-size: 12px; */
  display: none;
}
.tab_container .tab_content ul {
    width:100%;
    margin:0px;
    padding:0px;
}
.tab_container .tab_content ul li {
    padding:5px;
    list-style:none;
}

 #container {
    width: 249px;
    margin: 0 auto;
}





/*a링크*/
a:link {
	text-decoration: none;
	color: black;
}

.alink:visited {
	text-decoration: none;
	color: black;
}

a:active {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
	color: black;
}

/*표*/
.board_list_wrap {
	padding: 60px;
	font-family: 'Noto Serif KR', serif;

}

.board_list_head, .board_list_body .item {
	padding: 10px 0;
	font-size: 0;
}

.board_list_head {
	border-top: 3px solid #003478;
	border-bottom: 2px solid #003478;
	background-color: #003478;
	color: #ffcc66;
	border-radius: 10px;
}

.board_list_body .item {
	border-bottom: 2px solid #eeeeee;
	background-color: white;
	border-radius: 10px;
	font-family: 'Noto Serif KR', serif;
	opacity: 0.7;
}

.board_list_head>div, .board_list_body .item>div {
	display: inline-block;
	text-align: center;
	font-size: 14px; /*본문글자크기*/
}

.board_list_head>div {
	font-weight: 600;
}

.board_list .col {
	width: 12%; 
	padding-top: 1%; 
	padding-bottom: 1%;
	font-size: 15px; /*헤드글자크기*/
	/*바꾸지마셈*/
}

.item:hover {
	opacity: 2.5;
	border-bottom: 2px solid #ffcc66;
}

/*페이지바*/
.page-item.active .page-link { /*현재피이지*/
	background-color: #003478;
	color: white;
	border: none;
}

.pagination-sm .page-link { /*한칸한칸크기*/
	padding: 10px 20px;
	margin: 0;
}

.pagination a:hover:not(.active) { /*호버*/
	background-color: #ffcc66;
}

.pagination{
padding-bottom: 3%;
}

</style>
	<section id="content">
		<div class="tabs">

		<ul class="tabs">


			<li class="active" id="tab1"><a href="${path}/admin/adminExpertCounsel0" class="alinkEx2">진행중</a></li>

			<li id="tab2"><a href="${path}/admin/adminExpertCounsel1" class="alinkEx1">종료</a></li>

		</ul>
		
	<div class="tab_container">
		 <div id="tab2" class="tab_content2">
			<div class="board_list_wrap">
				<div class="board_list">
					<div class="board_list_head">
					
			<div class="col">전문가번호</div>
			<div class="col">상담신청유저번호</div>
			<div class="col">전문가닉네임</div>
			<div class="col">상담신청유저닉네임</div>
			<div class="col">상담완료유무</div>
			<div class="col">상담신청날짜</div>
			<div class="col">상담신청시간</div>
			<div class="col">상담요구사항</div>
		</div>
	

		<c:forEach items="${list }" var="list">
			<div class="board_list_body">
			<div class="item">

				<div class="col"><c:out value="${list.expertRequetExUsid}"/></div>
				<div class="col"><c:out value="${list.expertRequestMemUsid}"/></div>
				<div class="col"><c:out value="${list.expertRequetExNick}"/></div>
				<div class="col"><c:out value="${list.expertRequestMemNick}"/></div>
				<div class="col" style="color:blue">
					<c:choose>
						<c:when test="${list.expertIscounsel eq 0 }">진행중</c:when>
						<c:otherwise>종료</c:otherwise>
					</c:choose></div>
				
				<div class="col"><c:out value="${list.expertDate}" /></div>
				<div class="col"><c:out value="${list.expertCounselTime }" /></div>
				
				<div class="col"><c:out value="${list.expertCounselRequire }" /></div>
			</div>
			</div>

		</c:forEach>
	




	</div>
			</div>
</div>
			<div id="pageBar">${pageBar}</div>
			
		</div>

	</div>
	</section>
	
