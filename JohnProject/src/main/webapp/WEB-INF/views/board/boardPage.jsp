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
  overflow: auto;
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

#commentSection {
	height:100%;
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
  font-size:0.9em;
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

.commentContentCon .commentInfo b {
	font-size:16px;
	font-weight:bold;
}

.commentContentCon .commentInfo small {
	margin-left:3px;
	font-size:13px;
}

.commentContentCon .commentLikeAndFuncCon {
  margin-top:0.2em;
  text-align:right;
}

.commentLikeAndFuncCon span {
	cursor:pointer;
	margin-left:0.2em;
}

.commentLikeAndFuncCon span.up {
  color:red;
}

.commentLikeAndFuncCon span.down {
  color:gray;
}

ion-icon#likeButton {
	cursor:pointer;
}

#boardDate {
	text-align:right;
}

#boardFuncs {
	margin-top:1em;
	font-size:13px;
}

#boardFuncs a {
	color:rgb(0,0,0,0.8);
}

#textInsertBtn {
	background-color:#00316d;
}

#textInsertBtn:hover {
	background-color:rgb(0,49,109,0.9);
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
      </div>
	  <div id="boardFuncs">
	  	<a href="${path}/report/customerReport?boardId=${currBoard.BOARD_ID }&nick=${currBoard.WRITER_NICKNAME }">신고하기</a>
	  	<c:if test="${currBoard.WRITER_USID eq loginMember.usid }">
	  	<a href="#" onclick='fn_modify();'>수정하기</a>
	  	<a href="#" onclick="fn_delete();">삭제하기</a>
	  	</c:if>
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
            <div class="commentLikeAndFuncCon">
              <span class="modify">수정하기</span>
              <span class="delete">삭제하기</span>
              <span class="up"><ion-icon name="thumbs-up-outline"></ion-icon> 12</span> 
              <span class="down"><ion-icon name="thumbs-down-outline"></ion-icon> 3</span>
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
            <div class="commentLikeAndFuncCon">
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
          <button id="textInsertBtn" onclick="fn_commentInsert();" type="button" class="btn btn-primary">
            댓글쓰기
          </button>
        </div>
      </div>
    </div>
  </div>
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

function fn_modify(){
	
	let form = document.createElement('form');
	form.setAttribute('action','${path}/board/boardModify');
	form.setAttribute('method','POST');
	form.style.display = 'none';
	
	let title = document.createElement('input');
	title.setAttribute('name','title');
	title.value = '${currBoard.TITLE}';
	form.appendChild(title);
	
	let boardId = document.createElement('input');
	boardId.setAttribute('name','boardId');
	boardId.value = ${currBoard.BOARD_ID};
	form.appendChild(boardId);
	
	const content = document.createElement('input');
	content.setAttribute('name','content');
	content.value = `${currBoard.CONTENT}`;
	form.appendChild(content);
	
	let smallCate = document.createElement('input');
	smallCate.setAttribute('name','smallCate');
	smallCate.value = '${currBoard.SMALL_CATEGORY}';
	form.appendChild(smallCate);
	
	let agreeName = document.createElement('input');
	agreeName.setAttribute('name','agreeName');
	agreeName.value = '${currBoard.AGREE_NAME}';
	form.appendChild(agreeName);
	
	let disagreeName = document.createElement('input');
	disagreeName.setAttribute('name','disagreeName');
	disagreeName.value = '${currBoard.DISAGREE_NAME}';
	form.appendChild(disagreeName);
	
	document.getElementById('content').appendChild(form);
	form.submit();
}

function fn_delete(){
	
	if(confirm('정말 삭제하시겠습니까?'))location.href='${path}/board/boardDelete?boardId=${currBoard.BOARD_ID }';
}

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

document.getElementById('commentContent').onkeypress = function(e){
	if(e.keyCode == 13){
		document.getElementById('textInsertBtn').click();
	}
}

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

//댓글 리스트 화면에 출력
function commentListPrint(commentList) {
	document.getElementById('commentPrint').innerHTML = "";
	commentList.forEach(function(item, index){
		if(item!=null){
			//날짜 변환
			let time = parseInt(item.COM_ENROLL_DATE);
			time = new Date(time);
			time = time.customFormat("#YYYY#/#MM#/#DD# #hh#:#mm#");
			let comment = document.createElement('div');
			if(item.COM_WRITER_USID == '${currBoard.WRITER_USID}') comment.className = 'commentFromWriter';
			else comment.className = 'comment';

			let commentProfileCon = document.createElement('div');
			commentProfileCon.className = 'commentProfileCon';

			let commentProfile = document.createElement('div');
			commentProfile.className = 'commentProfile';

			let img = document.createElement('img');
			img.className = 'commentProfileImg';
			img.setAttribute('src','${path}/resources/profile_images/' + item.COM_PROFILE_PIC);
			
			commentProfile.appendChild(img);
			commentProfileCon.appendChild(commentProfile);
			comment.appendChild(commentProfileCon);
			
			let commentContentCon = document.createElement('div');
			commentContentCon.className = 'commentContentCon';

			let commentInfo = document.createElement('div');
			commentInfo.className = 'commentInfo';

			let name = document.createElement('b');
			name.innerHTML = item.COM_WRITER_NICKNAME;

			let date = document.createElement('small');
			date.innerHTML = time;

			commentInfo.appendChild(name);
			commentInfo.appendChild(date);//test

			commentContentCon.appendChild(commentInfo);

			let commentContent = document.createElement('div');
			commentContent.className = 'commentContent';
			commentContent.innerHTML = item.COM_CONTENT;

			commentContentCon.appendChild(commentContent);
			
			let commentLikeAndFuncCon = document.createElement('div');
			commentLikeAndFuncCon.className = 'commentLikeAndFuncCon';
			
			if(${loginMember.usid} == item.COM_WRITER_USID){
			//comId 넣기
			let comIdInput = document.createElement('input');
			comIdInput.setAttribute('type','hidden');
			comIdInput.setAttribute('value',item.COM_ID);
			
			//댓글 수정하기
			let modifySpan = document.createElement('span');
			modifySpan.className = 'modify';
			modifySpan.innerHTML = '수정하기';
			
			//댓글 삭제하기
			let deleteSpan = document.createElement('span');
			deleteSpan.className = 'delete';
			deleteSpan.innerHTML = '삭제하기';
			deleteSpan.setAttribute('onclick',"fn_commentDelete("+item.COM_ID+");");
			
			commentLikeAndFuncCon.appendChild(comIdInput);
			commentLikeAndFuncCon.appendChild(modifySpan);
			commentLikeAndFuncCon.appendChild(deleteSpan);
			}
			
			//댓글 좋아요
			let upSpan = document.createElement('span');
			upSpan.className = 'up';
			upSpan.setAttribute('onclick',"fn_commentLike('like',"+item.COM_ID+", this);");
			
			//댓글 좋아요 아이콘
			let thumbUp = document.createElement('ion-icon');
			thumbUp.setAttribute('name','thumbs-up-outline');
			
			//댓글 좋아요 카운트
			let upCount = document.createElement('span');
			upCount.className = 'comUpCount';
			upCount.innerHTML = item.LIKE_COUNT
			upSpan.appendChild(thumbUp);
			upSpan.appendChild(upCount);
			
			//댓글 싫어요
			let downSpan = document.createElement('span');
			downSpan.className = 'down';
			downSpan.setAttribute('onclick',"fn_commentLike('dislike',"+item.COM_ID+", this);");
			
			//댓글 싫어요 아이콘
			let thumbDown = document.createElement('ion-icon');
			thumbDown.setAttribute('name','thumbs-down-outline');
			
			//댓글 싫어요 카운트
			let downCount = document.createElement('span');
			downCount.className = 'comDownCount';
			downCount.innerHTML = item.DISLIKE_COUNT;
			downSpan.appendChild(thumbDown);
			downSpan.appendChild(downCount);
			
			commentLikeAndFuncCon.appendChild(upSpan);
			commentLikeAndFuncCon.appendChild(downSpan);
			
			commentContentCon.appendChild(commentLikeAndFuncCon);
			
			comment.appendChild(commentContentCon);

			document.getElementById('commentPrint').appendChild(comment);
		}
	})
}

//댓글 수정
$(document).on('click','.modify',function(e){
	let comId = $(e.target).parent().children('input').val();
	let value = $(e.target).parent().parent().children('.commentContent').text();
	let html = "<input class='modifyInput' type='text' size='20' value="+value+">";
	html += "<button onclick='fn_commentModify("+comId+", this);'>수정하기</button>"
	$(e.target).parent().parent().children('.commentContent').html(html);
})

//댓글 수정 Ajax
function fn_commentModify(comId, e) {
	let values = e.parentElement.getElementsByTagName('input');
	let value = values[0].value;
	$.ajax({
		url:"${path}/board/boardCommentUpdate",
		type:"post",
		dataType:"json",
		data:{
			comId:comId,
			value:value
		},
		success:function(data){
			if(data.result=='success')fn_commentList();
			else alert('댓글 수정에 실패했습니다.');
		}
	})
}
//댓글 삭제
function fn_commentDelete(comId){
	if(confirm('정말로 삭제하시겠습니까?')){
		$.ajax({
			url:"${path}/board/boardCommentDelete",
			type:"post",
			dataType:"json",
			data:{
				comId:comId
			},
			success:function(data){
				if(data.result=='success')fn_commentList();
				else alert('댓글 삭제에 실패했습니다.');
			}
		})
	}
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
			if(data.result=='success'){
				fn_commentList();
				document.getElementById('commentContent').value = "";
				}
			else alert('댓글 등록에 실패했습니다.');
		}
	})
}

//댓글 좋아요, 싫어요 업데이트
function fn_commentLike(key, comId, e){
	let loginUsid = ${loginMember.usid};
	let value;
	if(key == 'like'){
		//좋아요
		value = 1;
		$.ajax({
			url: "${path}/board/boardCommentLike",
			type: "post",
			dataType: "json",
			data: {
				loginUsid: loginUsid,
				comId: comId,
				key: value
			},
			success: function(data) {
				if(data.result == 'has') {
					alert("이미 참여하셨습니다.");
				}else if(data.result == 'fail') {
					alert("참여에 실패했습니다.")
				}
				else {
					let counts = e.getElementsByClassName('comUpCount');
					for(let i = 0; i < counts.length; i++){
						counts[i].innerHTML = parseInt(counts[i].innerHTML) + 1;
					}
				}
			},
		})
	}else {
		//싫어요
		value = 2;
		$.ajax({
			url: "${path}/board/boardCommentLike",
			type: "post",
			dataType: "json",
			data: {
				loginUsid: loginUsid,
				comId: comId,
				key : value
			},
			success: function(data) {
				if(data.result == 'has') {
					alert("이미 참여하셨습니다.");
				}else if(data.result == 'fail') {
					alert("참여에 실패했습니다.")
				}
				else {
					let counts = e.getElementsByClassName('comDownCount');
					for(let i = 0; i < counts.length; i++){
						counts[i].innerHTML = parseInt(counts[i].innerHTML) + 1;
					}
				}
			},
		})
	}
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

//*** This code is copyright 2002-2016 by Gavin Kistner, !@phrogz.net
//*** It is covered under the license viewable at http://phrogz.net/JS/_ReuseLicense.txt
Date.prototype.customFormat = function(formatString){
  var YYYY,YY,MMMM,MMM,MM,M,DDDD,DDD,DD,D,hhhh,hhh,hh,h,mm,m,ss,s,ampm,AMPM,dMod,th;
  YY = ((YYYY=this.getFullYear())+"").slice(-2);
  MM = (M=this.getMonth()+1)<10?('0'+M):M;
  MMM = (MMMM=["January","February","March","April","May","June","July","August","September","October","November","December"][M-1]).substring(0,3);
  DD = (D=this.getDate())<10?('0'+D):D;
  DDD = (DDDD=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"][this.getDay()]).substring(0,3);
  th=(D>=10&&D<=20)?'th':((dMod=D%10)==1)?'st':(dMod==2)?'nd':(dMod==3)?'rd':'th';
  formatString = formatString.replace("#YYYY#",YYYY).replace("#YY#",YY).replace("#MMMM#",MMMM).replace("#MMM#",MMM).replace("#MM#",MM).replace("#M#",M).replace("#DDDD#",DDDD).replace("#DDD#",DDD).replace("#DD#",DD).replace("#D#",D).replace("#th#",th);
  h=(hhh=this.getHours());
  if (h==0) h=24;
  if (h>12) h-=12;
  hh = h<10?('0'+h):h;
  hhhh = hhh<10?('0'+hhh):hhh;
  AMPM=(ampm=hhh<12?'am':'pm').toUpperCase();
  mm=(m=this.getMinutes())<10?('0'+m):m;
  ss=(s=this.getSeconds())<10?('0'+s):s;
  return formatString.replace("#hhhh#",hhhh).replace("#hhh#",hhh).replace("#hh#",hh).replace("#h#",h).replace("#mm#",mm).replace("#m#",m).replace("#ss#",ss).replace("#s#",s).replace("#ampm#",ampm).replace("#AMPM#",AMPM);
};
</script>
</body>
</html>