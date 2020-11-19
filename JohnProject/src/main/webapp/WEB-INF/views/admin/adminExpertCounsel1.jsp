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

			<li><a href="${path}/admin/adminExpertCounsel0">진행중</a></li>

			<li><a href="${path}/admin/adminExpertCounsel1">종료</a></li>

		</ul>
	<table id="tbl-board" class="table table-striped table-hover">
		<tr>
			<th>전문가번호</th>
			<th>상담신청유저번호</th>
			<th>전문가닉네임</th>
			<th>상담신청유저닉네임</th>
			<th>상담완료유무</th>
			<th>상담신청날짜</th>
			<th>상담신청시간</th>
			<th>상담요구사항</th>
		
		</tr>
		<c:forEach items="${list }" var="ex">
			<tr>
				<td><c:out value="${ex.expertRequetExUsid }" /></td>
				<td><c:out value="${ex.expertRequestMemUsid }" /></td>
				<td><c:out value="${ex.expertRequetExNick }" /></td>
				<td><c:out value="${ex.expertRequestMemNick }" /></td>
				<td><c:out value="${ex.expertIscounsel}"/></td>
				<td><c:out value="${ex.expertDate}" /></td>
				<td><c:out value="${ex.expertCounselTime }" /></td>
				<td><c:out value="${ex.expertCounselRequire }" /></td>
			</tr>
		</c:forEach>
	</table>



	<div id="pageBar">${pageBar }</div>
</div>	
	</section>
	
