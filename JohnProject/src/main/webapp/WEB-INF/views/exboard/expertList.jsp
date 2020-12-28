
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
<link rel="stylesheet" href="${path }/resources/css/splide-sea-green.min.css">

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
}

/* 폰트 설정 */
.exName, .exCounselArea, .johnbtn, .exBottm, .empty, #reviewDivTitle, .reviewInnerUpDiv, .userReview, .emptyReview, #categoryDiv {
	font-family: 'Noto Serif KR', serif;
}

/* 배경 설정 */
#headerAndContent {
	background-color: #062449;
}

#content {
	background-color: #062449;
	padding-bottom: 1%;
}

/* 위 div */
#upDiv * {
	/* border: 1px solid red; */
	
}

/* 아래 div */
#downDiv * {
	/* border: 1px solid red;  */
	
}

/* 위 div */
#upDiv {
	width: 100%;
	height: 58%;
}

/* 아래 div */
#downDiv {
	width: 100%;
	height: 40%;
	display: flex;
	padding: 0 5vh 0 5vh;
}

/* 리뷰 div */
#reviewDiv {
	height: 100%;
	width: 50%;
	padding-right: 1vh;
}

/* 카테고리 div */
#categoryDiv {
	height: 105.45%;
	width: 50%;
	background-color: white;
	border: 10px solid #FFCC66;
	padding-left: 1vh;
}

/* 가로 슬라이드 */
.splide {
	height: 100%;
}

#reviewDiv .splide__track {
	width: 100%;
	height: 100%;
}

.splide__track {
	background-color: white;
	border: 10px solid #FFCC66;
}

.splide__track * {
	height: 100%;
}

.splide__slide>div {
	width: 100%;
	height: 100%;
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
}

.splide__pagination {
	display: none;
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
	font-size: 2em;
	font-weight: bold;
	text-decoration: none;
	z-index: 1;
	position: absolute;
	height: 100%;
	width: 100%;
	top: 0;
	left: 0;
	opacity: 1;
	/* opacity: 0;  */
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
	margin-left: 3%;
}

.exRight * {
	margin-top: 2%;
}

/* 카드 오른쪽 이름  */
.exName {
	height: 20%;
	font-size: 2vh;
}

/* 카드 오른쪽 점수  */
.exRating {
	height: 16%;
	font-size: 2.5vh;
	display: flex;
	align-items: center;
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
	/* 줄 넘치면 ..으로 처리  안되! */
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
	font-size: 90%;
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
	/* 줄 넘치면 ..으로 처리 안되 시발! */
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
	background-color: white;
	border: 10px solid #FFCC66;
}

.emptyReview {
	width: 100%;
	height: 105%;
	font-size: 3vh;
	padding-top: 15vh;
	text-align: center;
	background-color: white;
	border: 10px solid #FFCC66;
}

/* 버튼 */
.button-8 {
	width: 100%;
	height: 30%;
	border: 2px solid #00316D;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
}

.button-8 .johnbtn {
	font-size: 2vh;
	color: #FFCC66;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
	/*  */
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.eff-8 {
	width: 100%;
	height: 100%;
	border: 90px solid #00316D;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
	box-sizing: border-box;
}

.button-8:hover .eff-8 {
	border: 0px solid #00316D;
}

.button-8:hover .johnbtn {
	color: #00316D;
}
</style>

<section id="content">
	<div id="upDiv">
		<div class="splide">
			<div id="upListDiv" class="splide__track">
				<ul id="upListUl" class="splide__list">
						<!-- 상단 리스트  -->
				</ul>
			</div>
		</div>
	</div>

	<div id="downDiv">
		<div id="reviewDiv">
			<div class="splide2">
				<div class="splide__track">
					<ul id="downListUl" class="splide__list">
						<!-- 하단 리스트  -->
					</ul>
				</div>
			</div>
		</div>

		<div id="categoryDiv">
			<!-- 히든  -->
			<input type="hidden" id="categoryHidden" name="categoryHidden" value="직장 상담">
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
	
		
	// ============================
	//부모창이 종료되면 자식창도 종료
	// ============================
		let pop;
		window.onunload = function() { 
			pop.close(); 
		}
		
		
	// ============================
	// 상담 신청 버튼
	// ============================
		 function counsel(no,nic){
			 console.log("no : "+no+" nic : "+nic);
			 window.open("${path}/expert/expertApply?no="+no+"&nic="+nic,'회원','width=800, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes');
		 }

		
	// ============================
	// 전체 배열
	// ============================
		let newexboardList = [];
		
		
	// ============================
	// 전체 배열
	// ============================
		let newexReviewList = [];
		
		
	// ============================
	//소켓 실행
	// ============================
		const exboardListConn = new WebSocket('wss://rclass.iptime.org${path}/exlistSocket');
		
		exboardListConn.onopen = function() {
			console.log("onopen");
			exboardListsendMessage("start2");
			exboardListsendMessage("start3");
		}
		
		exboardListConn.onmessage = function(msg) {
			console.log("onmessage 그냥 리스트");
			let check = (msg.data).includes("Request");
			console.log("포함 여부 : "+check);
			
			if(!check){
				if(newexboardList.length == 0){
					newexboardList = JSON.parse(msg.data);
					printUpExpertList();
				}else{
					newexReviewList = JSON.parse(msg.data);
					printDownExpertList();
				}
				//슬라이드 함수 실행
				slide();
			}
		}
		
		function exboardListsendMessage(message) {
			exboardListConn.send(message);
			console.log("exboardListsendMessage");
		};
		
		
	// ============================
	//카테고리 클릭 이벤트		
	// ============================
		 $(".counsel-title").click(e => {
			 	let cate = $(e.target).html();
				console.log(cate);//직장 상담 등등 출력
				$("#categoryHidden").val(cate);//히든 인풋에 카테고리 입력, 파라미터 대신
				//리스트 출력
				printUpExpertList();
				printDownExpertList();
				//슬라이드 함수 실행
				slide();
		 });
		
		
	// ============================
	//위 리스트 출력		
	// ============================
		function printUpExpertList(){
			console.log("printUpExpertList 실행");
			let tempprinthtml = "";
			let flag = true;
			const cate = $("#categoryHidden").val();
			console.log("출력전 카테고리 : "+cate);
			console.log("길이 : "+newexboardList.length );
				tempprinthtml = "<div id='emptyupdiv'><div class='empty'><h1>등록된 상담사가 없습니다.</h1></div></div>";
				
				newexboardList.forEach((e, i)=>{
					if(e['expertCounselArea'] == cate){
						
							if(flag == true){
								tempprinthtml ="";
								flag = false;
							}
							
							let count = 1;
							if(e['expertReviewCount'] > 0){
								count = e['expertReviewCount'];
							}
							let Greetings = "인사말 없음.";
							if(e['expertGreetings'] != null){
								Greetings = e['expertGreetings'];
							}
							tempprinthtml += "<li class='splide__slide'><div class='card-body'>";
							tempprinthtml += "<img class='expertimg' alt='전문가' src='${path }/resources/profile_images/"+e['profilePic']+"'><div class='exRight'>";
							tempprinthtml += "<div class='exName'>"+e['memName']+"</div>";
							tempprinthtml += "<div class='exRating'>"+printStar(Math.round(e['expertRating']/count),false)+printStar(5 - (Math.round(e['expertRating']/count)),true)+"</div>";
							tempprinthtml += "<div class='exCounselArea'>분야 : "+e['expertCounselArea']+"</div>";
							tempprinthtml += "<div class='button-8'><div class='eff-8'></div>";
							tempprinthtml += "<a class='johnbtn' onclick='counsel(\""+e['usid']+"\",\""+e['memNickname']+"\");'>상담 신청</a></div></div>";
							tempprinthtml += "<div class='exBottm'>"+Greetings+"</div></div></li>";
					}
				});
				//플래그에 따라 등록된게 없다는 표시를 구분함 
				if(flag){
					$("#upDiv").html(tempprinthtml);
				}else{
					$("#upDiv").html("<div class='splide'><div id='upListDiv' class='splide__track'><ul id='upListUl' class='splide__list'></ul></div></div>");
					$("#upListUl").html(tempprinthtml);
				}
	
		}
		
		
	// ============================
	//아래 리뷰 리스트 출력		
	// ============================
		function printDownExpertList(){
			let tempprinthtml = "";
				tempprinthtml = "<div class='emptyReview'><h1>등록된 리뷰가 없습니다.</h1></div>";
				let flag = true;
				const cate = $("#categoryHidden").val();
				console.log("리뷰 출력전 카테고리 : "+cate);
				console.log("리뷰 길이 : "+newexReviewList.length );
				newexReviewList.forEach((e, i)=>{
					if(e['bexpertCounselArea'] == cate){
						let content="내용 없음";
						if(flag == true){
							tempprinthtml ="";
							flag = false;
						}
						
						if(e['expertBoardReview'] != null){
							content = e['expertBoardReview'];
						}
						
						tempprinthtml += "<li class='splide__slide'><div class='reviewDiv'><div id='reviewDivTitle'><h1 id='reviewTitleH1'>베스트 상담 후기</h1></div>";
						tempprinthtml += "<div class='reviewInnerUpDiv'><div class='userNickName'>닉네임 : "+e['expertBoardMemNick']+"</div>";
						tempprinthtml += "<div class='counselDate'>날짜 : "+e['expertBoardDateString']+"</div>";
						tempprinthtml += "<div class='counselAreaReview'>분야 : "+cate+"</div></div>";
						tempprinthtml += "<div class='userRating'>"+printStar(e['expertBoardRating'],false)+printStar(5 - (e['expertBoardRating']),true)+"</div>";
						tempprinthtml += "<div class='userReview'>"+content+"</div></div></li>";
					}
				});
				//플래그에 따라 등록된게 없다는 표시를 구분함 
				if(flag){
					$("#reviewDiv").html(tempprinthtml);
				}else{
					$("#reviewDiv").html("<div class='splide2'><div class='splide__track'><ul id='downListUl' class='splide__list'></ul></div></div>");
					$("#downListUl").html(tempprinthtml);
				}
		}
		
		
	// ============================
	//별점 찍기, 끝나는 숫자를 end로 입력하고 빈별인지 꽉찬별인지 두번째 파라미터로 구분		
	// ============================
		function printStar(end, emptystar){
			let starhtml = "";
			for(let i = 1; i <= end; i++){
				if(emptystar == true){
					starhtml += "<span class='fa fa-star'></span>";
				}else{
					starhtml += "<span class='fa fa-star checked'></span>";
				}
			}
			return starhtml;
		}


	 // ============================
	 //슬라이드 생성하기 
	 // 요소들을 생성한후 실행해줘야 슬라이드가 제대로 먹힘 삽질함 ㅅㅂ ㅋㅋ		
	// ============================
	function slide(){
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
	 }
	 
</script>
