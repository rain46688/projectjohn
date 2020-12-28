<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value="adminMemberSearch"/>
	
</jsp:include>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');


  a:link { text-decoration: none; color: black;} 
 .alink:visited { text-decoration: none; color: black;}
  a:active { text-decoration: none; color: black;}
  a:hover {text-decoration:underline; color: black;}


.board_list_wrap {
    padding: 85px;
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
    width: 8.5%; 
    padding-top:1%;
    padding-bottom:1%;
    font-size:16px; /*헤드글자크기*/
    /*바꾸지마셈*/
    
   
}

.item:hover { 
	opacity: 2.5; 
	border-bottom: 2px solid #ffcc66;
}

.colE {
    width: 14.3%; 
    padding-top:1%;
    padding-bottom:1%;
    font-size:15px; /*헤드글자크기*/
    /*바꾸지마셈*/
     
}

/*써치컨체이너*/
#three,#four,#five,#eight{
	width: 40%;
    margin: 1em auto;
    display: inline-block; 
    color:white;
    font-family: 'Noto Serif KR', serif;
    margin-right:10px;
}

#three>.form-control{
	width:100%;

}

#four>.form-control{
	width:100%;
	height:100%;
	color:black;
	float:left;
	margin-top:-3%; /*이유모름 그냥 안맞아서*/
}

#five>.form-control{
	width:100%;
	margin-top:10%;
}

#eight{

	float:left;
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


#searchImg{

    color: #f0f2fc;
  
    /*이미지커지는거*/
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
	margin:0;
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
										<h5 class="modal-title" id="exampleModalLabel">회원관리</h5>
										<button type="button" class="close"
											data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
										</button>
									</div>
		<div id="search-container">
		<form id="myForm" action="${path }/admin/adminMemberSearch" method="post">
			
			<div id="totalone">
			
			<div id="three">
			<select name="searchType" class="form-control" >
				<option value="${param.searchType }" disabled selected>검색타입</option>

				<option value="mem_name"
					<c:if test="${param.searchType eq 'mem_name'}">selected</c:if>>이름</option>
				<option value="mem_email"
					<c:if test="${param.searchType eq 'mem_email'}">selected</c:if>>이메일</option>
				<option value="mem_nickname"
					${param.searchType eq 'mem_nickname'?"selected":"" }>닉네임</option>
			</select> 
			</div>
			
			<div id="four">
			<input type="search" name="keyword" value="${param.keyword }" placeholder="Search" class="form-control"/> <br>
			</div>

			<div id="five">
			
				<label>
				<input type="radio" name="gender"
				value="M" <c:if test="${param.gender eq 'M'}">checked</c:if>> 남</label> &nbsp;&nbsp;&nbsp;&nbsp;
				
				<label><input type="radio" name="gender"
				value="F" <c:if test="${param.gender eq 'F'}">checked</c:if>> 여</label> <br> 
				<label>
				
				<input type="checkbox" name="leaveMem"
				value="0"<c:if test="${param.leaveMem eq '0'}">checked</c:if>>현재 회원 
				</label>&nbsp;&nbsp;&nbsp;&nbsp;
				
				<label> 
				<input type="checkbox" name="leaveMem"
				value="1"<c:if test="${param.leaveMem eq '1'}">checked</c:if>>탈퇴한 회원 <br> 
				</label>
				
				<br>
				
				<label>
				<input type="checkbox"
				name="memClass" value="일반유저" <c:if test="${param.memClass eq '일반유저'}">checked</c:if>>일반유저 
				</label>&nbsp;&nbsp;&nbsp;&nbsp;
				
				<label>
				<input type="checkbox"
				name="memClass" value="예비전문가"<c:if test="${param.memClass eq '예비전문가'}">checked</c:if>>예비전문가 
				</label>
				
				<label>
				<input type="checkbox"
				name="memClass" value="전문가"<c:if test="${param.memClass eq '전문가'}">checked</c:if>>전문가 
				</label>
			</div>
			
			<div id="eight">			
			<button type="submit" class="btn btn-default" id="bbtn">검색</button>
			<button type="button" class="btn btn-default"
											data-dismiss="modal" id="bbtn">
											취소</button>
			</div>	
			
			</div>
			
		</form>
	</div>
								</div>						
							</div>
						</div>

	
	
<div class="board_list_wrap">
			<div class="board_list">
				<div class="board_list_head">
				<div class="col">번호</div>
				<div class="colE">이메일</div>
				<div class="col">이름</div>
				<div class="col">닉네임</div>
				<div class="col">성별</div>
				<div class="col">생일</div>
				<div class="col">가입날짜</div>
				<div class="col">포인트</div>
				<div class="col">탈퇴여부</div>
				<div class="col">구분</div>
				<div class="col">전화번호</div>
			</div>
			<c:if test="${empty list}">
			
				<div class="col">조회 결과가 없습니다.</div>
			
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="m" items="${list }">
				<div class="board_list_body">
						<a href="javascript:deleteMember(${m.usid});">
						<div class="item">
					<div class="col"><c:out value="${m['usid']}"/></div>
					<div class="colE"><c:out value="${m['memEmail']}"/></div>
					<div class="col"><c:out value="${m['memName']}"/></div>
					<div class="col"><c:out value="${m['memNickname']}"/></div>
					<div class="col"><c:out value="${m['gender'] eq 'M' ? 'M' : 'F' }"/></div>
					<div class="col"><c:out value="${m['birthday']}"/></div>
					<div class="col"><c:out value="${m['enrollDate']}"/></div>
					<div class="col"><c:out value="${m['point']}"/></div>
					<div class="col"><c:choose>
										<c:when test="${m['leaveMem'] eq false }">X</c:when>
										<c:otherwise>O</c:otherwise>
									</c:choose></div>
					<div class="col"><c:out value="${m['memClass']}"/></div>
					<div class="col"><c:out value="${m['tel']}"/></div>
				</div>
						</a>
					</div>
			</c:forEach>
		</c:if>
	
		</div>
		</div>
		

		<div id="pageBar" class="paging">${pageBar }</div>



</section>
	
<script type="text/javascript">
	function deleteMember(usid) {
		if (confirm("정말 탈퇴시키겠습니까?") == true) {
			location.replace("${path}/admin/adminDeleteMember?usid=" + usid);
		} else {
			return;
		}
	}
	
	
		 
	 

</script>
