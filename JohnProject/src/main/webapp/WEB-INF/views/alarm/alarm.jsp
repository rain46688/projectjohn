<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
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

/* #alcontent {
	display:flex;
	align-items:center;
	justify-content:center;
	width:50%;
	height:auto;
	padding:2%;
	background-color:white;
	border-radius:1%;
} */

.divListBodyAl {
	display: table-row-group;
}

.divListAl {
	display: table;
	width: 100%;
	height: 30%;
	text-align: center;
}

.divRowAl {
	display: table-row;
}

.divCellAl, .divTableHeadAl {
	 border-bottom: 1px #DEE2E6 solid;
/* 	border-bottom: 1px #DEE2E6 solid;
	border-right: 1px #DEE2E6 solid;
	border-left: 1px #DEE2E6 solid; */
	display: table-cell;
	padding: 3%1%;
	width: 16.67%;
	font-size: 1.7vh;
	/* background-color:#FFEB00; */
}

.divListAl .nav{
	background-color: #003478;
	border-radius:10% 2% 2%;
}

.divListAl .nav-link {
	cursor: pointer;
	/* background-color: white; */
	color:white;
	font-weight:bold;
	text-decoration: none;
}

.active{
	color:black;
	font-weight:bold;
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
	height:auto;
}

.emptyAl {
	margin-top: 20px;
	font-weight: bold;
	margin-top: 15px;
	width: 100%;
	font-size: 25px;
	padding:5% 0 5% 0;
}

#sideDiv{
	float:right;
	padding:1%;
	cursor: pointer;
}

.form-check-label{
	cursor: pointer;
}

.date{
	text-align:right;
	font-size:1.5vh;
}

</style>
	<div class="divListAl">
		<div id="sideDiv">
		<label class="form-check-label">
    		<input id="check" type="checkbox" class="form-check-input" value="">모두 보기
  		</label>
		<img id="delete" src="${path}/resources/images/delete.png" alt="" width="30px" height="30px"></div>
		<div class="divListBodyAl">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active">상담</a></li>
				<li class="nav-item"><a class="nav-link">게시판</a></li>
				<li class="nav-item"><a class="nav-link">신고</a></li>
				<li class="nav-item"><a class="nav-link">테스트</a></li>
			</ul>
			<div class="alarmPrintDiv"></div>
		</div>
	</div>
<script>

'use strict';

 let newURL = window.location.pathname;
console.log(newURL); 
//			/john/alarm/alarmList
let alarmList = [];

//메뉴 클릭시 이벤트
$(".nav-link").click(e =>{
	let alli = $(e.target).parents().parents().children('li');
	let item;
	let alprint = "";
	for(let i=0; i < alli.length; i++){
		$(alli[i]).children().removeClass('active');
	};
	$(e.target).addClass('active');
	item = $(e.target).html();
	console.log("item : "+item);
	if(item === '상담'){
		item = 'expert';
		printalfunc(alarmList, item);
		console.log("change : "+item);
	}else if(item === '게시판'){
		item = ' ';
		printalfunc(alarmList, item);
		console.log("change : "+item);
	}else if(item === '신고'){
		item = ' ';
		printalfunc(alarmList, item);
		console.log("change : "+item);
	}
});


function selectliItem(){
	let allnav = $(".nav-link");
	for(let i=0; i < allnav.length; i++){
		if($(allnav[i]).hasClass('active')){
			sel = $(allnav[i]).html();
			console.log("선택된것 : "+sel);
		}
	};
	return sel;
}

function matchAtagHtml(item){
	if(item === '상담'){
		return 'expert'
	}else if(item === '게시판'){
		return ''
	}else if(item === '신고'){
		return ''
	}
}

$("#check").click(e => {
	console.log("선택");
	let selectedNav = selectliItem();
	printalfunc(alarmList,matchAtagHtml(selectedNav));
});

//알람 읽은것으로 처리
$("#delete").click(e=>{
	console.log("zz");
	let selectedNavDelete = selectliItem();
	let ataghtml = matchAtagHtml(selectedNavDelete);
	alarmList.forEach((e, i)=>{
			if(e['alarmType'].includes(type) && e['alarmIscheked'] == false){
								
			}
		)};
});


/* $('.nav-item').hover(function() {
	console.log("z")
	if(!$(this).children().hasClass('active')){
		$(this).children().css('color', '#FECC66');
	}
}, function() {
	console.log("z2")
	if(!$(this).children().hasClass('active')){
		$(this).children().css('color', 'white');
	}
});
 */

/* $(".form-check-input").click(e =>{
	console.log("체크 여부 : "+$("input:checkbox[name=checkbox]").is(":checked"));
}); */


//알람 프린트
function printalfunc(list, type){
	let print="";
	console.log("printalfunc 실행 리스트 길이 : "+list.length+" 타입 : "+type);

	let allselectflag = $("#check").is(":checked");
	console.log("체크 여부 : "+allselectflag);
	if(list.length > 0){
	list.forEach((e, i)=>{
		if(allselectflag == true){
			if(e['alarmType'].includes(type)){
				console.log("출력");
				/* shadow p-3 mb-5 bg-white rounded */
				print += "<div class='divRowAl' style='cursor: pointer'>";
				print += "<input type='hidden' value='"+e['alarmId']+"'>";
				print += "<div class='divCellAl'>1 : 1 영상 상담 요청이있습니다.<div class='date'>"+e['tmpDate']+"</div></div></div>";
				print += "<div class='al'><div class='alContent'>"
				print += "안녕하세요 상담사 "+e['alarmSendMemNickname']+"입니다.<br> 아래 URL로 바로 접속하셔서 상담 진행하시면됩니다.<br>" 
				print += "<a href='${path }/expert/expertRoom?bno="+e['alarmMsgContent']+"'>-클릭해서 상담 접속-</a></div></div>"
			}else{
				//추가 예정
				print = "<div class='emptyAl'>알림이 비어있습니다.</div>";
			}
		}else{
			if(e['alarmType'].includes(type) && e['alarmIscheked'] == false){
				console.log("출력");
				print += "<div class='divRowAl' style='cursor: pointer'>";
				print += "<input type='hidden' value='"+e['alarmId']+"'>";
				print += "<div class='divCellAl'>1 : 1 영상 상담 요청이있습니다.<div class='date'>"+e['tmpDate']+"</div></div></div>";
				print += "<div class='al'><div class='alContent'>"
				print += "안녕하세요 상담사 "+e['alarmSendMemNickname']+"입니다.<br> 아래 URL로 바로 접속하셔서 상담 진행하시면됩니다.<br>" 
				print += "<a href='${path }/expert/expertRoom?bno="+e['alarmMsgContent']+"'>-클릭해서 상담 접속-</a></div></div>"
			}else{
				//추가 예정
				print = "<div class='emptyAl'>알림이 비어있습니다.</div>";
			}
		}
	});
	}else{
		print = "<div class='emptyAl'>알람이 없습니다.</div>";
	}
	$(".alarmPrintDiv").html(print);
	//ajax 후 함수 실행
	divhover();
};

  
//알람 객체
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


//토글 박스 내려갔다 올라갔다하는것
$(function(){
	$(".al").slideToggle('fast', function() {
		  });
});

//리스트 뿌린후 한번 실행시켜줘야 호버 작동함!
function divhover(){
	$(".divRowAl").click(e=>{
		   $(e.target).parent().next().slideToggle('fast', function() {
		     });
		  // $(this).removeClass( 'shadow p-3 mb-5 bg-white rounded' );
		});
		$('.divRowAl').hover(function() {
			//console.log("온");
			$(this).css('color', '#FFC107');
			$(this).addClass('shadow p-3 mb-5 bg-white rounded');
			//$(this).removeClass('shadow p-3 mb-5 bg-white rounded');
		}, function() {
			//console.log("오프");
			$(this).css('color', 'black');
			//$(this).addClass('shadow p-3 mb-5 bg-white rounded');
			$(this).removeClass('shadow p-3 mb-5 bg-white rounded');
		});
};
divhover();

</script>