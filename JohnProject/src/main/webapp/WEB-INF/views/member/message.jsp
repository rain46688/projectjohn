<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<style>
	div.msgRight{
		background-color: aqua;
	}
</style>
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
		memberSocket.send("connect");
	};
	
	//메세지 보냄
	function fn_sendMessage(){
		let message=$("#message").val();
		if(message!=null){
			sendChat(${loginMember.usid},${otherInfo.usid},message,"","");
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
			let allChatList=new Array;
			$.each(data, function(i,v){
				allChatList[i]=v;
			})
			
			$.each(allChatList,function(i,v){
				let msgLeft=$("<div/>").attr({"class":"msgLeft"});
		 		let msgRight=$("<div/>").attr({"class":"msgRight"});
		 		let picDiv=$("<div/>").html($("<img/>").attr("src","${path}/resources/profile_images/"+otherProfile));
		 		let nickDiv=$("<div/>").html(otherNick);
		 		let dateDiv=$("<div/>").attr({"class":"msgDate"});
				console.log(allChatList[i].mchatDate);
				if(v['mchatFirstUsid']=='${loginMember.usid}'){ //발신인==나
					let msgR=msgRight.html(v['mchatContent']);
					let msgDate=dateDiv.html(v['mchatDate']);
			 		$("#savedContainer").append(msgR).append(msgDate);
				}
				if(v['mchatFirstUsid']!='${loginMember.usid}' || v['mchatSecondUsid']=='${loginMember.usid}'){
					let msgL=msgLeft.html(v['mchatContent']);
					let msgDate=dateDiv.html(v['mchatDate']);
			 		$("#savedContainer").append(picDiv).append(nickDiv).append(msgL);
					$("#savedContainer").append(msgL).append(msgDate);
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
		console.log('onclose실행');
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>