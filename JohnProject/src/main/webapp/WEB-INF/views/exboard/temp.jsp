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

<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Splide library -->
<script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/js/splide.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/splide.min.css">
<%-- <link rel="stylesheet" href="${path }/resources/css/splide-core.min.css"> --%>
<%-- <link rel="stylesheet" href="${path }/resources/css/splide-default.min.css"> --%>
<link rel="stylesheet" href="${path }/resources/css/splide-sea-green.min.css">
<%-- <link rel="stylesheet" href="${path }/resources/css/splide-skyblue.min.css"> --%>

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
	
}

/* 위 div */
#upDiv * {
 	border: 1px solid red; 
	/* text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px #BFBFBF; */
}

/* 아래 div */
#downDiv * {
	 border: 1px solid red; 
	/* text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px #BFBFBF; */
}

/* 위 div */
#upDiv {
/* 	border: 1px solid gray;
	margin:0.5% 0 0.5% 0;
	border-radius:0.5em; */
	width: 100%;
	height: 60%;
	/* 	background-color:black; */
}

/* 아래 div */
#downDiv {
	/* 	border: 1px solid brown; */
	width: 100%;
	height: 40%;
	/* background-color: brown; */
	display: flex;
	border-top: 1px solid #C6C5C5;
}

/* 리뷰 div */
#reviewDiv {
	/*  background-color: red;  */
	height: 100%;
	width: 50%;
	border-right: 1px solid #C6C5C5;
}

/* 카테고리 div */
#categoryDiv {
	/* background-color: blue; */
	height: 100%;
	width: 50%;
}

/* 가로 슬라이드 */
.splide {
	height: 100%;
}

.splide__track * {
	height: 100%;
}

.splide__slide>div {
	width: 100%;
	height: 100%;
	font-size: 20px;
	margin: 10px;
	/* 	border: 1px solid black; */
	display: inline-block;
}

#upDiv .splide__list .splide__slide {
	margin: 1px;
}

/* 슬라이드 이미지 */
img {
	width: 100%; 
	height: auto;
}

/* 세로 슬라이드  */
.splide2 {
	width: 100%;
	height: 100%;
}

.splide__slide {
	width: 100%;
	height: 100%;
	border-left: 1px solid gray;
}

.splide__slide>img {
	width: 100%;
	height: 100%;
}

#downDiv .splide__arrow, #downDiv .splide__pagination {
	display: none;
}

/* 카테고리 부분 */
#categoryDiv {
	padding: 20px;
	font-family: sans-serif;
	/* background: #f2f2f2; */
	overflow-x: hidden;
	-ms-overflow-style: none;
}

/* 스크롤 바 투명하게 만들기 */
::-webkit-scrollbar {
	display: none;
}

/* 카테고리 그리드 */
.grid-container {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	grid-gap: 1em;
}

/* 카테고리 그리드 이미지 */
.counsel-image {
	line-height: 0;
	overflow: hidden;
}

.counsel-image img {
	filter: blur(0px);
	transition: filter 0.3s ease-in;
	transform: scale(1.1);
}

/* 카테고리 제목 */
.counsel-title {
	cursor: pointer;
	font-size: 2.5em;
	font-weight: bold;
	text-decoration: none;
	z-index: 1;
	position: absolute;
	height: 100%;
	width: 100%;
	top: 0;
	left: 0;
	opacity: 0;
	transition: opacity .5s;
	/* background: rgba(90, 0, 10, 0.4); */
	color: black;
	/* position the text in t’ middle*/
	display: flex;
	align-items: center;
	justify-content: center;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px #BFBFBF;
}

.counsel-listing:hover .counsel-title {
	opacity: 1;
}

.counsel-listing:hover .counsel-image img {
	filter: blur(0.5em);
}

@media ( hover : none) {
	.counsel-title {
		opacity: 1;
	}
	.counsel-image img {
		filter: blur(2px);
	}
}

/* 카테고리 그리드 */
.counsel-listing {
 	position: relative;
}

.cImgages {
	/* border:1px solid black; */
	width: 100%;
	height: 180px; 
}

/* 별 */
.checked {
	color: orange;
}

/* 카드  */
.expertimg {
	width: 40%;
	height: 50%;
}

/* 카드 오른쪽 div  */
.exRight {
	display: inline-block;
	height: 50%;
	width: 50%;
}

/* 카드 오른쪽 이름  */
.exName {
	height: 20%;
}

/* 카드 오른쪽 점수  */
.exRating {
	height: 20%;
	font-size: 1.6vh;
	overflow:hidden;
}

/* 카드 오른쪽 전문 분야  */
.exCounselArea{
	height:20%;
	font-size: 2vh;
	overflow:hidden;
}

/* 카드 오른쪽 버튼  */
.card-body button {
	width: 100%;
	height: 40%;
	font-size: 2vh;
}

/* 카드 자기소개  */
.exBottm {
	padding-top: 2vh;
	height: 50%;
	/* 줄 넘치면 ..으로 처리 */
	display: -webkit-box;
	-webkit-line-clamp: 9;
	text-overflow: ellipsis;
	overflow: hidden;
	-webkit-box-orient: vertical;
	font-size: 2vh;
}

/* 리뷰 부분 */
.reviewDiv {
	padding: 2%;
	width: 100%;
	height: 100%;
	/* background-color: skyblue;  */
}

/* 리뷰 위 div  */
.reviewInnerUpDiv {
	height: 10%;
	width: 100%;
	display: flex;
}

/* 리뷰한사람 닉네임  */
.userNickName {
	height: 100%;
	width: 20%;
	border-right: 1px solid #C6C5C5;
	margin-right: 2vh;
}

/* 리뷰한 날짜 */
.counselDate {
	height: 100%;
	width: 30%;
	border-right: 1px solid #C6C5C5;
	margin-right: 2vh;
}

/* 리뷰 카테고리 */
.counselAreaReview {
	height: 100%;
	width: 50%;
}

/* 리뷰 점수 */
.userRating {
	height: 10%;
	border-bottom: 1px solid #C6C5C5;
}

/* 리뷰 제목 */
#reviewDivTitle {
	height: 20%;
	width: 100%;
}

/* 리뷰 제목 */
#reviewTitleH1 {
	font-size: 40px;
	font-weight: bold;
}

/* 리뷰 내용 */
.userReview {
	height: 80%;
	width: 100%;
	font-style: italic;
	color: gray;
	font-size: 2vh;
	/* 줄 넘치면 ..으로 처리 */
	display: -webkit-box;
	-webkit-line-clamp: 6;
	text-overflow: ellipsis;
	overflow: hidden;
	-webkit-box-orient: vertical;
}

/* 빈값 */

.empty{
	width:100%;
	font-size:4vh;
	padding-top:15vh;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px #BFBFBF;
}

.emptyReview{
	width:100%;
	height:100%;
	font-size:5vh;
	padding-top:15vh;
	text-align:center;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px #BFBFBF;
}
</style>

<section id="content">
	<div id="upDiv">
		<div class="splide">
			<div class="splide__track">
				<ul class="splide__list">
					<c:choose>
						<c:when test="${fn:length(list) > 0}">
							<c:forEach items="${list }" var="expert">

								<!-- =========== -->
								<li class="splide__slide">
									<div class="card-body">
										<img class="expertimg" alt="전문가" src="${path }/resources/images/expert.png">
										<div class="exRight">
											<div class="exName">${expert['mem'].memName}</div>
											<div class="exRating">
											평점 : 
											<c:forEach var="i" begin="1" end="${expert['ex'].expertRating}">
												<span class="fa fa-star checked"></span>
											</c:forEach>
											<c:forEach var="i" begin="1" end="${5 - (expert['ex'].expertRating)}">
												<span class="fa fa-star"></span>
											</c:forEach>
											</div>
											<div class="exCounselArea">분야 : ${expert['ex'].expertCounselArea}</div>
											<button type="button" class="btn btn-outline-primary" onclick="counsel('${expert['mem'].usid}','${expert['mem'].memNickname}');">상담 신청</button>
										</div>
										<div class="exBottm">
										<c:if test="${empty (expert['ex'].expertGreetings)}">
										인사말 없음.
										</c:if>
										<c:if test="${not empty (expert['ex'].expertGreetings)}">
										${expert['ex'].expertGreetings}
										</c:if>
										</div>
									</div>
								</li>
								<!-- =========== -->

							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="empty"><h1>등록된 상담사가 없습니다.</h1></div>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</div>
	</div>

	<div id="downDiv">
		<div id="reviewDiv">
		
						<c:choose>
						<c:when test="${fn:length(exbolist) > 0}">
							<div class="splide2">
				<div class="splide__track">
					<ul class="splide__list">
							<c:forEach items="${exbolist }" var="review">


						<!-- =========== -->
						<li class="splide__slide">
							<div class="reviewDiv">
								<div id="reviewDivTitle">
									<h1 id="reviewTitleH1">베스트 상담 후기</h1>
								</div>
								<div class="reviewInnerUpDiv">
									<div class="userNickName">닉네임 : ${review.expertBoardMemNick }</div>
									<div class="counselDate">날짜 : ${review.expertBoardDate }</div>
									<div class="counselAreaReview">분야 : ${param.ca }</div>
								</div>
								<div class="userRating">
									평점 : 
									<c:forEach var="i" begin="1" end="${review.expertBoardRating}">
												<span class="fa fa-star checked"></span>
											</c:forEach>
											<c:forEach var="i" begin="1" end="${5 - (review.expertBoardRating)}">
												<span class="fa fa-star"></span>
											</c:forEach>
								</div>
								<div class="userReview">${review.expertBoardReview}</div>
							</div>
						</li>	
						<!-- =========== -->
					</c:forEach>
						</ul>
				</div>
			</div>
						</c:when>
						<c:otherwise>
							<div class="emptyReview"><h1>등록된 리뷰가 없습니다.</h1></div>
						</c:otherwise>
					</c:choose>

				
		</div>
		<div id="categoryDiv">

			<div class="child-page-listing">
				<div class="grid-container">
					<article id="3685" class="counsel-listing">
						<h3 class="counsel-title">직장 상담</h3>
						<div class="counsel-image">
							<img class="cImgages" src="${path }/resources/images/직장 상담.jpg" alt="직장">
						</div>
					</article>
					<article id="3688" class="counsel-listing">
						<h3 class="counsel-title">부부 상담</h3>
						<div class="counsel-image">
							<img class="cImgages" src="${path }/resources/images/부부 상담.jpg" alt="부부">
						</div>
					</article>
					<article id="3691" class="counsel-listing">
						<h3 class="counsel-title">진로 상담</h3>
						<div class="counsel-image">
							<img class="cImgages" src="${path }/resources/images/취업 상담.png" alt="취업">
						</div>
					</article>
					<article id="3694" class="counsel-listing">
						<h3 class="counsel-title">심리 상담</h3>
						<div class="counsel-image">
							<img class="cImgages" src="${path }/resources/images/심리 상담.jpg" alt="심리">
						</div>
					</article>
					<article id="3697" class="counsel-listing">
						<h3 class="counsel-title">자녀 상담</h3>
						<div class="counsel-image">
							<img class="cImgages" src="${path }/resources/images/자녀 갈등.png" alt="자녀">
						</div>
					</article>
					<article id="3700" class="counsel-listing">
						<h3 class="counsel-title">연애 상담</h3>
						<div class="counsel-image">
							<img class="cImgages" src="${path }/resources/images/연애 상담.jpg" alt="연애">
						</div>
					</article>
				</div>
			</div>

		</div>
	</div>
</section>


<script>
	'use strict';
	
		//부모창이 종료되면 자식창도 종료
		let pop;
		window.onunload = function() { 
			pop.close(); 
		  
		}
		
	 function counsel(no,nic){
		 console.log("no : "+no+" nic : "+nic);
		 window.open("${path}/expert/expertApply?no="+no+"&nic="+nic,'회원','width=800, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes');
	 }
	 
	 $(".counsel-title").click(e => {
			console.log($(e.target).html());
			location.href="${path}/expert/expertPrintList?ca="+$(e.target).html();
	 });
	 
	// 가로 슬라이드
	new Splide('.splide', {
		perPage : 4,
		rewind : true,
		autoplay : true,
		type : 'loop'
	}).mount();

	// 세로 슬라이드
	new Splide('.splide2', {
		direction : 'ttb',
		height : "33vh",
		rewind : true,
		autoplay : true,
		type : 'loop'
	}).mount();
	 
</script>
