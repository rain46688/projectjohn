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
	*{
		font-family: 나눔고딕;
	}
	#messageWindow{
		background: black;
		color: greenyellow;
	}
	#inputMessage{
		width:500px;
		height:20px
	}
	#btn-submit{
		background: white;
		background: #F7E600;
		width:60px;
		height:30px;
		color:#607080;
		border:none;
	}
	
	#main-container{
		width:600px;
		height:680px;
		border:1px solid black;
		margin:10px;
		display: inline-block;
		
	}
	#chat-container{
		vertical-align: bottom;
		border: 1px solid black;
		margin:10px;
		min-height: 600px;
		max-height: 600px;
		overflow: scroll;
		overflow-x:hidden;
		background: #9bbbd4;
	}
	
	.chat{
		font-size: 20px;
		color:black;
		margin: 5px;
		min-height: 20px;
		padding: 5px;
		min-width: 50px;
		text-align: left;
        height:auto;
        word-break : break-all;
        background: #ffffff;
        width:auto;
        display:inline-block;
        border-radius: 10px 10px 10px 10px;
	}
	
	.notice{
		color:#607080;
		font-weight: bold;
		border : none;
		text-align: center;
		background-color: #9bbbd4;
		display: block;
	}

	.my-chat{
		text-align: right;
		background: #F7E600;
		border-radius: 10px 10px 10px 10px;
	}
	
	#bottom-container{
		margin:10px;
	}
	
	.chat-info{
		color:#556677;
		font-size: 10px;
		text-align: right;
		padding: 5px;
		padding-top: 0px;

	}
	
	.chat-box{
		text-align:left;
	}
	.my-chat-box{
		text-align: right;
	}
	
	
	
</style>

<section id="content">

	<div id="main-container">
		<div id="chat-container">
			
		</div>
		<div id="bottom-container">
		
				<input id="inputMessage" type="text">
				<input id="btn-submit" type="submit" value="전송" >

		</div>
	</div>


</section>

<script>

const adminsocket = new WebSocket("wss://localhost${path}/adminsocket");

adminsocket.onopen = function(){
	console.log("onopen => signaling server 연결");

	
};

$(function(){
	$('#inputMessage').keydown(function(key){
		if(key.keyCode == 13){
			let txt = $("#inputMessage").val();
			console.log(txt);

		var date = new Date();
		
		
		  if ('${loginMember.memClass}' == '관리자') {
			sendMessage(new AdminChat(31,"${loginMember.usid}", txt,date,""));
		}
		 else { 
			sendMessage(new AdminChat("${loginMember.usid}",31, txt,date,""));
		}  

		}
		
		
	});
	

})


adminsocket.onmessage = function(adminChatContent){
	
 	console.log("onmessage => 메세지 출력 : " + adminChatContent);
	let chatMsg = JSON.stringify(adminChatContent.data);
	console.log("inputMessage.type : " + inputMessage.type);
	
		console.log(" ====== ");
		 var i = $("#inputMessage").val();
		 
			var date = new Date();
			var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
			
/* 	let getMemId = $('adminChatMemUsid').val();
	console.log("getMemId:"+getMemId); */
			
			if(getMemId !== '${loginMember.usid}'){
				var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>" + i + "</div><div class='chat-info'>"+ dateInfo +"</div></div>");
				$('#chat-container').append($chat); 
			}else{
				var $chat = $("<div class='chat-box'><div class='chat'>" + i + "</div><div class='chat-info chat-box'>"+ dateInfo +"</div></div>");
				$('#chat-container').append($chat);
			}
			$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20); 
		

	console.log("채팅내용 : "+i);
	

};

	
	

	function sendMessage(message) {
		adminsocket.send(JSON.stringify(message));
		console.log("메세지 보내는 함수 sendMessage");
		console.log("메세지내용:::"+JSON.stringify(message));
		
	
	};
	
		function sendChat(adminUsid, adminChatMemUsid, adminChatContent, adminChatDate, adminChatFile) {
			adminsocket.send(JSON.stringify(new AdminChat(adminUsid, adminChatMemUsid,
					adminChatContent, adminChatDate, adminChatFile)));
		};

//----------------------------------------
	function AdminChat(adminUsid, adminChatMemUsid, adminChatContent, adminChatDate, adminChatFile) {
				this.adminUsid = adminUsid;
				this.adminChatMemUsid = adminChatMemUsid;
				this.adminChatContent = adminChatContent;
				this.adminChatDate = adminChatDate;
				this.adminChatFile = adminChatFile;
				
			
			};
			
	

	
	function counselEnd() {
				
				let result = confirm("1:1 문의를 종료 하시겠습니까?");
				if(result){
					let form = document.createElement("form");
					form.setAttribute("charset", "UTF-8");
					form.setAttribute("method", "Post");
					form.setAttribute("action", "${path}/customerPage");
					let hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("name", "inputMessage");
					hiddenField.setAttribute("value", $("#inputMessage").val());
					form.appendChild(hiddenField);
					let hiddenField2 = document.createElement("input");
					hiddenField2.setAttribute("type", "hidden");
					hiddenField2.setAttribute("name", "bno");
					hiddenField2.setAttribute("value", "${bno}");
					form.appendChild(hiddenField2);
					document.body.appendChild(form);
					form.submit();
					exit();
					/* sendMessage(new ExboardMsg("END",
							"${loginMember.memClass}", "종료")); */
				}
			}
	
	adminsocket.onclose = function() {
		console.log('onclose 실행');
	};


</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
