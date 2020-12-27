<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="title" value=" " />

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
  /*   border-bottom: 1px solid #eee; */
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
    background: white;
    overflow: hidden;
    position: relative;
    margin-top:5%;
}
ul.tabs li.active {/*미승인탭*/
    background: white;
    border-bottom: 1px solid white;
	border: 3px solid white;
    margin-top:5%;
}
.tab_container {
    border: none;
    border-top: none;
    clear: both;
    float: left;
    width: 100%;
    background: white;
    margin-top:5%;
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







/*써치컨체이너*/
#one,#four,#five,#six,#seven,#eight{
	width: 40%;
    margin: 1em auto;
    display: inline-block; 
    color:white;
    font-family: 'Noto Serif KR', serif;
    margin-right:10px;

}



#one>.form-control{
	width:100%;
	margin-top:10%;

}

#four>.form-control{
	width:100%;

	color:black;
	float:left; 
	margin-top:-3%;

}

#five>.form-control{
	width:100%;
	margin-top:10%;
}


#six>.form-control{
	width:100%;
}

#seven>.form-control{
	width:100%;

}

#checkbox{
	width:20%;

}
.radio-inline{
	height:100%;
	width:100%;	
}


#search-container{
	display:flex; 
	justify-content:center;
	background-color:white;
	margin-top:3%;
	margin-bottom:3%;
	border-radius:20px;
	width: 90%; 
	text-align: center;
 	margin-left:4.5%; 
	background-color:#003478;
	padding: 50px;
/* 	background-image: url("${path}/resources/images/admin/logo.png"); 
 */	
}

#myForm{
	display: table;
    width: 100%;
    height: 100%;
    margin: 0 auto;
/* 	margin-top:-21%;
	margin-left:-6%; */
	background-color:#003478;
	border-radius:20px;

}



	
#eight{

	float:left;
	width:100%;
		
}


#searchImg{

    color: #f0f2fc;
  
    
    transform:scale(1); transition:transform 0.3s linear;
}

#searchImg:hover,
#searchImg:focus {
    background-color: #f0f2fc;
    border-color: #f0f2fc;
    color: black; 
    
    -webkit-transform:scale(1.3);

}
    
#searchImgBtn{
    height:20px; 
    width:100px; 
    margin: -20px -50px; 
    position:relative; 
    top:3%;
    left:50%; 

}
    
#bbtn{
	border-color: #ffcc66;
    color: white; 
    background-color: #003478;

}

#bbtn:hover,
#bbtn:focus {
    background-color: #ffcc66;
    border-color: #003478;
    color: #003478; 

}

/*셀렉트박스*/

select::-ms-expand { display: none; }

select { 
width: 200px; /* 원하는 너비설정 */ 
padding: .8em .5em; /* 여백으로 높이 설정 */ 
font-family: inherit; /* 폰트 상속 */ 
background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;/* 네이티브 화살표 대체 */ 
border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
-moz-appearance: none; 
appearance: none; 

}


/*모달전체*/
.modal-content{
	 background-color:#ffcc66;
	 font-family: 'Noto Serif KR', serif;
	 
}
/*페이지바*/

.page-item.active .page-link { /*현재피이지*/
  background-color: #003478;
  color: white;
  border:none;
}

.pagination-sm .page-link { /*한칸한칸크기*/
	padding:10px 20px ;
}

.pagination a:hover:not(.active) { /*호버*/
	background-color: #ffcc66;
}

.pagination{
padding-bottom: 3%;
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
	width: 10%;
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

</style>


<section id="content">


<button class="btn btn-default my-2 my-sm-0"
						type="button" data-toggle="modal" data-target="#loginModal" id="searchImgBtn">
						<img src="${path}/resources/images/admin/search.png" width="50px" 
						height="50px" id="searchImg"></button>

	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">전문가관리</h5>
										<button type="button" class="close"
											data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
										</button>
									</div>
		
			<div id="search-container">
			<form id="myForm" action="${path }/admin/adminExpertSearch" method="post">
			
			<div id="one">
				<select name="searchType" class="form-control">
					<option value=" " disabled selected>검색타입</option> 
					
					<option value="mem_name" <c:if test="${param.searchType eq 'mem_name'}">selected</c:if>>이름</option>
					<option value="mem_email" <c:if test="${param.searchType eq 'mem_email'}">selected</c:if>>이메일</option>
					<option value="mem_nickname" ${param.searchType eq 'mem_nickname'?"selected":"" }>닉네임</option>	
										
				
				</select>&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
				
				<div id="four">
				<input type="search" name="keyword" class="form-control" placeholder="Search"
				value="${param.keyword }"/> 
				</div>
				
				<br>
				
				<div id="five">
				
				<label><input type="radio" name="gender" value='M'<c:if test="${param.gender eq 'M'}">checked</c:if>>남</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<label><input type="radio" name="gender" value='F'<c:if test="${param.gender eq 'F'}">checked</c:if>>여</label>
				</div>
				
				<br>
				
				<div id="seven">
				<label><input type="checkbox" name="leaveMem" value="0"<c:if test="${param.leaveMem eq '0'}">checked</c:if>>현직 전문가</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<label><input type="checkbox" name="leaveMem" value="1"<c:if test="${param.leaveMem eq '1'}">checked</c:if>>퇴사 전문가</label>
				</div>
				
				<br>
				
			<div id="five">	
			<label><input type="radio" name="order" value='ascend'<c:if test="${param.order eq 'ascend'}">checked</c:if>>오름차순</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<label><input type="radio" name="order" value='descend'<c:if test="${param.order eq 'descend'}">checked</c:if>>내림차순</label> 
			</div>
			
			<div id="six">
			<select name="searchType2" class="form-control">
				<option value=" " disabled selected>선택</option> 
				<option value="enroll_date" <c:if test="${param.searchType2 eq 'enroll_date'}">selected</c:if>>입사날짜</option>
				<%-- <option value="expert_rating" <c:if test="${param.searchType eq 'expert_rating'}">selected</c:if>>등급순</option>
				<option value="expert_counsel_start_time" ${param.searchType eq 'expert_counsel_start_time'?"selected":"" }>상담시간순</option>	 --%>
			</select>
			</div>
							
					<div id="eight">
			<button type="submit" class="btn btn-default" id="bbtn">검색</button>
			<button type="button" class="btn btn-default"
											data-dismiss="modal" id="bbtn">
											취소</button>
					</div>
			</form>
		</div>
		
		
								</div>						
							</div>
						</div>


		
		
		
		
		
			<div class="tabs">

				<ul class="tabs">
		
					<li class="active" id="tab1"><a href="${path}/admin/adminBeforeExpert" class="alinkEx1">미승인</a></li>
		
					<li id="tab2"><a href="${path}/admin/adminExpert" class="alinkEx2">승인완료</a></li>
		
				</ul>
		
		
		
		
			<div class="tab_container">
		 <div id="tab2" class="tab_content2">
			<div class="board_list_wrap">
				<div class="board_list">
					<div class="board_list_head">
					
						<div class="col">번호</div>
						<div class="col">이메일</div>
						<div class="col">이름</div>
						<div class="col">닉네임</div>
						<div class="col">성별</div>
						<div class="col">생일</div>
						<div class="col">가입날짜</div>
						<div class="col">퇴사여부</div>
						<div class="col">구분</div>
						<div class="col">전화번호</div>
						
					</div>
					<c:forEach items="${list }" var="m">
						<div class="board_list_body">
							<div class="item">
								<div class="col">
									<c:out value="${m.usid}" />
								</div>
								<div class="col">
									<c:out value="${m.memEmail}" />
								</div>
								<div class="col">
									<c:out value="${m.memName}" />
								</div>
								<div class="col">
									<c:out value="${m.memNickname}" />
								</div>
								<div class="col">
									<c:out value="${m.gender}" />
								</div>
								<div class="col">
									<c:out value="${m.birthday}" />
								</div>
								<div class="col">
									<c:out value="${m.enrollDate}" />
								</div>
								<div class="col">
									<c:choose>
										<c:when test="${m.leaveMem eq false }">X</c:when>
										<c:otherwise>O</c:otherwise>
									</c:choose>
								</div>
								<div class="col" style="color:red">
									<c:out value="${m.memClass}" />
								</div>
								<div class="col">
								 <c:out value="${m.tel}"/>
								 </div>
								
							</div>
						</div>
					</c:forEach> 


				</div>
			</div>
</div>
			<div id="pageBar">${pageBar }</div>


	</div>
</div>
</section>




