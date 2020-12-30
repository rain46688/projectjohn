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

/* 초기화 */
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
	font-weight:bold;
}

/* 폰트 */
.d-block{
		font-family: 'Noto Serif KR', serif;
}

#downDiv *{
		font-family: 'Noto Serif KR', serif;
}

body * {
	/* border: 1px solid red; */
}

/* 추가 사항 */
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

/* 버튼 */
#exbtn{
	display:flex;
	justify-content:center;
}

body{
	background-color: #062449;
}

.card{
	border: 10px solid #FFCC66;
}

/* 일반 버튼  */
.button-7{
  width:30%;
  height:70%;
  border:2px solid #00316D;
  display:flex;
  justify-content:center;
  align-items:center;
  cursor:pointer;
  position:relative;
  box-sizing:border-box;
  overflow:hidden;
  margin:2%;
}

.button-7 .johnbtn{
  font-size:2vh;
  color:#FFCC66;
  text-decoration:none;
  line-height:50px;
  transition:all .5s ease;
  z-index:2;
  position:relative;
}

.eff-7{
  width:100%;
  height:50px;
  border:70px solid #00316D;
  position:absolute;
  transition:all .5s ease;
  z-index:1;
  box-sizing:border-box;
}

.button-7:hover .eff-7{
  border:0px solid #00316D;
}

.button-7:hover .johnbtn{
  color:#00316D;
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
								<img src="${path }/resources/profile_images/${mem.profilePic}" id="imgProfile" style="width: 150px; height: 150px" class="img-thumbnail" />
							</div>
							<div class="userData ml-3">
								<h2 class="d-block" style="font-size: 1.5rem; font-weight: bold">${mem.memName } 상담사님</h2>
								<c:set var="count" value="${((expert.expertReviewCount) == 0)?1:(expert.expertReviewCount)}" />
									<c:forEach var="i" begin="1" end="${Math.round((expert.expertRating)/(count))}">
												<span class="fa fa-star checked"></span>
											</c:forEach>
											<c:forEach var="i" begin="1" end="${5 - (Math.round((expert.expertRating)/(count)))}">
												<span class="fa fa-star"></span>
											</c:forEach>
								<h6 class="d-block">분야 :${expert.expertCounselArea}</h6>
								<h6 class="d-block">가입 날짜 : ${mem.enrollDate }</h6>
								<h6 class="d-block">이메일 : ${mem.memEmail }</h6>
								<h6 class="d-block">전화번호 : ${mem.tel }</h6>
							</div>
						</div>
					</div>

					<div class="row" id="downDiv">
						<div class="col-12">
							<ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
								<li class="nav-item"><a class="nav-link active" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab"
									aria-controls="basicInfo" aria-selected="true">상담사 정보</a></li>
								<li class="nav-item"><a class="nav-link" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab"
									aria-controls="connectedServices" aria-selected="false">보유 자격증</a></li>
							</ul>
							<div class="tab-content ml-1" id="myTabContent">
								<div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
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
										<div class="col-md-7 col-6">${expert.expertProfile} 년</div>
									</div>
									<hr />

									<div class="row">
										<div class="col-sm-3 col-md-3 col-5">
											<label style="font-weight: bold;">상담 가능 시간</label>
										</div>
										<div class="col-md-7 col-6">${expert.expertCounselStartTime} ~ ${expert.expertCounselEndTime}</div>
									</div>
									<hr />

									<div class="row">
										<div class="col-sm-3 col-md-3 col-5">
											<label style="font-weight: bold;">희망 상담 시간</label>
										</div>
										<div class="col-md-7 col-6">
											<!-- <input type="time" name="time"> -->
											<input name="time" type="datetime-local" value="xxx" min="mm" max="zzz">
										</div>
									</div>
									<hr />

									<div class="row">
										<div class="col-sm-3 col-md-3 col-5">
											<label style="font-weight: bold;">추가 전달 사항</label>
										</div>
										<div class="col-md-7 col-6">
											<textarea id="exapplyTextArea" name="applyText"></textarea>
										</div>
									</div>
									<hr />
									<div id="exbtn">
										<c:if test="${requestIsDuplicate != true}">
													<div class="button-7">
												    <div class="eff-7"></div>
												    <a  class="johnbtn"  onclick="expertRequest();">상담 신청하기</a>
												  </div>	 
											<!-- <button class="btn btn-outline-success" onclick="expertRequest();">상담 신청하기</button> -->
										</c:if>
										<c:if test="${requestIsDuplicate == true}">
											<div class="button-7">
												    <div class="eff-7"></div>
												    <a  class="johnbtn"  onclick="expertRequestCancel();">상담 취소하기</a>
												  </div>	
											<!-- <button class="btn btn-outline-success" onclick="expertRequestCancel();">상담 취소하기</button> -->
										</c:if>
									</div>

								</div>
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
													<img src="${path }/resources/upload/upload_license/${license.licenseFileName }" id="imgProfile" style="width: 150px; height: 150px" class="img-thumbnail" />
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

	// ============================
	// 사이즈 조절
	// ============================
	$(this).resize(fixedSize);
	function fixedSize() {
		this.resizeTo(800, 800);
	}

	// ============================
	// 상담 신청
	// ============================
	function expertRequest() {
		//console.log("상담 신청, ${mem.usid}");

		let result = confirm("상담 신청을 하시겠습니까?\n 전문가가 상담 시작후에는 취소가 불가합니다.");
		
		$.ajax({
					type : "GET",
					data : {
						"no" : "${mem.usid}",
						"nic" : "${mem.memNickname}",
						"time" : $("input[name=time]").val(),
						"applyText" : $("textarea[name=applyText]").val()
					},
					url : "${path}/expert/expertRequest",
					success : function(data) {
						if (data == 1) {
							//console.log("상담 신청 성공");
							alert("상담 신청 성공");
							$("input[name=time]").val("");
							$("textarea[name=applyText]").val("");
							$("#exbtn").html("");
							//$("#exbtn").html($("#exbtn").html()+ "<button class='btn btn-outline-success' onclick='expertRequestCancel();''>상담 취소하기</button>");
							$("#exbtn").html($("#exbtn").html()+ "<div class='button-7'> <div class='eff-7'></div> <a  class='johnbtn'  onclick='expertRequestCancel();'>상담 취소하기</a> </div>");
							
							//알람 발송 - 상담이 추가됬다는 알람 - 해당 전문가가 보는 상담 내역을 갱신해줘야됨
						sendAlarm("${loginMember.usid}","${mem.usid}","expertApply"," ","${loginMember.memNickname}");
						} else if (data == 2) {
							//console.log("이미 상담 신청을 하셨습니다");
							alert("이미 상담 신청을 하셨습니다");
						} else if(data == 9999){
							//console.log("현재 시간보다 과거를 선택했음");
							alert("선택하신 날짜가 맞지 않습니다.");
						}
						 else if(data == 9998){
								//console.log("희망 시간을 선택해주세요.");
								alert("희망 시간을 선택해주세요.");
							}
						else {
							//console.log("상담 신청 실패");
							alert("상담 신청 실패");
						}
					}
				});
	};

	// ============================
	// 상담 신청 취소
	// ============================
	function expertRequestCancel() {
		//console.log("상담 취소, ${mem.usid}");
		$
				.ajax({
					type : "GET",
					data : {
						"no" : "${mem.usid}",
						"nic" : "${mem.memNickname}"
					},
					url : "${path}/expert/expertRequestCancel",
					success : function(data) {
						if (data == 1) {
							//console.log("상담 취소 성공");
							alert("상담 취소 성공");
							//알람 발송 - 상담이 삭제됬다는 알람 - 해당 전문가가 보는 상담 내역을 갱신해줘야됨
							sendAlarm("${loginMember.usid}","${mem.usid}","expertApplyCancel"," ","${loginMember.memNickname}");
							$("#exbtn").html("");
							//$("#exbtn").html("<button class='btn btn-outline-success' onclick='expertRequest();''>상담 신청하기</button>");
							$("#exbtn").html("<div class='button-7'> <div class='eff-7'></div> <a  class='johnbtn'  onclick='expertRequest();'>상담 신청하기</a></div>");
						} else if(data == -1) {
							//console.log("상담이 이미 진행중이라 취소 불가합니다.");
							alert("상담이 이미 진행중이라 취소 불가합니다.");
						}else{
							//console.log("상담 취소 실패");
							alert("상담 취소 실패");
						}
					}
				});
	}
</script>
