<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value=" "/>
	
</jsp:include>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap')
	;
	
/*탭*/

.tabs{
	font-family: 'Noto Sans KR', sans-serif;

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
    border-bottom: 1px solid #eee;
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
    background: #f8f8ff;
    overflow: hidden;
    position: relative;
    margin-top:5%;
}
ul.tabs li.active {/*미승인탭*/
    background: #f8f8ff;
    border-bottom: 1px solid #f8f8ff;
	border: 3px solid #f8f8ff;
    margin-top:5%;
}
.tab_container {
    border: none;
    border-top: none;
    clear: both;
    float: left;
    width: 100%;
    background: #f8f8ff;
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
    font-family: 'Noto Sans KR', sans-serif;
    margin-right:10px;

}



#one>.form-control{
	width:100%;
	margin-top:10%;

}

#four>.form-control{
	width:100%;
	height:100%;
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
	 font-family: 'Noto Sans KR', sans-serif;
	 
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
	font-family: 'Noto Sans KR', sans-serif;
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
	font-family: 'Noto Sans KR', sans-serif;
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
	width: 8.3%;
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
}

.pagination a:hover:not(.active) { /*호버*/
	background-color: #ffcc66;
}

</style>

	<section id="content">
	<div class="tab-box">

		<ul>

			<li><a href="${path}/admin/adminBeforeExpert">미승인</a></li>

			<li><a href="${path}/admin/adminExpert">승인완료</a></li>

		</ul>

	<div id="search-container">
			<form action="${path }/admin/adminExpertSearch" method="post">
			
				<select name="searchType" required>
					<option value=" " disabled selected>검색타입</option> 
					
					<option value="mem_name" <c:if test="${param.searchType eq 'mem_name'}">selected</c:if>>이름</option>
					<option value="mem_email" <c:if test="${param.searchType eq 'mem_email'}">selected</c:if>>이메일</option>
					<option value="mem_nickname" ${param.searchType eq 'mem_nickname'?"selected":"" }>닉네임</option>	
										
				
				</select>
				
				<input type="search" name="keyword"
				value="${param.keyword }"/> 
				
				<br>
				
				<label>성별</label>
				<label><input type="radio" name="gender" value='M'>남</label>
				<label><input type="radio" name="gender" value='F'>여</label>
				
				<br>
				
				<input type="checkbox" name="leave_mem" value="0">현직 전문가
				<input type="checkbox" name="leave_mem" value="1">퇴사 전문가
	
				<br>
				
			<label><input type="radio" name="order" value='ascend'>오름차순</label>
			<label><input type="radio" name="order" value='descend'>내림차순</label> 
			
			<select name="searchType2" required>
				<option value=" " disabled selected>선택</option> 
				<option value="enroll_date" <c:if test="${param.searchType2 eq 'enroll_date'}">selected</c:if>>입사날짜</option>
				<%-- <option value="expert_rating" <c:if test="${param.searchType eq 'expert_rating'}">selected</c:if>>등급순</option>
				<option value="expert_counsel_start_time" ${param.searchType eq 'expert_counsel_start_time'?"selected":"" }>상담시간순</option>	 --%>
			</select>
							
				<input type="submit" value="검색">
			</form>
		</div>
		
	
	<table class="table">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">이메일</th>
				<th scope="col">이름</th>
				<th scope="col">닉네임</th>
				<th scope="col">성별</th>
				<th scope="col">생일</th>
				<th scope="col">가입날짜</th>
				<th scope="col">퇴사여부</th>
				<th scope="col">구분</th>
				<th scope="col">전화번호</th>
				<th scope="col">전문가 별점</th>
				<th scope="col">전문가 분야</th>
			</tr>
			<c:if test="${empty list}">
			<tr>
				<td colspan="12">조회 결과가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="m" items="${list }">
				<tr>
					<td><c:out value="${m['usid']}"/></td>
					<td><c:out value="${m['memEmail']}"/></td>
					<td><c:out value="${m['memName']}"/></td>
					<td><c:out value="${m['memNickname']}"/></td>
					<td><c:out value="${m['gender'] eq 'M' ? 'M' : 'F' }"/></td>
					<td><c:out value="${m['birthday']}"/></td>
					<td><c:out value="${m['enrollDate']}"/></td>
					<td><c:out value="${m['point']}"/></td>
					<td><c:out value="${m['leaveMem']}"/></td>
					<td><c:out value="${m['memClass']}"/></td>
					<%-- <td><c:out value="${m['tel']}"/></td>
					<td><c:out value="${m['expert_rating']}"/></td>
					<td><c:out value="${m['expert_counsel_area']}"/></td> --%>
				</tr>
			</c:forEach>
		</c:if>
		
		</table>
		
		     <div id="pageBar">
		        ${pageBar } 
		      </div>
		       
	</div>
	</section>
	

	
