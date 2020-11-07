<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="title" value=" " />

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

		<div class="tab-view">


			<form id="operForm">
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
					</tr>

					<c:forEach items="${list }" var="m">
						<tr>
							<td><c:out value="${m.usid}" /></td>
							<td><c:out value="${m.mem_email}" /></td>
							<td><a href="javascript:updateMemberToExpert(${m.usid});"><c:out value="${m.mem_name}"/></a></td>
							<td><c:out value="${m.mem_nickname}" /></td>
							<td><c:out value="${m.gender}" /></td>
							<td><c:out value="${m.birthday}" /></td>
							<td><c:out value="${m.enroll_date}" /></td>
							<td><c:out value="${m.point}" /></td>
							<td><c:out value="${m.leave_mem}" /></td>
							<td><c:out value="${m.mem_class}" /></td>

						</tr>
					</c:forEach>

				</table>

				<div id="pageBar">${pageBar }</div>


			</form>

		</div>

	</div>

</section>

<script>
function updateMemberToExpert(usid){
	console.log("클릭됨");
	location.replace("${path}/admin/adminUpdateMemberToExpert?usid="+usid);
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

