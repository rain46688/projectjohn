<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value="adminMember"/>
	
</jsp:include>


	<section id="content">
	      	
	<div id="search-container">
		<form action="${path }/admin/adminMemberSearch" method="post">
		
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
			
			<input type="checkbox" name="leaveMem" value="0">현재 회원
			<input type="checkbox" name="leaveMem" value="1">탈퇴한 회원

			<br>
			
			<input type="checkbox" name="memClass" value="일반유저">일반유저
			<input type="checkbox" name="memClass" value="전문가">전문가
						
			<input type="submit" value="검색">
		</form>
	</div>
	
	
	
	<form id="operForm" >
		<table class="table">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">이메일</th>
				<th scope="col">이름</th>
				<th scope="col">닉네임</th>
				<th scope="col">성별</th>
				<th scope="col">생일</th>
				<th scope="col">가입날짜</th>
				<th scope="col">포인트</th>
				<th scope="col">탈퇴여부</th>
				<th scope="col">구분</th>
				<th scope="col">전화번호</th>
				<th scope="col">경고횟수</th>
			</tr>
			
			<c:forEach items="${list }" var="m">
				<tr>
					<td><c:out value="${m.usid}"/></td>
					<td><c:out value="${m.memEmail}"/></td>
					<td><a href="javascript:deleteMember(${m.usid});"><c:out value="${m.memName}"/></a></td>
					<td><c:out value="${m.memNickname}"/></td>
					<td><c:out value="${m.gender}"/></td>
					<td><c:out value="${m.birthday}"/></td>
					<td><c:out value="${m.enrollDate}"/></td>
					<td><c:out value="${m.point}"/></td>
					<td><c:out value="${m.leaveMem}"/></td>
					<td><c:out value="${m.memClass}"/></td>
					<%-- <td><c:out value="${report.report_iswarning}"/></td>  --%>
					
				</tr>
				</c:forEach>
					
		</table>
		
		     <div id="pageBar">
		        ${pageBar } 
		      </div>
		       
		       
		</form>
	</section>
	
	<script type="text/javascript">
	function deleteMember(usid){
		 if (confirm("정말 탈퇴시키겠습니까?") == true){
			location.replace("${path}/admin/adminDeleteMember?usid="+usid);
		 }else{  
		     return;
		 }
	}
	</script>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>