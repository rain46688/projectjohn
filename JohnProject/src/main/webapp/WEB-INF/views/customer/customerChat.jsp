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

		console.log("onopen => signaling server 연결");
		console.log("닉 : " + "${loginMember.memNickname}");
		var date = new Date();

		if ('${loginMember.memClass}' != '관리자') {
			sendChat(31, '${loginMember.usid}',"관리자ㄴ", date, "",
					'${loginMember.memNickname}');
			console.log("로긴멤버관리자ㄴ:" + '${loginMember.memClass}');
		} else {
			sendChat('${loginMember.usid}', 31,"관리자ㅇ", date, "",
					'${loginMember.memNickname}');
			console.log("로긴멤버관리자:" + '${loginMember.memClass}');
		}
	};

	$('#inputMessage').keydown(
			function(key) {
				if (key.keyCode == 13) {
					let txt = $("#inputMessage").val();
					console.log("텍스트:" + txt);
					var date = new Date();

					if ('${loginMember.memClass}' != '관리자') {
						sendChat('${loginMember.usid}', 31, txt, date, "",
								'${loginMember.memNickname}');
						$('#inputMessage').val("");
						console.log("관리자아님");
					} else {
						sendChat(31, '${loginMember.usid}', txt, date, "",
								'${loginMember.memNickname}');
						$('#inputMessage').val("");
						console.log("관리자임");
					}

				}

			});

	adminsocket.onmessage = function(e) {
 		const chatMsg = JSON.parse(e.data);

		/* var arr = JSON.stringify(chatMsg);
		console.log(arr); */
		
/* 		sendChat(31, '${loginMember.usid}',arr, date, "",
		'${loginMember.memNickname}'); */
		
		var date = new Date();
		var dateInfo = date.getHours() + ":" + date.getMinutes() + ":"
				+ date.getSeconds();

		 /* if(chatMsg['adminChatContent']=='SYS1'){
			
			$('#chat-container').html("<div class='chat notice'>"
					+chatMsg['관리자']+"님이 입장하였습니다</div>");
			
		}else{
			$('#chat-container').html("<div class='chat notice'>"
					+chatMsg['${loginMember.usid}']+"님이 입장하였습니다</div>");
		} */

		/*발신인 : 관리자*/
		/*  if(chatMsg['adminUsid']==31&&chatMsg['adminChatMemUsid']==31){ */
		if ('${loginMember.memClass}' != '관리자') { /*관리자가 아닌사람*/

			if ('${loginMember.usid}' != chatMsg['adminUsid']) { /*현재 로그인한사람 != 메세지의 발신인*/
				console.log("1첫번째" + chatMsg['adminChatMemUsid']);
				console.log("1첫번째" + chatMsg['adminUsid']);
				$('#chat-container').html(
						$('#chat-container').html()
								+ "<div class='chat-box'><div class='chat'>"
								+ chatMsg['adminChatContent']
								+ "</div><div class='chat-info chat-box'>"
								+ dateInfo + "</div></div>");
				console.log("1첫번째" + chatMsg);
				console.log("1첫번째컨첸츠" + chatMsg['adminChatContent']);
			} else {/*현재 로그인한사람 == 메세지의 발신인*/

				console.log("2두번째" + chatMsg['adminChatMemUsid']);
				console.log("2두번째" + chatMsg['adminUsid']);
				$('#chat-container')
						.html(
								$('#chat-container').html()
										+ "<div class='my-chat-box'><div class='chat my-chat'>"
										+ chatMsg['adminChatContent']
										+ "</div><div class='chat-info'>"
										+ dateInfo + "</div></div>");
				console.log("2두번째" + chatMsg);
				console.log("2두번째컨텐츠" + chatMsg['adminChatContent']);
			}
		} else {/*관리자인사람*/

			if ('${loginMember.usid}' != chatMsg['adminUsid']) { /*현재 로그인한사람 != 메세지의 발신인*/

				console.log("3첫번째" + chatMsg['adminChatMemUsid']);
				console.log("3첫번째" + chatMsg['adminUsid']);
				$('#chat-container').html(
						$('#chat-container').html()
								+ "<div class='chat-box'><div class='chat'>"
								+ chatMsg['adminChatContent']
								+ "</div><div class='chat-info chat-box'>"
								+ dateInfo + "</div></div>");
				console.log("3첫번째" + chatMsg);
				console.log("3첫번째컨첸츠" + chatMsg['adminChatContent']);

				/* 					var js = JSON.stringify([undefined,function(){},Symbol('')]);
				 console.log("js"+js); */

			} else { /*현재 로그인한사람 == 메세지의 발신인*/

				console.log("4두번째" + chatMsg['adminChatMemUsid']);
				console.log("4두번째" + chatMsg['adminUsid']);
				$('#chat-container')
						.html(
								$('#chat-container').html()
										+ "<div class='my-chat-box'><div class='chat my-chat'>"
										+ chatMsg['adminChatContent']
										+ "</div><div class='chat-info'>"
										+ dateInfo + "</div></div>");
				console.log("4두번째" + chatMsg);
				console.log("4두번째컨텐츠" + chatMsg['adminChatContent']);
			}
		}
	}

	/* 	console.log("onmessage => 메세지 출력 : " + adminChatContent);
	let chatMsg = JSON.stringify(adminChatContent.data);
	console.log("inputMessage.type : " + inputMessage.type);
	
		console.log(" ====== ");
		 var i = $("#inputMessage").val();
		 
			var date = new Date();
			var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds(); */

	/* 	let getMemId = $('adminChatMemUsid').val();
	 console.log("getMemId:"+getMemId); */

	/* 	if(getMemId !== '${loginMember.usid}'){
			var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>" + i + "</div><div class='chat-info'>"+ dateInfo +"</div></div>");
			$('#chat-container').append($chat); 
		}else{
			var $chat = $("<div class='chat-box'><div class='chat'>" + i + "</div><div class='chat-info chat-box'>"+ dateInfo +"</div></div>");
			$('#chat-container').append($chat);
		}
		$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20); 


	console.log("채팅내용 : "+i);
	 */

	/*  console.log("onmessage실행");
	 const chatMsg = JSON.parse(e){
		 console.log("발신인:"+["adminChatMemUsid"]);
		 console.log("수신인:"+["adminUsid"]);
		 
		 if(msg["adminChatContent"]")
	 } */
	/* 
	 }; */

	/* 	function sendMessage(message) {
	 adminsocket.send(JSON.stringify(message));
	 console.log("메세지 보내는 함수 sendMessage");
	 console.log("메세지내용:::"+JSON.stringify(message));
	
	
	 }; */

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

	/* 	function counselEnd() {
	
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
	 sendMessage(new ExboardMsg("END",
	 "${loginMember.memClass}", "종료"));
	 }
	 } */

	adminsocket.onclose = function() {
		console.log('onclose 실행');
	};
</script>





