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
	.messageBox:hover{
		background-color: #D3D3D3;
	}
</style>
<section id="content">
	<div>
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
			새로운 채팅
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
		<!--상대방 프로필 사진, 가장 최근 메세지, 상대방 닉네임, 날짜-->
<!--
		<c:forEach var="otherInfo" items="${otherInfo}">
		<div class="messageBox" onclick="location.href='${path}/member/myPage/message?usid=${loginMember.usid}&otherUsid=${otherInfo.otherUsid}'">
				<div>
					<img src="<c:out value="${path}/resources/profile_images/${otherInfo.otherProfilePic}"/>" alt="">
				</div>
				<div>
					<c:out value="${otherInfo.otherNick}"/>
				</div>
				<div>
					<c:out value="${otherInfo.latestDate}"/>
				</div>
				<div>
					<c:out value="${otherInfo.latestMessage}"/>
				</div>
			</div>
		</c:forEach>
-->
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

				let msgBox=$("<div/>").attr({"class":"msgBox","onclick":"location.href=${path}/member/myPage/message?usid=${loginMember.usid}&otherUsid="+otherUsid});
				let picDiv=$("<div/>").html($("<img/>").attr("src","${path}/resources/profile_images/"+otherProfilePic));
				let nickDiv=$("<div/>").html(otherNick);
				let dateDiv=$("<div/>").html(latestDate);
				let msgDiv=$("<div/>").html(latestMsg);
				msgBox.append(picDiv).append(nickDiv).append(dateDiv).append(msgDiv);
				$("#savedContainer").append(msgBox);
			})
		}
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>









