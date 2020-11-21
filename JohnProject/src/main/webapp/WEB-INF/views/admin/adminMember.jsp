<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="title" value="adminMember" />

</jsp:include>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');


  a:link { text-decoration: none; color: black;} 
/*   a:visited { text-decoration: none; color: black;}  */
  a:active { text-decoration: none; color: black;}
  a:hover {text-decoration:underline; color: black;}


.board_list_wrap {
    padding: 50px;
    
 	
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
    font-family: 'Noto Sans KR', sans-serif;
}

.board_list_body .item {
    border-bottom: 2px solid #eeeeee;
    background-color:white;
    border-radius:10px;
    font-family: 'Noto Sans KR', sans-serif;
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
    width: 7.7%; 
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

</style>

<section id="content">

	<div id="search-container">
		<form action="${path }/admin/adminMemberSearch" method="post">

			<select name="searchType" required>
				<option value=" " disabled selected>검색타입</option>

				<option value="mem_name"
					<c:if test="${param.searchType eq 'mem_name'}">selected</c:if>>이름</option>
				<option value="mem_email"
					<c:if test="${param.searchType eq 'mem_email'}">selected</c:if>>이메일</option>
				<option value="mem_nickname"
					${param.searchType eq 'mem_nickname'?"selected":"" }>닉네임</option>

			</select> <input type="search" name="keyword" value="${param.keyword }" /> <br>

			<label>성별</label> <label><input type="radio" name="gender"
				value='M'>남</label> <label><input type="radio" name="gender"
				value='F'>여</label> <br> <input type="checkbox" name="leaveMem"
				value="0">현재 회원 <input type="checkbox" name="leaveMem"
				value="1">탈퇴한 회원 <br> <input type="checkbox"
				name="memClass" value="일반유저">일반유저 <input type="checkbox"
				name="memClass" value="전문가">전문가 <input type="submit"
				value="검색">
		</form>
	</div>



	<form id="operForm">
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
					<div class="col">경고횟수</div>
				</div>
				<c:forEach items="${list }" var="m">
					<div class="board_list_body">
						<a href="javascript:deleteMember(${m.usid});">
						<div class="item">

							<div class="col">
								<c:out value="${m.usid}" />
							</div>
							<div class="colE">
								<c:out value="${m.memEmail}" />
							</div>
							<div class="col">
								<c:out
										value="${m.memName}" />
							</div>
							<div class="col">
								<c:out value="${m.memNickname}" />
							</div>
							<div class="col">
								<c:out value="${m.gender}" />
							</div>
							<div class="col">
								<c:out value="${m.birthday}" />
							</div>
							<div class="col">
								<c:out value="${m.enrollDate}" />
							</div>
							<div class="col">
								<c:out value="${m.point}" />
							</div>
							<div class="col">
								<c:out value="${m.leaveMem}" />
							</div>
							<div class="col">
								<c:out value="${m.memClass}" />
							</div>
							<div class="col">
								<c:out value="${m.tel}" />
							</div>
							<div class="col">
								<c:out value="" />
							</div>
							<%-- <td><c:out value="${report.report_iswarning}"/></td>  --%>
						</div>
						</a>
					</div>
				</c:forEach>

			</div>
		</div>


		<div id="pageBar" class="paging">${pageBar }</div>


	</form>
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