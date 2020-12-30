<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" " />
</jsp:include>

<style>

/* 초기화 */
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em,
	ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
	caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby,
	section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
	font-family: 'Noto Serif KR', serif;
}

/* 배경 */
#headerAndContent {
	background-color: #062449;
}

#content {
	/* background-color: #F1F3F3;  */
	background-color: #062449;
}

#content * {
	/* 	border:1px solid red; */
	
}

/*  div 테이블 구조 css */
.divList {
	display: table;
	width: 100%;
	height: 20%;
	text-align: center;
	padding: 0 3% 0 3%;
	background-color: #062449;
}

.divRow {
	display: table-row;
}

.divRowTitle {
	display: table-row;
	font-size: 2vh;
	font-weight: bold;
	width: 100%;
}

h1 {
	font-weight: bold;
	margin: 2% 0 3% 3%;
	font-size: 5vh;
	background-color: white;
	display: inline-block;
	padding: 1%;
	border: 10px solid #FFCC66;
}

.active {
	font-weight: bold;
}

.divRow .divCell {
	border-bottom: 1px #AEAEAE solid;
	display: table-cell;
	padding: 2vh 3vh;
	width: 16.67%;
	font-size: 2vh;
}

.divRowTitle {
	border-radius: 2%;
	background-color: #003478;
	color: white;
}

.divRowTitle .divCell {
	height: 30%;
	padding: 2vh 3vh;
	display: table-cell;
	border-bottom: 1px #AEAEAE solid;
}

.divListBody {
	display: table-row-group;
	background-color: white;
}

.empty {
	margin-top: 3vh;
	font-weight: bold;
	margin-top: 3vh;
	margin-left: 200%;
	width: 100%;
	height:22vh;
	font-size: 3vh;
	display:flex;
	justify-content:center;
}

/* 검색 부분 div */
#middelDiv {
	width: 100%;
	height: 20%;
	margin-bottom: 2%;
}

#searchDiv {
	width: 100%;
	height: 80%;
	display: flex;
	justify-content: center;
}

#sortDiv {
	width: 100%;
	height: 20%;
	display: flex;
	justify-content: flex-end;
	margin-top: 1%;
	padding-right: 4%;
}

#sortDiv * {
	margin-right: 1%;
}

#innerSearchDiv {
	width: 50%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	border: 1px solid #AEAEAE;
	background-color: white;
	border: 5px solid #FFCC66;
}

#innerSearchDiv select {
	width: 18%;
	height: 30%;
	margin-right: 2%;
}

#innerSearchDiv img {
	width: 6%;
	height: 30%;
	margin-right: 1%;
}

#innerSearchDiv input {
	width: 40%;
	height: 30%;
}

#innerSearchDiv button {
	width: 10%;
	height: 30%;
	margin-left: 1%;
	font-size: 100%;
}

/* 빈값 */
.empty {
	font-size: 4vh;
	margin: 0;
	width: 100%;
}

.divCell form {
	width: 100%;
	height: 100%;
}

.divCell button {
	width: 70%;
	height: 100%;
	font-size: 2vh;
	font-weight: bold;
}

/* 검색 버튼  */
.button-8 {
	width: 10%;
	height: 40%;
	border: 2px solid #00316D;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	margin: 2%;
	/*  */
	display: flex;
	justify-content: center;
	align-items: center;
}

.button-8 .johnbtn {
	font-size: 2vh;
	color: #FFCC66;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
	/*  */
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.eff-8 {
	width: 100%;
	height: 100%;
	border: 90px solid #00316D;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
	box-sizing: border-box;
}

.button-8:hover .eff-8 {
	border: 0px solid #00316D;
}

.button-8:hover .johnbtn {
	color: #00316D;
}
/* 일반 버튼  */
.button-7 {
	width: 100%;
	height: 70%;
	border: 2px solid #00316D;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	margin: 2%;
}

.button-7 .johnbtn {
	font-size: 2vh;
	color: #FFCC66;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
	/*  */
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.eff-7 {
	width: 100%;
	height: 70px;
	border: 90px solid #00316D;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
	box-sizing: border-box;
}

.button-7:hover .eff-7 {
	border: 0px solid #00316D;
}

.button-7:hover .johnbtn {
	color: #00316D;
}
/* 빨강 버튼 */
.button-6 {
	width: 100%;
	height: 70%;
	border: 2px solid #DC3545;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	margin: 2%;
}

.button-6 .johnbtn {
	font-size: 2vh;
	color: #FFCC66;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
	/*  */
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.eff-6 {
	width: 100%;
	height: 70px;
	border: 90px solid #DC3545;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
	box-sizing: border-box;
}

.button-6:hover .eff-6 {
	border: 0px solid #DC3545;
}

.button-6:hover .johnbtn {
	color: #DC3545;
}
</style>

<section id="content">
	<br> <br> <br>
	<!-- <h1>상담 신청 확인 게시판</h1> -->
	<!-- <hr/> -->

	<!-- 검색 및 정렬 할수있는 Div -->
	<div id="middelDiv">
		<div id="searchDiv">
			<div id="innerSearchDiv">
				<select id="searchSelect" name="searchSelect" required>
					<option value="nic" selected>상담 신청자</option>
					<option value="date">신청 날짜</option>
					<option value="time">원하는 상담 시간</option>
				</select> <img src="${path}/resources/images/search.png" alt="" width="30px" height="30px"> <input type="text" name="search" id="searchInput"
					onkeypress="searchkey();">

				<div class="button-8">
					<div class="eff-8"></div>
					<a class="johnbtn" id="searchBtn22">검색</a>
				</div>


				<!-- <button id="searchBtn22"class="btn btn-outline-success" >검색</button> -->

			</div>
		</div>
		<div id="sortDiv">
			<select id="counselSelect" name="counselSelect" required>
				<option value="req" selected>요청 상담</option>
				<option value="on">진행중 상담</option>
				<option value="off">종료된 상담</option>
			</select> <select id="sortSelect" name="sortSelect" required>
				<option value="expertDate" selected>신청 날짜 순</option>
				<option value="expertCounselTime">상담 시간순</option>
				<option value="expertRequestMemNick">신청자 이름순</option>
			</select> <select id="sortType" name="sortType" required>
				<option value="desc" selected>내림차순</option>
				<option value="asc">오름차순</option>
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
	<br> <br> <br>
	<script>
	'use strict'
	
	// ============================
	// 필요한 변수 등록 
	// 전체 배열, 백업용 배열,  소켓
	// ============================
	//const exlistconn = new WebSocket('wss://rclass.iptime.org${path}/exlistSocket');
	const exlistconn = new WebSocket('wss://192.168.219.105${path}/exlistSocket');
	
	let exboardList = [];
	let backupList = [];
	
	exlistconn.onopen = function() {
		//console.log("onopen");
		//아무거나 보내서 식별함
		exListsendMessage("start");
		
		let newURL = window.location.pathname;
		//console.log(newURL);
	}

	exlistconn.onmessage = function(msg) {
		//console.log("onmessage리퀘스트 리스트");
		let check = (msg.data).includes("Request");
		//console.log("포함 여부2 : "+check);
		
		if(check){
			exboardList = JSON.parse(msg.data);
			backupList = JSON.parse(msg.data);
			setting();
			
			if(exboardList.length == 0){
				//console.log("상담 신청이 없다~~~~!!!");
				let pbhtml = "<div class='divRow '><div class='divCell'><div><img id='noli' src='${path}/resources/images/noli.png' alt='' width='150px' height='150px'></div><div class='empty'>상담 신청이 없습니다.</div></div></div>";
				$(".divListBody").html(pbhtml);				
			}
		}
	}

	// ============================
	// 전체 배열, 백업용
	// ============================
	function setting(){
		// 기본 속성으로 리스트 정렬
		//console.log("셋팅 실행");
		search($("#searchSelect").val(),$("#searchInput").val());
		exboardList = excompare(exboardList, $("#sortSelect").val(),$("#sortType").val());
		// 뿌려줌
		listPrint(exboardList);
	}
	
	function exListsendMessage(message) {
		exlistconn.send(message);
		//console.log("exListsendMessage");
	};
	
	
	// ============================
	//리스트 출력
	// ============================
	function listPrint(list){
		//console.log("리스트 길이ㅋ : "+list.length);
		let pbhtml = "";
		let num = 3;
		if(list.length > 0){
			list.forEach((e, i)=>{
				if(i == 0){
					pbhtml += "<div class='divRowTitle '><div class='divCell'>상담 신청자</div><div class='divCell'>상담 신청 날짜</div><div class='divCell'>원하는 상담 시간</div><div class='divCell'>상담 시작</div><div class='divCell'>정보 보기</div></div>";
				}
				if(e['endCounsel'] != null){
					pbhtml +="<div class='divRow ' ><div class='divCell'>"+e['expertRequestMemNick']+"</div><div class='divCell'>"+e['expertDateTmp']+"</div><div class='divCell'>"+e['expertCounselTime']+"</div><div class='divCell'>";
					//pbhtml +="<div class='divRow ' ><div class='divCell'>"+e['expertRequestMemNick']+","+e['endCounsel']+","+e['startCounsel']+"</div><div class='divCell'>"+e['expertDateTmp']+"</div><div class='divCell'>"+e['expertCounselTime']+"</div><div class='divCell'>";
					if(e['endCounsel'] == false){//endCounsel false
							if(e['startCounsel']== false){
								//end start 둘다 false이면 요청 온 상태
								//상담시작
									pbhtml +=	 "<div class='button-7'><div class='eff-7'></div><a  class='johnbtn' onclick='counselStart(\""+e['expertRequestMemUsid']+"\",\""+e['expertRequestMemNick']+"\");'>상담 시작</a></div>";	 
							}else{
								//end false에서 start true면 진행중인 상태
								//채팅 접속
								pbhtml +=	 "<div class='button-6'><div class='eff-6'></div><a  class='johnbtn' onclick='counselConn(\""+e['expertRequestMemUsid']+"\",\""+e['expertRequestMemNick']+"\");'>채팅 접속</a></div>";
							}
					}else{
						pbhtml +="상담 완료";
					}
					
					pbhtml +=	 "</div><div class='divCell'><div class='button-7'><div class='eff-7'></div><a  class='johnbtn' onclick='exmemInfo(\""+"${loginMember.usid}"+"\",\""+e['expertRequestMemUsid']+"\");'>회원 정보</a></div></div></div>";	 
				}
			});
		}else{
			//console.log("상담 신청이 없다~~~~");
			pbhtml = "<div class='divRow '><div class='divCell'><div><img id='noli' src='${path}/resources/images/noli.png' alt='' width='150px' height='150px'></div><div class='empty'>상담 신청이 없습니다.</div></div></div>";
		}
		$(".divListBody").html(pbhtml);
	}
	
	
	// ============================
	// 정렬 라디오 액션 취할시 리스트 가져옴
	// ============================
	$("#sortSelect").on('change', e => {
		let keyword = $(e.target).val();
		//console.log("sort : "+keyword);
		//console.log("type : "+$("#sortType").val());
		exboardList = excompare(exboardList, $("#sortSelect").val(),$("#sortType").val());
		listTestConsolelog(exboardList);
		listPrint(exboardList);
	});
	
	
	// ============================
	//정렬 하기
	// ============================
	$("#sortType").on('change', e => {
		let keyword = $(e.target).val();
		//console.log("type : "+keyword);
		let field = $("#sortSelect").val();
		exboardList = excompare(exboardList,field,keyword);
		listTestConsolelog(exboardList);
		listPrint(exboardList);
	});
	

	
	// ============================
	//정렬 하기 2
	// ============================
	let excompare = function(list, field, type){
		//console.log(" field : "+field+" type : "+type);
		if(type == 'desc'){
			//console.log("내림!");
			list.sort((a,b) => {
				return a[field] > b[field] ? -1 : a[field] > b[field] ? 1 : 0;
			});
			return list;
		}else{
			//console.log("오름!");
			list.sort((a,b) => {
				return a[field] < b[field] ? -1 : a[field] > b[field] ? 1 : 0;
			});
			return list;
		}
	}

	// ============================
	//시험용 출력
	// ============================
	function listTestConsolelog(list,type){
		list.forEach((e, i)=>{
			//console.log(e['expertRequestMemNick']);	
		});
	}
	
	
	// ============================
	//검색 키보드 엔터
	// ============================
	function searchkey(){
		if(window.event.keyCode == 13) {
			//console.log("search 엔터 버튼 클릭");
			search($("#searchSelect").val(),$("#searchInput").val());
		}
		return false;
	};
	
	// ============================
	//검색 버튼
	// ============================
	$("#searchBtn22").click(e => {
		//console.log("검색");
		search($("#searchSelect").val(),$("#searchInput").val());
	});

	
	// ============================
	//검색 함수
	// ============================
	function search(keyword, inputval){
		//console.log("search 버튼 클릭");
		
		if(inputval == ""){
			//console.log("값 비어있음");
			exboardList = backupList;
			listPrint(exboardList);
		}else{
			//console.log("값 비어있지않음");
			exboardList = backupList;
			if (keyword == 'nic'){
				//console.log("닉");
				exboardList = findKeyword(exboardList,'expertRequestMemNick',inputval);
				listPrint(exboardList);
			}else if (keyword == 'date'){
				//console.log("날짜");
				exboardList = findKeyword(exboardList,'expertDateTmp',inputval);
				listPrint(exboardList);
			}else if (keyword == 'time'){
				//console.log("시간");
				exboardList = findKeyword(exboardList,'expertCounselTime',inputval);
				listPrint(exboardList);
			}
		}		
	}
	
	
	// ============================
	//검색검색!검색검색!검색검색!검색검색!
	// ============================
	function findKeyword(list, keyword,val){
		//console.log("keyword : "+keyword+" val : "+val);
		let tmpList = [];
		list.forEach((e,i) => {
			if(e[keyword].includes(val)){
				tmpList.push(e);				
			}
		});
		return tmpList;
	}
	
	$("#counselSelect").on('change', e => {
		let key = $(e.target).val();
		//console.log("counselSelect : "+key);
		exboardList = backupList;
		exboardList = findKeywordCounsel(exboardList, key);
		listPrint(exboardList);
	});
	
	function findKeywordCounsel(list, keyword){
		let tmpListCounsel = [];
		list.forEach((e,i) => {
			 if(keyword == 'req'){
					if(e['startCounsel'] == false && e['endCounsel'] == false){
						tmpListCounsel.push(e);
					}
			 }else if(keyword == 'on'){
				 if(e['startCounsel'] == true && e['endCounsel'] == false){
					 tmpListCounsel.push(e);
					}
				 
			 }else if(keyword == 'off'){
				 if(e['endCounsel'] == true){
					 tmpListCounsel.push(e);
				 }
			 }
		});
		return tmpListCounsel;
	}
	
	
	// ============================
	//부모창이 종료되면 자식창도 종료
	// ============================
	let pop;
	window.onunload = function() { 
		pop.close(); 
	}
	
	// ============================
	// 상담시작
	// ============================
	let bno = "";
	function counselStart(num,nick){
		//console.log("num : "+num);
		let result = confirm("해당 회원과 상담을 진행하시겠습니까?");
		if(result){
			  $.ajax({
			 	   type:"GET",
			 	   data:{
			 		   "no" : num,
			 		   "nic" : nick
			 	   },
			 	   url:"${path}/expert/selectExpertBno",
			 	   success:function (data){
			 		   //console.log("data : "+data);
			 		 bno = data;
			 		 //알람 발송 - 상담이 진행됬다는 알람 - 페이지가 넘어가기때문에 바로 변경해줄 사항 없음
			 		 sendAlarm("${loginMember.usid}",num,"expert",bno,"${loginMember.memNickname}");
			 		 //console.log("${loginMember.usid} "+"num : "+num+"bno : "+bno+" ${loginMember.memNickname}");
					location.replace('${path}/expert/counselStart?no='+num+"&nic="+nick+"&bno="+bno);
			 	   }
			    }); 
		}
	};
	
	
	// ============================
	//상담 재연결 -> 채팅방 입장 , 이미 방은 생성되있는 상태
	// ============================
	function counselConn(num,nick){
		//console.log("num : "+num);
		location.replace('${path}/expert/counselConn?no='+num+"&nick="+nick);
	}
	
	// ============================
	//회원 상세보기
	// ============================
	function exmemInfo(usid,musid){
		//console.log(usid, musid);
		 window.open("${path}/expert/memInfo?usid="+usid+"&musid="+musid,'회원','width=600, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=no');
	}
	
	</script>
</section>
