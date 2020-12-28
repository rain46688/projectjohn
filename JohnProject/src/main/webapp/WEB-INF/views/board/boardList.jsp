<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	<!-- 
		추후 업데이트 할 것
		화살표가 아이디 기준으로 움직이므로 기준점 이름을 바꿔줄 것
	 -->

<style>
	
#result {
	margin-top:1em;
	font-family: 'Noto Serif KR', serif;
 	scroll-behavior:smooth;
}

#content > button {
	float:right;
}

.subListTitle {
	margin-left:1em;
	font-weight: 800;
	font-size: 1.75em;
}

.subListTitle a {
	margin-left: 0em;
	font-size: 14px;
	font-weight: 600;
	color:black;
	text-decoration: underline;
}

.subListBigCon {
	display:grid;
	grid-template-columns: repeat(3, 100%);
    overflow: hidden;
    scroll-behavior: smooth;
}

.subListBigCon .sector {
	width: 100%;
    position: relative;
    display: grid;
    grid-template-columns: repeat(5, auto);  
    padding-left:3em;
    padding-right:3em;
    margin: 20px 0;
}

.subListBigCon .sector .subListContent {
  margin:0;
  padding: 0 2px;
  cursor: pointer;
  transition: 250ms all;
  width:16em;
  height:8em;
  /* background-color:#CCD7E6; */
  background-color: white;
  border-top:5px #ffc55b solid;
}

.subListBigCon .sector .subListContentBlue {
  margin:0;
  padding: 0 2px;
  cursor: pointer;
  transition: 250ms all;
  width:16em;
  height:8em;
  /* background-color:#CCD7E6; */
  background-image: url("${path}/resources/images/mic.png");
  background-repeat:repeat-y;
  border-top:5px #00316d solid;
}

.subListBigCon .sector .subListContent:hover {
  margin: 0 40px;
	  transform: scale(1.2);
}

.subListBigCon .sector .subListContentBlue:hover {
  margin: 0 40px;
	  transform: scale(1.2);
}

.subListBigCon .sector>a {
  position: absolute;
  color: black;
  text-decoration: none;
  font-size: 3em;
  width:1em;
  margin:0;
  text-align: center;
  z-index: 1;
  transform: translateY(-30%);
}

.subListBigCon .sector>a:nth-of-type(1) {
  top: 0;
  bottom: 0;
  left: 0;
  background: linear-gradient(-90deg, rgba(0, 0, 0, 0) 0%, white 100%);
}

.subListBigCon .sector>a:nth-of-type(2) {
  top: 0;
  bottom: 0;
  right: 0;
  background: linear-gradient(90deg, rgba(0, 0, 0, 0) 0%, white 100%);
}

@media only screen and (max-width: 600px) {
  a.arrow__btn {
    display: none;
  }
}
	
.titleAndIcon{
 display:flex;
}

.profileCon{
  width:12%;
  display:flex;
  justify-content:center;
  align-items:center;
}
.imgCon{
  border-radius:20px;
  width:1.6em;
}
.titleCon {
  padding-left:0.5em;
  font-size:18px;
  width:78%;
  overflow:hidden;
}
.iconCon {
  font-size:24px;
  width:10%;
}
ion-icon[name=thumbs-up-outline]{
color:orange;
}
ion-icon[name=thumbs-down-outline]{
color:silver;
}

.iconBlue {
color:
}

.likeAndCount {
  display:flex;
}

.likeAndHits {
  font-size:12px;
}

.judgeCon {
  position:absolute;
  bottom:0;
}
	
@import url('https://fonts.googleapis.com/css2?family=DM+Mono:wght@300;400;500&display=swap');

body {
    padding: 0;
    margin: 0;
    background-color: silver;
    color: black;
    font-family: 'DM Mono', monospace;
}

a {
    text-decoration: none;
}

.card-list {
    display: flex;
    padding: 2rem;
    width:100%;
}

.card-list::-webkit-scrollbar {
    width: 10px;
    height: 10px;
}
.card-list::-webkit-scrollbar-thumb {
    background: #201c29;
    border-radius: 10px;
    box-shadow: inset 2px 2px 2px hsla(0,0%,100%,.25), inset -2px -2px 2px rgba(0,0,0,.25);
}

.card-list::-webkit-scrollbar-track {
    background: linear-gradient(90deg,#201c29,#201c29 1px,#17141d 0,#17141d);
}


.card1 {
    height: 250px;
    width: 17rem;
    min-width: 17rem;
    padding: 1.5rem;
    border-radius: 16px;
    background: white;
    box-shadow: -0.5rem 0 1rem silver;
    display: flex;
    flex-direction: column;
    transition: .2s;
    margin: 0;
    scroll-snap-align: start;
    clear: both;
    position: relative;
    cursor:pointer;
}

.card1:focus-within~.card1, .card1:hover~.card1 {
    transform: translateX(130px);
}

.card1:hover {
    transform: translateY(-1rem);
}

.card1:not(:first-child) {
    margin-left: -130px;
}


.card1-header {
    margin-bottom: 0.5em;
}

.card1-header p {
    font-size: 14px;
    margin: 0 0 1rem;
    color: black;
}

.card1-header h2 {
    font-size: 20px;
    margin: .25rem 0 auto;
    text-decoration: none;
    color: inherit;
    border: 0;
    display: inline-block;
    cursor: pointer;
}

.card1-content p {
	font-size: 16px;
    text-decoration: none;
    color: inherit;
    border: 0;
    display: inline-block;
    cursor: pointer;
    text-overflow:eclipse;
    height:30%;
}

.card1-content {
	text-overflow:eclipse;
	white-space: nowrap;
 	 overflow: hidden;
	height:4rem;
	margin-bottom:0;
	border:1px red solid;
}

/* .card1-header h2:hover {
    background: linear-gradient(90deg,#ff8a00,#e52e71);
    text-shadow: none;
    -webkit-text-fill-color: transparent;
    -webkit-background-clip: text;
    background-clip: text;
} */

.card1:hover > .card1-header>h2{
	background: linear-gradient(90deg,#ff8a00,#e52e71);
    text-shadow: none;
    -webkit-text-fill-color: transparent;
    -webkit-background-clip: text;
    background-clip: text;
}

.card1:hover > .card1-content>p{
	background: linear-gradient(90deg,#ff8a00,#e52e71);
    text-shadow: none;
    -webkit-text-fill-color: transparent;
    -webkit-background-clip: text;
    background-clip: text;
}

.card-author {
    margin: 3rem 0 0;
    display: grid;
    grid-template-columns: 75px 1fr;
    align-items: center;
    position: relative;
    margin-top:0.5rem;
}

.author-avatar {
    grid-area: auto;
    align-self: start;
    position: relative;
    box-sizing: border-box;
}

.author-avatar img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    /* filter: grayscale(100%); */
    display: block;
    overflow: hidden;
    margin: 16px 10px;
}

.author-name {
    grid-area: auto;
    box-sizing: border-box;
}

.author-name-prefix {
    font-style: normal;
    font-weight: 700;
    color: #7a7a8c;
}

.half-circle {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 60px;
    height: 48px;
    fill: none;
    stroke: #ff8a00;
    stroke-width: 8;
    stroke-linecap: round;
    pointer-events: none;
}

.tags {
    margin: 1rem 0 2rem;
    padding: .5rem 0 1rem;
    line-height: 2;
    margin-bottom: 0;
}

.tags a {
    font-style: normal;
    font-weight: 700;
    font-size: .5rem;
    color: #7a7a8c;
    text-transform: uppercase;
    font-size: .66rem;
    border: 3px solid #28242f;
    border-radius: 2rem;
    padding: .2rem .85rem .25rem;
    position: relative;
}

.tags a:hover {
    background: linear-gradient(90deg,#ff8a00,#e52e71);
    text-shadow: none;
    -webkit-text-fill-color: transparent;
    -webkit-background-clip: text;
    -webkit-box-decoration-break: clone;
    background-clip: text;
    border-color: white;
}

#sidebarHome {
	background-color: rgb(255,255,255,0.1);
}
</style>
<script src="${path }/resources/js/glider.js"></script>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/glider.css">
	<div id="content">
					<!-- 내용 -->
					<div id="result">
						<div class="popular">
							<h1 class='subListTitle'>인기 <a href="${path }/board/boardListSmall?key=popular">View More</a></h1>
							<div id='popularList' class='subListBigCon'>
								<div class="glider-contain">
	<div class="card-list glider">
	
	<c:forEach var="popular" items="${popularList }" varStatus="status">
      <div class="card1" onclick="location.href='${path}/board/boardPage?boardNo=${popular.BOARD_ID }'">
        <div class="card1-header">
          <p><fmt:formatDate value="${popular.ENROLL_DATE}" pattern="yyyy년 MM월 dd일"/></p>
          <h2>${popular.TITLE }</h2>
        </div>
		<div class="icons">
			<div class="judge">
				<ion-icon name="thumbs-up-outline"></ion-icon> ${popular.AGREE_NUM }
				<ion-icon name="thumbs-down-outline"></ion-icon> ${popular.DISAGREE_NUM }
			</div>
		</div>
        <div class="card-author">
          <a class="author-avatar" href="#">
          	<c:if test="${popular.WRITER_PROFILE eq null}">
            <img src="${path }/resources/profile_images/avatar.png" />
            </c:if>
            <c:if test="${popular.WRITER_PROFILE ne null}">
            <img src="${path }/resources/profile_images/${popular.WRITER_PROFILE}" />
            </c:if>
          </a>
          <svg class="half-circle" viewBox="0 0 106 57">
            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
          </svg>

          <div class="author-name">
            <div class="author-name-prefix">글쓴이</div>
            ${popular.WRITER_NICKNAME }
          </div>
        </div>
      </div>
      </c:forEach>
 </div>
      <div role="tablist" class="dots"></div>
 </div>
							</div>
						</div>
						<hr>
						<div class="new">
							<h1 class='subListTitle'>최신 <a href="${path }/board/boardListSmall?key=new">View More</a></h1>
							<div id='newList' class='subListBigCon'>
								<div class="glider-contain">
	<div class="card-list glider1">
      <c:forEach var="new1" items="${newList }" varStatus="status">
      <div class="card1" onclick="location.href='${path}/board/boardPage?boardNo=${new1.BOARD_ID }'">
        <div class="card1-header">
          <p><fmt:formatDate value="${new1.ENROLL_DATE}" pattern="yyyy년 MM월 dd일"/></p>
          <h2>${new1.TITLE }</h2>
        </div>
        <div class="icons">
			<div class="judge">
				<ion-icon name="thumbs-up-outline"></ion-icon> ${new1.AGREE_NUM }
				<ion-icon name="thumbs-down-outline"></ion-icon> ${new1.DISAGREE_NUM }
			</div>
		</div>
        <div class="card-author">
          <a class="author-avatar" href="#">
          	<c:if test="${new1.WRITER_PROFILE eq null}">
            <img src="${path }/resources/profile_images/avatar.png" />
            </c:if>
            <c:if test="${new1.WRITER_PROFILE ne null}">
            <img src="${path }/resources/profile_images/${new1.WRITER_PROFILE}" />
            </c:if>
          </a>
          <svg class="half-circle" viewBox="0 0 106 57">
            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
          </svg>

          <div class="author-name">
            <div class="author-name-prefix">글쓴이</div>
            ${new1.WRITER_NICKNAME }
          </div>
        </div>
      </div>
      </c:forEach>
      </div>
      <div role="tablist" class="dots1"></div>
 </div>
 </div>
							</div>
							<hr style="border-top:1px solid rgba(0,0,0,.1)">
						</div>
					</div>
	
                </div>
            </div>
        </div>
    </div>
<script defer>
	'use strict'
	
	window.addEventListener('load', function(){
	  new Glider(document.querySelector('.glider'), {
		  slidesToShow: 4,
		  slidesToScroll: 4,
		  draggable: true,
		  dots: '.dots',
		  arrows: {
		    prev: '.glider-prev',
		    next: '.glider-next'
		  }
	  })
	  new Glider(document.querySelector('.glider1'), {
		  slidesToShow: 4,
		  slidesToScroll: 4,
		  draggable: true,
		  dots: '.dots1',
		  arrows: {
		    prev: '.glider-prev1',
		    next: '.glider-next1'
		  }
	  })
	})
</script>
</body>
</html>