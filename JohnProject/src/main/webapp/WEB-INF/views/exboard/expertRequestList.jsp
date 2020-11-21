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
			<select id="counselSelect" name="counselSelect" required>
						<option value="req"  selected>요청 상담</option> 
						<option value="on" >진행중 상담</option>
						<option value="off" >종료된 상담</option>
					</select>
					<select id="sortSelect" name="sortSelect" required>
						<option value="expertDate"  selected>신청 날짜 순</option> 
						<option value="expertCounselTime" >상담 시간순</option>
						<option value="expertRequestMemNick" >신청자 이름순</option>
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
	<br>
	<br>
	<br>
	<script>
	'use strict'
	
	const exlistconn = new WebSocket('wss://192.168.219.105${path}/exlistSocket');
	// 전체 배열
	let exboardList = [];
	// 백업용 배열
	let backupList = [];
	
	exlistconn.onopen = function() {
		console.log("onopen");
		//아무거나 보내서 식별함
		exListsendMessage("start");
		
		let newURL = window.location.pathname;
		console.log(newURL);
	}

	exlistconn.onmessage = function(msg) {
		console.log("onmessage");
		exboardList = JSON.parse(msg.data);
		backupList = JSON.parse(msg.data);
		setting();
	}
	
	function setting(){
		// 기본 속성으로 리스트 정렬
		search($("#searchSelect").val(),$("#searchInput").val());
		exboardList = excompare(exboardList, $("#sortSelect").val(),$("#sortType").val());
		// 뿌려줌
		listPrint(exboardList);
	}
	
	function exListsendMessage(message) {
		exlistconn.send(message);
		console.log("exListsendMessage");
	};
	
	//리스트 출력
	function listPrint(list){
		console.log("리스트 길이 : "+list.length);
		let pbhtml = "";
		let num = 3;
		if(list.length > 0){
			list.forEach((e, i)=>{
				if(i == 0){
					pbhtml += "<div class='divRowTitle '><div class='divCell'>상담 신청자</div><div class='divCell'>상담 신청 날짜</div><div class='divCell'>원하는 상담 시간</div><div class='divCell'>상담 시작</div><div class='divCell'>정보 보기</div></div>";
				}
				if(e['endCounsel'] != null){
					pbhtml +="<div class='divRow ' ><div class='divCell'>"+e['expertRequestMemNick']+"</div><div class='divCell'>"+e['expertDateTmp']+"</div><div class='divCell'>"+e['expertCounselTime']+"</div><div class='divCell'>";
					if(e['endCounsel'] == false){
							if(e['startCounsel']== false){
								//end start 둘다 false이면 요청 온 상태
								pbhtml += "<button class='btn btn-outline-success' onclick='counselStart(\""+e['expertRequestMemUsid']+"\",\""+e['expertRequestMemNick']+"\");'>상담 시작</button>";
							}else{
								//end false에서 start true면 진행중인 상태
								pbhtml += "<button class='btn btn-outline-danger' onclick='counselConn(\""+e['expertRequestMemUsid']+"\",\""+e['expertRequestMemNick']+"\");'>채팅 접속</button>";
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
		exboardList = excompare(exboardList, $("#sortSelect").val(),$("#sortType").val());
		listTestConsolelog(exboardList);
		listPrint(exboardList);
	});
	
	//정렬
	$("#sortType").on('change', e => {
		let keyword = $(e.target).val();
		console.log("type : "+keyword);
		let field = $("#sortSelect").val();
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
	
	$("#counselSelect").on('change', e => {
		let key = $(e.target).val();
		console.log("counselSelect : "+key);
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
	
	//부모창이 종료되면 자식창도 종료
	let pop;
	window.onunload = function() { 
		pop.close(); 
	}
	
	// 상담 시작
	let bno = "";
	function counselStart(num,nick){
		console.log("num : "+num);
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
			 		   console.log("data : "+data);
			 		 bno = data;
			 		 //알람 발송 - 상담이 진행됬다는 알람 - 페이지가 넘어가기때문에 바로 변경해줄 사항 없음
			 		 sendAlarm("${loginMember.usid}",num,"expert",bno,"${loginMember.memNickname}");
			 		 console.log("bno : "+bno);
					location.replace('${path}/expert/counselStart?no='+num+"&nic="+nick+"&bno="+bno);
			 	   }
			    }); 
		}
	};
	
	//상담 재연결 -> 채팅방 입장 , 이미 방은 생성되있는 상태
	function counselConn(num,nick){
		console.log("num : "+num);
		location.replace('${path}/expert/counselConn?no='+num+"&nick="+nick);
	}
	
	//회원 상세보기
	function exmemInfo(f){
			const x = 600;
			const y = 800;
			const cx = (window.screen.width / 2) - (x / 2);
			const cy= (window.screen.height / 2) - (y / 2);

			const url    ="${path}/expert/memInfo";
			const title  = "chat";
			const status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width="+x+", height="+y+", top="+cy+",left="+cx;
			pop =  window.open("", title,status);
			f.target = title;
			f.action = url;
			f.method = "post";
			f.submit();    
	}
	
	</script>
</section>
