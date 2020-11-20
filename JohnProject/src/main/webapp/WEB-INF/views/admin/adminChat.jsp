<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value=" "/>
	
</jsp:include>

<style type="text/css">
* {
	font-family: 나눔고딕;
}
#messageWindow {
	background: black;
	color: greenyellow;
}
#inputMessage {
	width: 500px;
	height: 20px
}
#btn-submit {
	background: white;
	background: #F7E600;
	width: 60px;
	height: 30px;
	color: #607080;
	border: none;
}
#main-container {
	width: 600px;
	height: 680px;
	border: 1px solid black;
	margin: 10px;
	display: inline-block;
}
#chat-container {
	vertical-align: bottom;
	border: 1px solid black;
	margin: 10px;
	min-height: 600px;
	max-height: 600px;
	overflow: scroll;
	overflow-x: hidden;
	background: #9bbbd4;
}
.chat {
	font-size: 20px;
	color: black;
	margin: 5px;
	min-height: 20px;
	padding: 5px;
	min-width: 50px;
	text-align: left;
	height: auto;
	word-break: break-all;
	background: #ffffff;
	width: auto;
	display: inline-block;
	border-radius: 10px 10px 10px 10px;
}
.notice {
	color: #607080;
	font-weight: bold;
	border: none;
	text-align: center;
	background-color: #9bbbd4;
	display: block;
}
.my-chat {
	text-align: right;
	background: #F7E600;
	border-radius: 10px 10px 10px 10px;
}
#bottom-container {
	margin: 10px;
}
.chat-info {
	color: #556677;
	font-size: 10px;
	text-align: right;
	padding: 5px;
	padding-top: 0px;
}
.chat-box {
	text-align: left;
}
.my-chat-box {
	text-align: right;
}
</style>

<section id="content">
	<div id="main-container">

		<div id="chat-container"></div>

		<div id="bottom-container">

			<input id="inputMessage" type="text"> <input id="btn-submit"
				type="submit" value="전송">

		</div>
	</div>
</section>

<script>
	const adminsocket = new WebSocket("wss://localhost${path}/adminsocket");
	adminsocket.onopen = function() {
		adminsocket.send("memberConnected");
	}

	adminsocket.onmessage = function(e) {
		$("#chat-container").html('');
		let data = JSON.parse(e.data);
		
		console.log("data:"+data);
		
		if(data!=null){
			let profilePic = "${memberInfo.profilePic}"; //멤버 객체에 있는 변수	
			let adminNick = "${memberInfo.memNickname}";
			let allChatList = new Array();
			let otherUsid="${memberInfo.usid}";

			
			$.each(data,function(i,v){
				allChatList[i]=v; //배열 안에 value를 집어넣는다.
			})
			
			$.each(allChatList,function(i,v){
				console.log("v:"+v['adminChatContent']);
				var date = new Date();
				var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
				
				//let picDiv=$("<div/>").html($("<img/>").attr("src","${path}/resources/profile_images/"+profilePic));

				
 				if(v['adminFirstUsid']=='${loginMember.usid}'&&
 						 v['adminSecondUsid']== otherUsid){//발신인==나
					
					
  	        	let msgR=$('#chat-container').html( 
						$('#chat-container').html()
								+ "<div class='my-chat-box'><div class='chat'>"
								+ v['adminChatContent']
								+ "</div><div class='chat my-chat'>"
								+ dateInfo + "</div></div>"); 
						
		 	         } 
		 	         
 				if(v['adminFirstUsid']== otherUsid && 
 	         			v['adminSecondUsid']=='${loginMember.usid}'){
 	         
	 	        	let msgL=$('#chat-container').html(
						$('#chat-container').html()
								+ "<div class='chat-box'><div class='chat'>"
								+ v['adminChatContent']
								+ "</div><div class='chat-info chat-box'>"
								+ dateInfo + "</div></div>"); 
									
						
         					

	 	    
 	         }
		 	    
		 	      });
			
		
			$('#inputMessage').keydown(
					function(key) {
						if (key.keyCode == 13) {
							let txt = $("#inputMessage").val();
							var date = new Date();
							
								sendChat('${loginMember.usid}', '${memberInfo.usid}', txt, date, "");
								$('#inputMessage').val("");
								
						}
					});
		     
			

			
		}
		
		
	}

	function sendChat(adminFirstUsid, adminSecondUsid, adminChatContent,
			adminChatDate, adminChatFile) {
		adminsocket.send(JSON.stringify(new AdminChat(adminFirstUsid,
				adminSecondUsid, adminChatContent, adminChatDate,
				adminChatFile)));
	};
	
	function AdminChat(adminFirstUsid, adminSecondUsid, adminChatContent,
			adminChatDate, adminChatFile) {
		this.adminFirstUsid = adminFirstUsid;
		this.adminSecondUsid = adminSecondUsid;
		this.adminChatContent = adminChatContent;
		this.adminChatDate = adminChatDate;
		this.adminChatFile = adminChatFile;
	
	};

	adminsocket.onclose = function() {
		console.log('onclose 실행');
	};
	
</script>
