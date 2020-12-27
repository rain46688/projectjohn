<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value=" "/>
	
</jsp:include>
	
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');

 div#board-container{
 	margin: 0 auto;
    margin-top: 2em;
    padding: 1em;
    width: 70%;
    align-items: center;
    margin-bottom: 3em;
    border-radius: 1em;
    overflow: auto;
    background-color:#ffcc66;
    font-family: 'Noto Serif KR', serif;
 }
 div#board-container input,div#board-container button{
 margin-bottom:15px;
 }
 div#board-container label.custom-file-label{
 text-align:left;
 }
  .marginTop0{/*신고상세내역 제목*/
	width:50%;
	float:left;
}
 .marginTop2{ /*신고게시글번호*/
	float: right;
	width:10%;
	text-align:right;
	display: inline;
}
 .marginTop1{/*불러오는값들 하나하나*/
	margin-top: 0.5em;
	margin-bottom:0.5em;
	margin-left:1%;
	width:48%;
	font-size:20px;
	color:black;
/* 	background-color:#003478; */
	border-radius:20px;
	padding:1%;
}

.marginTop3{ /*불러오는내역 전체*/
	border:2px solid ;
	border-radius:20px;
	margin-top:3%;

}

.marginTop31{
	border:2px solid ;
	border-radius:20px;
	margin-top:3%;
	background-color:white;
	padding: 5%;

}

.marginTop4{ /*신고내용:*/
	margin-top:3%;
	font-size:20px;
	color:black;
	padding:1%;
}

.marginTop5{/*신고내역area*/
	margin-top:3%;
}

.marginTop6{
	margin-top: 0.5em;
	margin-bottom:0.5em;
	margin-left:0%;
	width:100%;
	font-size:20px;
	color:white;
 	background-color:#003478; 
	border-radius:20px;
	padding:1%;
}



.accordion .accordion-item {
  border-bottom: 1px solid white;
  border-radius:20px;
  width:100%;
}

.accordion .accordion-item button[aria-expanded='true'] {
  border-bottom: 1px solid white;
border-radius:20px;
}

.accordion button {
  position: relative;
  display: block;
  text-align: left;
  width: 100%;
  padding: 1em 1em;
  color: white;
  font-size: 1.15rem;
  font-weight: 400;
  border: none;
  background-color:#003478 ;
  outline: none;
  border-radius:20px;
}

.accordion button:hover, .accordion button:focus {
  cursor: pointer;
  color: white;
}

.accordion button:hover::after, .accordion button:focus::after {
  cursor: pointer;
  color: white;
  border: 1px solid white;
}

.accordion button .accordion-title {
  padding: 1em 1.5em 1em 0;
}

.accordion button .icon {
  display: inline-block;
  position: absolute;
  top: 18px;
  right: 0;
  width: 22px;
  height: 22px;
  border: 1px solid;
  border-radius: 22px;
  padding-right:1em;
  margin-right:1em;
}

.accordion button .icon::before {
  display: block;
  position: absolute;
  content: '';
  top: 9px;
  left: 5px;
  width: 10px;
  height: 2px;
  background: currentColor;

}

.accordion button .icon::after {
  display: block;
  position: absolute;
  content: '';
  top: 5px;
  left: 9px;
  width: 2px;
  height: 10px;
  background: currentColor;
}

.accordion button[aria-expanded='true'] {
  color: white;
  font-weight:1000;
  
}

.accordion button[aria-expanded='true'] .icon::after {
  width: 0;
}

.accordion button[aria-expanded='true'] + .accordion-content {
  opacity: 1;
  max-height: 9em;
  -webkit-transition: all 200ms linear;
  transition: all 200ms linear;
  will-change: opacity, max-height;
}

.accordion .accordion-content {
  opacity: 0;
  max-height: 0;
  overflow: hidden;
  -webkit-transition: opacity 200ms linear, max-height 200ms linear;
  transition: opacity 200ms linear, max-height 200ms linear;
  will-change: opacity, max-height;
}

.accordion .accordion-content p {
  font-size: 1rem;
  font-weight: 300;
  margin: 2em 0;
}


#btnDiv{
	text-align:center;
}

#bbtn{
	margin-top:3%;
	border-color: #ffcc66;
    color: white; 
    background-color: #003478;
	
}

#bbtn:hover,
#bbtn:focus {
    background-color: #ffcc66;
    border-color: #003478;
    color: #003478; 

}

.marginTop7{
	margin-top: 0.5em;
	margin-bottom:0.5em;
	margin-left:1%;
	margin-right:1%;
	width:98%;
	font-size:20px;
	color:white;
 	/* background-color:#003478;  */
	border-radius:20px;
	padding:1%;
}


</style>
    
	<section id="content">
		<div id="board-container">
		<div class="input-group marginTop0">
		<h4><img src="${path }/resources/images/admin/siren.png" width="30px" height="27px">&nbsp;신고상세내역</h4>
		</div>
		<div class="input-group marginTop2">
		[<c:out value="${report.reportId }"/>]&nbsp;
		</div>
			<br>
			<hr color="black">
		
		<%-- 신고접수회원번호<input type="text" class="form-control" name="reportWriterUsid" value="${report.reportWriterUsid }" readonly required> --%>
        <%-- 신고대상회원<input type="text" class="form-control" name="reportTargetUsid" id="reportTargetUsid" value="${report.reportTargetUsid}" >  --%>
       	<div class="input-group marginTop3">
	       	<div class="input-group marginTop1">
	       	<img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;신고유형&nbsp;:&nbsp;<c:out value="${report.reportType}"/>
	       	</div>
	        <div class="input-group marginTop1">
	        <img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;처리여부&nbsp;:&nbsp;<c:out value="${report.reportIscheck}"/> 
	        </div>
	        <div class="input-group marginTop1">
	        <img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;신고자닉네임&nbsp;:&nbsp;<c:out value="${report.reportUserNickname}"/> 
	        </div>
	        <div class="input-group marginTop1">
	        <img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;신고대상회원닉네임&nbsp;:&nbsp;<c:out value="${report.reportTargetNickname}"/> 
	     	</div>
	     	<%--신고답변<input type="text" class="form-control" name="reportAnswer" id="reportAnswer"  value="${report.reportAnswer }" placeholder="제목"  required> --%>
	        <div class="input-group marginTop1">
	        <img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;경고횟수&nbsp;:&nbsp;<c:out value="${report.reportIswarning }"/> 
	       </div>
       </div>
<%-- 		<c:forEach items="${reportFile}" var="r" varStatus="vs">
             <img src="${path }/resources/upload/admin/${r.reportFileName }">
        </c:forEach>  --%>
		<div class="input-group marginTop4">
        <img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;신고내용&nbsp;:
        </div>
        <div class="input-group marginTop31">
        <%-- <textarea class="form-control" name="reportContent" placeholder="내용" required readonly id="reportContent">
        <c:out value="${report.reportContent }"/></textarea> --%>
        ${report.reportContent }
		</div>
        
        
        <input type="hidden" id="reportIswarning" value="<c:out value="${report.reportIswarning }"/>">
        <br>
   		
   


	<script type="text/javascript">
	CKEDITOR.replace( 'reportContent',{
		width:'100%',
		height:'1000px'
	});
	
	</script>
<div>
   <!-- <div class="input-group marginTop1"> -->
				<!-- 신고답글내역 -->
		<div class="input-group marginTop4">
        <img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;관리자 답변&nbsp;:
        </div>
	<form>
  	
  	 <div class="input-group marginTop6">
   		<div class="answerFrm">
			<br>
			<p>${report.reportAnswer }</p>
			<br>
		</div>
	 </div>
	</form>
		
<!-- 	</div> -->
			<!-- 신고답글 -->
	
		
		<!-- <h5>답글달기</h5> -->
		<div class="input-group marginTop7">
			<form class="form-contact comment_form" action="${path}/admin/reportAnswer?reportId=${report.reportId}"
				id="commentForm" method="post">
					
				
					<!-- <input class="form-control" name="reportId"
								id="reportId" type="text"
								value="관리자" readonly>
				
					<div class="form-group">
						<textarea class="form-control w-100" name="reportAnswer"
								id="reportAnswer" cols="30" rows="9"
								placeholder="답글을 적어주세요"></textarea>
					</div>
					<div class="form-group">
						<button type="submit"
							class="button button-contactForm btn_1 boxed-btn"
							onclick="function validate();">답글달기</button>
					</div> -->
					<div class="accordion">
						<div class="accordion-item">
							<button type="button" id="accordion-button-1" aria-expanded="false">
								<span class="accordion-title">답글달기</span>
								<span class="icon" aria-hidden="true"></span>
							</button>
							<div class="accordion-content">
								<!-- <button type="submit" id="bbtn2" onclick="function validate();">SUBMIT</button> -->
								<textarea class="form-control w-100" name="reportAnswer"
									id="reportAnswer" cols="500" rows="500"
									placeholder="답글을 적어주세요"></textarea>
							</div>
						</div>
					</div>
		
			</form>
		</div>
		
		
  		<div id="btnDiv">
        <button class="btn btn-outline-info" onclick="reportWarn('${report.reportTargetUsid}');" id="bbtn">경고주기</button>
        <button class="btn btn-outline-info" onclick="reportViewDelete('${report.reportId}');" id="bbtn">삭제하기</button>
        </div>
</div>  




      </div>
	</section>
	
	
	
	
	
	
	
	<script>
	
		var reportIswarning=document.getElementById("reportIswarning").value;
		
		function reportWarn(reportTargetUsid){
			 if (confirm("정말 경고를 주시겠습니까?") == true){
				 location.href="${path}/admin/adminReportWarn?reportTargetUsid="+reportTargetUsid+"&reportIswarning="+reportIswarning;
			 }else{  
			     return;
			 }
		}
		
	

		function reportViewDelete(reportId){
			 if (confirm("정말 삭제하시겠습니까?") == true){
				 location.href="${path}/admin/adminReportDelete?reportId="+reportId;
			 }else{  
			     return;
			 }
		}
		
		
		
				
		$('#reportAnswer').keydown(
				function(key) {
					if (key.keyCode == 13) {
						commentForm.submit();
							validate();
					}
				});
		
		
		
		
			function validate(){
				if ('${loginMember.memClass}' != '관리자') {
					alert("관리자만 등록할 수 있습니다!");
					return false;
				}
			};
			
			
			
			
			const items = document.querySelectorAll(".accordion button");

			function toggleAccordion() {
			  const itemToggle = this.getAttribute('aria-expanded');
			  
			  for (i = 0; i < items.length; i++) {
			    items[i].setAttribute('aria-expanded', 'false');
			  }
			  
			  if (itemToggle == 'false') {
			    this.setAttribute('aria-expanded', 'true');
			  }
			}

			items.forEach(item => item.addEventListener('click', toggleAccordion));

			
			
			
			

			
			
	

		
	</script>
	
	

	
