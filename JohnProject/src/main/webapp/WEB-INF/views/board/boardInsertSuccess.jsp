<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div id="content">
                    <!-- 내용 -->
                </div>
            </div>
        </div>
    </div>
</body>
<script>
	alert("정상적으로 등록되었습니다.");
	
	let socket = SockJS("http://localhost:9090${path}/list")
	
	socket.onopen = function(e) {
		socket.send("insertSuccess");
		
	}
	
	socket.onclose = function(){
		location.href = '${path}/board/boardList';
	}
</script>
</html>