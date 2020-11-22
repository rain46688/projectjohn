<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="title" value=" " />

</jsp:include>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');

/*a링크*/
  a:link { text-decoration: none; color: black;} 
  a:visited { text-decoration: none; color: black;} 
  a:active { text-decoration: none; color: black;}
  a:hover {text-decoration:underline; color: black;}

/*표*/
.board_list_wrap {
    padding: 50px;
    font-family: 'Noto Sans KR', sans-serif;
 	
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
    font-family: 'Noto Sans KR', sans-serif;
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
	width:23%;
	float:left;
	 margin-right: 10px;
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

.radio-inline{
	width:23px;
	height:23px;
}

#eight>.form-control{
	width:100%;
}



#search-container{
	display:flex;
	justify-content:center;
	background-color:white;
	margin-top:3%;
	border-radius:20px;
	width: 90%;
	text-align: center;
 	margin-left:4.5%; 
	background-color:#ffcc66;
	padding: 50px;
}



#myForm{
	width:90%;
	height:10%;
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

	<div id="search-container">
		<form  id="myForm" action="${path }/admin/adminBoardSearch" method="post">
		
		
<%-- 		<input type="hidden" id="type" name="type" value="${param.type }" readonly="readonly"/>
		<input type="hidden" id="keyword" name="keyword" value="${param.keyword }" readonly="readonly"/>
		<input type="hidden" id="keyword2" name="keyword2" value="${param.keyword2 }" readonly="readonly"/>
		<input type="hidden" id="type2" name="type2" value="${param.type2 }" readonly="readonly"/>
		<input type="hidden" id="bigCategory" name="bigCategory" value="${param.big_category }" readonly="readonly"/>
		<input type="hidden" id="smallCategory" name="smallCategory" value="${param.small_category }" readonly="readonly"/>
		<input type="hidden" id="isclose" name="isclose" value="${param.isclose }" readonly="readonly"/>
		<input type="hidden" id="order" name="order" value="${param.order }" readonly="readonly"/> --%>
		
		<div id="one">
		 <select class="form-control" name="bigCategory" id="s0" required>
		 		<option>대분류</option>
				<option value="연애상담" <c:if test="${param.big_category eq '연애상담'}">selected</c:if>>연애상담</option> 
				<option value="일반게시판" <c:if test="${param.big_category eq '일반게시판'}">selected</c:if>>일반게시판</option> 
				<option value="음성게시판" <c:if test="${param.big_category eq '음성게시판'}">selected</c:if>>음성게시판</option> 
	    </select>
		</div>
		
		<div id="two">
	    <select class="form-control" id="s1" name="smallCategory">
	        <option>소분류</option>
	    </select>
		</div>	
			
		<%-- 	<select name="big_category"  required>
		
				<option value="연애상담" <c:if test="${param.big_category eq '연애상담'}">selected</c:if>>연애상담</option> 
				<option value="일반게시판" <c:if test="${param.big_category eq '일반게시판'}">selected</c:if>>일반게시판</option> 
				<option value="음성게시판" <c:if test="${param.big_category eq '음성게시판'}">selected</c:if>>음성게시판</option> 
				
			</select>	 --%>
			
		<div id="three"> 
			<select name="searchType" class="form-control" required>
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
			
			
			<div id="five">
 			<label id="five-1"><input type="radio" name="order" value='ascend' class="form-control">오름차순</label>
			<label id="five-1"><input type="radio" name="order" value='descend' class="form-control">내림차순</label> 
			</div>
			
			<div id="six">
			<select name="searchType2" class="form-control" required>
				<option value=" " disabled selected>선택하세요</option> 
				<option value="enroll_date" <c:if test="${param.searchType eq 'enroll_date'}">selected</c:if>>날짜</option>
				<option value="board_id" <c:if test="${param.searchType eq 'board_id'}">selected</c:if>>글번호</option>
				<option value="hit" ${param.searchType eq 'hit'?"selected":"" }>조회수</option>	
			</select>
			</div>

			<div id="seven">
			<label class="radio-inline"><input type="checkbox" name="isclose" value="0" class="form-control">진행중인 게시글</label>
			<label class="radio-inline"><input type="checkbox" name="isclose" value="1" class="form-control">종료된 게시글</label>
			</div>
			
			
			<div id="eight">
			<input type="submit" value="검색">
			</div>
		</form>
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
			<a href="#">
			<div class="item">
				<div class="col"><c:out value="${b.boardId }" /></div>
				<div class="col"><c:out value="${b.writerUsid }" /></div>
				<div class="col"><c:out value="${b.writerNickname }" /></div>
				<div class="col"><c:out value="${b.title }" /></div>
				<div class="colDate"><c:out value="${b.enrollDate }" /></div>
				<div class="col"><c:out value="${b.hit}" /></div>
				<div class="col"><c:out value="${b.bigCategory }" /></div>
				<div class="col"><c:out value="${b.smallCategory }" /></div>
				<div class="col"><c:out value="${b.isclose }" /></div>
			</div>
			</a>
		</div>
		</c:forEach>
	</div>
	</div>

	

	<div id="pageBar">${pageBar }</div>

 </section>
 
 
 <script>
 

 
 </script>




