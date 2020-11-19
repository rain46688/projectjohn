<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<section id="content">
	<div>
		<div id="savedContainer"></div>
		<div id="textingContainer">
			<input type="text" id="message">
			<button type="button" id="sendMessage" onclick="fn_sendMessage()">전송</button>
		</div>
	</div>
</section>
<script>
	//소켓 시작
	const memberSocket=new WebSocket("wss://localhost${path}/memberSocket");
	//소켓이 열림
	memberSocket.onopen=function(){
		console.log("onopen => signaling server 연결");
		console.log("닉 : "+"${loginMember.memNickname}");
		var date = new Date();
	};
	
	//메세지 보냄
	function fn_sendMessage(){
		let message=$("#message").val();
		if(message!=null){
			var date=new Date();
			sendChat(${loginMember.usid},${otherInfo.usid},message,date,"");
			$("#message").val('');			
		}
	};
	
	//엔터로 보냄
	$("#message").on('keypress', function(e){
        if(e.keyCode==13) {
            $("#sendMessage").click();
        }
    });  
	
	//메세지 불러오기
	memberSocket.onmessage=function(e){
		console.log("json."+JSON.parse(e.data));
		console.log("data"+data);
// 		console.log("e.da"+e.data);
// 		function(JSON.parse(e.data)){
// 			$.each(e.data,function(i,v){
// 				let msgLeft=$("<div/>").attr({"class":"msgLeft"});
// 		 		let msgRight=$("<div/>").attr({"class":"msgRight"});
// 		 		if(v['mchatFirstUsid']=='${loginMember.usid}'){
// 		 			let msgR=msgRight.html(v['mchatContent']);
// 		 			$("$savedContainer").append(msgR);
// 		 		}else{ //수신인==나(왼쪽)
// 		 			let msgL=msgLeft.html(v['mchatContent']);
// 		 			$("$savedContainer").append(msgL);
// 		 		}
// 			})
// 		}
///////////////////////
// 		const savedMessage=JSON.parse(e.data);
// 		console.log(savedMessage);
// 		var date=new Date();
// 		var timeStamp=date.getHours+":"+date.getMinutes();
// 		let msgLeft=$("<div/>").attr({"class":"msgLeft"});
// 		let msgRight=$("<div/>").attr({"class":"msgRight"});
// 		let picDiv=$("<div/>").html($("<img/>").attr("src","${path}/resources/profile_images/${otherInfo.profilePic}"));
// 		let nickDiv=$("<div/>").html(${otherInfo.memNickname});
// 		let contentDiv;
// 		//발신인==나(오른쪽)
// 		if(savedMessage['mchatFirstUsid']=='${loginMember.usid}'){
// 			let msgR=msgRight.html(savedMessage['mchatContent']);
// 			$("$savedContainer").append(msgR);
// 		}else{ //수신인==나(왼쪽)
// 			let msgL=msgLeft.html(savedMessage['mchatContent']);
// 			$("$savedContainer").append(msgL);
// 		}
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
		console.log('onclose실행');
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>









