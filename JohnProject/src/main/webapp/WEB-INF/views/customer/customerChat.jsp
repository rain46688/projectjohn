<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="title" value=" " />

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
		
		<div id="chat-container">
		<div id="savedContainer"></div>
		</div>
		
		<div id="bottom-container">

			<input id="inputMessage" type="text"> <input id="btn-submit"
				type="submit" value="전송">

		</div>
	</div>


</section>

<script>
	const adminsocket = new WebSocket("wss://localhost${path}/adminsocket");
	adminsocket.onopen = function() {
		adminsocket.send("connect");
		

		var date = new Date();
		
		var date = new Date();
		var dateInfo = date.getHours() + ":" + date.getMinutes() + ":"
				+ date.getSeconds();
		
		if('${loginMember.usid}'==31){
			
			$('#chat-container').html("<div class='chat notice'>"
					+"관리자님이 입장하였습니다</div>");
			
		}else{
			$('#chat-container').html("<div class='chat notice'>"
					+'${loginMember.memNickname}'+"님이 입장하였습니다</div>");
		}  
		
		
		

 		
	};
	$('#inputMessage').keydown(
			function(key) {
				if (key.keyCode == 13) {
					let txt = $("#inputMessage").val();
					var date = new Date();
					
						sendChat('${loginMember.usid}', '${otherInfo.usid}', txt, date, "",
								'${loginMember.memNickname}');
						$('#inputMessage').val("");
						
				
				}
			});
	
	
	adminsocket.onmessage = function(e) {
 		let chatMsg = JSON.parse(e.data);
 		
 	      let allChatList=new Array;
 	  
 	      $.each(chatMsg, function(i,v){
 	         allChatList[i]=v;
 	      });
 	      
 	      $("#chat-container").append(allChatList.adminChatContent);
 	      
 	   
 	     $.each(allChatList,function(i,v){
 	       
 	          if(v['adminUsid']!='${loginMember.usid}'){ //발신인==나

 	 
 	         
  	        	let msgR=$('#chat-container').html(
						$('#chat-container').html()
								+ "<div class='chat-box'><div class='chat'>"
								+ v['adminChatContent']
								+ "</div><div class='chat-info chat-box'>"
								+ dateInfo + "</div></div>"); 
						
 	         
	  	            			$("#savedContainer").html('');
 	            

 	         }
 	         
 	         if(v['adminUsid']!='${loginMember.usid}' || v['adminChatMemUsid']=='${loginMember.usid}'){
 	         
 	          
	 	        	let msgL=$('#chat-container').html(
							$('#chat-container').html()
									+ "<div class='chat-box'><div class='chat'>"
									+ v['adminChatContent']
									+ "</div><div class='chat-info chat-box'>"
									+ dateInfo + "</div></div>"); 
										
							
          							$("#savedContainer").html('');

	 	    
 	         }
 	    
 	      });
     


		
		var date = new Date();
		var dateInfo = date.getHours() + ":" + date.getMinutes() + ":"
				+ date.getSeconds();
		
// 	/* if ('${loginMember.memClass}' != '관리자') { /*관리자가 아닌사람*/
// 			if ('${loginMember.usid}' != chatMsg['adminUsid']) { /*현재 로그인한사람 != 메세지의 발신인*/
				
// 				$('#chat-container').html(
// 						$('#chat-container').html()
// 								+ "<div class='chat-box'><div class='chat'>"
// 								+ chatMsg['adminChatContent']
// 								+ "</div><div class='chat-info chat-box'>"
// 								+ dateInfo + "</div></div>");
				
// 			} else {/*현재 로그인한사람 == 메세지의 발신인*/
				
// 				$('#chat-container')
// 						.html(
// 								$('#chat-container').html()
// 										+ "<div class='my-chat-box'><div class='chat my-chat'>"
// 										+ chatMsg['adminChatContent']
// 										+ "</div><div class='chat-info'>"
// 										+ dateInfo + "</div></div>");
			
// 			}
// 		} else {/*관리자인사람*/
// 			if ('${loginMember.usid}' != chatMsg['adminUsid']) { /*현재 로그인한사람 != 메세지의 발신인*/
			
// 				$('#chat-container').html(
// 						$('#chat-container').html()
// 								+ "<div class='chat-box'><div class='chat'>"
// 								+ chatMsg['adminChatContent']
// 								+ "</div><div class='chat-info chat-box'>"
// 								+ dateInfo + "</div></div>");
			
// 			} else { /*현재 로그인한사람 == 메세지의 발신인*/
				
// 				$('#chat-container')
// 						.html(
// 								$('#chat-container').html()
// 										+ "<div class='my-chat-box'><div class='chat my-chat'>"
// 										+ chatMsg['adminChatContent']
// 										+ "</div><div class='chat-info'>"
// 										+ dateInfo + "</div></div>");
				
// 			}
// 		} */
	}
	
	function sendChat(adminUsid, adminChatMemUsid, adminChatContent,
			adminChatDate, adminChatFile, adminChatSenderNickname) {
		adminsocket.send(JSON.stringify(new AdminChat(adminUsid,
				adminChatMemUsid, adminChatContent, adminChatDate,
				adminChatFile, adminChatSenderNickname)));
	};
	//----------------------------------------
	function AdminChat(adminUsid, adminChatMemUsid, adminChatContent,
			adminChatDate, adminChatFile, adminChatSenderNickname) {
		this.adminUsid = adminUsid;
		this.adminChatMemUsid = adminChatMemUsid;
		this.adminChatContent = adminChatContent;
		this.adminChatDate = adminChatDate;
		this.adminChatFile = adminChatFile;
		this.adminChatSenderNickname = adminChatSenderNickname;
	};
	
	adminsocket.onclose = function() {
		console.log('onclose 실행');
	};
</script>

