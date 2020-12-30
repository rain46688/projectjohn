<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>재판하는존경장님</title>
	<link rel="icon" type="image/png" href="${path }/resources/images/favicon.ico">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
	<script defer src="http://localhost:3000/socket.io/socket.io.js"></script>
	<script defer src="${path}/resources/js/script.js"></script>
	<link rel="stylesheet" href="${path}/resources/css/layout.css">
	<!-- 글씨체 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
	<!-- 아임포트 -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style>
	div#content *{
		/* border: 1px red solid; */
		font-family: 'Noto Serif KR', serif;
	}
	div#myInfoBox{
		width: 45%;
		margin: 3% auto;
	}
	div#myInfoHeader{
		background-color: #003478;
		color: #ffcc66;
		font-weight: bolder;
		border-top-left-radius: 15px;
		border-top-right-radius: 15px;
		text-align: left;
		padding: 5px 15px;
		font-size: 1.5rem;
	}
	div#myInfoContainer{
		background-color: white;
		border-bottom-left-radius: 15px;
		border-bottom-right-radius: 15px;
		display: flex;
		padding: 5px;
	}
	div#myProfilePic{
		width: 40%;
		display: flex;
		float: left;
		padding: auto;
	}
	div#myProfilePic *{
		width: 10em;
		height: 10em;
		border-radius: 15px;
		display: flex;
		margin: auto;
		max-width: 100%;
	}
	div#myInfo{
		width: 50%;
		display: flex;
		float: right;
		margin: 0px 10px;
		padding: 10px;
		flex-direction: column;
	}
	div#myInfo *{
		text-align: left;
		margin: 3px;
		font-weight: bolder;
	}
	button#chargeBtn{
		margin-left: 1rem;
	}
	div.modal-body{
		padding: 1rem;
	}
	div.modalText{
		padding: 1rem;
		text-align: center;
	}
	label.container{
		border: 1px black solid;
		padding: 0.5rem;
		margin: 0.5rem auto;
		font-size: 1.2rem;
	}
	div#boards{
		clear: both;
		width: 60%;
		margin: auto;
		margin-bottom: 100px;
		border-radius: 10px;
		display: grid;
		grid-template-columns: repeat(3,minmax(30%,auto));
		column-gap: 1rem;
		text-align: center;
	}
	div.board{
		background-color: white;
		border: black 1px solid;
		margin-top: 1.5rem;
		padding: 1rem;
	}
	ion-icon.pageIcon{
		font-size: 5rem;
	}
	img.pageIcon{
		width: 5rem;
		height: 5rem;
	}
	div.boardTitle{
		font-size: 1.2rem;
		margin: 1rem;
	}
	div.boardTitle *{
		text-align: left;
	}
	div.board button{
		margin: 1%;
		margin-top: 0;
	}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<div id="content">
	<div>
		<div id="myInfoBox">
			<div id="myInfoHeader">
				내 정보
			</div>
			<div id="myInfoContainer">
				<div id="myProfilePic">
					<img src="${path }/resources/profile_images/${member.getProfilePic()}">
				</div>
				<div id="myInfo">
					<div>
						이름: ${member.memName}
					</div>
					<div>
						생년월일: ${member.getBirthday() }
					</div>
					<div>
						성별: 
						<c:choose>
							<c:when test="${loginMember.getGender() eq 'F' }">여</c:when>
							<c:otherwise>남</c:otherwise>
						</c:choose>
					</div>
					<div>
						닉네임: ${member.getMemNickname() }
					</div>
					<div>
						회원구분: ${member.getMemClass() }
					</div>
					<div>
						가입일: ${member.getEnrollDate() }
					</div>
					<div>
						포인트: ${member.getPoint() }
						<button type="button" class="btn btn-outline-dark btn-sm" id="chargeBtn" data-toggle="modal" data-target="#chargePoint">충전하기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="chargePoint" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">포인트 충전하기</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div id="radioContainer">
							<div class="modalText">
								충전하신 포인트는 전문가와 상담하기 등에 쓰입니다.
							</div>
							<label class="container">
								<input type="radio" name="money" value="100" checked>
								100
								<span class="checkmark"></span>
							</label>
							<label class="container">
								<input type="radio" name="money" value="5000">
								5000
								<span class="checkmark"></span>
							</label>
							<label class="container">
								<input type="radio" name="money" value="10000">
								10000
								<span class="checkmark"></span>
							</label>
							<label class="container">
								<input type="radio" name="money" value="15000">
								15000
								<span class="checkmark"></span>
							</label>
							<label class="container">
								<input type="radio" name="money" value="20000">
								20000
								<span class="checkmark"></span>
							</label>
							<label class="container">
								<input type="radio" name="money" value="25000">
								25000
								<span class="checkmark"></span>
							</label>
							<label class="container">
								<input type="radio" name="money" value="30000">
								30000
								<span class="checkmark"></span>
							</label>
							<label class="container">
								<input type="radio" name="money" value="35000">
								35000
								<span class="checkmark"></span>
							</label>
							<label class="container">
								<input type="radio" name="money" value="40000">
								40000
								<span class="checkmark"></span>
							</label>
							<label class="container">
								<input type="radio" name="money" value="45000">
								45000
								<span class="checkmark"></span>
							</label>
							<label class="container">
								<input type="radio" name="money" value="50000">
								50000
								<span class="checkmark"></span>
							</label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="fn_chargePoint()">충전하기</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<div id="boards">
			<div class="board">
				<img src="${path}/resources/images/chat.png" class="pageIcon">
				<div class="boardTitle">
					서신함
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/messageList?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<img src="${path}/resources/images/build.png" class="pageIcon">
				<div class="boardTitle">
					회원정보 수정하기
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/updateMemberInfo?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<c:if test="${loginMember.getMemClass() eq '전문가'}">
				<div class="board">
					<img src="${path}/resources/images/build.png" class="pageIcon">
					<div class="boardTitle">
						전문가 정보 수정하기
					</div>
					<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/expertInfoModify?usid=${loginMember.usid}'">이동하기</button>
				</div>
			</c:if>
			<c:if test="${loginMember.getMemClass() eq '전문가'}">
				<div class="board">
					<img src="${path}/resources/images/clipboard.png" class="pageIcon">
					<div class="boardTitle">
						상담 신청받은 내역
					</div>
					<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/expertRequestPrintList?usid=${loginMember.usid}'">이동하기</button>
				</div>
			</c:if>
			<div class="board">
				<img src="${path}/resources/images/clipboard.png" class="pageIcon">
				<div class="boardTitle">
					상담 신청한 내역
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/counselingRequest?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<img src="${path}/resources/images/clipboard.png" class="pageIcon">
				<div class="boardTitle">
					상담 받은 내역
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/counselingHistory?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<img src="${path}/resources/images/list.png" class="pageIcon">
				<div class="boardTitle">
					나의 게시물 내역
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/myBoard?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<img src="${path}/resources/images/heart.png" class="pageIcon">
				<div class="boardTitle">
					좋아요 한 게시물
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/liked?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<div class="board">
				<img src="${path}/resources/images/skull.png" class="pageIcon">
				<div class="boardTitle">
					내 신고 내역
				</div>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/myReport?usid=${loginMember.usid}'">이동하기</button>
			</div>
			<c:if test="${loginMember.getMemClass() eq '일반유저'}">
				<div class="board">
					<img src="${path}/resources/images/driver-license.png" class="pageIcon">
					<div class="boardTitle">
						전문가 신청하기	
					</div>
					<button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${path}/member/myPage/applyExpertPage?usid=${loginMember.usid}'">이동하기</button>
				</div>
			</c:if>
		</div>
	</div>
</div>
<script>
	function fn_chargePoint(){
		var IMP = window.IMP;
        IMP.init('imp53290509');
        var money = $('input[name="money"]:checked').val();
		var usid='${loginMember.usid}';

        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '포인트 충전',
            amount : money,
            buyer_name : '${loginMember.memName}',
            buyer_tel : '${loginMember.tel}',
        }, function(rsp) {
            if ( rsp.success ) {
            	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            	jQuery.ajax({
            		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
            		type: 'POST',
            		dataType: 'json',
            		data: {
        	    		imp_uid : rsp.imp_uid
            		}
            	});
				$.ajax({
                    type: "POST", 
                    url: "${path}/member/chargePoint", //충전 금액값을 보낼 url 설정
                    data: {
                        "point" : money,
						"usid" :usid
                    },
                });
				var msg = '결제가 완료되었습니다.';
				msg += '\n고유ID : ' + rsp.imp_uid;
				msg += '\n상점 거래ID : ' + rsp.merchant_uid;
				msg += '\n결제 금액 : ' + rsp.paid_amount+'원';
				alert(msg);
				close();
				location.href='${path}/member/myPage?usid=${loginMember.usid}';
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                
                alert(msg);
                close();
				location.href='${path}/member/myPage?usid=${loginMember.usid}';
            }
        });
	}
</script>
</body>
</html>