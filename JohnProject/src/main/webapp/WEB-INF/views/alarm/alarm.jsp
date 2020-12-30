<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
}

/* 배경 색깔 header.jsp에 있음 */
#alarmDropdownDiv{
 	background-color: #062449;
}

/* 리스트 div */
.divListAl {
	display: table;
	width: 100%;
	height: 30%;
	text-align: center;
	background-color: white;
	border: 10px solid #FFCC66;
}

/* div 리스트에 관한 css */
.divListBodyAl {
	display: table-row-group;
}

.divRowAl {
	display: table-row;
}

.divCellAl, .divTableHeadAl {
	border-bottom: 1px #DEE2E6 solid;
	display: table-cell;
	padding: 3% 1%;
	width: 16.67%;
	font-size: 1.7vh;

}

.divListAl .nav {
	background-color: #003478;
}

.divListAl .nav-link {
	cursor: pointer;
	color: white;
	font-weight: bold;
	text-decoration: none;

}

.active {
	color: black;
	font-weight: bold;
}

.al {
	margin: 0px;
	height: 30%;
	display: none;
}

.alContent {
	margin-top: 20px;
	margin-bottom: 15px;
	font-size: 15px;
	font-weight: bold;
	width: 100%;
	height: auto;
}

/* 알람 비어있는 경우 */
.emptyAl {
	margin-top: 20px;
	font-weight: bold;
	margin-top: 15px;
	width: 100%;
	font-size: 25px;
	padding: 5% 0 5% 0;
	height:200px;
	color:#585858;
}

/* 맨위 휴지통이랑 모두 보기 체크 부분 */
#sideDiv {
	float: right;
	padding: 1%;
	cursor: pointer;
}

.form-check-label {
	cursor: pointer;
}

.date {
	text-align: right;
	font-size: 1.5vh;
}

/* 읽은 알람 표시 색 변경 */
.fontgray {
	color: gray;
}

</style>
<div class="divListAl">
	<div id="sideDiv">
		<label class="form-check-label"> <input id="check" type="checkbox" class="form-check-input" value="">모두 보기
		</label> <img id="delete" src="${path}/resources/images/delete.png" alt="" width="30px" height="30px">
	</div>
	<div class="divListBodyAl">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active">상담</a></li>
			<!-- <li class="nav-item"><a class="nav-link">게시판</a></li> -->
			<!-- <li class="nav-item"><a class="nav-link">신고</a></li> -->
			<!-- <li class="nav-item"><a class="nav-link">테스트</a></li> -->
		</ul>
		<div class="alarmPrintDiv"></div>
	</div>
</div>
<script>

'use strict';

 let newURL = window.location.pathname;
//console.log(newURL); 
//			/john/alarm/alarmList
let alarmList = [];

// ============================
//메뉴 클릭시 이벤트
// ============================
$(".nav-link").click(e =>{
	let alli = $(e.target).parents().parents().children('li');
	let item;
	let alprint = "";
	for(let i=0; i < alli.length; i++){
		$(alli[i]).children().removeClass('active');
	};
	$(e.target).addClass('active');
	item = $(e.target).html();
	////console.log("item : "+item);
	if(item === '상담'){
		item = 'expert';
		printalfunc(alarmList, item);
		////console.log("change : "+item);
	}else if(item === '게시판'){
		item = 'board';
		printalfunc(alarmList, item);
		////console.log("change : "+item);
	}else if(item === '신고'){
		item = 'report';
		printalfunc(alarmList, item);
		////console.log("change : "+item);
	}
	//나중에 추가?
});
 
// ============================
//디비 content에 맞게 변경
// ============================
function matchAtagHtml(){
	let item;
	let allnav = $(".nav-link");
	for(let i=0; i < allnav.length; i++){
		if($(allnav[i]).hasClass('active')){
			item = $(allnav[i]).html();
			//console.log("선택된것 : "+item);
		}
	};
	if(item === '상담'){
		return 'expert';
	}else if(item === '게시판'){
		return 'board';
	}else if(item === '신고'){
		return 'report';
	}
	//나중에 추가?
}

$("#check").click(e => {
	//console.log("선택");
	printalfunc(alarmList,matchAtagHtml());
});

// ============================
//알람 읽은것으로 처리
// ============================
$("#delete").click(e=>{
	
	var result = confirm("현재 탭의 알람을 읽음 처리하시겠습니까?");
	if(result){
	
	//console.log("del");
	let readList = [];
	let ataghtml = matchAtagHtml();
	alarmList.forEach((e, i)=>{
			if(e['alarmType'].includes(ataghtml) && e['alarmIscheked'] == false){
								//console.log(e['alarmId']);
								readList.push(e);
			}
	});
	if(readList.length == 0){
		//console.log("읽음 처리할 알람 없음");
	}
	alsocket.send(JSON.stringify(readList));
	alsocket.send('list');
	}
	
});

//============================
// 종 모양 출력 ! 넣어주기
//============================
function printBell(list){
	//console.log("printBell 알람.jsp");
	$("#number").html("");
	let count = 0;
	//console.log(" ================ ")
	list.forEach((e, i)=>{
		if(e['alarmType'] != 'expertApplyCancel' && e['alarmIscheked'] == false){//안 읽은 알람을 탐색해서 카운트를 증가시킴
			count++;
		}
	});
	//console.log("카운트 : "+count);
	if(count > 0){
		//체크가 안된 알람이 1개 이상 있다는것
		$("#number").html("<div id='al'>!</div>");
	}
}

// ============================
//알람 프린트
// ============================
function printalfunc(list, type){
	let print="";
	//console.log("printalfunc 실행 리스트 길이 : "+list.length+" 타입 : "+type);
	let allselectflag = $("#check").is(":checked");
	////console.log("체크 여부 : "+allselectflag);
	if(list.length > 0){
	list.forEach((e, i)=>{
		////console.log(e['alarmType']+" : "+e['alarmType'].includes(type));
		if(allselectflag == true && e['alarmType'].includes(type)){
			//모두 보기가 체크된 경우
			print += typeifprint(e,e['alarmType']);
		}else if(e['alarmType'].includes(type) && e['alarmIscheked'] == false){
				//모두보기가 체크 안된경우, 알람 체크가 0인것만 보여주기
			print += typeifprint(e,e['alarmType']);
			}
	//forEach 끝
	});
	//console.log("반복 끝");
	if(print == ''){
		//console.log("빔1")
		print = "<div class='emptyAl'><div><img id='nome' src='${path}/resources/images/nome.png' alt='' width='100px' height='100px'></div>알람 메세지가 없습니다.</div>";
	}
	//리스트 0개 아닐때
	}else{
		//console.log("빔2");
		print = "<div class='emptyAl'><div><img id='nome' src='${path}/resources/images/nome.png' alt='' width='100px' height='100px'></div>알람 메세지가 없습니다!!</div>";
	}
	//console.log("html 프린트");
	$(".alarmPrintDiv").html(print);
	//ajax 후 호버 함수 실행 / 안하면 호버 적용안됨!
	divhover();
};

// ============================
//출력관련 로직 함수로 정의함
// ============================
function typeifprint(e,type){
	let print2="";
	if(type == 'expert'){
		//console.log("ex");
		let extitle = "1 : 1 영상 상담 요청이있습니다.";
		let excontent= "안녕하세요 상담사 "+e['alarmSendMemNickname']+"입니다.<br> 아래 링크로 바로 접속하셔서 상담 진행하시면됩니다.<br><a href='${path }/expert/expertRoom?bno="+e['alarmMsgContent']+"'>-클릭해서 상담 접속-</a>";
		print2 += printAlarmBoardContent(e,extitle,excontent);
	}else if(type == 'expertend'){
		//console.log("exe");
		let extitle = "후기를 작성해주세요 완료된 상담이 있습니다.";
		let excontent="안녕하세요 존경장님 상담은 만족스러우신가요? <br>더 나은 서비스에 대해 상담 결과에 대해 <br>아래 링크로 바로 접속하셔서 후기를 <br>작성해주시면 감사하겠습니다.<br>";
		excontent += "<a style='cursor:pointer;' onclick='writereview("+e['alarmMsgContent']+");'>-클릭해서 후기 작성-</a>";
		print2 += printAlarmBoardContent(e,extitle,excontent);
	}else if(type == 'expertApply'){
		//console.log("exe");
		let extitle = e['alarmSendMemNickname']+"님이 상담 신청하셨습니다.";
		let excontent="안녕하세요 상담사님 아래 링크로 접속해서 내역을 확인해주세요<br><a href='${path }/member/myPage/expertRequestPrintList?usid=${loginMember.usid}'>-클릭해서 확인-</a>";
		print2 += printAlarmBoardContent(e,extitle,excontent);
	}else if(type == 'board'){
		//console.log("bo");
		let extitle = "TEST용 게시글 알람 사용자한테 보여질 제목입니다.";
		let excontent = "TEST용 게시글 알람 사용자한테 보여질 내용입니다.";
		print2 += printAlarmBoardContent(e,extitle,excontent);
	}else if(type == 'report'){
		//console.log("re");
		let extitle = "TEST용 신고 알람 사용자한테 보여질 제목입니다.";
		let excontent = "TEST용 신고 알람 사용자한테 보여질 내용입니다.";
		print2 += printAlarmBoardContent(e,extitle,excontent);
	}else if(type == 'test'){
		//나중에 추가?
	}
	return print2;
}

// ============================
//알람 제목 컨텐츠 작성 후 출력 메소드
// ============================
function printAlarmBoardContent(e, title, content){
	let print ="";
	print += "<div class='divRowAl' style='cursor: pointer'>";
	print += "<input type='hidden' value='"+e['alarmId']+"'>";
	if(e['alarmIscheked'] == false){
		print += "<div class='divCellAl'>"+title+"<div class='date'>"+e['alarmDate']+"</div></div></div>";
	}else{
		print += "<div class='divCellAl fontgray'>"+title+"<div class='date'>"+e['alarmDate']+"</div></div></div>";
	}
		print += "<div class='al'><div class='alContent'>"+content+"</div></div>";
		return print;
}

// ============================
//상담 리뷰 작성
// ============================

function writereview(bno){
	//console.log("bno : "+bno);
	window.open("","popForm","width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=no");
	let forms = document.createElement("form");
	forms.setAttribute("charset","UTF-8");
	forms.setAttribute("method","post");
	forms.setAttribute("action","${path}/expert/expertReviewWrite");
	let hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","bno");
	hiddenField.setAttribute("value",bno);
	forms.appendChild(hiddenField);
	document.body.appendChild(forms);
	forms.target = "popForm";
	forms.submit();
}

// ============================
//알람 객체
// ============================

function Alarm(alarmId,alarmSendMemUsid, alarmReceiveMemUsid,
		alarmType, alarmMsgContent,
		alarmSendMemNickname, tmpDate,
		alarmIscheked) {
	this.alarmId = alarmId;
	this.alarmSendMemUsid = alarmSendMemUsid;
	this.alarmReceiveMemUsid = alarmReceiveMemUsid;
	this.alarmType = alarmType;
	this.alarmMsgContent = alarmMsgContent;
	this.alarmSendMemNickname = alarmSendMemNickname;
	this.tmpDate = tmpDate;
	this.alarmIscheked = alarmIscheked;
};

// ============================
//토글 박스 내려갔다 올라갔다하는것
// ============================
$(function(){
	$(".al").slideToggle('fast', function() {
		  });
});

// ============================
//리스트 뿌린후 한번 실행시켜줘야 호버 작동함!
// ============================
function divhover(){
	$(".divRowAl").click(e=>{
		   $(e.target).parent().next().slideToggle('fast', function() {
		     });
		});
		$('.divRowAl').hover(function() {
			$(this).css('color', '#FFC107');
			$(this).addClass('shadow p-3 mb-5 bg-white rounded');
		}, function() {
			$(this).css('color', 'black');
			$(this).removeClass('shadow p-3 mb-5 bg-white rounded');
		});
};
divhover();

</script>