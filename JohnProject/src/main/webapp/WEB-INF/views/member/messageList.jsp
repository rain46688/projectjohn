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
		overflow: auto;
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
	input#newNick{
		width: 100%;
		outline: none;
        border: black solid 1px;
        background-color: white;
        width: 60%;
        height: 2.5rem;
        margin: 10px 20%;
		margin-bottom: 5px;
        padding: 5px;
        box-sizing: border-box;
        font-size: 1rem;
	}
	div.result{
		overflow: auto;
		clear: both;
		padding: 0.5rem;
		border: 1px black solid;
		display: grid;
		grid-template-columns: 5rem 15rem 3rem;
		column-gap: 0.5rem;
		text-align: center;
		justify-items: center;
		margin-bottom: 0.5rem;
	}
	div.searchPic{
		overflow: auto;
		margin-left: 2rem;
	}
	img.picImg{
		height: 3rem;
		width: 3rem;
		max-width: 100%;
		border-radius: 15px;
	}
	div.searchNick{
		text-align: left;
		min-width: 15rem;
		font-size: 1.2rem;
		padding: 0.6rem;
	}
	div.searchRadio{
		min-width: 3rem;
		margin-right: 1rem;
		padding: 0.8rem;
	}
	input[type="radio"]{
		font-size: 1.5rem;
		width: 1.5rem;
		height: 1.5rem;
	}
</style>
<section id="content">
	<div id="newChatContainer">
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newChat">
			<ion-icon name="add-circle" id="newChatIcon"></ion-icon>
			<div>
				새로운 채팅
			</div>
		</button>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="newChat" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">존경장 검색하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="text" id="newNick" placeholder="닉네임을 입력해주세요.">
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
					let container=$("<div/>").attr("class","container");
					$.each(data,function(i,v){
						if(v['usid']!='${loginMember.usid}'){
							if(v['leaveMem']=='1'){
								let div=$("<div/>").attr("class","result");
								let otherProfilePic=$("<div/>").attr("class","searchPic").html($("<img/>").attr({"src":"${path}/resources/profile_images/"+v['profilePic'],"class":"picImg"}));
								let otherNick=$("<div/>").attr({"class":"searchNick"}).html('탈퇴한 회원입니다.');
								let radioBtn=$("<div/>").attr("class","searchRadio").html($("<input/>").attr({"type":"radio","name":"selectMember","disabled":"true"}));
								div.append(otherProfilePic).append(otherNick).append(radioBtn);
								container.append(div);
							}else{
								let div=$("<div/>").attr("class","result");
								let otherProfilePic=$("<div/>").attr("class","searchPic").html($("<img/>").attr({"src":"${path}/resources/profile_images/"+v['profilePic'],"class":"picImg"}));
								let otherNick=$("<div/>").attr({"class":"searchNick"}).html(v['memNickname']);
								let radioBtn=$("<div/>").attr("class","searchRadio").html($("<input/>").attr({"type":"radio","name":"selectMember","value":v['memNickname']}));
								div.append(otherProfilePic).append(otherNick).append(radioBtn);
								container.append(div);
							}
						}
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
			data:{"otherNick":$('input[name="selectMember"]:checked').val()},
			dataType:"json",
			success:function(data){
				location.href="${path}/member/myPage/message?usid=${loginMember.usid}&otherUsid="+data.usid;
			}
		})
	};

	const memberSocket=new WebSocket("wss://rclass.iptime.org${path}/memberSocket");
	//const memberSocket=new WebSocket("wss://localhost${path}/memberSocket");

	memberSocket.onopen=function(){
		memberSocket.send("messageOnOpen");
	};
	
	memberSocket.onmessage=function(e){
		$("#savedContainer").html('');
		let data=JSON.parse(e.data);
		if(data!=null){
			let msgList=new Array;
			$.each(data, function(i,v){
				msgList[i]=v;
			})
			let usidList=new Array();
			$.each(msgList,function(i,v){
				let firstUsid=v['mchatFirstUsid'];
				let secondUsid=v['mchatSecondUsid'];
				if(firstUsid=='${loginMember.usid}' || secondUsid=='${loginMember.usid}'){
					// 수신인이 나
					if(firstUsid!='${loginMember.usid}' && secondUsid=='${loginMember.usid}'){
						let otherUsid=firstUsid;
						if(!usidList.includes(otherUsid)){
							usidList.push(otherUsid);
						}
					}
					// 발신인이 나
					if(firstUsid=='${loginMember.usid}' && secondUsid!='${loginMember.usid}'){
						let otherUsid=secondUsid;
						if(!usidList.includes(otherUsid)){
							usidList.push(otherUsid);
						}
					}
				}
			});

			let otherInfo=new Array();
			let ourChat=new Array();
			ourChat[i]=new Array();
			for(var i in usidList){
				let loginUsid='${loginMember.usid}';
				let otherUsid=usidList[i];
				$.each(msgList,function(index,value){
					let firstUsid=value['mchatFirstUsid'];
					let secondUsid=value['mchatSecondUsid'];
					if((firstUsid==loginUsid && secondUsid==otherUsid) || (firstUsid==otherUsid && secondUsid==loginUsid)){
						ourChat[i]=value;
					}
				});
			}

			function date_descending(a, b) {
				var dateA = new Date(a['mchatDateString'].concat(":00"));
				var dateB = new Date(b['mchatDateString'].concat(":00"));
				return dateA < dateB ? 1 : -1;
			};
			ourChat.sort(date_descending);

			$.each(ourChat,function(i,v){
				let firstUsid=v['mchatFirstUsid'];
				let secondUsid=v['mchatSecondUsid'];
				let otherUsid;
				let otherProfilePic;
				let otherNick;
				// if(firstUsid=='${loginMember.usid}' || secondUsid=='${loginMember.usid}'){
					// 수신인이 나
					if(firstUsid!='${loginMember.usid}' && secondUsid=='${loginMember.usid}'){
						otherUsid=firstUsid;
						otherProfilePic=v['firstProfilePic'];
						otherNick=v['firstNick'];
					}
					// 발신인이 나
					if(firstUsid=='${loginMember.usid}' && secondUsid!='${loginMember.usid}'){
						otherUsid=secondUsid;
						otherProfilePic=v['secondProfilePic'];
						otherNick=v['secondNick'];
					}
				// }
				let latestMsg=v['mchatContent'];
				let latestDate=v['mchatDateString'];

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
			})
		}
	}
	memberSocket.onclose=function(){
	}
</script>
</body>
</html>