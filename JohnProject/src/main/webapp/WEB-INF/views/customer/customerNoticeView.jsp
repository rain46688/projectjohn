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
	margin-top:0.5em;
	margin-bottom:0.5em;
	margin-left:1%;
	width:50%;
	font-size:20px;
	color:black;
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
			<h4><img src="${path }/resources/images/admin/board.png" width="30px" height="27px">&nbsp;게시판 상세내역</h4>
			</div>
			
			<div class="input-group marginTop2">
			[<c:out value="${notice.noticeId }"/>]&nbsp;
			</div>
			<br>
			<hr color="black">
			<input type="hidden" class="form-control" name="noticeAdminUisd" id="noticeAdminUisd" value="${notice.noticeAdminUisd }" > 

		<div class="input-group marginTop3">	       
	        <div class="input-group marginTop1">
	        <img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;글쓴이&nbsp;:&nbsp;<c:out value="${notice.noticeAdminNickname }"/>
	        </div>
	        <div class="input-group marginTop1">
	        <img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;제목&nbsp;:&nbsp;<c:out value="${notice.noticeTitle }" />
	        </div>
	        <div class="input-group marginTop1">
	        <img src="${path }/resources/images/admin/check.png" width="30px" height="30px">&nbsp;등록날짜&nbsp;:&nbsp;
	        <fmt:formatDate value="${notice.noticeEnrolldate }" pattern="yyyy.MM.dd HH:mm"/>
	       <%--  <c:out value="${notice.noticeEnrolldate }"/>  --%>
       		</div>
       	</div>
		<%-- <c:forEach items="${noticeFile}" var="a" varStatus="vs">
              <img src="${path }/resources/upload/notice/${a.noticeFileName }">      
        </c:forEach>  --%>
        
        
        <div class="input-group marginTop31">
        <%-- <textarea class="form-control" name="noticeContent" placeholder="내용" required id="editor1"><c:out value="${notice.noticeContent }"/></textarea> --%>
        ${notice.noticeContent }
        </div>
        <br>
        
        <div id="btnDiv">
        <button class="btn btn-outline-info" onclick="noticeViewModify('${notice.noticeId}');" id="bbtn">수정하기</button>
        <button class="btn btn-outline-info" onclick="noticeViewDelete('${notice.noticeId}');" id="bbtn">삭제하기</button>
        </div>
    </div>
	
	</section>

	<script type="text/javascript">
		CKEDITOR.replace( 'noticeContent',{
			width:'100%',
			height:'1000px'
		});
		
	</script>
	
	<script>
		function fileDownload(oriName, reName){
			oriName=encodeURIComponent(oriName);
			location.href="${path}/board/fileDown.do?oriName="+oriName+"&reName="+reName;
		}
		
		function noticeViewModify(noticeId){
			 var sessionId = '${loginMember.usid}';
				if(sessionId!='31'){
					alert("관리자만 접근할 수 있습니다");
					return;
				}
			location.href="${path}/customer/customerNoticeModify?noticeId="+noticeId;
		}
				
		function noticeViewDelete(noticeId){
			 var sessionId = '${loginMember.usid}';
			if(sessionId!='31'){
				alert("관리자만 접근할 수 있습니다");
				return;
			}
			 if (confirm("정말 삭제하시겠습니까?") == true){
				 location.href="${path}/customer/customerNoticeDelete?noticeId="+noticeId;
			 }else{  
			     return;
			 }
		}
		

	</script>
	
	

	
