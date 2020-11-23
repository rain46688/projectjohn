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
	div#newChatContainer{
		margin-top: 50px;
		text-align: center;
	}
	#newChatIcon{
		margin: 0;
	}
	div#newChatContainer button{
		margin: 0 auto;
	}
	div#savedContainer{
		width: 40%;
		margin: 50px auto;
		padding: 1%;
	}
	div.msgBox{
		background-color: white;
		border-radius: 15px;
		margin-bottom: 2px;
		display: flex;
	}
	div.msgBox:hover{
		background-color: #D3D3D3;
		cursor:pointer;
	}
	div.picDiv{
		width: 10em;
		padding: 0 auto;
		text-align: center;
		margin: 10px;
	}
	div.picDiv img{
		min-width: 10em;
		height: 10em;
		max-width: 100%;
		border-radius: 15px;
	}
	div.rightDiv{
		width: 65%;
		margin: 10px 10px 10px auto;
		padding: 10px;
	}
	div.rightTopDiv{
		display: flex;
	}
	div.nickDiv{
		font-size: 1.2em;
	}
	div.dateDiv{
		width: 50%;
		color: grey;
		margin: 5px;
	}
	div.msgDiv{
		margin: 5px;
	}
</style>
<section id="content">
	<div id="newChatContainer">
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
			<ion-icon name="add-circle" id="newChatIcon"></ion-icon>
			<div>
				새로운 채팅
			</div>
		</button>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">존경장 검색하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="text" id="newNick" placeholder="닉네임">
					<div id="searchResult"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="fn_selectMember()">확인</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div id="savedContainer"></div>
	</div>
</section>
<script>
	$("#newNick").keyup(e=>{
		$.ajax({
			url:"${path}/member/searchMemberByNick",
			data:{"nick":$(e.target).val()},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.length>0){
					let container=$("<div/>")
					$.each(data,function(i,v){
						let div=$("<div/>").attr("class","result");
						let otherProfilePic=$("<div/>").html($("<img/>").attr("src","${path}/resources/profile_images/"+v['profilePic']));
						let otherNick=$("<div/>").html(v['memNickname']);
						let radioBtn=$("<div/>").html($("<input/>").attr({"type":"radio","name":"selectMember","value":v['memNickname']}));
						div.append(otherProfilePic).append(otherNick).append(radioBtn);
						container.append(div);
					})
					$("#searchResult").html(container);
				}else{
					$("#searchResult").html('');
				}
			}
		})
	})
	function fn_selectMember(){
		$.ajax({
			url:"${path}/member/selectMessageMember",
			type:"post",
			data:{"otherNick":$("input[name=selectMember]").val()},
			dataType:"json",
			success:function(data){
				location.href="${path}/member/myPage/message?usid=${loginMember.usid}&otherUsid="+data.usid;
			}
		})
	};

	const msgListSocket=new WebSocket("wss://localhost${path}/msgListSocket");
	
	msgListSocket.onopen=function(){
		msgListSocket.send("messageListOpen");
	};
	
	msgListSocket.onmessage=function(e){
		$("#savedContainer").html('');
		let data=JSON.parse(e.data);
		if(data!=null){
			let msgList=new Array;
			$.each(data, function(i,v){
				msgList[i]=v;
			})
			$.each(msgList,function(i,v){
				let otherUsid=v['otherUsid'];
				let otherProfilePic=v['otherProfilePic'];
				let otherNick=v['otherNick'];
				let latestMsg=v['latestMessage'];
				let latestDate=v['latestDateStr'];
				let myUsid=v['myUsid'];
				if(myUsid=='${loginMember.usid}' || otherUsid=='${loginMember.usid}'){
					let msgBox=$("<div/>").attr({"class":"msgBox","onclick":"location.href='${path}/member/myPage/message?usid=${loginMember.usid}&otherUsid="+otherUsid+"'"});
					let picDiv=$("<div/>").attr("class","picDiv").html($("<img/>").attr("src","${path}/resources/profile_images/"+otherProfilePic));
					let rightDiv=$("<div/>").attr("class","rightDiv");
					let rightTopDiv=$("<div/>").attr("class","rightTopDiv");
					let nickDiv=$("<div/>").attr("class","nickDiv").html(otherNick);
					let dateDiv=$("<div/>").attr("class","dateDiv").html(latestDate);
					let msgDiv=$("<div/>").attr("class","msgDiv").html(latestMsg);
					rightTopDiv.append(nickDiv).append(dateDiv);
					rightDiv.append(rightTopDiv).append(msgDiv);
					msgBox.append(picDiv).append(rightDiv);
					$("#savedContainer").append(msgBox);					
				}
			});
		}
	}
	msgListSocket.onclose=function(){
		console.log('onclose실행');
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>









