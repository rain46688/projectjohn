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
	 border:1px solid red;
}

.divList {
	display: table;
	width: 100%;
	height: 20%;
	text-align: center;
	padding:0 5% 0 5%;
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
	font-size:5vh;
}

.active {
	font-weight: bold;
		/* text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px #BFBFBF; */
}

.divRow .divCell {
	border-bottom: 1px #AEAEAE solid;
	display: table-cell;
	padding: 2vh 3vh;
	width: 16.67%;
	font-size:  2vh;
}

.divRowTitle{
	border-radius:1em;
	background-color: #0054BA;
	color: white;
}

.divRowTitle .divCell{
	height:30%;
	padding: 2vh 3vh;
	display: table-cell;
	border-bottom: 1px #AEAEAE solid;

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
	border:1px solid #AEAEAE;
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
	font-size:100%;
}

/* 빈값 */

.empty{
	font-size:4vh;
	margin:0;
	width:100%;
}

hr{
	border-top:1px solid #AEAEAE; 
}

.divCell form{
	width:100%;
	height:100%;
}

.divCell button{
	width:70%;
	height:100%;
	font-size:2vh;
	font-weight:bold;
}


</style>

<section id="content">
<br>
	<h1>상담 신청 확인 게시판</h1>
	<!-- <hr/> -->
	
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
					<button id="searchBtn"class="btn btn-outline-success" >검색</button>
				</div>
		</div>
		<div id="sortDiv">
					<select id="sortSelect" name="sortSelect" required>
						<option value="date"  selected>신청 날짜 순</option> 
						<option value="time" >상담 시간순</option>
						<option value="nic" >신청자 이름순</option>
					</select>
					<select id="sortType" name="sortType" required>
						<option value="desc" selected>내림차순</option>
						<option value="asc"  >오름차순</option> 
					</select>
		</div>
	<!-- 현재 페이지 -->
		<input id="cPageInput" type="hidden" value="1">
	</div>
	<!-- <hr/> -->
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
	let backupList = [];
	
	exlistconn.onopen = function() {
		console.log("onopen");
		sendMessage("1");
	}

	exlistconn.onmessage = function(msg) {
		console.log("onmessage");
		exboardList = JSON.parse(msg.data);
		backupList = JSON.parse(msg.data);
		exboardList = excompare(exboardList, 'expertDate',$("#sortType").val());	
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
		let keyword = $(e.target).val();
		console.log("sort : "+keyword);
		console.log("type : "+$("#sortType").val());
		if (keyword == 'nic'){
			exboardList = excompare(exboardList, 'expertRequestMemNick',$("#sortType").val());
			listTestConsolelog(exboardList);
			listPrint(exboardList);
		}else if (keyword == 'date'){
			exboardList = excompare(exboardList, 'expertDate',$("#sortType").val());	
			listTestConsolelog(exboardList);
			listPrint(exboardList);
		}else if (keyword == 'time'){
			exboardList = excompare(exboardList, 'expertCounselTime',$("#sortType").val());
			listTestConsolelog(exboardList);
			listPrint(exboardList);
		}
	});
	
	$("#sortType").on('change', e => {
		let keyword = $(e.target).val();
		console.log("type : "+keyword);
		let field;
		if($("#sortSelect").val() =='date'){
			field = 'expertDate';
		}else if($("#sortSelect").val() == 'nic'){
			field = 'expertRequestMemNick';
		}else{
			field = 'expertCounselTime';
		}
		exboardList = excompare(exboardList,field,keyword);
		listTestConsolelog(exboardList);
		listPrint(exboardList);
	});
	
	//정렬
	let excompare = function(list, field, type){
		console.log(" field : "+field+" type : "+type);
		if(type == 'desc'){
			console.log("내림!");
			list.sort((a,b) => {
				return a[field] > b[field] ? -1 : a[field] > b[field] ? 1 : 0;
			});
			return list;
		}else{
			console.log("오름!");
			list.sort((a,b) => {
				return a[field] < b[field] ? -1 : a[field] > b[field] ? 1 : 0;
			});
			return list;
		}
	}

	//시험용 출력
	function listTestConsolelog(list,type){
		list.forEach((e, i)=>{
			console.log(e['expertRequestMemNick']);	
			//console.log(e['expertCounselTime']);
			//console.log(e['expertDate']);	
		});
	}
	
	//검색 키보드
	function searchkey(){
		if(window.event.keyCode == 13) {
			console.log("search 엔터 버튼 클릭");
			search($("#searchSelect").val(),$("#searchInput").val());
		}
		return false;
	}
	
	$("#searchBtn").click(e => {
		search($("#searchSelect").val(),$("#searchInput").val());
	});

	//검색 함수
	function search(keyword, inputval){
		console.log("search 버튼 클릭");
		
		if(inputval == ""){
			console.log("값 비어있음");
			exboardList = backupList;
			listPrint(exboardList);
		}else{
			console.log("값 비어있지않음");
			exboardList = backupList;
			if (keyword == 'nic'){
				console.log("닉");
				exboardList = findKeyword(exboardList,'expertRequestMemNick',inputval);
				listPrint(exboardList);
			}else if (keyword == 'date'){
				console.log("날짜");
				exboardList = findKeyword(exboardList,'expertDateTmp',inputval);
				listPrint(exboardList);
			}else if (keyword == 'time'){
				console.log("시간");
				exboardList = findKeyword(exboardList,'expertCounselTime',inputval);
				listPrint(exboardList);
			}
		}		
	}
	
	//검색검색!
	function findKeyword(list, keyword,val){
		console.log("keyword : "+keyword+" val : "+val);
		let tmpList = [];
		list.forEach((e,i) => {
			//console.log("비교 : "+e[keyword].includes(val));
			if(e[keyword].includes(val)){
				//console.log("닉 : "+e[keyword]);
				//console.log("값 : "+val);
				tmpList.push(e);				
			}
		});
		return tmpList;
	}
	
	</script>
</section>
