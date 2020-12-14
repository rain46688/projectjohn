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
ion-icon[name=mic-outline]{
color:#00316d;
}
ion-icon[name=brush-outline] {
color:#ffc55b;
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
    margin-bottom: auto;
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

.card1-header h2:hover {
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
</style>
<script src="${path }/resources/js/glider.js"></script>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/glider.css">
	<div id="content">
					<!-- 내용 -->
                    
					<!-- <div id="result"> -->
						<div class="popular">
							<h1 class='subListTitle'>인기 <a href="#">View More</a></h1>
							<hr>
							<div id='popularList' class='subListBigCon'>

							</div>
						</div>
						<!-- <div class="new">
							<h1 class='subListTitle'>최신 <a href="#">View More</a></h1>
							<hr>
							<div id='newList' class='subListBigCon'>

							</div>
							<hr style="border-top:1px solid rgba(0,0,0,.1)">
						</div> -->
					<!-- </div> -->
	<div class="glider-contain">
	<div class="card-list glider">
      <div class="card1">
        <div class="card1-header">
          <p>Sep 11th 2020</p>
          <h2>Never forget</h2>
        </div>

        <div class="card-author">
          <a class="author-avatar" href="#">
            <img src="${path }/resources/images/avatar.png" />
          </a>
          <svg class="half-circle" viewBox="0 0 106 57">
            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
          </svg>

          <div class="author-name">
            <div class="author-name-prefix">Author</div>
            Jeff Delaney
          </div>
        </div>
      </div>

      <div class="card1">
        <header class="card1-header">
          <p>Sep 11th 2020</p>
          <h2>Card Tricks are fun!</h2>
        </header>

        <div class="card-author">
          <a class="author-avatar" href="#">
            <img src="https://api.adorable.io/avatars/172/a.png" />
          </a>
          <svg class="half-circle" viewBox="0 0 106 57">
            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
          </svg>

          <div class="author-name">
            <div class="author-name-prefix">Pirate</div>
            Zheng Zhilong
          </div>
        </div>
      </div>

      <div class="card1">
        <header class="card1-header">
          <p>2020년 11월 30일</p>
          <h2>Card Tricks are fun!</h2>
        </header>

        <div class="card-author">
          <a class="author-avatar" href="#">
            <img src="https://api.adorable.io/avatars/172/b.png" />
          </a>
          <svg class="half-circle" viewBox="0 0 106 57">
            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
          </svg>

          <div class="author-name">
            <div class="author-name-prefix">Pirate</div>
            Francis Drake
          </div>
        </div>
      </div>

      <div class="card1">
        <header class="card1-header">
          <p>Sep 11th 2020</p>
          <h2>Card Tricks are fun!</h2>
        </header>

        <div class="card-author">
          <a class="author-avatar" href="#">
            <img src="https://api.adorable.io/avatars/172/c.png" />
          </a>
          <svg class="half-circle" viewBox="0 0 106 57">
            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
          </svg>

          <div class="author-name">
            <div class="author-name-prefix">Pirate</div>
            Edward Teach
          </div>
        </div>
      </div>

      <div class="card1">
        <div class="card1-header">
          <p>Sep 11th 2020</p>
          <h2>Card Tricks are fun!</h2>
        </div>

        <div class="card-author">
          <a class="author-avatar" href="#">
            <img src="https://api.adorable.io/avatars/172/d.png" />
          </a>
          <svg class="half-circle" viewBox="0 0 106 57">
            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
          </svg>

          <div class="author-name">
            <div class="author-name-prefix">Pirate</div>
            William Kidd
          </div>
        </div>
      </div>

      <div class="card1">
        <header class="card1-header">
          <p>Sep 11th 2020</p>
          <h2>Card Tricks are fun!</h2>
        </header>

        <div class="card-author">
          <a class="author-avatar" href="#">
            <img src="https://api.adorable.io/avatars/172/d.png" />
          </a>
          <svg class="half-circle" viewBox="0 0 106 57">
            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
          </svg>

          <div class="author-name">
            <div class="author-name-prefix">Pirate</div>
            William Kidd
          </div>
        </div>
      </div>
 </div>
 <button aria-label="Previous" class="glider-prev">«</button>
  <button aria-label="Next" class="glider-next">»</button>
  <div role="tablist" class="dots"></div>
 </div>
 <section class="card-list">
      <div class="card1">
        <div class="card1-header">
          <p>Sep 11th 2020</p>
          <h2>Never forget</h2>
        </div>

        <div class="card-author">
          <a class="author-avatar" href="#">
            <img src="avatar.png" />
          </a>
          <svg class="half-circle" viewBox="0 0 106 57">
            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
          </svg>

          <div class="author-name">
            <div class="author-name-prefix">Author</div>
            Jeff Delaney
          </div>
        </div>
      </div>



      <div class="card1">
        <header class="card1-header">
          <p>Sep 11th 2020</p>
          <h2>Card Tricks are fun!</h2>
        </header>

        <div class="card-author">
          <a class="author-avatar" href="#">
            <img src="https://api.adorable.io/avatars/172/a.png" />
          </a>
          <svg class="half-circle" viewBox="0 0 106 57">
            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
          </svg>

          <div class="author-name">
            <div class="author-name-prefix">Pirate</div>
            Zheng Zhilong
          </div>
        </div>
      </div>




      <div class="card1">
        <header class="card1-header">
          <p>2020년 11월 30일</p>
          <h2>Card Tricks are fun!</h2>
        </header>

        <div class="card-author">
          <a class="author-avatar" href="#">
            <img src="https://api.adorable.io/avatars/172/b.png" />
          </a>
          <svg class="half-circle" viewBox="0 0 106 57">
            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
          </svg>

          <div class="author-name">
            <div class="author-name-prefix">Pirate</div>
            Francis Drake
          </div>
        </div>
      </div>

      <div class="card1">
        <header class="card1-header">
          <p>Sep 11th 2020</p>
          <h2>Card Tricks are fun!</h2>
        </header>

        <div class="card-author">
          <a class="author-avatar" href="#">
            <img src="https://api.adorable.io/avatars/172/c.png" />
          </a>
          <svg class="half-circle" viewBox="0 0 106 57">
            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
          </svg>

          <div class="author-name">
            <div class="author-name-prefix">Pirate</div>
            Edward Teach
          </div>
        </div>
      </div>


      <div class="card1">
        <header class="card1-header">
          <p>Sep 11th 2020</p>
          <h2>Card Tricks are fun!</h2>
        </header>

        <div class="card-author">
          <a class="author-avatar" href="#">
            <img src="https://api.adorable.io/avatars/172/d.png" />
          </a>
          <svg class="half-circle" viewBox="0 0 106 57">
            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
          </svg>

          <div class="author-name">
            <div class="author-name-prefix">Pirate</div>
            William Kidd
          </div>
        </div>
      </div>

      <div class="card1">
        <header class="card1-header">
          <p>Sep 11th 2020</p>
          <h2>Card Tricks are fun!</h2>
        </header>

        <div class="card-author">
          <a class="author-avatar" href="#">
            <img src="https://api.adorable.io/avatars/172/d.png" />
          </a>
          <svg class="half-circle" viewBox="0 0 106 57">
            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
          </svg>

          <div class="author-name">
            <div class="author-name-prefix">Pirate</div>
            William Kidd
          </div>
        </div>
      </div>

 </section>
                </div>
            </div>
        </div>
    </div>
<script defer>
	'use strict'
	
	function myfun(){
     // Write your business logic here
     console.log('hello');
	}		
	
	window.onbeforeunload = function(){
	  myfun();
	  confirm('나갈거야?');
	  return 'Are you sure you want to leave?';
	};
	
	window.addEventListener('load', function(){
	  new Glider(document.querySelector('.glider'), {
		  slidesToShow: 3,
		  slidesToScroll: 3,
		  draggable: true,
		  dots: '.dots',
		  arrows: {
		    prev: '.glider-prev',
		    next: '.glider-next'
		  }
	  })
	})
	
	//구독하는 채널 리스트
	let subList = [];
	<c:forEach var="sub" items="${subList}">
	   subList.push('${sub.subCategory}')
	</c:forEach>
	
    let userUsid = '${loginMember.usid}';
	
	//서브 목록만 쏴주기
	subList.forEach(function(element, index){
		let div = parent.document.createElement('div');
		div.className = "SUB";
		let subTitle = "";
		switch(element){
		case "love" : subTitle = "연애문제";break;
		case "family" : subTitle = "가족문제";break;
		case "work" : subTitle = "직장문제";break;
		case "friend" : subTitle = "친구문제";break;
		case "pet" : subTitle = "반려동물문제";break;
		}
		// div.innerHTML += "<h1 class='subListTitle'>"+subTitle+'</h1>';
		let subTitleCon = parent.document.createElement('h1');
		subTitleCon.className = 'subListTitle';
		subTitleCon.innerHTML = subTitle;
		
		let viewMore = parent.document.createElement('a');
		viewMore.innerHTML = 'View More';
		
		// div.innerHTML += "<div id='subList" + (index+1) + "' class='subListBigCon'></div>";
		let subListCon = parent.document.createElement('div');
		subListCon.id = 'subList' + (index+1);
		subListCon.className = 'subListBigCon';

		div.appendChild(subTitleCon);
		div.appendChild(subListCon);

		document.getElementById('result').appendChild(div);
	})
	
	//소켓연결
	/* const socket = new SockJS("https://172.30.1.16:8443${path}/list");
	let message = ''; 
	socket.onopen = function(e){
		socket.send('boardList');
	} */
	
	//리스트 크기
	const boardLength = 15;

	//메세지가 왔을 때 액션
    socket.onmessage = function(e){
		//모든 게시글
		let allList = JSON.parse(e.data);
		//인기 게시글 목록
		let popularList = [];
		//최신 게시글 목록
		let newList = [];
		//구독한 채널에 맞춤 목록
		let eachList = [];
		
		console.log(allList);

		//구독 목록 갯수에 맞게 eachList 크기 조정
		for(let j = 0; j < subList.length; j++){
			eachList[j] = [];
		}

        allList.forEach(function(element, index){
        	//메세지가 오면 해당 채널에 업데이트 해주기
        	for(let i = 0; i < subList.length; i++){
        		//구독 목록과 같은 것만 넣기
				if(subList[i]==element.SMALL_CATEGORY){
					eachList[i].push(element);
				}
			}
        	//최신목록 넣어주기
			if(index < 15)newList.push(element);
		})

		//hit 순서에 맞춰서 리스트 재 배열
		allList = allList.sort((a,b) => (a.hit > b.hit) ? -1 : 1);
		
		//인기 목록 넣어주기
		for(let i = 0; i < allList.length; i++){
			popularList.push(allList[i]);
			if(i>=boardLength-1)break;
		}

		//최신 목록 만들기
		makeList(newList, 'newList');

		//인기 목록 만들기
		makeList(popularList, 'popularList');
        

		//15개만 출력하기 위해 종류별로 어레이에 넣어주기
		for(let i = 0; i < eachList.length; i++){
			let idx = 1;
			let html = "";
			let name = 'subList' + (i+1);

			let hr = document.createElement('hr');
			hr.setAttribute('width','100%');
			hr.style.borderTop = '1px solid rgba(0,0,0,.1)';
			document.getElementById(name).innerHTML = "";
			for(let j = 0; j < boardLength; j++) {
				if(eachList[i][j]!=null){
					if(j%5==0){
					let sector = document.createElement('div');
					sector.id = 'sector' + idx + eachList[i][j].SMALL_CATEGORY;
					sector.className = 'sector';

					let anchor = document.createElement('a');
					anchor.href = '#sector' + (idx-1)+eachList[i][j].SMALL_CATEGORY;
					anchor.innerHTML = '<';
					anchor.className = 'arrow__btn';
					if(j==0)anchor.style.display = 'none';
					
					sector.appendChild(anchor);
					document.getElementById(name).appendChild(sector);
					}

					// if(j%5==0){
					// 	html += "<div id='sector"+idx+eachList[i][j].smallCategory
					// 	+"' class='sector'><a href='#sector"+(idx-1)+eachList[i][j].smallCategory+"' class='arrow__btn'";
					// 	if(j==0){
					// 		html += " style='display:none '"
					// 	}
					// 	html += "><</a>";
					// 	idx++;
					// }
					// html += 
					// 	"<div class='subListContent'>" +
					// 	"<br><a href='${path}/board/boardPage?boardNo="+eachList[i][j].boardId+"'>"
					// 	+ eachList[i][j].title + eachList[i][j].writerNickname + "</a></div>";
					
					let subListContent = document.createElement('div');
					subListContent.className = 'subListContent';
					subListContent.onclick = function(){
						location.assign('${path}/board/boardPage?boardNo='+eachList[i][j].BOARD_ID);
					}
					//제목
					let subListConTitle = document.createElement('div');
					subListConTitle.innerHTML = eachList[i][j].title;
					subListContent.appendChild(subListConTitle);

					//조회수 + 찜
					
					let sector = document.getElementById('sector' + idx + eachList[i][j].SMALL_CATEGORY);
					sector.appendChild(subListContent);
					
					if(j%5==4){
						idx++;
						let anchor2 = document.createElement('a');
						anchor2.href = '#sector'+idx+eachList[i][j].SMALL_CATEGORY;
						anchor2.className = 'arrow__btn';
						anchor2.innerHTML = '>';
						// html += "<a href='#sector"+idx+eachList[i][j].smallCategory+"' class='arrow__btn'";
						if(j==(boardLength-1)){
							// html += " style='display:none '"
							anchor2.style.display = 'none';
						}
						// html += ">></a></div>";
						sector.appendChild(anchor2);
					}
				}
			}
			document.getElementById(name).append(hr);
		}
	}
	
	function makeList(list, name){
		let idx = 1;
		list.forEach(function(element, index) {
			if(index%5==0){
			let sector = document.createElement('div');
			sector.id = 'sector' + idx + name;
			sector.className = 'sector';

			let anchor = document.createElement('a');
			anchor.href = '#sector' + (idx-1)+name;
			anchor.innerHTML = '<';
			anchor.className = 'arrow__btn';
			if(index==0)anchor.style.display = 'none';
			
			sector.appendChild(anchor);
			document.getElementById(name).appendChild(sector);
			}

			let subListContent = document.createElement('div');
			subListContent.className = 'subListContent';
			if(element.BIG_CATEGORY=='음성게시판')subListContent.className='subListContentBlue'
			
			subListContent.onclick = function(){
				location.assign('${path}/board/boardPage?boardNo='+element.BOARD_ID);
			}
			
			let titleAndIcon = document.createElement('div');
			titleAndIcon.className = 'titleAndIcon';
			
			let profileCon = document.createElement('div');
			profileCon.className = 'profileCon';
			
			let imgCon = document.createElement('div');
			imgCon.className = 'imgCon';
			
			let img = document.createElement('img');
			img.setAttribute('src',element.WRITER_PROFILE);
			
			imgCon.appendChild(img);
			profileCon.appendChild(imgCon);
			
			let titleCon = document.createElement('div');
			titleCon.className = 'titleCon';
			titleCon.innerHTML = element.TITLE;
			
			let iconCon = document.createElement('div');
			iconCon.className = 'iconCon';
			let icon = document.createElement('ion-icon');
			if(element.BIG_CATEGORY=='음성게시판') icon.setAttribute('name','mic-outline')
			else icon.setAttribute('name','brush-outline');
			iconCon.appendChild(icon);
			
			let likeAndCount = document.createElement('div');
			likeAndCount.className = 'likeAndCount';
			
			let likeAndHits = document.createElement('div');
			likeAndHits.className = 'likeAndHits';
			likeAndHits.innerHTML = '좋아요 '+element.LIKE_NUM+' 조회수 '+element.HIT;
			
			likeAndCount.appendChild(likeAndHits);
			
			let judgeCon = document.createElement('div');
			judgeCon.className = 'judgeCon';
			judgeCon.innerHTML = '<ion-icon name="thumbs-up-outline"></ion-icon> '+element.AGREE_NUM+ 
								' <ion-icon name="thumbs-down-outline"></ion-icon> '+element.DISAGREE_NUM;

			titleAndIcon.appendChild(profileCon);
			titleAndIcon.appendChild(titleCon);
			titleAndIcon.appendChild(iconCon);
			
			subListContent.appendChild(titleAndIcon);
			subListContent.appendChild(likeAndCount);
			subListContent.appendChild(judgeCon);
			let sector = document.getElementById('sector' + idx + name);
			sector.appendChild(subListContent);
			
			if(index%5==4){
				idx++;
				let anchor2 = document.createElement('a');
				anchor2.href = '#sector'+idx+name;
				anchor2.className = 'arrow__btn';
				anchor2.innerHTML = '>';
				if(index==(boardLength-1)){
					anchor2.style.display = 'none';
				}
				sector.appendChild(anchor2);
			}
		})	
	}
</script>
</body>
</html>