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
	
	let socket = SockJS("https://172.30.1.31:8443${path}/list")
	
	socket.onopen = function() {
		socket.send("boardInsertSuccess");
		location.href = '${path}/board/boardPage?boardNo=${boardId}';
	}
	
</script>
</html>