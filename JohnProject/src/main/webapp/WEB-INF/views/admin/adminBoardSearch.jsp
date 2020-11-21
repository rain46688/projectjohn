<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="title" value=" " />

</jsp:include>

<script type=text/javascript>
        $(document).ready(function(){
            var ko=['헤어질까요?'];
            var ja=['가족문제','회사문제','연애상담'];
            var su=['가족문제','연애상담'];

            $('.s0').change(function(){
                var sel=$(this).val();
                if(sel=='연애상담'){
                    $('.op').remove();
                    $.each(ko,function(i,item){
                        $('.s1').append('<option class="op" value="'+item+'" <c:if test="${param.smallCategory eq '+item+'}">selected</c:if>>'+item+'</option>');
                    });
                }
                if(sel=='일반게시판'){
                    $('.op').remove();
                    $.each(ja,function(i,item){
                        $('.s1').append('<option class="op" value="'+item+'" <c:if test="${param.smallCategory eq '+item+'}">selected</c:if>>'+item+'</option>');
                    });
                }
                if(sel=='음성게시판'){
                    $('.op').remove();
                    $.each(su,function(i,item){
                        $('.s1').append('<option class="op" value="'+item+'" <c:if test="${param.smallCategory eq '+item+'}">selected</c:if>>'+item+'</option>');
                    });
                }
            });

        });
    </script>
    
<section id="content">

	<div id="search-container">
		<form  id="myForm" action="${path }/admin/adminBoardSearch" method="post">
		
		 <select class="s0" name="bigCategory" id="bigCategory" required>
		 		<option>대분류</option>
				<option value="연애상담" <c:if test="${param.bigCategory eq '연애상담'? 'selected':'' }"/>>연애상담</option> 
				<option value="일반게시판" <c:if test="${param.bigCategory eq '일반게시판'? 'selected':'' }"/>>일반게시판</option> 
				<option value="음성게시판"<c:if test="${param.bigCategory eq '음성게시판'? 'selected':'' }"/>>음성게시판</option> 
				
			<%-- 	<option value="일반게시판" <c:if test="${param.big_category eq '일반게시판'}">selected</c:if>>일반게시판</option> 
				<option value="음성게시판" <c:if test="${param.big_category eq '음성게시판'}">selected</c:if>>음성게시판</option>  --%>
	    </select>
	
	    <select class="s1" name="smallCategory">
	        <option>소분류</option>
	    </select>
			
			
		<%-- 	<select name="big_category"  required>
		
				<option value="연애상담" <c:if test="${param.big_category eq '연애상담'}">selected</c:if>>연애상담</option> 
				<option value="일반게시판" <c:if test="${param.big_category eq '일반게시판'}">selected</c:if>>일반게시판</option> 
				<option value="음성게시판" <c:if test="${param.big_category eq '음성게시판'}">selected</c:if>>음성게시판</option> 
				
				
			</select>	 --%>
		    
		    
			<select name="searchType" required>
				<option value=" " disabled selected>검색타입</option> 
				
				<option value="mem_name" <c:if test="${param.searchType eq 'mem_name'}">selected</c:if>>이름</option>
				<option value="mem_email" <c:if test="${param.searchType eq 'mem_email'}">selected</c:if>>이메일</option>
				<option value="title" ${param.searchType eq 'title'?"selected":"" }>제목</option>	
																							
			
			</select>
			
			<input type="search" name="keyword"
			value="${param.keyword }"/> 
			
			<br>
			
			
 			<label><input type="radio" name="order" value='ascend'>오름차순</label>
			<label><input type="radio" name="order" value='descend'>내림차순</label> 
			
			<select name="searchType2" required>
				<option value=" " disabled selected>선택</option> 
				<option value="enroll_date" <c:if test="${param.searchType eq 'enroll_date'}">selected</c:if>>날짜</option>
				<option value="board_id" <c:if test="${param.searchType eq 'board_id'}">selected</c:if>>글번호</option>
				<option value="hit" ${param.searchType eq 'hit'?"selected":"" }>조회수</option>	
			</select>
			

			<br>
			
			<input type="checkbox" name="isclose" value="0">진행중인 게시글
			<input type="checkbox" name="isclose" value="1">종료된 게시글

			
			

			<input type="submit" value="검색" >
		</form>
	</div>
	


	<table id="tbl-board" class="table table-striped table-hover">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>닉네임</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>대분류</th>
			<th>소분류</th>
			<th>종료여부</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="9">조회 결과가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="b" items="${list }">
				<tr>
					<td><c:out value="${b['boardId']}" /></td>
					<td><c:out value="${b['writerUsid']}" /></td>
					<td><c:out value="${b['writerNickname']}" /></td>
					<td><c:out value="${b['title']}" /></td>
					<td><c:out value="${b['enrollDate']}" /></td>
					<td><c:out value="${b['hit']}" /></td>
					<td><c:out value="${b['bigCategory']}" /></td>
					<td><c:out value="${b['smallCategory']}" /></td>
					<td><c:out value="${b['isclose']}" /></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	<div id="pageBar">${pageBar }</div>

</section>


