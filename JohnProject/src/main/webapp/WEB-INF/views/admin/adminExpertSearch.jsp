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
ul li {
	list-style-type: none;
}

.tab-box {
	/* 	margin: 50px auto 0 auto;
	width: 520px; */
	
}

.tab-box ul {
	height: 30px;
}

.tab-box li {
	float: left;
	width: 100px;
	height: 30px;
	line-height: 30px;
	margin-right: 2px;
	text-align: center;
	background-color: #ccc;
	border-radius: 3px 3px 0 0;
	cursor: pointer;
}

/* .tab-box li.selected {
	background-color: #ffcc66
} */


.tab-view {
	/* 	width: 506px;
	height: 100px;
	line-height: 100px;
	border: 1px solid gray;
	text-align: center;
	margin-top: -1px; */
	border: 1px solid gray;
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
	

	
