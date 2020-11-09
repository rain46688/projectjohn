<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div id="content">
                    <!-- 내용 -->
                    ${currBoard }
                    
                    <div id="commentSection">
				      <div id="commentInsert">
				          <select name="commentTo" id="commentTo">
				            <option value="openComment" selected>전체댓글</option>
				          </select>
				          <input type="text" name="commentContent" class="commentContent" id="commentContent" size="48">
				          <input type="hidden" name="commentLevel" id="commentLevel" value="1">
				          <button class="commentInsertBtn" id="commentInsertBtn">댓글입력</button>
				      </div>
				    <div id="Comments">
				      <ul class="comment_list">
				        <!-- 댓글이 들어갈 곳 -->
				      </ul>
				    </div>
				    </div>
                </div>
            </div>
        </div>
    </div>
<script>
'use strict'

$(document).ready(function(){
	fn_commentList();
})

function fn_commentList(){
	$.ajax({
		url: "${path}/board/boardCommentList",
		type: "post",
		dataType: "json",
		data: {
			currBoardNo: ${currBoard.board_id}
		},
		success: function(data) {
			console.log(data);
			let html = "";
			$.each(data, function(index, item){
				html = JSON.stringify(item)
			})
			$(".comment_list").html(html);
			
		},
	})
	
}

</script>
</body>
</html>