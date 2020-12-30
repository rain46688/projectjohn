<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<head>
	<!-- 글씨체 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<style>
	#content *{
		font-family: 'Noto Serif KR', serif;
	}
	div#msgContainer{
		overflow: auto;
		background-color: #003478;
		width: 80%;
		margin-left: 10%;
		margin-top: 2rem;
		border-radius: 10px;
	}
	div#savedContainer{
		overflow: auto;
		margin: 5% auto;
		width: 70%;
	}
	div.msgBoxL{
		display: flex;
		width: 100%;
		clear: both;
	}
	div.msgBoxR{
		width: 100%;
		float: right;
	}
	div.msgLeft{
		width: 40%;
		background-color: white;
		color: #003478;
		border-radius: 15px;
		margin-bottom: 15px;
		padding: 10px;
	}
	div.msgRight{
		width: 40%;
		background-color: #ffcc66;
		color: #003478;
		border-radius: 15px;
		margin-bottom: 15px;
		text-align: right;
		margin-right: 0;
		float: right;
		padding: 10px;
	}
	div.picDiv{
		width: 3em;
		text-align: center;
		display: flex;
		float: left;
		margin-bottom: 10px;
	}
	div.picDiv img{
		min-width: 3em;
		height: 3em;
		max-width: 100%;
		border-radius: 15px;
		float: left;
	}
	div.rightTopDiv{
		display: flex;
		float: left;
		margin: 10px 5px;
	}
	div.nickDiv{
		position: relative;
		float: left;
		margin: 5px;
	}
	div.dateDiv{
		clear: both;
		margin: 8px;
		font-size: 0.8em;
		color: gray;
	}
	div.msgDiv{
		margin: 5px;
		text-align: left;
		clear: both;
	}
	div#textingContainer{
		margin: 5% auto;
		clear: both;
		width: 70%;
		vertical-align: middle;
	}
	input#message{
		border: none;
		padding: 7px;
		width: 90%;
		margin-left: 0px;
		margin-right: 5px;
	}
	div#textingContainer button{
		background-color: white;
		float: right;
	}
	div#textingContainer button:hover{
		background-color: black;
	}
</style>
<section id="content">
	<div id="msgContainer">
		<div id="savedContainer"></div>
		<div id="textingContainer">
			<c:choose>
				<c:when test="${otherInfo.leaveMem eq true}">
					<input type="text" id="message" placeholder="탈퇴한 회원입니다." readonly style="background-color: lightgrey; width: 100%;">
				</c:when>
				<c:otherwise>
					<input type="text" id="message" placeholder="메세지를 입력하세요.">
					<button type="button" class="btn btn-outline-dark" id="sendMessage" onclick="fn_sendMessage()">전송</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</section>
<script>
	//소켓 시작
	const memberSocket=new WebSocket("wss://rclass.iptime.org${path}/memberSocket");
	//const memberSocket=new WebSocket("wss://localhost${path}/memberSocket");

	//소켓이 열림
	memberSocket.onopen=function(){
		memberSocket.send("messageOnOpen");
	};
	
	//메세지 보냄
	function fn_sendMessage(){
		let message=$("#message").val();
		if(message!=""){
			sendChat("${loginMember.usid}","${otherInfo.usid}",message,"","");
			$("#message").val('');
		}
	};

	//엔터로 보냄
	$("#message").on('keypress', function(e){
        if(e.keyCode==13) {
            $("#sendMessage").click();
        }
    });  
	
	//메세지 받기
	memberSocket.onmessage=function(e){
		$("#savedContainer").html('');
		let data=JSON.parse(e.data);
		if(data!=null){
			let otherProfile="${otherInfo.profilePic}";
			let otherNick="${otherInfo.memNickname}";
			let otherUsid="${otherInfo.usid}";
			let allChatList=new Array;
			$.each(data, function(i,v){
				allChatList[i]=v;
			})
			
			$.each(allChatList,function(i,v){
				let msgBoxL=$("<div/>").attr({"class":"msgBoxL"});
				let msgBoxR=$("<div/>").attr({"class":"msgBoxR"});
				let msgLeft=$("<div/>").attr({"class":"msgLeft"});
		 		let msgRight=$("<div/>").attr({"class":"msgRight"});
		 		let picDiv=$("<div/>").attr({"class":"picDiv"}).html($("<img/>").attr("src","${path}/resources/profile_images/"+otherProfile));
				let rightTopDiv=$("<div/>").attr({"class":"rightTopDiv"});
		 		let nickDiv=$("<div/>").attr({"class":"nickDiv"}).html(otherNick);
		 		let dateDiv=$("<div/>").attr({"class":"dateDiv"});
				let msgDiv=$("<div/>").attr({"class":"msgDiv"});
				
				if(v['mchatFirstUsid']=='${loginMember.usid}' && v['mchatSecondUsid']==otherUsid){ //발신인==나
					let msgR=msgDiv.html(v['mchatContent']);
					let msgDate=dateDiv.html(v['mchatDateString']);
					msgRight.append(msgR).append(msgDate)
					msgBoxR.append(msgRight)
			 		$("#savedContainer").append(msgBoxR);
				}
				if(v['mchatFirstUsid']==otherUsid && v['mchatSecondUsid']=='${loginMember.usid}'){
					let msgL=msgDiv.html(v['mchatContent']);
					let msgDate=dateDiv.html(v['mchatDateString']);
					rightTopDiv.append(nickDiv).append(msgDate);
			 		msgLeft.append(picDiv).append(rightTopDiv).append(msgL);
					msgBoxL.append(msgLeft)
					$("#savedContainer").append(msgBoxL);
				}
			});			
		}
	}
	
	function sendChat(mchatFirstUsid, mchatSecondUsid, mchatContent, mchatDate, mchatFile){
		memberSocket.send(JSON.stringify(new MemberChat(mchatFirstUsid, mchatSecondUsid, mchatContent, mchatDate, mchatFile)))
	};
	
	function MemberChat(mchatFirstUsid, mchatSecondUsid, mchatContent, mchatDate, mchatFile){
		this.mchatFirstUsid=mchatFirstUsid;
		this.mchatSecondUsid=mchatSecondUsid;
		this.mchatContent=mchatContent;
		this.mchatDate=mchatDate;
		this.mchatFile=mchatFile;
	}
	
	memberSocket.onclose=function(){
	}
</script>
</body>
</html>