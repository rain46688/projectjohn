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
	
	//시작시 온로드로 페이지바랑 리스트를 프린트 해옴
	$(function(){
		pageBar();
		listPrint($("#sortSelect").val(),$("#pageSelect").val(),$("#searchSelect").val(),$("#searchInput").val(),$("#cPageInput").val());
	});
	
	// 액션 취할시 리스트 가져옴
	$("#sortSelect").on('change', e => {
		console.log("sort : "+$(e.target).val());
		listPrint($(e.target).val(),$("#pageSelect").val(),$("#searchSelect").val(),$("#searchInput").val(),$("#cPageInput").val());
	});
	
	$("#searchSelect").on('change', e => {
		console.log("search : "+$(e.target).val());
		listPrint($("#sortSelect").val(),$("#pageSelect").val(),$(e.target).val(),$("#searchInput").val(),$("#cPageInput").val());
	});
	
	$("#pageSelect").on('change', e => {
		console.log("page : "+$(e.target).val());
		listPrint($("#sortSelect").val(),$(e.target).val(),$("#searchSelect").val(),$("#searchInput").val(),$("#cPageInput").val());
	});
	
	function cpaging(e){
		console.log($(e.target).html());
		$("#cPageInput").val($(e.target).html());
		pageBar();
		listPrint($(e.target).val(),$("#pageSelect").val(),$("#searchSelect").val(),$("#searchInput").val(),$("#cPageInput").val());
	}
	
	//페이지 바 클릭
	function barClick(n){
		console.log(n);
	}
	
	//리스트 프린트
	function listPrint(sort, page, searchType, searchInput, cpage){
		console.log(sort+" "+page+" "+searchType+" "+searchInput+" "+cpage);
		let pbhtml = "";
		   $.ajax({
		 	   type:"GET",
		 	   data:{
		 		 	  "sort" : sort,
		 		 	  "page" : page,
		 			  "searchType" : searchType,
		 			 "searchInput" : searchInput,
		 			 "cpage" : cpage
		 	   },
		 	   dataType : "json",
		 	   url:"${path}/expert/selectExpertListAjax",
		 	   success:function (data){
		 		   console.log("data : "+data);
		 		   
		 		   if(data != ""){
		 			$.each(data, function(i, item) {
		 				console.log("i : "+i+" data : "+data.length);
						console.log("endCounsel : " + item['endCounsel']);
							pbhtml += printBoard(item['expertDateTmp'],item['expertCounselTime'],item['startCounsel'],item['endCounsel'],item['expertRequestMemUsid'],item['expertRequestMemNick'],i, data.length);
						$(".divListBody").html(pbhtml);
		 			});
		 		}else{
					console.log("빈값");
					pbhtml = "<div class='divRow ' ><div class='divCell'><div class='empty'>상담 신청이 없습니다.</div></div></div>";
					pageBar();
					$(".divListBody").html(pbhtml);
				}
		 			
		 	   }
		    }); 
	};
	
	//페이지바 프린트
	function pageBar(){
		let totalData = "${totalData}";
		let cPage = $("#cPageInput").val();
		let pageNo = (cPage - ((cPage - 1)%5));
		let numPerPage = $("#pageSelect").val();
		let pageEnd = Math.ceil(totalData/numPerPage);
		console.log("토탈 : "+totalData+" cPage : "+cPage+" pageNo : "+pageNo+" pageEnd : "+pageEnd+" numPerPage : "+numPerPage);
		
		let ph = "<br><nav aria-lable='Page navigation' id='pagebar'><ul class='pagination justify-content-center'>";
		if(pageNo > 1){
			ph+="<li class='page-item'><a class='page-link' tabindex='-1' onclick='barClick(1);' aria-disabled='true'>이전</a></li>";
		}else if(pageNo <= 1){
			ph += "<li class='page-item disabled'><a class='page-link' tabindex='-1' aria-disabled='true'>이전</a></li>";
		}
		
		for(let i = 0; i < (numPerPage - 1); i++){
			if(pageNo + i == cPage){
				ph += "<li class='page-item disabled'><a class='page-link' style='cursor:pointer;'>"+(pageNo + i) +"</a></li>";
			}else if((pageNo + i) <= pageEnd){	
				ph += "<li class='page-item'><a class='page-link' style='cursor:pointer;' onclick='cpaging(event);'>"+(pageNo + i) +"</a></li>";
			}
		}
		
		if(pageNo < (pageEnd - 4)){
			ph += "<li class='page-item'><a class='page-link' onclick='barClick(2);' tabindex='-1' aria-disabled='true'>다음</a></li>";
		}else if(pageNo >= (pageEnd - 4)){
			ph += "<li class='page-item disabled'><a class='page-link' tabindex='-1' aria-disabled='true'>다음</a></li>";
		}
		ph += "</ul></nav>";
		$("#pagingDiv").html(ph);
}
	
	//리스트 출력하기
	function printBoard(date, time, start, end, rememusid, rememnick,i, max){
		console.log("end : "+end+" start : "+start);
		let pb = "";
		if(i == 0){
			pb += "<div class='divRowTitle '><div class='divCell'>상담 신청자</div><div class='divCell'>상담 신청 날짜</div><div class='divCell'>원하는 상담 시간</div><div class='divCell'>상담 시작</div><div class='divCell'>정보 보기</div></div>"; 
		}
		if(end != null){
			pb +="<div class='divRow ' ><div class='divCell'>"+rememnick+"</div><div class='divCell'>"+date+"</div><div class='divCell'>"+time+"</div><div class='divCell'>";
			if(end == false){
					if(start== false){
						pb += "<button class='btn btn-outline-success' onclick='counselStart('"+rememusid+"','"+rememnick+"');'>상담 시작</button>";
					}else{
						pb += "<button class='btn btn-outline-success' onclick='counselConn('"+rememusid+"','"+rememnick+"');'>채팅 접속</button>";
					}
			}else{
				pb +="상담 완료";
			}
				pb += "</div><div class='divCell'><form  name='form' ><input type='hidden' name='usid' value='${loginMember.usid}'><input type='hidden' name='musid' value='"+rememusid+"'><button class='btn btn-outline-success' onclick='exmemInfo(this.form);'>회원 정보</button></form></div></div>";
		}
		pageBar();
		return pb;
	}
	
	//검색 키보드
	function searchkey(){
		if(window.event.keyCode == 13) {
			console.log("search 엔터 버튼 클릭");
			search();
		}
		return false;
	}

	//검색 함수
	function search(){
		console.log("search 버튼 클릭");
		listPrint($("#sortSelect").val(),$("#pageSelect").val(),$("#searchSelect").val(),$("#searchInput").val(),$("#cPageInput").val());
		printBoard();
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
			 		 
			 		sendAlarm("${loginMember.usid}",num,"expert",bno,"${loginMember.memNickname}");
			 		
			 		 console.log("bno : "+bno);
					location.replace('${path}/expert/counselStart?no='+num+"&nic="+nick+"&bno="+bno);
			 	   }
			    }); 
		}
	}
	
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
