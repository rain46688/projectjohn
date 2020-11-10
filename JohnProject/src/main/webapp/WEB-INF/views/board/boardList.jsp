<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div id="content">
                    <!-- 내용 -->
                    <button onclick="location.href = '${path}/board/boardInsert'">글쓰기</button>
               		<button onclick="location.href = '${path}/board/boardPage'">글보기</button>
               		<button onclick="location.href = '${path }/board/boardSession'">세션만들기</button>
               		${loginMember }<br>
               		${subList }
                </div>
            </div>
        </div>
    </div>
<script>
	const socket = new SockJS("http://localhost:9090${path}/list");
	let message = '';
	socket.onopen = function(e){
		console.log("접속");
		socket.send('boardList');
	}
	
    socket.onmessage = function(e){
        console.log(JSON.parse(e.data));
    }

</script>
</body>
</html>