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

</style>

<section id="content">
<br>
	<h1>상담 신청 확인 게시판</h1>
	<hr/>
	<div id="middelDiv">
		<div id="searchDiv">
				<div id="innerSearchDiv">
				<select name="searchType" required>
						<option value=" "  selected>상담 신청자</option> 
						<option value="mem_name" <c:if test="${param.searchType eq 'mem_name'}">selected</c:if>>신청 날짜</option>
						<option value="mem_email" <c:if test="${param.searchType eq 'mem_email'}">selected</c:if>>원하는 상담 시간</option>
					</select>
					<img src="${path}/resources/images/search.png" alt="" width="30px" height="30px">
					<input type="text" name="searchKeyword" id="searchInput" onkeypress="searchkey();">
					<button class="btn btn-outline-success" onclick="exmemInfo(this.form);">검색</button>
				</div>
		</div>
		<div id="sortDiv">
					<select name="searchType" required>
						<option value=" "  selected>신청 날짜 순</option> 
						<option value="mem_name" <c:if test="${param.searchType eq 'mem_name'}">selected</c:if>>상담 시간순</option>
						<option value="mem_email" <c:if test="${param.searchType eq 'mem_email'}">selected</c:if>>신청자 이름순</option>
					</select>
				<select name="searchType" required>
						<option value=" "  selected>10개씩 보기</option> 
						<option value="mem_name" <c:if test="${param.searchType eq 'mem_name'}">selected</c:if>>20개씩 보기</option>
						<option value="mem_email" <c:if test="${param.searchType eq 'mem_email'}">selected</c:if>>50개씩 보기</option>
					</select>
		</div>
	</div>
		<hr/>
	<div class="divList">
		<div class="divListBody">

			<div class="divRowTitle ">
				<div class="divCell">상담 신청자</div>
				<div class="divCell">상담 신청 날짜</div>
					<div class="divCell">원하는 상담 시간</div>
				<div class="divCell">상담 시작</div>
				<div class="divCell">정보 보기</div>
			</div>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="n">
						<div class="divRow " >
							<div class="divCell">${n.expertRequestMemNick}</div>
							<div class="divCell">${n.expertDate}</div>
								<div class="divCell">${n.expertCounselTime}</div>
								<div class="divCell">
							<c:if test="${n.endCounsel != true }">
								<c:if test="${n.startCounsel == false }">
									<button class="btn btn-outline-success" onclick="counselStart('${n.expertRequestMemUsid}','${n.expertRequestMemNick}');">상담 시작</button>
								</c:if>
								<c:if test="${n.startCounsel == true }">
										<button class="btn btn-outline-success" onclick="counselConn('${n.expertRequestMemUsid}','${n.expertRequestMemNick}');">채팅 접속</button>
								</c:if>
							</c:if> 
						
							<c:if test="${n.endCounsel == true }">
									상담 완료
							</c:if>
								</div>
								<div class="divCell">
								<form  name="form" >				
									<input type="hidden" name="usid" value="${loginMember.usid}"> 
									<input type="hidden" name="musid" value="${n.expertRequestMemUsid}">
								<button class="btn btn-outline-success" onclick="exmemInfo(this.form);">회원 정보</button>
								</form>
								</div>
					
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
	
	
	function searchkey(){
		if(window.event.keyCode == 13) {
			search();
		}
		return false;
	}
	
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
	
	function counselConn(num,nick){
		console.log("num : "+num);
		location.replace('${path}/expert/counselConn?no='+num+"&nick="+nick);
	}
	
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
