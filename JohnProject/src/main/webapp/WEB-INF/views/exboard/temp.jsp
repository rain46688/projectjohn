<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
#content {
	text-align: center;
	border-radius: 5px;
	margin: 10% atuo;
	height: auto;
	width: 50%;
	border-radius: 5px;
	height: auto;
	padding: 4em;
}

.noti {
	margin: 0px;
	height: 80px;
	/* display: none; */
	/* display: inline-block; */
	display: none;
}

.noContent {
	margin-top: 20px;
	margin-bottom: 15px;
	font-size: 15px;
	font-weight: bold;
	width: 100%;
}

.divCell, .divTableHead {
	border-bottom: 1px #DEE2E6 solid;
	display: table-cell;
	padding: 25px 10px;
	width: 16.67%;
	font-size: 15px;
}

.divListBody {
	display: table-row-group;
}

.divList {
	display: table;
	width: 100%;
	height: 80px;
	text-align: center;
}

.divRow {
	display: table-row;
}

.empty {
	margin-top: 20px;
	font-weight: bold;
	margin-top: 15px;
	width: 100%;
	font-size: 25px;
}

.nav-link {
	cursor: pointer
}
</style>
<br>
<br>
<section id="content" class="container">
	<div class="divList">
		<div class="divListBody">
			<br> <br>
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active">상담</a></li>
				<li class="nav-item"><a class="nav-link">게시판</a></li>
				<li class="nav-item"><a class="nav-link">신고</a></li>
				<li class="nav-item"><a class="nav-link">테스트</a></li>
			</ul>
	<!--  -->
			<div class="alarmPrintDiv">
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach items="${list }" var="n">

							<div class="divRow shadow p-3 mb-5 bg-white rounded" style="cursor: pointer">
								<input type="hidden" value="${n.alarmId}">
								<div class="divCell">
									"${n.alarmSendMemNickname}" 상담사님으로 부터 상담 요청이있습니다.<br> <small>${n.tmpDate }</small>
								</div>
							</div>
							<div class="noti">
								<div class="noContent">
									안녕하세요 상담사 ${n.alarmSendMemNickname}입니다.<br> 아래 URL로 바로 접속하셔서 상담 진행하시면됩니다.<br> <a
										href="${path }/expert/expertRoom?bno=${n.alarmMsgContent}">상담 링크 바로가기</a>
								</div>
							</div>

						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="empty">알람이 없습니다.</div>
					</c:otherwise>
				</c:choose>
			</div>
	<!--  -->

		</div>
	</div>
</section>

<script>

'use strict';

//위에 알람 메뉴 클릭시 ajax로 출력
$(".nav-link").click(e =>{
	
	let alli = $(e.target).parents().parents().children('li');
	let item;
	let alprint = "";
	//console.log(alli.length);
	for(let i=0; i < alli.length; i++){
		$(alli[i]).children().removeClass('active');
		
	};
	$(e.target).addClass('active');
	item = $(e.target).html();
	console.log("item : "+item);
	if(item === '상담'){
		item = 'expert';
		console.log("change : "+item);
	}else{
		//추가 예정
	}
	
	 $.ajax({
		type:'get',
		data:{'item':item,usid:"${loginMember.usid}"},
		dataType: "json",
		url:"${path}/alarm/selectAlarmItem",
		success:function(data){
			//console.log("data : "+data);
			if(data == ''){
				//console.log("빔");
				$(".alarmPrintDiv").html("");
				$(".alarmPrintDiv").html("<div class='empty'>알람이 없습니다.</div>");
			}else{
				//console.log("안빔");
				$.each(data, function(i, item){
					//console.log("i : "+i);
					//console.log("date : "+item["tmpDate"]);
					alprint += printalfunc(item["alarmId"],item["alarmSendMemNickname"],item["tmpDate"],item["alarmType"],item["alarmMsgContent"]);
				});
				$(".alarmPrintDiv").html("");
				$(".alarmPrintDiv").html(alprint);
				//ajax 후 함수 실행
				divhover();
			}
		}
	});
	 
	
});

//알람 프린트
function printalfunc(alid,sendnic,date,type,msg){
	let print="";
	
	if(type == 'expert'){
	print += "<div class='divRow shadow p-3 mb-5 bg-white rounded' style='cursor: pointer'>";
	print += "<input type='hidden' value='"+alid+"'>";
	print += "<div class='divCell'>"+sendnic+"상담사님으로 부터 상담 요청이있습니다.<br> <small>"+date+"</small></div></div>";
	print += "<div class='noti'><div class='noContent'>"
	print += "안녕하세요 상담사 "+sendnic+"입니다.<br> 아래 URL로 바로 접속하셔서 상담 진행하시면됩니다.<br>" 
	print += "<a href='${path }/expert/expertRoom?bno="+msg+"'>상담 링크 바로가기</a></div></div>"
	}else{
		//추가 예정
	}
	return print;
}


/*
//알람 누르면 읽은것으로 처리되게 만듬
$(".divRow").click(e=>{
 	 //$(e.target).parent().next().slideToggle('slow', function() {
    // });
  
   //$(this).removeClass( 'shadow p-3 mb-5 bg-white rounded' );
   
   const aid = $(e.target).parent().children('input:eq(0)').val();
  // console.log("누름"+aid);
   
    $.ajax({
	   type:"GET",
	   data:{
		   "aid":aid
	   },
	   url:"${path}/alarm/alarmRead",
	   success:function (data){
		   if(data == 1){
			   console.log("성공");
		   }
		   else{
			   console.log("실패");
		   }
	   }
   });
}); 
  */
  
  
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

	$(function(){
		$(".noti").slideToggle('fast', function() {
		     });
	})

//토글
function divhover(){
	$(".divRow").click(e=>{
		   $(e.target).parent().next().slideToggle('slow', function() {
		     });
		   $(this).removeClass( 'shadow p-3 mb-5 bg-white rounded' );
		});
		$('.divRow').hover(function() {
			//console.log("온");
			$(this).css('color', '#FFC107');
			$(this).removeClass('shadow p-3 mb-5 bg-white rounded');
		}, function() {
			//console.log("오프");
			$(this).css('color', 'black');
			$(this).addClass('shadow p-3 mb-5 bg-white rounded');
		});
};
divhover();



</script>