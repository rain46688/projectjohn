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
			
			<input type="checkbox" name="leave_mem" value="0">현재 회원
			<input type="checkbox" name="leave_mem" value="1">탈퇴한 회원

			<br>
			
			<input type="checkbox" name="mem_class" value="일반유저">일반유저
			<input type="checkbox" name="mem_class" value="전문가">전문가
						
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
			</tr>
			
			<c:forEach items="${list }" var="m">
				<tr>
					<td><c:out value="${m.usid}"/></td>
					<td><c:out value="${m.mem_email}"/></td>
					<td><a href="javascript:deleteMember(${m.usid});"><c:out value="${m.mem_name}"/></a></td>
					<td><c:out value="${m.mem_nickname}"/></td>
					<td><c:out value="${m.gender}"/></td>
					<td><c:out value="${m.birthday}"/></td>
					<td><c:out value="${m.enroll_date}"/></td>
					<td><c:out value="${m.point}"/></td>
					<td><c:out value="${m.leave_mem}-"/></td>
					<td><c:out value="${m.mem_class}"/></td>
					<%-- <td><c:out value="${m.tel}"/></td> --%>
					

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
		alert("정말 탈퇴시키겠습니까?");
		location.replace("${path}/admin/adminDeleteMember?usid="+usid);
	}
	


	</script>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>