<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
<jsp:param name="title" value=" "/>
</jsp:include>

<style>
#content *{
	/* border:1px solid red; */
}

.divList {
	display: table;
	width: 100%;
	height: 20%;
	text-align: center;
	padding:0 2% 0 2%;
}

.divRow {
	display: table-row;
}

.divRowTitle {
	display: table-row;
	font-size: 2vh;
	font-weight: bold;
	/* text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px #BFBFBF; */
	width: 100%;
}

h1 {
	font-weight: bold;
	/* text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px #BFBFBF; */
	margin: 2% 0 3% 3%;
}

.active {
	font-weight: bold;
		/* text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px #BFBFBF; */
}

.divRow .divCell {
	border-bottom: 1px #DEE2E6 solid;
	display: table-cell;
	padding: 2vh 3vh;
	width: 16.67%;
	font-size:  2vh;
}

.divRowTitle .divCell{
	height:30%;
	padding: 2vh 3vh;
	display: table-cell;
		border-bottom: 1px #DEE2E6 solid;
}

.divListBody {
	display: table-row-group;
}

.empty {
	margin-top: 3vh;
	font-weight: bold;
	margin-top: 3vh;
	margin-left: 200%;
	width: 100%;
	font-size: 3vh;
}

#middelDiv{
	width:100%;
	height:20%;
	margin-bottom:2%;
}

#searchDiv{
	width:100%;
	height:80%;
	display:flex;
	justify-content:center;
}

#sortDiv{
	width:100%;
	height:20%;
	display:flex;
	justify-content:flex-end;
}

#sortDiv *{
	margin-right:1%;
}

#innerSearchDiv{
	width:50%;
	height:100%;
	display:flex;
	justify-content:center;
	align-items:center;
	border:1px solid #C6C5C5;
}

#innerSearchDiv select{
	width:18%;
	height:30%;
	margin-right:2%;
}

#innerSearchDiv img{
	width:6%;
	height:30%;
	margin-right:1%;
}

#innerSearchDiv input{
	width:40%;
	height:30%;
	
}

#innerSearchDiv button{
	width:10%;
	height:30%;
	margin-left:1%;
}

/* 빈값 */

.empty{
	font-size:4vh;
	margin:0;
	width:100%;
}

</style>

<section id="content">
<br>
	<h1>상담 신청 확인 게시판</h1>
	<hr/>
	
	<!-- 검색 및 정렬 할수있는 Div -->
	<div id="middelDiv">
		<div id="searchDiv">
					<div id="innerSearchDiv">
					<select id="searchSelect" name="searchSelect" required>
						<option value="EXPERT_REQUEST_MEM_NICK"  selected>상담 신청자</option> 
						<option value="EXPERT_DATE" >신청 날짜</option>
						<option value="EXPERT_COUNSEL_TIME" >원하는 상담 시간</option>
					</select>
					<img src="${path}/resources/images/search.png" alt="" width="30px" height="30px">
					<input type="text" name="search" id="searchInput" onkeypress="searchkey();">
					<button class="btn btn-outline-success" onclick="search();">검색</button>
				</div>
		</div>
		<div id="sortDiv">
					<select id="sortSelect" name="sortSelect" required>
						<option value="EXPERT_DATE"  selected>신청 날짜 순</option> 
						<option value="EXPERT_COUNSEL_TIME" >상담 시간순</option>
						<option value="EXPERT_REQUEST_MEM_NICK" >신청자 이름순</option>
					</select>
					<select id="pageSelect" name="pageSelect" required>
						<option value="10"  selected>10개씩 보기</option> 
						<option value="20" >20개씩 보기</option>
						<option value="50" >50개씩 보기</option>
					</select>
		</div>
	<!-- 현재 페이지 -->
		<input id="cPageInput" type="hidden" value="1">
	</div>
	<hr/>
	<!-- 리스트를 쏴줄 Div -->
	<div class="divList">
		<div class="divListBody"></div>
	</div>
	<!-- 페이징 처리 Div -->
	<div id="pagingDiv"></div>
	
	<script>
	
	const exlistconn = new WebSocket('wss://192.168.219.105${path}/exlistSocket');
	
	exlistconn.onopen = function() {
		console.log("onopen");
		sendMessage("1");
	}

	exlistconn.onmessage = function(msg) {
		console.log("onmessage");
		
	}
	
	function sendMessage(message) {
		exlistconn.send(message);
		console.log("sendMessage");
	};
	
	
	</script>

</section>
