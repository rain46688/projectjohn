<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div id="content">
                    <!-- 내용 -->
                    <button onclick="location.href = '${path}/board/boardInsert'">글쓰기</button>
               		<button onclick="location.href = '${path}/board/boardPage'">글보기</button>
               		<button onclick="location.href = '${path }/board/boardSession'">세션만들기</button>
               		${loginMember }<br>
               		${subList }
               		<c:forEach var="sub" items="${subList}">
               			<br>
						${sub.sub_category}
					</c:forEach>
					<div id="result">
						
					</div>
                </div>
            </div>
        </div>
    </div>
<script>
'use strict'
	//구독하는 채널 리스트
	let subList = [];
	<c:forEach var="sub" items="${subList}">
	   subList.push('${sub.sub_category}')
	</c:forEach>
	console.log(subList);
	
	//서브 목록만 쏴주기
	subList.forEach(function(element, index){
		let div = parent.document.createElement('div');
		div.className = "subList";
		div.id = "subList"+(index+1);
		div.innerHTML = element;
		document.getElementById('result').appendChild(div);
	})
	
	//소켓연결
	const socket = new SockJS("http://localhost:9090${path}/list");
	let message = '';
	socket.onopen = function(e){
		console.log("접속");
		socket.send('boardList');
	}
	
	//메세지가 왔을 때 액션
    socket.onmessage = function(e){
    	let allList = JSON.parse(e.data);
        allList.forEach(function(element, index){
        	/* console.log(subList[0])
        	console.log(element.small_category) */
        	//메세지가 오면 해당 채널에 업데이트 해주기
        	for(let i = 0; i < subList.length; i++){
				if(subList[i]==element.small_category){
					let name = 'subList' + (i+1);
					console.log(element);
					document.getElementById(name).innerHTML += '<br>' + element.title;
				}
			}
        })
    }

</script>
</body>
</html>