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
	margin-top:5%;

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
	width: 23%; 
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


/*글쓰기버튼*/

#bbtn{
	float:right;
	margin-right:4%;
	border-color: #ffcc66;
    color: white; 
    background-color: #003478;
	margin-top:5%;
}

#bbtn:hover,
#bbtn:focus {
    background-color: #ffcc66;
    border-color: #003478;
    color: #003478; 

}


</style>	
<section id="content" >

<%-- <p id="totalNotice">총 <c:out value="${totalData}"/>건의 공지사항이 있습니다.</p> --%>

		           
<button type="button" value="글쓰기" id="bbtn" 
class="btn btn-outline-info" 
onclick="noticeWrite('${notice.noticeId}');">WRITE</button>

		        <div class="board_list_wrap">
				<div class="board_list">
					 <div class="board_list_head">
		             <div class="col">번호</div>
		             <div class="col">제목</div>
		             <div class="col">닉네임</div>
		             <div class="col">날짜</div>
		            </div>
		            
		            <c:forEach items="${list }" var="n">
		           	<div class="board_list_body">
		           	<a href="${path }/customer/customerNoticeView?noticeId=${n.noticeId }" class="alink">
					<div class="item">
            		<div class="col"><c:out value="${n.noticeId }"/></div>
            		<div class="col"><c:out value="${n.noticeTitle }"/></div>
            		<div class="col"><c:out value="${n.noticeAdminNickname }"/></div>
            		<div class="col"> <fmt:formatDate value="${n.noticeEnrolldate }" pattern="yyyy.MM.dd HH:mm"/></div>
            		
            		
            		
            		</div>
            		</a>
					</div>
            	
		            </c:forEach>
		      
		        
	
		        </div>
				</div>
				
		       
		       <div id="pageBar">
		        ${pageBar } 
		       </div>
		      
		      </section>
		      
		      <script>
		      function noticeWrite(noticeId){
					 var sessionId = '${loginMember.usid}';
						if(sessionId!='31'){
							alert("관리자만 접근할 수 있습니다");
							return;
						}
						
				location.href="${path}/customer/customerNoticeForm";
				}
		      </script>
	

	
