<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	<!-- 
		추후 업데이트 할 것
		화살표가 아이디 기준으로 움직이므로 기준점 이름을 바꿔줄 것
	 -->

<style>

#content {
}
	
#result {
	font-family: 'Noto Serif KR', serif;
 	scroll-behavior:smooth;
 	display:flex;
 	flex-direction:column;
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

.heart{
color:darkred;
}

	
@import url('https://fonts.googleapis.com/css2?family=DM+Mono:wght@300;400;500&display=swap');

body {
    padding: 0;
    margin: 0;
    background-color: silver;
    color: black;
    font-family: 'DM Mono', monospace;
}

.popular {
}

a {
    text-decoration: none;
}

.card-list {
    display: flex;
   	justify-content:center;
    padding: 1rem 3rem;
    padding-right:0;
    width:100%;
    height:100%;
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
    height: 18rem;
    width: 19rem;
    padding: 1.5rem;
    border-radius: 16px;
    background: white;
    box-shadow: 0rem 0 1rem silver;
    display: flex;
    flex-direction: column;
    transition: .2s;
    margin: 0;
    scroll-snap-align: start;
    clear: both;
    position: relative;
    cursor:pointer;
    margin-right:2em;
}
.card1 * {
	/* border:1px red solid; */
}

.card1:focus-within~.card1, .card1:hover~.card1 {
	
}

.card1:hover {
    transform: scale(1.09);
    height:17.5rem;
}

.card1:hover > .card1-content {
	height:20em;
}

.card1-header {
    margin-bottom: 0.5em;
}

.card1-header p {
    font-size: 14px;
    margin: 0 0 0.5rem;
    color: black;
}

.card1-header h2 {
    font-size: 20px;
    margin: 0 auto;
    text-decoration: none;
    color: inherit;
    border: 0;
}

.card1-content {
	text-overflow:eclipse;
	white-space: nowrap;
 	 overflow: hidden;
	margin-bottom:0.5rem;
	height:60%;
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

.card1:hover > .card1-content{
	background: linear-gradient(90deg,#ff8a00,#e52e71);
    text-shadow: none;
    -webkit-text-fill-color: transparent;
    -webkit-background-clip: text;
    background-clip: text;
}

.card1:hover .hits {
	display:inline-block;
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

.card-content{
	margin-bottom:0.5rem;
	height:40%;
}

#sidebarHome {
	background-color: rgb(255,255,255,0.1);
}

hr { display: block; height: 1px;
    border: 0; border-top: 1px solid #ccc;
    margin: 1em 0; padding: 0; }
    
.hits{
	float:right;
}

.pagination {
	margin-top:2em;
	height: 4em;
	color:gray;
}

<c:if test="${title == '인기'}">
#sidebarHome {
	background-color:transparent;
}

#sidebarPopular{
background-color: rgb(255,255,255,0.1);
}
</c:if>
</style>
<script src="${path }/resources/js/glider.js"></script>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/glider.css">
	<div id="content">
	<!-- 내용 -->
	<div id="result">
		<h1 class='subListTitle'>${title }</h1>
		<hr>
		<div class="card-list">
		
		<c:forEach var="item" items="${list }" varStatus="status">
			<c:if test="${status.index < 4 }">
			<div class="card1" onclick="location.href='${path}/board/boardPage?boardNo=${item.BOARD_ID }'">
	        <div class="card1-header">
	          <p><fmt:formatDate value="${item.ENROLL_DATE}" pattern="yyyy년 MM월 dd일"/>
	          <span class="hits">
					<ion-icon class="heart" name="heart-outline"></ion-icon> ${item.LIKE_NUM }
				</span></p>
	          <h2>${item.TITLE }</h2>
	        </div>
	        
	        <div class="card1-content">
				${item.CONTENT }
			</div>
			
			<div class="icons">
				<div class="judge">
					<ion-icon name="thumbs-up-outline"></ion-icon> ${item.AGREE_NUM }
					<ion-icon name="thumbs-down-outline"></ion-icon> ${item.DISAGREE_NUM }
				</div>
			</div>
			
	        <div class="card-author">
	          <a class="author-avatar" href="#">
	          	<c:if test="${item.WRITER_PROFILE eq null}">
	            <img src="${path }/resources/images/avatar.png" />
	            </c:if>
	            <c:if test="${item.WRITER_PROFILE ne null}">
	            <img src="${path }/resources/images/${item.WRITER_PROFILE}" />
	            </c:if>
	          </a>
	          <svg class="half-circle" viewBox="0 0 106 57">
	            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
	          </svg>
	
	          <div class="author-name">
	            <div class="author-name-prefix">글쓴이</div>
	            ${item.WRITER_NICKNAME }
	          </div>
	        </div>
	      </div>
	      </c:if>
		</c:forEach>
	      </div>
	      
	      <div class="card-list">
	      
	      <c:forEach var="item" items="${list }" varStatus="status">
			<c:if test="${status.index >= 4 }">
			<div class="card1" onclick="location.href='${path}/board/boardPage?boardNo=${item.BOARD_ID }'">
	        <div class="card1-header">
	          <p><fmt:formatDate value="${item.ENROLL_DATE}" pattern="yyyy년 MM월 dd일"/>
	          <span class="hits">
					<ion-icon class="heart" name="heart-outline"></ion-icon> ${item.LIKE_NUM }
				</span></p>
	          <h2>${item.TITLE }</h2>
	        </div>
	        
	        <div class="card1-content">
				${item.CONTENT }
			</div>
			
			<div class="icons">
				<div class="judge">
					<ion-icon name="thumbs-up-outline"></ion-icon> ${item.AGREE_NUM }
					<ion-icon name="thumbs-down-outline"></ion-icon> ${item.DISAGREE_NUM }
				</div>
			</div>
			
	        <div class="card-author">
	          <a class="author-avatar" href="#">
	          	<c:if test="${item.WRITER_PROFILE eq null}">
	            <img src="${path }/resources/images/avatar.png" />
	            </c:if>
	            <c:if test="${item.WRITER_PROFILE ne null}">
	            <img src="${path }/resources/images/${item.WRITER_PROFILE}" />
	            </c:if>
	          </a>
	          <svg class="half-circle" viewBox="0 0 106 57">
	            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
	          </svg>
	
	          <div class="author-name">
	            <div class="author-name-prefix">글쓴이</div>
	            ${item.WRITER_NICKNAME }
	          </div>
	        </div>
	      </div>
	      </c:if>
		</c:forEach>
	 	</div>
	 	${pageBar }
	 </div>
									</div>
 								</div>
							</div>
						</div>
					</div>
	
                </div>
            </div>
        </div>
    </div>
<script defer>
	'use strict'
	
	
</script>
</body>
</html>