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
#writecontainer {
	text-align: center;
	border-radius: 5px;
	margin: 5% atuo;
	height: auto;
	width: 100%;
	border-radius: 5px;
	height: auto;
}

.divList {
	display: table;
	width: 100%;
	height: 150px;
	text-align: center;
}

.divRow {
	display: table-row;
}

.divRowTitle {
	display: table-row;
	font-size: 15px;
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px #BFBFBF;
	width: 100%;
}

h2 {
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px #BFBFBF;
	margin: 15px 0 10px 0;
}

.active {
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px #BFBFBF;
}

.divCell {
	border-bottom: 1px #DEE2E6 solid;
	display: table-cell;
	padding: 25px 10px;
	width: 16.67%;
	font-size: 15px;
}

.divListBody {
	display: table-row-group;
}

#n_btn {
	float: right;
	margin: 0 10px 10px 0;
}

.noti {
	width: 133%;
	margin: 0px;
	height: 200px;
	display: inline-block;
}

.noContent {
	margin-top: 20px;
	margin-bottom: 15px;
	margin-left: 100%;
	font-size: 15px;
	font-weight: bold;
	width: 100%;
}

.empty {
	margin-top: 20px;
	font-weight: bold;
	margin-top: 15px;
	margin-left: 200%;
	width: 100%;
	font-size: 15px;
}

#container {
	margin-left: auto;
	margin-right: auto;
}
</style>

<section id="content">
<br>
	<p>임시 테스트용 사이트</p>
	<div class="divList">
		<div class="divListBody">

			<div class="divRowTitle shadow p-3 mb-5 bg-white rounded">
				<div class="divCell">상담 신청자</div>
				<div class="divCell">상담 신청 날짜</div>
					<div class="divCell">원하는 상담 시간</div>
				<div class="divCell">상담 시작</div>
				<div class="divCell">정보 보기</div>
			</div>


			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="n">
						<div class="divRow shadow p-3 mb-5 bg-white rounded" ><!-- style="cursor: pointer"  -->
							<div class="divCell">${n.expertRequestMemNick}</div>
							<div class="divCell">${n.expertDate}</div>
								<div class="divCell">${n.expertCounselTime}</div>
								<div class="divCell">
								
							<c:if test="${n.endCounsel != true }">
								
							<c:if test="${n.startCounsel == false }">
								<button class="btn btn-outline-success" onclick="counselStart('${n.expertRequestMemUsid}','${n.expertRequestMemNick}');">상담 시작</button>
							</c:if>
							<c:if test="${n.startCounsel == true }">
									<button class="btn btn-outline-success" onclick="counselConn('${n.expertRequestMemUsid}');">채팅 접속</button>
							</c:if>
						</c:if> 
							<c:if test="${n.endCounsel == true }">
									상담 완료
									<!-- <div class="divCell"><button class="btn btn-outline-success" onclick="">상담 완료</button></div> -->
							</c:if>
								</div>
					<form  name="form">				
						<input type="hidden" name="no" value="${n.expertRequestMemUsid}"> 
						<input type="hidden" name="nic" value="${n.expertRequestMemNick}">
						<div class="divCell"><button class="btn btn-outline-success" onclick="exmemInfo(this.form);">회원 정보</button></div>
					</form>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="empty">상담 신청이 없습니다.</div>
				</c:otherwise>
			</c:choose>
			<br>
		</div>
	</div>
	
	<script>
	
	//부모창이 종료되면 자식창도 종료
	let pop;
	window.onunload = function() { 
		pop.close(); 
	  
	}
	
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
	
	function counselConn(num){
		console.log("num : "+num);
		location.replace('${path}/counselConn?no='+num);
	}
	
	function exmemInfo(f){
			const x = 600;
			const y = 800;
			const cx = (window.screen.width / 2) - (x / 2);
			const cy= (window.screen.height / 2) - (y / 2);

			const url    ="${path}/expert/exmemInfo";
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
