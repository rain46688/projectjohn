<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="title" value="adminBoard" />

</jsp:include>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');

/*a링크*/
  a:link { text-decoration: none; color: black;} 
 .alink:visited { text-decoration: none; color: black;}
  a:active { text-decoration: none; color: black;}
  a:hover {text-decoration:underline; color: black;}

/*표*/
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
    
}

.board_list_body .item {
    border-bottom: 2px solid #eeeeee;
    background-color:white;
    border-radius:10px;
    font-family: 'Noto Serif KR', serif;
    opacity: 0.7;
}

.board_list_head > div,
.board_list_body .item > div{
    display: inline-block;
    text-align: center;
    font-size: 15px; /*본문글자크기*/
}



.board_list_head > div {
    font-weight: 600;
}

.board_list .col {
    width: 10.3%; 
    padding-top:1%;
    padding-bottom:1%;
    font-size:15px; /*헤드글자크기*/
    /*바꾸지마셈*/
}

.item:hover { 
	opacity: 2.5;
	border-bottom: 2px solid #ffcc66;
 }

.colDate {
    width: 16.3%; 
    padding-top:1%;
    padding-bottom:1%;
    font-size:15px; /*헤드글자크기*/
    /*바꾸지마셈*/
}    
    
/*써치컨체이너*/
#one,#two,#three,#four,#five,#six,#seven,#eight{
	width: 40%;
    margin: 1em auto;
    display: inline-block; 
    color:white;
    font-family: 'Noto Serif KR', serif;
    margin-right:10px;
}

#one>.form-control{
	width:100%;
	

}

#two>.form-control{
	width:100%;


}

#three>.form-control{
	width:100%;
}

#four>.form-control{
	width:100%;
	height:100%;
	color:black;
}

#five>.form-control{
	width:100%;
	margin-top:10%;
}

#five-1>.form-control{
	width:23px;
	height:23px;
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

/* #totalone, #totaltwo, #totalthree,#totalfour{
	justify-content:center;
	background-color:white;
	margin-top:3%;
	border-radius:20px;
	width: 100%; 
	height:10%;
	text-align: center;
 	margin-left:4.5%; 
	background-color:#003478;
	padding: 50px;
	color:white;
	float: left; 
	
	padding-top:1%;
	padding-left:0%;

} */

	
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
	margin: 0;
}

.pagination a:hover:not(.active) { /*호버*/
	background-color: #ffcc66;
}


</style>

 <script type=text/javascript>
        $(document).ready(function(){
            var ko=['헤어질까요?'];
            var ja=['가족문제','회사문제','연애상담'];
            var su=['가족문제','연애상담'];

            $('#s0').change(function(){
                var sel=$(this).val();
                if(sel=='연애상담'){
                    $('.op').remove();
                    $.each(ko,function(i,item){
                        $('#s1').append('<option class="op" value="'+item+'" <c:if test="${param.smallCategory eq '+item+'}">selected</c:if>>'+item+'</option>');
                    });
                }
                if(sel=='일반게시판'){
                    $('.op').remove();
                    $.each(ja,function(i,item){
                        $('#s1').append('<option class="op" value="'+item+'" <c:if test="${param.smallCategory eq '+item+'}">selected</c:if>>'+item+'</option>');
                    });
                }
                if(sel=='음성게시판'){
                    $('.op').remove();
                    $.each(su,function(i,item){
                        $('#s1').append('<option class="op" value="'+item+'" <c:if test="${param.smallCategory eq '+item+'}">selected</c:if>>'+item+'</option>');
                    });
                }
            });

        });
    </script>
    
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
										<h5 class="modal-title" id="exampleModalLabel">게시판관리</h5>
										<button type="button" class="close"
											data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
										</button>
									</div>
		<div id="search-container">
		<form  id="myForm" action="${path }/admin/adminBoardSearch" method="post">
		
		<div id="totalone">
		<div id="one">
		 <select class="form-control" name="bigCategory" id="s0" >
		 		<option>대분류</option>
				<option value="연애상담" <c:if test="${param.bigCategory eq '연애상담'}">selected</c:if>>연애상담</option> 
				<option value="일반게시판" <c:if test="${param.bigCategory eq '일반게시판'}">selected</c:if>>일반게시판</option> 
				<option value="음성게시판" <c:if test="${param.bigCategory eq '음성게시판'}">selected</c:if>>음성게시판</option> 
	    </select>
		</div>

		<div id="two">
	    <select class="form-control" id="s1" name="smallCategory">
	        <option>소분류</option>
	    </select>
		</div>	
		</div>	
		<%-- 	<select name="big_category"  required>
		
				<option value="연애상담" <c:if test="${param.big_category eq '연애상담'}">selected</c:if>>연애상담</option> 
				<option value="일반게시판" <c:if test="${param.big_category eq '일반게시판'}">selected</c:if>>일반게시판</option> 
				<option value="음성게시판" <c:if test="${param.big_category eq '음성게시판'}">selected</c:if>>음성게시판</option> 
				
			</select>	 --%>
		<div id="totaltwo">
		<div id="three"> 
			<select name="searchType" class="form-control" >
				<option value=" " disabled selected>검색타입</option> 
				
				<option value="mem_name" <c:if test="${param.searchType eq 'mem_name'}">selected</c:if>>이름</option>
				<option value="mem_email" <c:if test="${param.searchType eq 'mem_email'}">selected</c:if>>이메일</option>
				<option value="title" ${param.searchType eq 'title'?"selected":"" }>제목</option>	
					
			</select>
		</div>
			
			<div id="four">
			<input type="search" name="keyword" class="form-control" placeholder="Search" 
			value="${param.keyword }"/> 
			
			</div>	
		</div>	
		<div id="totalthree">
			<div id="five">
 			<label id="five-1"><input type="radio" name="order" value='ascend' <c:if test="${param.order eq 'ascend'}">checked</c:if>>오름차순</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label id="five-1"><input type="radio" name="order" value='descend' <c:if test="${param.order eq 'descend'}">checked</c:if>>내림차순</label> 
			</div>
			
			<div id="six">
			<select name="searchType2" class="form-control" >
				<option value="${param.searchType2 }" disabled selected>선택하세요</option> 
				<option value="enroll_date" <c:if test="${param.searchType2 eq 'enroll_date'}">selected</c:if>>날짜</option>
				<option value="board_id" <c:if test="${param.searchType2 eq 'board_id'}">selected</c:if>>글번호</option>
				<option value="hit" ${param.searchType2 eq 'hit'?"selected":"" }>조회수</option>	
			</select>
			</div>
		</div>
		<div id="totalfour">	
			<div id="seven">
			
			<label>
			<input type="checkbox" name="isclose" value="0" <c:if test="${param.isclose eq '0'}">checked</c:if>>
			진행중인 게시글<br></label><br>
			
			<label>
			<input type="checkbox" name="isclose" value="1" <c:if test="${param.isclose eq '1'}">checked</c:if>>
			종료된 게시글</label>
			
			</div>
		</div>	
			
			<div id="eight">
			<button type="submit" class="btn btn-default" id="bbtn" onclick="fn_selectBoard();">검색</button>
			<button type="button" class="btn btn-default"
											data-dismiss="modal" id="bbtn">
											취소</button>
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
			<div class="col">아이디</div>
			<div class="col">닉네임</div>
			<div class="col">제목</div>
			<div class="colDate">날짜</div>
			<div class="col">조회수</div>
			<div class="col">대분류</div>
			<div class="col">소분류</div>
			<div class="col">종료여부</div>
		</div>
		<c:forEach items="${list }" var="b">
			<div class="board_list_body">
			<a href="${path}/board/boardPage?boardNo=${b.boardId}" class="alink">
			<div class="item">
				<div class="col"><c:out value="${b.boardId }" /></div>
				<div class="col"><c:out value="${b.writerUsid }" /></div>
				<div class="col"><c:out value="${b.writerNickname }" /></div>
				<div class="col"><c:out value="${b.title }" /></div>
				<div class="colDate"><fmt:formatDate value="${b.enrollDate }" pattern="yyyy.MM.dd HH:mm"/></div>
				<div class="col"><c:out value="${b.hit}" /></div>
				<div class="col"><c:out value="${b.bigCategory }" /></div>
				<div class="col"><c:out value="${b.smallCategory }" /></div>
				<div class="col" style="font-weight:bold">
					<c:choose>
						<c:when test="${b.isclose eq false }">진행중</c:when>
						<c:otherwise>종료</c:otherwise>
					</c:choose></div>
			</div>
			</a>
		</div>
		</c:forEach>
	</div>
	</div>

	<div id="pageBar">${pageBar }</div>

 </section>
 
 
 <script>
 
/*  function fn_selectBoard(){
		$.ajax({
			url:"${path}/admin/adminBoardSearch",
			type:"post",
			data:{"searchType":$('input[name="searchType"]:checked').val(),
			"keyword":$('input[name="keyword"]:checked').val(),
			"keyword2":$('input[name="keyword2"]:checked').val(),
			"searchType2":$('input[name="searchType2"]:checked').val(),
			"bigCategory":$('input[name="bigCategory"]:checked').val(),
			"smallCategory":$('input[name="smallCategory"]:checked').val(),
			"order":$('input[name="order"]:checked').val(),
			"isclose":$('input[name="isclose"]:checked').val()},
			
			dataType:"json",
			success:function(data){
				location.href="${path}/admin/adminBoardSearch?searchType="+data.searchType
				"&keyword="+data.keyword
				"&keyword2="+data.keyword2
				"&searchType2="+data.searchType2
				"&bigCategory="+data.bigCategory
				"&smallCategory="+data.smallCategory
				"&order="+data.order
				"&idclose="+data.isclose
			}
		})
		
		console.log("검색실행됨")''
	}; */
 </script>
 


