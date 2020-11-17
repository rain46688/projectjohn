<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
	
	#result {
		margin-top:2em;
	}
	
	#icon_right {
		right:20;
		cursor:pointer;
		margin-top:-200px;
		position:fixed;
	}
	
	#icon_left {
		left:20;
		cursor:pointer;
		margin-top:-200px;
		position:fixed;
	}

	.subListTitle {
		font-weight: 800;
		font-size: large;
	}
	
	.subListBigCon {
		display:inline-block;
		white-space: nowrap;
	}
	
	.transition {
		-webkit-transform: scale(1.2); 
	    -moz-transform: scale(1.2);
	    -o-transform: scale(1.2);
	    transform: scale(1.2);
	}
	
	.subListContent {
		float:left;
		width:10em;
		-webkit-transition: all .4s ease-in-out;
	    -moz-transition: all .4s ease-in-out;
	    -o-transition: all .4s ease-in-out;
	    -ms-transition: all .4s ease-in-out;
	    cursor: pointer; 
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
<script src="${path }/resources/js/azle.js" defer></script>
<script defer>
	'use strict'
	
	
	//구독하는 채널 리스트
	let subList = [];
	<c:forEach var="sub" items="${subList}">
	   subList.push('${sub.subCategory}')
	</c:forEach>
	
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
        allList.forEach(function(element, index){
        	
        	//메세지가 오면 해당 채널에 업데이트 해주기
        	for(let i = 0; i < subList.length; i++){
				if(subList[i]==element.smallCategory){
					let name = 'subList' + (i+1);
					document.getElementById(name).innerHTML += 
						"<div class='subListContent'>" +
						"<br><a href='${path}/board/boardPage?boardNo="+element.boardId+"'>"
								+ element.title + element.writerNickname + "</a></div>";
				}
			}
        })
    }
</script>
</body>
</html>