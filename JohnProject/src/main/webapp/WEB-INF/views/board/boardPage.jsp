<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
    #video-grid {
        display:grid;
        grid-template-columns: repeat(auto-fill,300px);
        grid-auto-rows: 300px;
    }

    video {
        width:100%;
        height:100%;
        object-fit: cover;
    }
</style>
<script>
	const ROOM_ID = ${currBoard.boardId}
</script>
<script defer src="http://localhost:82/socket.io/socket.io.js"></script>
<div id="content">
                    <!-- 내용 -->
                    ${currBoard }
                    <div id="video-grid"></div>
                    <button onclick="location.href = 'http://localhost:3000'">수정하기</button>
                    <button onclick="location.href = '${path}/board/boardDelete'">삭제하기</button>
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
<script src="${path }/resources/js/peerJS.js"></script>
<script>
        $(document).ready(function() {
            var socket = io("http://localhost:82");
            const videoGrid = document.getElementById('video-grid')
			socket.emit('message_from_jackson', "Message from view");
			socket.on('messageFromServer', function(msg){
				console.log(msg);
			})
			 const myPeer = new Peer(undefined, {
				 host: '/',
				 port: '3001'
			 });
			const myVideo = document.createElement('video')
			myVideo.muted = true;

			navigator.mediaDevices.getUserMedia({
			    video:true,
			    audio:true
			}).then(stream => {
			    addVideoStream(myVideo, stream)

			    myPeer.on('call', call => {
			        call.answer(stream)
			        const video = document.createElement('video')
			        call.on('stream', userVideoStream => {
			            addVideoStream(video, userVideoStream)
			        })
			    })

			    socket.on('user-connected', userId => {
			        connectToNewUser(userId, stream)
			    })
			})

			myPeer.on('open', id => {
			    socket.emit('join-room', ROOM_ID, id);
			})

			function connectToNewUser(userId, stream){
			    const call = myPeer.call(userId, stream)
			    const video = document.createElement('video');
			    call.on('stream', userVideoStream => {
			        addVideoStream(userVideoStream);
			    })
			    call.on('close',()=>{
			        video.remove();
			    })
			}
			
			function addVideoStream(video, stream) {
			    video.srcObject = stream;
			    video.addEventListener('loadedmetadata', () => {
			        video.play();
			    })
			    videoGrid.append(video);
			}
        });
    </script>
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
			currBoardNo: ${currBoard.boardId}
		},
		success: function(data) {
			let html = "";
			$.each(data, function(index, item){
				let date = new Date(item.comEnrollDate);
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
			currBoardNo:${currBoard.boardId},
			content:contentValue
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