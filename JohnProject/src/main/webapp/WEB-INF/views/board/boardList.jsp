<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div id="content">
                    <!-- 내용 -->
                    <button onclick="location.href = '${path}/board/boardInsert'">글쓰기</button>
                </div>
            </div>
        </div>
    </div>
<script>
	const socket = new SockJS("http://localhost:9090${path}/list");
	let message = '';
	socket.onopen = function(e){
		console.log("접속");
		socket.send('메세지를 보냄');
	}
	
    socket.onmessage = function(e){
        message = e.data;
        console.log(JSON.parse(message));
    }
    
    

    document.getElementById('content').innerHTML = message;
</script>
</body>
</html>