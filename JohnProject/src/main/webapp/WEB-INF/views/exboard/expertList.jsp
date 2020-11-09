<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" " />
</jsp:include>

<style>

/* 카드  */

#expertimg {
	width: 40%;
	height: 50%;
}

.layout-margin-8 {
	margin: 0% 20%;
}

.card-img-top-custom {
	width: 50%;
	margin: 0 auto;
}

.card-title {
	text-align: center;
}

.card-shadow {
	-webkit-box-shadow: 0px 0px 28px 14px rgba(232, 232, 232, 1);
	-moz-box-shadow: 0px 0px 28px 14px rgba(232, 232, 232, 1);
	box-shadow: 0px 0px 28px 14px rgba(232, 232, 232, 1);
}

.card-deck {
	display: flex;
	justify-content: space-around;
	flex-flow: row wrap;
	align-items: stretch;
}

.card {
	padding: 2% 1%;
	border: none;
	max-width: 30%;
	height: 450px;
	flex-grow: 1;
}

/* 슬라이드  */

@media ( max-width : 300px) {
	.carosel-item {
		width: 100%;
	}
}

@media ( min-width : 300px) {
	.carosel-item {
		width: 50%;
	}
}

@media ( min-width : 500px) {
	.carosel-item {
		width: 33.333%;
	}
}

@media ( min-width : 768px) {
	.carosel-item {
		width: 25%;
	}
}

.carosel {
	position: relative;
	background-color: #000;
}

.carosel-inner {
	white-space: nowrap;
	overflow: hidden;
	font-size: 0;
}

.carosel-item {
	display: inline-block;
}

.carosel-control {
	text-align:center;
	position: absolute;
	top: 50%;
	padding: 10px;
	box-shadow: 0 0 10px 0px rgba(0, 0, 0, 0.5);
	transform: translateY(-50%);
	border-radius: 20%;
	color: rgba(180, 180, 180, 0.5);
	font-size: 25px;
}

.carosel-control-left {
	left: 15px;
}

.carosel-control-right {
	right: 15px;
}

.carosel-control:active, .carosel-control:hover {
	text-decoration: none;
	color: rgba(0, 0, 0, 0.8);
}

.cal {
	display: inline-block;
}
</style>

<section id="content">

	리스트<br>
	<p>세션 : ${loginnedMember.nickname}</p>
		<p>전문가 : ${loginnedMember.expert}</p>
	<p>USID : ${loginnedMember.sessionUsid}</p>
	<br>


	<div class="carosel" id="carosel1">
		<a class="carosel-control carosel-control-left glyphicon glyphicon-chevron-left" href="#"></a>

		<div class="carosel-inner">

			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="e">
						<div class="card card-shadow text-center carosel-item">
							<div class="card-body">
								<img id="expertimg" alt="ㅈ문가" src="${path }/resources/images/expert.png">
								<h4 class="card-title">${e.mem_name}</h4>
								<p class="card-text">${e.mem_class}</p>
								<div class="dropdown-divider"></div>
								<p class="card-text">
									<small class="text-muted">평점 : ${e.expert_rating}</small>
								</p>
								<a href="${path}/expertApply?no=${e.usid}">
									<button type="button" class="btn btn-outline-primary">상담 신청</button>
								</a>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="empty">등록된 전문가가 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
		<a class="carosel-control carosel-control-left glyphicon glyphicon-chevron-left" href="#">◁</a>
		<a class="carosel-control carosel-control-right glyphicon glyphicon-chevron-right" href="#">▷</a> 
	</div>


</section>

<script>
	$('.carosel-control-right').click(
			function() {
				$(this).blur();
				$(this).parent().find('.carosel-item').first().insertAfter(
						$(this).parent().find('.carosel-item').last());
			});
	$('.carosel-control-left').click(
			function() {
				$(this).blur();
				$(this).parent().find('.carosel-item').last().insertBefore(
						$(this).parent().find('.carosel-item').first());
			});
</script>
