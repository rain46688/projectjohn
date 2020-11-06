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
	const socket = new SockJS("http://192.168.140.126:9090/${path}/list");
	
	socket.onopen = function(e){
		console.log("접속");
	}
</script>
</body>
</html>