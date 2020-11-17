<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
	<section id="content">
		<div>
			<div>

			</div>
			<div>
				<input type="text" id="inputMessage">
				<button type="button" id="sendMessage" onclick="fn_sendMessage()">전송</button>
			</div>
		</div>
	</section>
	<script>
		const memberSocket=new WebSocket("wss://192.168.43.112${path}/memberSocket");
		memberSocket.onopen=function(){
			console.log("onopen => signaling server 연결");
			console.log("닉 : "+"${loginMember.memNickname}");
			var date = new Date();
			sendChat('${loginMember.usid}','',"SYS1",date,"");
		};
		function sendChat(mchatFirstUsid, mchatSecondUsid, mchatContent, mchatDate, mchatFile){
			member.send(JSON.stringify(new MemberChat(mchatFirstUsid, mchatSecondUsid, mchatContent, mchatDate, mchatFile)))
		};
		function memberChat(mchatFirstUsid, mchatSecondUsid, mchatContent, mchatDate, mchatFile){
			this.mchatFirstUsid=mchatFirstUsid;
			this.mchatSecondUsid=mchatSecondUsid;
			this.mchatContent=mchatContent;
			this.mchatDate=mchatDate;
			this.mchatFile=mchatFile;
		}
		memberSocket.onclose=function(){
			consol.log('onclose실행');
		}
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>









