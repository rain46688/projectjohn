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
	height: 50px;
	display: inline-block;
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
</style>
<section id="content" class="container">
	<div class="divList">
		<div class="divListBody">
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="n">
						<div class="divRow shadow p-3 mb-5 bg-white rounded" style="cursor: pointer">
							<%-- <div class="divCell">${n.ALARM_ID} 번호</div> --%>
							<input type="hidden" value="${n.ALARM_ID}">
							<div class="divCell">${n.ALARM_SEND_MEM_USID}님께서보낸 메세지</div>
						</div>
						<div class="noti">
							<div class="noContent">내용 : ${n.ALARM_MSG_CONTENT}</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="empty">알람이 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</section>

<script>

'use strict';

$(function(){
	$(".noti").slideToggle('fast', function() {
	     });
})
	
$(".divRow").click(e=>{
   $(e.target).parent().next().slideToggle('slow', function() {
     });
   $(this).removeClass( 'shadow p-3 mb-5 bg-white rounded' );
   const aid = $(e.target).parent().children('input:eq(0)').val();
   console.log("누름"+aid);
    $.ajax({
	   type:"GET",
	   data:{
		   "aid":aid
	   },
	   url:"${path}/alarmRead",
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

	$('.divRow').hover(function() {
		$(this).css('color', '#FFC107');
		$(this).removeClass('shadow p-3 mb-5 bg-white rounded');
	}, function() {
		$(this).css('color', 'black');
		$(this).addClass('shadow p-3 mb-5 bg-white rounded');
	});
</script>