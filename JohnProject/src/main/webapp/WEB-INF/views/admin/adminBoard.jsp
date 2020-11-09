<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="title" value=" " />

</jsp:include>

 <!-- <script type=text/javascript>
 
        $(document).ready(function(){
            var ko=['헤어질까요?','말까요?'];
            var ja=['가족문제','아닌가요?'];
            var ch=['엥','아닌가요?'];
            $('.s0').change(function(){
                var sel=$(this).val();
                if(sel==1){
                    $('.op').remove();
                    $.each(ko,function(i,item){
                        $('.s1').append('<option class="op" value="small_category" <c:if test="${param.searchType eq '헤어질까요?'}">selected</c:if>>'+item+'</option>');
                        $('.s1').append('<option class="op" value="small_category" <c:if test="${param.searchType eq '말까요?'}">selected</c:if>>'+item+'</option>');
                    });
                }
                if(sel==2){
                    $('.op').remove();
                    $.each(ja,function(i,item){
                        $('.s1').append('<option class="op" value="small_category" <c:if test="${param.searchType eq '가족문제'}">selected</c:if>>'+item+'</option>');
                        $('.s1').append('<option class="op" value="small_category" <c:if test="${param.searchType eq '아닌가요?'}">selected</c:if>>'+item+'</option>');
                    });
                }
                if(sel==3){
                    $('.op').remove();
                    $.each(ch,function(i,item){
                        $('.s1').append('<option class="op" value="small_category" <c:if test="${param.searchType eq '엥?'}">selected</c:if>>'+item+'</option>');
                        $('.s1').append('<option class="op" value="small_category" <c:if test="${param.searchType eq '아닌가요?'}">selected</c:if>>'+item+'</option>');

                    });
                }
            });

        });
        
        

    </script> -->

<section id="content">

	<div id="search-container">
		<form action="${path }/admin/adminBoardSearch" method="post" >
		
			
		 <%-- <label>대분류</label>
		    <select class="s0" name="searchType">
		        <option selected disabled>선택하세요</option>
		        <option value="big_category" <c:if test="${param.searchType eq '연애상담'}">selected</c:if>>연애상담</option>
		        <option value="big_category" <c:if test="${param.searchType eq '일반게시판'}">selected</c:if>>일반게시판</option>
		        <option value="big_category" <c:if test="${param.searchType eq '음성게시판'}">selected</c:if>>음성게시판</option>
		        
		    </select>

   		 <label>소분류</label>
		    <select class="s1" name="searchType">
		        <option value=" " disabled selected>선택하세요</option>
		    </select> --%>
		  	 
		    <br>
		    
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

			
			
						
			<input type="submit" value="검색">
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
		<c:forEach items="${list }" var="b">
			<tr>
				<td><c:out value="${b.board_id }" /></td>
				<td><c:out value="${b.writer_usid }" /></td>
				<td><c:out value="${b.writer_nickname }" /></td>
				<td><c:out value="${b.title }" /></td>
				<td><c:out value="${b.enroll_date }" /></td>
				<td><c:out value="${b.hit}" /></td>
				<td><c:out value="${b.big_category }" /></td>
				<td><c:out value="${b.small_category }" /></td>
				<td><c:out value="${b.isclose }" /></td>
			</tr>
		</c:forEach>
	</table>



	<div id="pageBar">${pageBar }</div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

