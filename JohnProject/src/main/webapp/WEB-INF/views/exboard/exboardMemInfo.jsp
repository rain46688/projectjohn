<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script async src="${path}/resources/js/header.js"></script>
<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em,
	ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
	caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby,
	section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
}

body * {
	border: 1px solid red;
}

#exapplyTextArea {
	width:100%;
	height:20vh;
}

/* 위 텍스트 영역 눌르면 옆에 테두리 생기는거 지우는 용도 */
textarea:focus {
	outline: none;
}

textarea {
    resize: none;
}

#exbtn{
	display:flex;
	justify-content:center;
}


/* 별 */
.checked {
	color: orange;
}

</style>

<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="card-title mb-4">
						<div class="d-flex justify-content-start">
							<div class="image-container">
								<img src="${path }/resources/images/expert.png" id="imgProfile" style="width: 150px; height: 150px" class="img-thumbnail" />
							</div>
							<div class="userData ml-3">
							<c:if test="${not empty expert}">
								<h2 class="d-block" style="font-size: 1.5rem; font-weight: bold">${mem.memName } 상담사님</h2>
								<h6 class="d-block">평점 :
									<c:forEach var="i" begin="1" end="${expert.expertRating}">
												<span class="fa fa-star checked"></span>
											</c:forEach>
											<c:forEach var="i" begin="1" end="${5 - (expert.expertRating)}">
												<span class="fa fa-star"></span>
											</c:forEach>
								</h6>
								<h6 class="d-block">분야 :${expert.expertCounselArea}</h6>
								<h6 class="d-block">가입날짜 : ${mem.enrollDate }</h6>
								<h6 class="d-block">이메일 : ${mem.memEmail }</h6>
								<h6 class="d-block">전화번호 : ${mem.tel }</h6>
								</c:if>
								
								<c:if test="${empty expert}">
								<h2 class="d-block" style="font-size: 1.5rem; font-weight: bold">${mem.memName }님</h2>
								<h6 class="d-block">닉네임 : ${mem.memNickname }</h6>
								<h6 class="d-block">성별 : ${mem.gender }</h6>
								</c:if>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-12">
							<ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
								<c:if test="${not empty expert}">
								<li class="nav-item"><a class="nav-link active" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab"
									aria-controls="basicInfo" aria-selected="true">상담사 정보</a></li>
								<li class="nav-item"><a class="nav-link" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab"
									aria-controls="connectedServices" aria-selected="false">보유 자격증</a></li>
									</c:if>
								<c:if test="${empty expert}">	
									<li class="nav-item"><a class="nav-link active" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab"
									aria-controls="basicInfo" aria-selected="true">회원 정보</a></li>
								</c:if>
							</ul>
							
							<div class="tab-content ml-1" id="myTabContent">
								<div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
									
									<c:if test="${empty expert}">
												<div class="row">
										<div class="col-sm-3 col-md-3 col-5">
											<label style="font-weight: bold;">생년월일</label>
										</div>
										<div class="col-md-7 col-6">${mem.birthday }</div>
									</div>
									<hr />
									<div class="row">
										<div class="col-sm-3 col-md-3 col-5">
											<label style="font-weight: bold;">가입 날짜</label>
										</div>
										<div class="col-md-7 col-6">${mem.enrollDate }</div>
									</div>
									<hr />

									<div class="row">
										<div class="col-sm-3 col-md-3 col-5">
											<label style="font-weight: bold;">이메일</label>
										</div>
										<div class="col-md-7 col-6">${mem.memEmail }</div>
									</div>
									<hr />

									<div class="row">
										<div class="col-sm-3 col-md-3 col-5">
											<label style="font-weight: bold;">전화번호</label>
										</div>
										<div class="col-md-7 col-6">
												 ${mem.tel }
										</div>
									</div>
									<hr />
									</c:if>
									
									<c:if test="${not empty expert}">
									<div class="row">
										<div class="col-sm-3 col-md-3 col-5">
											<label style="font-weight: bold;">인사말</label>
										</div>
										<div class="col-md-7 col-6">${expert.expertGreetings}</div>
									</div>
									<hr />
									<div class="row">
										<div class="col-sm-3 col-md-3 col-5">
											<label style="font-weight: bold;">상담 경력</label>
										</div>
										<div class="col-md-7 col-6">${expert.expertProfile}</div>
									</div>
									<hr />

									<div class="row">
										<div class="col-sm-3 col-md-3 col-5">
											<label style="font-weight: bold;">상담 가능 시간</label>
										</div>
										<div class="col-md-7 col-6">${expert.expertCounselStartTime} ~ ${expert.expertCounselEndTime}</div>
									</div>
									<hr />
									</c:if>
									

								</div>
								<c:if test="${not empty expert}">
								<div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
								
										<c:choose>
										<c:when test="${fn:length(license) > 0}">
										<c:forEach items="${license }" var="license">
								
									<!--  -->
									<div class="row">
										<div class="col-sm-3 col-md-3 col-5">
											<label style="font-weight: bold;">자격증</label>
										</div>
										<div class="col-md-7 col-6">
										<!-- 자격증 이미지 넣어야됨! -->
												<div class="image-container">
													<img src="${path }/resources/images/expert.png" id="imgProfile" style="width: 150px; height: 150px" class="img-thumbnail" />
												</div>
												<h6 class="d-block">자격증 종류 : ${license.licenseType }</h6>
												<h6 class="d-block">자격증 발급일 : ${license.licenseDate }</h6>
												<h6 class="d-block">자격증 인증 기관 : ${license.licenseCompany }</h6>
												<h6 class="d-block"></h6>
										</div>
									</div>
									<hr />
									<!--  -->
									
										</c:forEach>
										</c:when>
										<c:otherwise>
											<div class="empty"><h1>등록된 자격증이 없습니다.</h1></div>
										</c:otherwise>
									</c:choose>
									
									
								</div>
								</c:if>
								
								
							</div>
						</div>
					</div>


				</div>

			</div>
		</div>
	</div>
</div>


<script>
	'use strict';

	$(this).resize(fixedSize);
	function fixedSize() {
		this.resizeTo(800, 800);
	}
</script>
