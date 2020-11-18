<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- 
		추후 업데이트 할 것
		첫번째에서는 화살표 없도록
		화살표가 아이디 기준으로 움직이므로 기준점 이름을 바꿔줄 것
	 -->

<style>
	
	#result {
		margin-top:2em;
	 	scroll-behavior:smooth;
	}

	.subListTitle {
		font-weight: 800;
		font-size: large;
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
	  border: 1px solid black;
	  cursor: pointer;
	  transition: 250ms all;
	  z-index: 2;
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
                    <button onclick="location.href = '${path}/board/boardInsert'">글쓰기</button>
               		<button onclick="location.href = '${path}/board/boardPage?boardNo=10'">글보기</button>
               		<button onclick="location.href = '${path }/board/boardSession'">세션만들기</button>
               		${loginMember }<br>
               		<%-- <c:forEach var="sub" items="${subList}">
               			<br>
						${sub.subCategory}
					</c:forEach> --%>
					<div id="result">
						
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
		/* div.className = "subList"; */
		/* div.id = "subList"+(index+1); */
		div.innerHTML += "<h1 class='subListTitle'>"+element+'</h1>';
		div.innerHTML += "<div id='subList" + (index+1) + "' class='subListBigCon'></div>";
		document.getElementById('result').appendChild(div);
	})
	
	//소켓연결
	const socket = new SockJS("http://localhost:9090${path}/list");
	let message = '';
	socket.onopen = function(e){
		socket.send('boardList');
	}
	
	//메세지가 왔을 때 액션
    socket.onmessage = function(e){
    	let allList = JSON.parse(e.data);
		let eachList = [];

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
		})
		console.log(eachList);
		//15개만 출력하기 위해 종류별로 어레이에 넣어주기
		for(let i = 0; i < eachList.length; i++){
			let idx = 1;
			let html = "";
			let name = 'subList' + (i+1);
			for(let j = 0; j < 15; j++) {
				if(eachList[i][j]!=null){
					if(j%5==0){
						html += "<div id='sector"+idx+"' class='sector'><a href='#sector"+(idx-1)+"' class='arrow__btn'><</a>";
						idx++;
					}
					
					html += 
						"<div class='subListContent'>" +
						"<br><a href='${path}/board/boardPage?boardNo="+eachList[i][j].boardId+"'>"
						+ eachList[i][j].title + eachList[i][j].writerNickname + "</a></div>";
					
					if(j%5==4){
						html += "<a href='#sector"+idx+"' class='arrow__btn'>></a></div>";
					}
				}
			}
			document.getElementById(name).innerHTML += html;
		}
    }
</script>
</body>
</html>