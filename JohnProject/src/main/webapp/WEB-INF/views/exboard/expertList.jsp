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
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
	font-family: 'Noto Serif KR', serif;
}

#headerAndContent{
	background-color:#062449;
}

#content{
	background-color:#062449;
	padding-bottom:1%;
}

/* 위 div */
#upDiv * {
/* 	border: 1px solid red; */
}

/* 아래 div */
#downDiv * {
	/* border: 1px solid red;  */
}

/* 위 div */
#upDiv {
	width: 100%;
	height: 58%;
/* 	display:flex;
	justify-content:center; */

}

/* 아래 div */
#downDiv {
	width: 100%;
	height: 40%;
	display: flex;
	/* border-top: 1px solid #C6C5C5; */
	padding:0 5vh 0 5vh;
}

/* 리뷰 div */
#reviewDiv {
	height: 100%;
	width: 50%;
	/* border-right: 1px solid #C6C5C5; */
	padding-right:1vh;
}

/* 카테고리 div */
#categoryDiv {
	height: 105.45%;
	width: 50%;
	background-color:white;
	/* margin:0 3% 0 0; */
	border: 10px solid #FFCC66;
	padding-left:1vh;
}

/* 가로 슬라이드 */
.splide {
	height: 100%;
}

#reviewDiv .splide__track{
		width:100%;
		height:100%;
}

.splide__track{
	/* 수정 */
	background-color:white;
	/* border-radius:2%; */
	border: 10px solid #FFCC66;
}

.splide__track * {
	height: 100%;
}

.splide__slide>div {
	width: 100%;
	height: 100%;
	font-size: 20px;
	margin: 10px;
	display: inline-block;

}

#upDiv .splide__list .splide__slide {
	margin: 1px;
}

/* 슬라이드 이미지 */
.expertimg {
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
	/* 수정 */
	/* border-left: 1px solid #C6C5C5; */
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
	/* grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); */
	grid-template-columns: repeat(auto-fill, minmax(20vh, 1fr));
	/* 간격 */
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
	color: black;
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
	width: 100%;
	height: 13vh;
	/* height: 180px; */
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
	padding: 0 0 0 3%;
	margin:3% 0 3% 0;
}

/* 카드 오른쪽 이름  */
.exName {
	height: 20%;
	font-size: 2vh;
}

/* 카드 오른쪽 점수  */
.exRating {
	height: 20%;
	font-size: 2vh;
	overflow: hidden;
}

/* 카드 오른쪽 전문 분야  */
.exCounselArea {
	height: 20%;
	font-size: 2vh;
	overflow: hidden;
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
	padding: 1%;
	width: 100%;
	height: 50%;

}


/* 리뷰 위 div  */
.reviewInnerUpDiv {
	height: 10%;
	width: 100%;
	display: flex;
	font-size:90%;
}

/* 리뷰한사람 닉네임  */
.userNickName {
	height: 100%;
	width: 40%;
	border-right: 1px solid #C6C5C5;
	margin-right: 1vh;
}

/* 리뷰한 날짜 */
.counselDate {
	height: 100%;
	width: 30%;
	border-right: 1px solid #C6C5C5;
	margin-right: 1vh;
}

/* 리뷰 카테고리 */
.counselAreaReview {
	height: 100%;
	width: 20%;
}

/* 리뷰 점수 */
.userRating {
	margin-top: 1%;
	height: 15%;
	border-bottom: 1px solid #C6C5C5;
}

/* 리뷰 제목 */
#reviewDivTitle {
	height: 20%;
	width: 100%;
	margin-bottom: 2%;
}

/* 리뷰 제목 */
#reviewTitleH1 {
	font-size: 4vh;
	font-weight: bold;
}

/* 리뷰 내용 */
.userReview {
	height: 40%;
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
#emptyupdiv {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.empty {
	width: 95%;
	height: 70%;
	font-size: 3vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color:white;
	 border: 10px solid #FFCC66;
}

.emptyReview {
	width: 100%;
	height: 105%;
	font-size: 3vh;
	padding-top: 15vh;
	text-align: center;
	background-color:white;
	border: 10px solid #FFCC66;
}

.button-8{
  width:100%;
  height:50px;
  border:2px solid #00316D;
  text-align:center;
  cursor:pointer;
  position:relative;
  box-sizing:border-box;
  overflow:hidden;
/*   margin: 4vh 0 0 0; */
}

.button-8 .johnbtn{
  font-size:2vh;
  color:#FFCC66;
  text-decoration:none;
  line-height:50px;
  transition:all .5s ease;
  z-index:2;
  position:relative;
}

.eff-8{
  width:100%;
  height:50px;
  border:70px solid #00316D;
  position:absolute;
  transition:all .5s ease;
  z-index:1;
  box-sizing:border-box;
}

.button-8:hover .eff-8{
  border:0px solid #00316D;
}
.button-8:hover .johnbtn{
  color:#00316D;
}

</style>

<section id="content">
	<div id="upDiv">



		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<div class="splide">
					<div class="splide__track">
						<ul class="splide__list">
							<c:forEach items="${list }" var="expert">

								<!-- =========== -->
								<li class="splide__slide">
									<div class="card-body">
										<img class="expertimg" alt="전문가" src="${path }/resources/profile_images/${expert['mem'].profilePic}">
										<div class="exRight">
											<div class="exName">${expert['mem'].memName}</div>
											<c:set var="count" value="${((expert['ex'].expertReviewCount) == 0)?1:(expert['ex'].expertReviewCount)}" />
											<div class="exRating">
												평점 :
												<c:forEach var="i" begin="1" end="${Math.round((expert['ex'].expertRating)/(count))}">
													<span class="fa fa-star checked"></span>
												</c:forEach>
												<c:forEach var="i" begin="1" end="${5 - (Math.round((expert['ex'].expertRating)/(count)))}">
													<span class="fa fa-star"></span>
												</c:forEach>
											</div>

											<%-- 			
											<div class="exCounselArea"><p>카운트 : ${(expert['ex'].expertReviewCount)}</p></div>
											<div class="exCounselArea"><p>점수 : ${(expert['ex'].expertRating)}</p></div>
											<div class="exCounselArea">	<p>확ㅇ : ${Math.round((expert['ex'].expertRating)/(expert['ex'].expertReviewCount))}</p></div>
											 --%>

											<div class="exCounselArea">분야 : ${expert['ex'].expertCounselArea}</div>
											
											<%-- <button type="button" class="btn btn-outline-primary" onclick="counsel('${expert['mem'].usid}','${expert['mem'].memNickname}');">상담
												신청</button> --%>
												
											  <div class="button-8">
												    <div class="eff-8"></div>
												    <a class="johnbtn" onclick="counsel('${expert['mem'].usid}','${expert['mem'].memNickname}');">상담 신청</a>
												  </div>	
												  
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
						</ul>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div id="emptyupdiv">
					<div class="empty">
						<h1>등록된 상담사가 없습니다.</h1>
					</div>
				</div>
			</c:otherwise>
		</c:choose>




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
					<div class="emptyReview">
						<h1>등록된 리뷰가 없습니다.</h1>
					</div>
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
