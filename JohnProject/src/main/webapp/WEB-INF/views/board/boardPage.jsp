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

	#content {
  margin:0;
  display: flex;
  flex-direction: row;
  border:1px silver solid;
}

#wrapper {
  width: 70%;
  /* display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center; */
  font-family: 'Noto Serif KR', serif;
  padding:2em;
  /* border:1px red solid; */
  border-right:1px silver solid;
}

#titleHr {
  color:black;
  width: 100%;
}

#titleAndLikes {
  display:flex;
}

#titleAndLikes>#title {
  width:80%;
  font-size:1.5em;
}

#titleAndLikes>#likeAndHits {
  position:relative;
  width:30%;
  font-size:0.8em;
}

#titleAndLikes>#likeAndHits>span {
  position:absolute;
  bottom:0;
  right:0;
  
}

#titleAndLikes>#likeAndHits span>ion-icon {
  bottom:0;
  font-size:1.5em;
}

#boardContent {
  /* border:1px red solid; */
}

#commentSection {
  width:30%;
  /* border: 1px red solid */;

}

#judgeCon {
  /* border:1px red solid; */
  display:flex;
}

.judgeBtns {
  /* border:1px red solid; */
  width:50%;
}

#judgeCon div#agreeBtn {
  display: flex;
  flex-direction:row-reverse;
}

#judgeCon div#disagreeBtn {
  display: flex;
  flex-direction:row;
}

#judgeCon .countCon {
  width:10em;
  display:flex;
  align-items:center;
  justify-content:center;
  font-size:1.8em;
}

.judgeBtns button {
  width:10em;
  height:10em;
  background-color:white;
  color:black;
}

.judgeBtns button {
  border:1px gray solid;
}

.judgeBtns button#agree {
  background-color:#ffc55b;
  color:white;
}

.judgeBtns button#agree:hover {
  background-color:white;
  color:black;
}

.judgeBtns button#agree-disabled {
	background-color:white;
	color:black;
}

.judgeBtns button#agree-disabled:hover {
  background-color:#ffc55b;
  color:white;
}

.judgeBtns button#disagree {
  background-color:#00316d;
  color:white;
}

.judgeBtns button#disagree:hover {
  background-color:white;
  color:black;
}

.judgeBtns button#disagree-disabled {
	background-color:white;
    color:black;
}

.judgeBtns button#disagree-disabled:hover {
  background-color:#00316d;
  color:white;
}

#commentSection #commentPrint {
  /* border:1px red solid; */
  height:80%;
  overflow:auto;
  background-color:#F0F2FC;
}

#commentSection #commentInsert {
  /* border:1px red solid; */
  height:20%;
  display:flex;
}

#commentInsert>#textCon {
  height:100%;
  width:75%;
}

#commentInsert #commentContent {
  height:100%;
  width:100%;
  border-radius:10px;
}

#commentInsert #textBtnCon {
  /* border:1px red solid; */
  width:25%;
}

#textBtnCon button {
  width:100%;
  height:100%;
}

#commentPrint {
  padding:1em;
}

#commentPrint .comment {
  display:flex;
}

#commentPrint>div {
  margin-bottom:1em;
}

.commentFromWriter {
  display:flex;
  flex-direction:row-reverse;
}

.commentFromWriter .commentContentCon {
  border:1px gray solid;
  background-color:rgb(255,197,91,0.8);
}

.commentProfileCon {
  width:12%;
  min-width:25px;
  max-width:25px;
  height:25px;
  border-radius:30px;
  margin:0.3em;
  overflow:hidden;
}

.commentProfileCon .commentProfileImg {
	width:25px;
	height:25px;
	object-fit:cover;
}

.commentContentCon {
  border:1px rgb(65,90,156) solid;
  background-color:white;
  color:black;
  font-size:1.1em;
  border-radius:8px;
  margin-top:0.3em;
  padding:0.3em;
  padding-left:0.6em;
  padding-right:0.6em;
  max-width:88%;
  overflow:hidden;
}


.commentContentCon .commentInfo {
  margin-bottom:0.2em;
}

.commentContentCon .commentLikeCon {
  margin-top:0.2em;
  text-align:right;
}


.commentLikeCon span#up {
  color:red;
}

.commentLikeCon span#down {
  color:gray;
}

ion-icon#likeButton {
	cursor:pointer;
}

#boardDate {
	text-align:right;
}
	
</style>
<script>
	const ROOM_ID = "${currBoard.boardId}";
</script>
<!-- <script defer src="http://localhost:82/socket.io/socket.io.js"></script> -->
<div id="content">
    <div id="wrapper">
      <div id="titleAndLikes">
        <div id="title">${currBoard.TITLE }</div>
        <div id="likeAndHits">
          <span><ion-icon id="likeButton" name="heart-outline"></ion-icon> 좋아요 <span id="likeCount">${currBoard.LIKE_NUM }</span> 조회수 ${currBoard.HIT }</span>
        </div>
      </div>
      <hr id="titleHr">
      <div id="boardDate">${currBoard.WRITER_NICKNAME } <fmt:formatDate value="${currBoard.ENROLL_DATE}" pattern="yyyy.MM.dd HH:mm"/></div>
      <div id="boardContent">
        ${currBoard.CONTENT }
        ${currBoard}
      </div>
      <hr>
      <div id="judgeCon">
        <div class="judgeBtns" id="agreeBtn">
          <div id="agreeBtnCon">
            <button onclick="fn_judge('agree');" id="agree" type="button" class="btn btn-primary">
              <ion-icon name="thumbs-up-outline"></ion-icon>
              <br>
              ${currBoard.AGREE_NAME }</button>
          </div>
          <div class="countCon">
            <div id="agreeNum">${currBoard.AGREE_NUM }</div>
          </div>
        </div>
        <div class="judgeBtns" id="disagreeBtn">
          <div id="disagreeBtnCon">
            <button onclick="fn_judge('disagree');" id="disagree" type="button" class="btn btn-primary">
              <ion-icon name="thumbs-down-outline"></ion-icon>
              <br>
              ${currBoard.DISAGREE_NAME }</button>
          </div>
          <div class="countCon">
          	<div id="disagreeNum">${currBoard.DISAGREE_NUM }</div>
          	</div>
        </div>
      </div>
      <hr>
    </div>
    <div id="commentSection">
      <div id="commentPrint">
        <div class="comment">
          <div class="commentProfileCon">
            <div class="commentProfile">
              <img class="commentProfileImg" src="${path }/resources/profile_images/NONEPROFILE.PNG">
            </div>
          </div>
          <div class="commentContentCon">
            <div class="commentInfo">
              <b>홍잭슨</b> <small>2020.12.25 23:42</small>
            </div>
            <div class="commentContent">
            아빠는 만나야지!asdsadas
            asdasdasdsadasdasdasdasd
            asdasdasdsadsadsadasd
            asdsadsadsadasdsadasd
            asdasdasdasdasdasdsdsadsad	
            asdasdasdasda
            asdasdsadsadasdasdasdas
            </div>
            <div class="commentLikeCon">
              <span id="up"><ion-icon name="thumbs-up-outline"></ion-icon> 12</span> 
              <span id="down"><ion-icon name="thumbs-down-outline"></ion-icon> 3</span>
            </div>
          </div>
        </div>
        <div class="commentFromWriter">
          <div class="commentProfileCon">
            <div class="commentProfile">
              
            </div>
          </div>
          <div class="commentContentCon">
            <div class="commentInfo">
              <b>글쓴이</b> <small>2020.12.25 23:42</small>
            </div>
            <div class="commentContent">
            아빠는 만나야지!asdsadas
            asdasdasdsadasdasdasdasd
            asdasdasdsadsadsadasd
            asdsadsadsadasdsadasd
            asdasdasdasdasdasdsdsadsad
            asdasdasdasda
            asdasdsadsadasdasdasdas
            </div>
            <div class="commentLikeCon">
              <span id="up"><ion-icon name="thumbs-up-outline"></ion-icon> 12</span> 
              <span id="down"><ion-icon name="thumbs-down-outline"></ion-icon> 3</span>
            </div>
          </div>
        </div>
      </div>
      <div id="commentInsert">
        <div id="textCon">
          <textarea id="commentContent"></textarea>
        </div>
        <div id="textBtnCon">
          <button onclick="fn_commentInsert();" type="button" class="btn btn-primary">
            댓글쓰기
          </button>
        </div>
      </div>
    </div>
  </div>
                    <%-- <button onclick="location.href = '${path}/board/boardModify'">수정하기</button>
                    <button onclick="location.href = '${path}/board/boardDelete'">삭제하기</button> --%>
                    <!-- <div id="commentSection">
				      <div id="commentInsert">
				          <input type="text" name="commentContent" class="commentContent" id="commentContent" size="48">
				          <input type="hidden" name="commentLevel" id="commentLevel" value="1">
				          <button class="commentInsertBtn" id="commentInsertBtn" onclick="fn_commentInsert();">댓글입력</button>
				      </div>
				    <div id="Comments">
				      <ul class="comment_list">
				        댓글이 들어갈 곳
				      </ul>
				    </div> -->
                </div>
            </div>
        </div>
    </div>
<script src="${path }/resources/js/peerJS.js"></script>
<!-- <script>
	$(document).ready(function() {
		var socket = io("http://localhost:82");
		const videoGrid = document.getElementById('video-grid')
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
</script> -->
<script>
'use strict'
document.getElementById('likeButton').addEventListener('click', function(){
	if(this.name=='heart-outline'){
		$.ajax({
			url: "${path}/board/boardLikeInsert",
			type: "post",
			dataType: "json",
			data: {
				loginUsid: ${loginMember.usid},
				boardId: ${currBoard.BOARD_ID}
			},
			success: function(data) {
				if(data == 'fail') {
					return;
				}else {
					document.getElementById('likeButton').setAttribute('name',"heart");
					let likeCount = document.getElementById('likeCount').innerHTML;
					document.getElementById('likeCount').innerHTML = parseInt(likeCount) + 1;
				}
			}
		})
	}else {
		$.ajax({
			url: "${path}/board/boardLikeDelete",
			type: "post",
			dataType: "json",
			data: {
				loginUsid: ${loginMember.usid},
				boardId: ${currBoard.BOARD_ID}
			},
			success: function(data) {
				if(data == 'fail') {
					return;
				}else {
					document.getElementById('likeButton').setAttribute('name',"heart-outline");
					let likeCount = document.getElementById('likeCount').innerHTML;
					document.getElementById('likeCount').innerHTML = parseInt(likeCount) - 1;
				}
			}
		})
	}
})



$(document).ready(function(){
	fn_commentList();
	hasLiked();
})
//댓글 리스트 불러오기
function fn_commentList(){
	$.ajax({
		url: "${path}/board/boardCommentList",
		type: "post",
		dataType: "json",
		data: {
			currBoardNo: ${currBoard.BOARD_ID}
		},
		success: function(data) {
			commentListPrint(data);
		},
	})
}

function commentListPrint(commentList) {
	document.getElementById('commentPrint').innerHTML = "";
	commentList.forEach(function(item, index){
		if(item!=null){
			let comment = document.createElement('div');
			if(item.comWriterUsid == ${currBoard.WRITER_USID}) comment.className = 'commentFromWriter';
			else comment.className = 'comment';

			let commentProfileCon = document.createElement('div');
			commentProfileCon.className = 'commentProfileCon';

			let commentProfile = document.createElement('div');
			commentProfile.className = 'commentProfile';

			let img = document.createElement('img');
			img.className = 'commentProfileImg';
			img.setAttribute('src','${path}/resources/profile_images/' + item.comProfilePic);
			
			commentProfile.appendChild(img);
			commentProfileCon.appendChild(commentProfile);
			comment.appendChild(commentProfileCon);
			
			let commentContentCon = document.createElement('div');
			commentContentCon.className = 'commentContentCon';

			let commentInfo = document.createElement('div');
			commentInfo.className = 'commentInfo';

			let name = document.createElement('b');
			name.innerHTML = item.comWriterNickname;

			let date = document.createElement('small');
			date.innerHTML = item.com_enroll_date;

			commentInfo.appendChild(name).appendChild(date);//test

			commentContentCon.appendChild(commentInfo);

			let commentContent = document.createElement('div');
			commentContent.className = 'commentContent';

			commentContentCon.appendChild(commentContent);

			comment.appendChild(commentContentCon);

			document.getElementById('commentPrint').appendChild(comment);
		}
	})
}

//댓글 쓰기
function fn_commentInsert(){
	let contentValue = document.getElementById('commentContent').value;
	$.ajax({
		url:"${path}/board/boardCommentInsert",
		type:"post",
		dataType:"json",
		data:{
			currBoardNo:${currBoard.BOARD_ID},
			content:contentValue,
			writerUsid:${loginMember.usid},
			profilePic:'${loginMember.profilePic}',
			writerNick:'${loginMember.memNickname}'
		},
		success:function(data){
			if(data.result=='success')fn_commentList();
			else alert('댓글 등록에 실패했습니다.');
		}
	})
}

//좋아했는지에 따라 하트 모양 바꾸기
function hasLiked(){
	let loginUsid = ${loginMember.usid};
	$.ajax({
		url: "${path}/board/boardHasLiked",
		type: "post",
		dataType: "json",
		data: {
			loginUsid: loginUsid,
			boardId: ${currBoard.BOARD_ID}
		},
		success: function(data) {
			if(data.result == 'has') {
				document.getElementById('likeButton').setAttribute('name',"heart");
			}else {
				document.getElementById('likeButton').setAttribute('name',"heart-outline");
			}
		},
	})
}

//재판
function fn_judge(judge) {
	let boardId = ${currBoard.BOARD_ID};
	let loginUsid = ${loginMember.usid};
	let judResult;
	let loginNick = '${loginMember.memNickname}';

	if(judge=='agree'){
		judResult = 0;
		$.ajax({
			url: "${path}/board/boardJudge",
			type: "post",
			dataType: "json",
			data: {
				loginUsid: loginUsid,
				boardId: boardId,
				judResult:judResult,
				loginNick:loginNick
			},
			success: function(data) {
				if(data.result == 'has') {
					alert("이미 참여하셨습니다.");
				}else if(data.result == 'fail') {
					alert("참여에 실패했습니다.")
				}
				else {
					let likeCount = document.getElementById('agreeNum').innerHTML;
					document.getElementById('agreeNum').innerHTML = parseInt(likeCount) + 1;
				}
			}
		})
	}else {
		judResult = 1;
		$.ajax({
			url: "${path}/board/boardJudge",
			type: "post",
			dataType: "json",
			data: {
				loginUsid: loginUsid,
				boardId: boardId,
				judResult:judResult,
				loginNick:loginNick
			},
			success: function(data) {
				if(data.result == 'has') {
					alert("이미 참여하셨습니다");
				}else if(data.result == 'fail') {
					alert("참여에 실패했습니다.")
				}else {
					let likeCount = document.getElementById('disagreeNum').innerHTML;
					document.getElementById('disagreeNum').innerHTML = parseInt(likeCount) + 1;
				}
			}
		})
	}
}

</script>
</body>
</html>