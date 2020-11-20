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
						<option value="nic"  selected>상담 신청자</option> 
						<option value="date" >신청 날짜</option>
						<option value="time" >원하는 상담 시간</option>
					</select>
					<img src="${path}/resources/images/search.png" alt="" width="30px" height="30px">
					<input type="text" name="search" id="searchInput" onkeypress="searchkey();">
					<button class="btn btn-outline-success" onclick="search();">검색</button>
				</div>
		</div>
		<div id="sortDiv">
					<select id="sortSelect" name="sortSelect" required>
						<option value="date"  selected>신청 날짜 순</option> 
						<option value="time" >상담 시간순</option>
						<option value="nic" >신청자 이름순</option>
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
	'use strict'
	
	const exlistconn = new WebSocket('wss://192.168.219.105${path}/exlistSocket');
	let exboardList = [];
	
	
	exlistconn.onopen = function() {
		console.log("onopen");
		sendMessage("1");
	}

	exlistconn.onmessage = function(msg) {
		console.log("onmessage");
		exboardList = JSON.parse(msg.data);
		listPrint(exboardList);
		
	}
	
	function sendMessage(message) {
		exlistconn.send(message);
		console.log("sendMessage");
	};
	
	//리스트 출력
	function listPrint(list){
		console.log("리스트 길이 : "+list.length);
		let pbhtml = "";
		
		if(list.length > 0){
			list.forEach((e, i)=>{
				if(i == 0){
					pbhtml += "<div class='divRowTitle '><div class='divCell'>상담 신청자</div><div class='divCell'>상담 신청 날짜</div><div class='divCell'>원하는 상담 시간</div><div class='divCell'>상담 시작</div><div class='divCell'>정보 보기</div></div>";
				}
				if(e['endCounsel'] != null){
					pbhtml +="<div class='divRow ' ><div class='divCell'>"+e['expertRequestMemNick']+"</div><div class='divCell'>"+e['expertDateTmp']+"</div><div class='divCell'>"+e['expertCounselTime']+"</div><div class='divCell'>";
					if(e['endCounsel'] == false){
							if(e['startCounsel']== false){
								pbhtml += "<button class='btn btn-outline-success' onclick='counselStart('"+e['expertRequestMemUsid']+"','"+e['expertRequestMemNick']+"');'>상담 시작</button>";
							}else{
								pbhtml += "<button class='btn btn-outline-success' onclick='counselConn('"+e['expertRequestMemUsid']+"','"+e['expertRequestMemNick']+"');'>채팅 접속</button>";
							}
					}else{
						pbhtml +="상담 완료";
					}
					pbhtml += "</div><div class='divCell'><form  name='form' ><input type='hidden' name='usid' value='${loginMember.usid}'><input type='hidden' name='musid' value='"+e['expertRequestMemUsid']+"'><button class='btn btn-outline-success' onclick='exmemInfo(this.form);'>회원 정보</button></form></div></div>";
				}
			});
		}else{
			pbhtml = "<div class='divRow '><div class='divCell'><div class='empty'>상담 신청이 없습니다.</div></div></div>";
		}
		$(".divListBody").html(pbhtml);
	}
	
	// 액션 취할시 리스트 가져옴
	$("#sortSelect").on('change', e => {
		let sortList = [];
		let keyword = $(e.target).val();
		console.log("sort : "+keyword);
		if (keyword == 'nic'){
			sortList = excompare(exboardList, 'expertRequestMemNick');	
			listTestConsolelog(sortList);
			listPrint(sortList);
		}else if (keyword == 'date'){
			sortList = excompare(exboardList, 'expertDate');	
			listTestConsolelog(sortList);
			listPrint(sortList);
		}else if (keyword == 'time'){
			sortList = excompare(exboardList, 'expertCounselTime');	
			listTestConsolelog(sortList);
			listPrint(sortList);
		}
	});
	
	//정렬
	let excompare = function(list, field){
		list.sort((a,b) => {
			return a[field] < b[field] ? -1 : a[field] > b[field] ? 1 : 0;
		});
		return list;
	}
	
	//시험용 출력
	function listTestConsolelog(list){
		list.forEach((e, i)=>{
			console.log(e['expertRequestMemNick']);	
			//console.log(e['expertCounselTime']);
			//console.log(e['expertDate']);	
		});
	}
	
	

	
	
	
	</script>
</section>
