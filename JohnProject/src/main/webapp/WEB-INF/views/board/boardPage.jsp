<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div id="content">
                    <!-- 내용 -->
                    ${currBoard }
                    
                    <div id="commentSection">
				      <div id="commentInsert">
				          <input type="text" name="commentContent" class="commentContent" id="commentContent" size="48">
				          <input type="hidden" name="commentLevel" id="commentLevel" value="1">
				          <button class="commentInsertBtn" id="commentInsertBtn" onclick="fn_commentInsert();">댓글입력</button>
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
			let html = "";
			$.each(data, function(index, item){
				let date = new Date(item.com_enroll_date);
				let dateToString = date.toString();
				let parsedString = dateToString.substring(0,25);
				item.com_enroll_date = parsedString;
				html += JSON.stringify(item)
				html += "<br>"
			})
			$(".comment_list").html(html);
		},
	})
}

function fn_commentInsert(){
	let contentValue = document.getElementById('commentContent').value;
	$.ajax({
		url:"${path}/board/boardCommentInsert",
		type:"post",
		dataType:"json",
		data:{
			currBoardNo:${currBoard.board_id},
	gi		content:contentValue
		},
		success:function(data){
			console.log(data);
			if(data.result=='success')fn_commentList();
			else alert('댓글 등록에 실패했습니다.');
		}
		/* ,error:function(q,e,r){
			console.log('asdf');
			console.log(q);
		} */
	})
}

</script>
</body>
</html>