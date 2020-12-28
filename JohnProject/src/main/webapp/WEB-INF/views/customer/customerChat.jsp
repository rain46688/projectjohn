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

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
#totaldiv{
	background-color:#ffcc66;
	margin-right: 5%;
    margin-bottom:5%;
    margin-left:5%;
    margin-top:2%;
    border-radius:20px;
    height:100%;
}

#messageWindow {
	background: black;
	color: greenyellow;
}
#inputMessage {
	width: 85%;
	height: 5%;
	border: none;
	background-color:#eeeeee;
	border-radius:10px;
	margin-left:0.5%;

}
#btn-submit{
	border-color: #ffcc66;
    color: white; 
    background-color: #003478;
    width:10%;
    height:5%;
    border-radius:10px;
    margin-left:1%;



}

#btn-submit:hover,
#btn-submit:focus {
    background-color: #ffcc66;
    border-color: #003478;
    color: #003478; 

}
#main-container {
/* 	width: 600px;
	height: 680px;
	border: 1px solid black;
	margin: 10px;
	display: inline-block;
	font-family: 'Noto Serif KR', serif; */
	padding-right: 20%;
    padding-bottom:20%;
    padding-left:20%;
    padding-top:2%;
    font-family: 'Noto Serif KR', serif;
	overflow:hidden;
}
#chat-container {
	vertical-align: bottom;
	border: none;
	border-radius:30px;
	margin: 10px;
	min-height: 85%;
	max-height: 85%;
	/* overflow: scroll; */
	overflow-y:scroll;
	overflow-x: hidden;
	background: #003478;
	background-image:url("${path}/resources/images/admin/chatbot.png");
	background-repeat:no-repeat;background-position: center;
	padding:10px;


}
 ::-webkit-scrollbar{
 	display:block;
 }
.chat {
	font-size: 20px;
	color: black;
	margin: 20px;
	min-height: 20px;
	padding: 10px;
	min-width: 50px;
	text-align: left;
	height: auto;
	word-break: break-all;
	background: #ffffff;
	width: auto;
	display: inline-block;
	border-radius: 10px 10px 10px 10px;

}
/* .notice {
	color: #607080;
	font-weight: bold;
	border: none;
	text-align: center;
	background-color: #9bbbd4;
	display: block;
} */
.my-chat {
	text-align: right;
	background: #ffcc66;
	border-radius: 10px 10px 10px 10px;
	margin-right:1px;
	padding:10px;
}
#bottom-container {
	margin: 10px;
	width:100%;
}
.chat-info {
	color: #eeeeee;
	font-size: 12px;
	text-align: right;
	padding: 20px;
	padding-top: 0px;
}
.chat-box {
	text-align: left;
}
.my-chat-box {
	text-align: right;
}



/*추가*/
.board_list_head {
    border-top: 3px solid #003478;
    border-bottom: 2px solid #003478;
    background-color:#003478;
    color:#ffcc66;
    border-radius:10px;
    font-family: 'Noto Serif KR', serif;
    padding: 10px 0;
   
}

.board_list_head > div{
    display: inline-block;
    text-align: center;
    font-size: 25px; /*본문글자크기*/
    font-weight: 600;
}


</style>

<section id="content">
<div id="totaldiv">
	<div id="main-container">  

		<div id="chat-container"></div> 

		<div id="bottom-container">

			<input id="inputMessage" type="text"> <input id="btn-submit"     
				type="submit" value="전송">

		</div>
	</div>
	</div>
</section>

<script>
	const adminsocket = new WebSocket("wss://rclass.iptime.org${path}/adminsocket");
	adminsocket.onopen = function() {
		adminsocket.send("memberConnected");
	}

	adminsocket.onmessage = function(e) {
		$("#chat-container").html('');
		let data = JSON.parse(e.data);
		
		console.log("data:"+data);
		
		if(data!=null){
			let profilePic = "${adminInfo.profilePic}"; //멤버 객체에 있는 변수	
			let adminNick = "${adminInfo.memNickname}";
			let allChatList = new Array();
			let otherUsid="${adminInfo.usid}";

			
			$.each(data,function(i,v){
				allChatList[i]=v; //배열 안에 value를 집어넣는다.
			})
			
			$.each(allChatList,function(i,v){
				console.log("v:"+v['adminChatContent']);
				var date = new Date();
				var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
				
				//let picDiv=$("<div/>").html($("<img/>").attr("src","${path}/resources/profile_images/"+profilePic));

				
 				if(v['adminFirstUsid']=='${loginMember.usid}'&&
 						 v['adminSecondUsid']== otherUsid){ //발신인==나
					
					
  	        	let msgR=$('#chat-container').html( 
						$('#chat-container').html()
								+ "<div class='my-chat-box'><div class='chat my-chat'>"
								+ v['adminChatContent']
								+ "</div><div class='chat-info'>"
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
					
							if(txt!=""){
								sendChat('${loginMember.usid}', '${adminInfo.usid}', txt, date, "");
								$('#inputMessage').val("");
							}
								
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

