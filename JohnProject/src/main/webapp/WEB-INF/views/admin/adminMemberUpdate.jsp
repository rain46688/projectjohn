<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="title" value=" " />

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

/*이미지사진*/

div {
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
}

*, *:before, *:after {
  -webkit-box-sizing: inherit;
          box-sizing: inherit;
}

.image-grid {
  width: 100%;
  max-width: 1310px;
  margin: 0 auto;
  overflow: hidden;
  padding: 10px 5px 0;
}

.image__cell {
  float: left;
  position: relative;
  width: 20%;
}

.image--basic {
  padding: 0 5px;
}

.basic__img {
  display: block;
  max-width: 100%;
  height: auto;
  margin: 0 auto;
  margin-left:205%;
}

.image__cell.is-collapsed .arrow--up {
  display: block;
  height: 10px;
  width: 100%;
}

.image--large {
  max-width: 100%;
  height: auto;
  display: block;
  padding: 40px;
  margin: 0 auto;
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
}

.image__cell.is-collapsed .image--basic {
  cursor: pointer;
}

.image__cell.is-expanded .image--expand {
  max-height: 500px;
  margin-bottom: 10px;
}

.image--expand { /*사진나오는화면*/
  position: relative;
  left: -5px;
  padding: 0 5px;
  -webkit-box-sizing: content-box;
          box-sizing: content-box;
  overflow: hidden;
  background: #003478;
  max-height: 0;
  -webkit-transition: max-height .3s ease-in-out,
 margin-bottom .1s .2s;
  transition: max-height .3s ease-in-out,
 margin-bottom .1s .2s;
  width: 500%;
  border-radius:20px;
}

.image__cell:nth-of-type(5n+2) .image--expand {
  margin-left: -100%;
}

.image__cell:nth-of-type(5n+3) .image--expand {
  margin-left: -200%;
}

.image__cell:nth-of-type(5n+4) .image--expand {
  margin-left: -300%;
}

.image__cell:nth-of-type(5n+5) .image--expand {
  margin-left: -400%;
}

.image__cell:nth-of-type(5n+6) {
  clear: left;
}

.expand__close {
  position: absolute;
  top: 10px;
  right: 20px;
  color: #fff;
  font-size: 50px;
  line-height: 50px;
  text-decoration: none;
}

.expand__close:before {
  content: '×';
}

.expand__close:hover {
  color: #fff;
}

.image__cell.is-expanded .arrow--up { /*화살표*/
  display: block;
  border-bottom: 8px solid #003478;
  border-left: 8px solid transparent;
  border-right: 8px solid transparent;
  height: 0;
  width: 0;
  margin: 2px auto 0;
  margin-left:250%;
}
/*# sourceMappingURL=jisun3.css.map */


</style>

<section id="content">

	<div id="board-container">
		<div class="input-group marginTop0">
			<h4><img src="${path }/resources/images/admin/expert.png" width="30px" height="27px">&nbsp;전문가 승인하기</h4>
				</div>
				
		<div class="input-group marginTop2">
		[<c:out value="${member.usid }"/>]&nbsp;
		</div>
				<br>
				<hr color="black">
				
		<form name="memberEnrollFrm" id="memberEnrollFrm"
			action="${path }/admin/adminUpdateMemberToExpertEnd" method="post" onSubmit='return false;'>
				
		 <div class="input-group marginTop3">		
				<input type="hidden" name="usid" id="usid" value="${member.usid }">
				<div class="input-group marginTop1">	
				<img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;이름&nbsp;:&nbsp;<c:out value="${member.memName}"/>
				</div>
				<div class="input-group marginTop1">
				<img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;닉네임&nbsp;:&nbsp;<c:out value="${member.memNickname }"/> 
				</div>
				<div class="input-group marginTop1">
				<img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;성별&nbsp;:&nbsp;<c:out value="${member.gender}"/>
				</div>
				<div class="input-group marginTop1">
				<img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;생일&nbsp;:&nbsp;<c:out value="${member.birthday }"/> 
				</div>
				<div class="input-group marginTop1">
				<img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;가입날짜&nbsp;:&nbsp;<c:out value="${member.enrollDate }"/>
				</div>
				<div class="input-group marginTop1">
				<img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;멤버등급&nbsp;:&nbsp;<c:out value="${member.memClass }"/> 
				</div>
			</div>
				
				<br>
				<div class="input-group marginTop0">
					<h4><img src="${path }/resources/images/admin/expert.png" width="30px" height="27px">&nbsp;자격증 정보</h4>
				</div>
				
				<br>
				<hr color="black">
				
				<c:forEach items="${list }" var="l">
				 <div class="input-group marginTop3">
	      				<div class="input-group marginTop1">
							<img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;자격증번호&nbsp;:&nbsp;<c:out value="${l.licenseMemUsid}"/>
						</div>
						<div class="input-group marginTop1">
							<img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;자격증발급날짜&nbsp;:&nbsp;<c:out value="${l.licenseDate}"/>
						</div>
						<div class="input-group marginTop1">
							<img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;자격증급수&nbsp;:&nbsp;<c:out value="${l.licenseType}"/>
						</div>
						<div class="input-group marginTop1">
							<img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;자격증발급기관&nbsp;:&nbsp;<c:out value="${l.licenseCompany}"/>
						</div>
						<%-- <div class="input-group marginTop1">
							<img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;자격증사진&nbsp;:&nbsp;<img src="${path }/resources/upload/upload_license/<c:out value="${l.licenseFileName }"/>">
						</div> --%>
					
							<div class="input-group marginTop1">
								<img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;자격증사진&nbsp;:
							</div>
							 
					<div class="image-grid">
				        <div class="image__cell is-collapsed">
				          <div class="image--basic">
				          	
				            <a href="#expand-jump-1">
				
							<img id="expand-jump-1" class="basic__img" src="${path }/resources/upload/upload_license/<c:out value="${l.licenseFileName }"/>">
				        
				            </a>
				          
				            <div class="arrow--up"></div>
				          </div>
				          <div class="image--expand">
				            <!-- <a href="#close-jump-1" class="expand__close"></a> -->
				            <img class="image--large" src="${path }/resources/upload/upload_license/<c:out value="${l.licenseFileName }"/>"> 
				          </div>
				        </div>
    			  	</div>
					
					</div>
				</c:forEach>
					
					
					<div id="btnDiv">
					<button class="btn btn-outline-info" onclick="appExpert();" id="bbtn">전문가 승인하기</button>
					</div>
					
		</form>

	</div>

</section>



<script>
function appExpert(){
	 if (confirm("정말 전문가로 승인하시겠습니까?") == true){
		memberEnrollFrm.submit();
		 return true;
		
	 }else{  
	     return false;
	 }
}



var $cell = $('.image__cell');

$cell.find('.image--basic').click(function() {
var $thisCell = $(this).closest('.image__cell');

if ($thisCell.hasClass('is-collapsed')) {
    $cell.not($thisCell).removeClass('is-expanded').addClass('is-collapsed');
    $thisCell.removeClass('is-collapsed').addClass('is-expanded');
} else {
    $thisCell.removeClass('is-expanded').addClass('is-collapsed');
}
});

$cell.find('.expand__close').click(function() {
var $thisCell = $(this).closest('.image__cell');
$thisCell.removeClass('is-expanded').addClass('is-collapsed');
});


</script>





