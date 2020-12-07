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
	
	.subListBigCon .sector .subListContent:hover {
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
</style>
	<div id="content">
					<!-- 내용 -->
                    
					<div id="result">
						<div class="popular">
							<h1 class='subListTitle'>인기 <a href="#">View More</a></h1>
							<hr>
							<div id='popularList' class='subListBigCon'>

							</div>
							<hr>
						</div>
						<div class="new">
							<h1 class='subListTitle'>최신 <a href="#">View More</a></h1>
							<hr>
							<div id='newList' class='subListBigCon'>

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
	const socket = new SockJS("https://172.30.1.16:8443${path}/list");
	let message = ''; 
	socket.onopen = function(e){
		socket.send('boardList');
	}
	
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
		

		//구독 목록 갯수에 맞게 eachList 크기 조정
		for(let j = 0; j < subList.length; j++){
			eachList[j] = [];
		}

        allList.forEach(function(element, index){
        	//메세지가 오면 해당 채널에 업데이트 해주기
        	for(let i = 0; i < subList.length; i++){
        		//구독 목록과 같은 것만 넣기
				if(subList[i]==element.smallCategory){
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
					sector.id = 'sector' + idx + eachList[i][j].smallCategory;
					sector.className = 'sector';

					let anchor = document.createElement('a');
					anchor.href = '#sector' + (idx-1)+eachList[i][j].smallCategory;
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
						location.assign('${path}/board/boardPage?boardNo='+eachList[i][j].boardId);
					}
					//제목
					let subListConTitle = document.createElement('div');
					subListConTitle.innerHTML = eachList[i][j].title;
					subListContent.appendChild(subListConTitle);

					//조회수 + 찜
					
					let sector = document.getElementById('sector' + idx + eachList[i][j].smallCategory);
					sector.appendChild(subListContent);
					
					if(j%5==4){
						idx++;
						let anchor2 = document.createElement('a');
						anchor2.href = '#sector'+idx+eachList[i][j].smallCategory;
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
			subListContent.onclick = function(){
				location.assign('${path}/board/boardPage?boardNo='+element.boardId);
			}
			subListContent.innerHTML = element.title + ":" + element.writerNickname;
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