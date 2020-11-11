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
	margin-left: 150%;
	width: 100%;
	font-size: 15px;
}

#container {
	margin-left: auto;
	margin-right: auto;
}
</style>

<section id="content">

	<div class="divList">
		<div class="divListBody">

			<div class="divRowTitle shadow p-3 mb-5 bg-white rounded">
				<div class="divCell">상담 신청자</div>
				<div class="divCell">상담 신청 날짜</div>
					<div class="divCell">startCounsel</div>
								<div class="divCell">endCounsel</div>
				<div class="divCell">상담 시작</div>
				<div class="divCell">정보 보기</div>
			</div>


			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="n">
						<div class="divRow shadow p-3 mb-5 bg-white rounded" ><!-- style="cursor: pointer"  -->
							<div class="divCell">${n.EXPERT_REQUEST_MEM_NICK}</div>
							<div class="divCell">${n.EXPERT_DATE}</div>
								<div class="divCell">${n.startCounsel}</div>
									<div class="divCell">${n.endCounsel}</div>
								<div class="divCell">
								
							<c:if test="${n.endCounsel != true }">
								
							<c:if test="${n.startCounsel == false }">
								<button class="btn btn-outline-success" onclick="counselStart('${n.EXPERT_REQUEST_MEM_USID}','${n.EXPERT_REQUEST_MEM_NICK}');">상담 시작</button>
							</c:if>
							<c:if test="${n.startCounsel == true }">
									<button class="btn btn-outline-success" onclick="counselConn('${n.EXPERT_REQUEST_MEM_USID}');">채팅 접속</button>
							</c:if>
						</c:if>
							<c:if test="${n.endCounsel == true }">
									상담 완료
									<!-- <div class="divCell"><button class="btn btn-outline-success" onclick="">상담 완료</button></div> -->
							</c:if>
								</div>
							<div class="divCell"><button class="btn btn-outline-success" onclick="">회원 정보</button></div>
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
	
	function counselStart(num,nick){
		console.log("num : "+num);
		let result = confirm("해당 회원과 상담을 진행하시겠습니까?");
		if(result){
				location.replace('${path}/counselStart?no='+num+"&nic="+nick);
		}
	}
	
	function counselConn(num){
		console.log("num : "+num);
		location.replace('${path}/counselConn?no='+num);
	}
	
	
	</script>

</section>
