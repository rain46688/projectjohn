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
		<!--상대방 프로필 사진, 가장 최근 메세지, 상대방 닉네임, 날짜-->
		<c:forEach var="otherInfo" items="${otherInfo}">
		<div class="messageBox" ondblclick="location.href='${path}/member/myPage/message?myUsid=${loginMember.usid}&otherUsid=${otherInfo.otherUsid}'">
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
						let div=$("<div/>").attr("class","result");;
						let otherProfilePic=$("<img/>").attr("src","${path}/resources/profile_images/"+v['profilePic']);
						let otherNick=$("<div/>").html(v['memNickname']);
						let radioBtn=$("<input/>").attr({"type":"radio","name":"selectMember","value":v['profilePic']});
						div.append(otherProfilePic).append(otherNick);
						container.append(div);
					})
					$("#searchResult").html(container);
				}
			}
		})
	})
	function fn_selectMember(){
		$.ajax({
			url:"{path}/member/myPage/message",
			type:"post",
			data:{"otherNick":$("input[name='selectMember']:checked").val()},
		})
	};
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>









