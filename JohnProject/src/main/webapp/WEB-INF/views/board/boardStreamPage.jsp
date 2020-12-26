<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
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

#content1 {
  margin:0;
  width: 100%;
  height: 89%;
  overflow:auto;
  display: flex;
  flex-direction: row;
  border:1px silver solid;
  background-color:white;
}

hr {
  border-top:1px black solid;
}

#titleHr {
  margin-top:0.5em;
}

#writerInfo {
height:1.9em;
  display:flex;
}

#writerProfile{
  border-radius:20px;
  overflow:hidden;
}

#writerImg {
  width:30px;
  height:30px;
}

#writerNick {
  display:flex;
  justify-content:center;
  align-items:center;
  margin-left:2.5px;
  margin-right:5px;
  min-width:3em;
  max-width:6em;
}

#writerComment{
  width:100%;
  background-color:white;
  border-radius:15px;
  border-top-left-radius:0px;
  display:flex;
  justify-content:center;
  align-items:center;
  border:1px silver solid;
}

#writerComIn {
  width:100%;
  border:1px white solid;
  border-radius:15px;
  border-top-left-radius:0px;
  padding-left:8px;
  
}

#wrapper {
  width: 70%;
  font-family: 'Noto Serif KR', serif;
  padding:2em;
  border-right:1px silver solid;
  overflow:auto;
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
  border-radius:10px;
  background-color:#F0F2FC;
  padding:1.5em;
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
  background-color:#F0F2FC;
  width:30%;

}

#commentSection #commentPrint {
  height:91%;
  overflow:auto;
  padding:1em;
}
.user {
  border-radius:7px;
  background-color:#00316d;
  color:white;
  margin-bottom:0.5em;
}

.userCon {
  display:flex;
  height:2em;
  align-items:center;
}

.userNick {
  margin-left:5px;
  display:flex;
  justify-content:center;
  align-items:center;
}

.userImgCon {
  width:25px;
  height:25px;
  border-radius:25px;
  overflow:hidden;
  display:flex;
  justify-content:center;
  align-items:center;
  margin-left:0.3em;
}

.userImg {
  width:25px;
  height:25px;
}

.userComment {
  border-radius:6px;
  border-top-left-radius:0px;
  border-top-right-radius:0px;
  background-color:white;
  padding-left:1em;
  padding-right:1em;
  color:black;
  min-height:1.7em;
  max-height:3.5em;
  display:flex;
  align-items:center;
}

#commentInsertArea {
  background-color:white;
  display:flex;
  justify-content:center;
  align-items:center;
  height:9%;
  padding-left:1em;
  padding-right:1em;
  border-top:1px silver solid;
  /* background-color:#CCD7E6; */
}

#commentText {
  width:83%;
}

#commentTextBtn {
  margin-left:-4px;
  width:17%
}

ion-icon#likeButton {
	cursor:pointer;
}

#boardDate {
  text-align:right;
}

#box1 {
  width: 90%;
  box-sizing: border-box;
  position: relative;
  margin: 50px auto;
  margin-top:2em;
  margin-bottom:2em;
  padding:5em;
  border:1px silver solid;
  padding-left:6.5em;
  display:flex;
  flex-direction:column;
  justify-content:center;
  align-items:center;
  border-radius:15px;
  background-color:white;
  overflow:hidden;
}

#box1 .inform {
  /* position:absolute; */
  /* border:1px red solid; */
}
.wifi-symbol {
  width: 50px;
  height: 50px;
  box-sizing: border-box;
  overflow: hidden;
  transform: rotate(135deg);
  /* border:1px red solid; */
  margin-left:2em;
}
.wifi-circle {
  border: 5px solid #999999;
  border-radius: 50%;
  position: absolute;
}

.first {
  width: 5px;
  height: 5px;
  background: #cccccc;
  top: 45px;
  left: 45px;
}

.second {
  width: 25px;
  height: 25px;
  top: 35px;
  left: 35px;
  animation: fadeInOut 1s infinite 0.2s;.
}

.third {
  width: 40px;
  height: 40px;
  top: 25px;
  left: 25px;
  animation: fadeInOut 1s infinite 0.4s;
}

@keyframes fadeInOut {
  0% {
    Opacity: 0; /* initial state transparency is 0*/
  }
  100% {
    Opacity: 1; /* end state transparency is 1*/
  }
}

#box1 img {
	width:100%em;
	height:20em;;
}

#exitBtn {
	margin-top:0.5em;
	float:right;
	background-color:orange;
	color:white;
	border:1px orange solid;
	border-radius:5px;
	transition: .2s;
	width:7em;
}

#exitBtn:hover {
	border:1px orange solid;
	background-color:white;
	color:black;
}
	
	
</style>
<script>
	const ROOM_ID = "${currBoard.BOARD_ID}";
</script>

<div id="content1">
    <div id="wrapper">
      <div id="boardContent">
      <div id="titleAndLikes">
        <div id="title"><!-- ${currBoard.TITLE } -->TITLE</div>
        <div id="likeAndHits">
          <span><ion-icon id="likeButton" name="heart-outline"></ion-icon> 좋아요 <span id="likeCount">${currBoard.LIKE_NUM }</span> 조회수 ${currBoard.HIT }</span>
        </div>
      </div>
          <hr id="titleHr">
          <div id="writerInfo">
            <div id="writerProfile">
              <img src="${path }/resources/profile_images/${currBoard.WRITER_PROFILE}" id="writerImg">
            </div>
            <div id="writerNick">
              ${currBoard.WRITER_NICKNAME }
            </div>
            <div id="writerComment">
              <input type="text" value="방장의 한마디" id="writerComIn"
              <c:if test="${loginMember.usid ne currBoard.WRITER_USID }">
	        	readonly
	        	</c:if>
               placeholder="Enter를 누르면 입력됩니다.">
            </div>
          </div>
          <div id="video-grid">
          	
          </div>
          <div id="box1">
            <div class="wifi-symbol">
                <div class="wifi-circle first"></div>
                <div class="wifi-circle second"></div>
                <div class="wifi-circle third"></div>
            </div>
            <div class="inform">
            <c:if test="${currBoard.ISCLOSE eq 1}">
            	대화가 끝난 채팅방입니다.
            </c:if>
            <c:if test="${currBoard.ISCLOSE eq 0}">
            	이 곳에 사진을 공유해보세요
            </c:if>
            </div>
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
              ${currBoard.DISAGREE_NAME }
            </button>
          </div>
          <div class="countCon">
          	<div id="disagreeNum">${currBoard.DISAGREE_NUM }</div>
          	</div>
        </div>
      </div>
      <hr>
    </div>
    <c:if test="${currBoard.WRITER_USID eq loginMember.usid }">
    <button id="exitBtn" onclick="fn_exit();">대화 종료</button>
    </c:if>
        </div>
        <div id="commentSection">
          <div id="commentPrint">
            
          </div>
        <div id="commentInsertArea">
          <input type="text" id="commentText" maxlength="20">
          <button id="commentTextBtn" onclick="fn_chatInsert();">전송</button>
        </div>
        <c:if test="${loginMember.usid eq currBoard.WRITER_USID }">
        	<style>
        		#commentInsertArea {
        			display:none;
        		}
        	</style>
        </c:if>
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
<c:if test="${currBoard.ISCLOSE eq 0 }">
<script src="https://unpkg.com/peerjs@1.3.1/dist/peerjs.min.js"></script>
<script defer src="https://172.30.1.31:83/socket.io/socket.io.js"></script>
<script>
	function fn_exit(){
		
		if(confirm('정말 대화방을 종료하시겠습니까?')){
			chatSocket.send("leave:"+"${currBoard.BOARD_ID}");
			location.href="${path}/board/boardExit?boardId=${currBoard.BOARD_ID}";
		}
		
	}

	$(document).ready(function() {
		const userId = uuidv4()+":"+${loginMember.usid};
		var socket = io("https://172.30.1.31:83");
		const videoGrid = document.getElementById('video-grid')
		const myPeer = new Peer(undefined, {
			host: '/172.30.1.31',
			port: '3000',
			secure:true
		});
		const dataConnection = myPeer.connect(myPeer.id, {
			metadata:${loginMember.usid}
		})
		
		console.log(dataConnection.metadata);
		let myVideo = document.createElement('audio')
		myVideo.muted = true;
		
		const peers = {};
		
		console.log(peers);
		
		navigator.mediaDevices.getUserMedia({
			video:false,
			audio:true
		}).then(stream => {
			addVideoStream(myVideo, stream)
			
			myPeer.on('call', call => {
				console.log('call 받음')
				call.answer(stream)
				console.log('call 받음2222')
				const video = document.createElement('audio')
				call.on('stream', userVideoStream => {
					addVideoStream(video, userVideoStream)
				})
			})
			
			//새로운 유저가 들어왔을 때
			socket.on('user-connected', userId => {
				console.log('새로운 유저가 들어옴:'+userId)
				connectToNewUser(userId, stream)
			})
		}, function(err) {
			  console.log('Failed to get local stream' ,err);
		})
		
		socket.on('user-disconnected', userId => {
			console.log('유저가 나감')
			if(peers[userId]){
				peers[userId].close();
				console.log('close 실행')
			}
			console.log(peers);
		})

		
		myPeer.on('open', id => {
			console.log('룸에 조인함')
			socket.emit('join-room', ROOM_ID, id);
		})

		function connectToNewUser(userId, stream){
			const call = myPeer.call(userId, stream, {
				metadata:${loginMember.usid}
			});
			call.answer(mediaStream);
			const video = document.createElement('audio');
			console.log(userId+"로 부터 들어옴");
			call.on('stream', userVideoStream => {
				console.log(userVideoStream.metadata);
				console.log('stream 실행')
				addVideoStream(video, userVideoStream);
			})
			call.on('close',()=>{
				console.log('close 실행')
				video.remove();
			})
			
			peers[userId] = call;
		}
		
		function addVideoStream(video, stream) {
			video.srcObject = stream;
			console.log(stream.metadata);
			video.addEventListener('loadedmetadata', () => {
				video.play();
			})
			videoGrid.appendChild(video);
			console.log(video);
		}
	});
</script>
<script>
'use strict'

let chatList = [];

let chatSocket = new WebSocket("wss://rclass.iptime.org${path}/chat");

document.ondrop = function(e){
	e.preventDefault();
}

document.ondragover = function(e) {
 e.preventDefault();
 document.body.style.backgroundColor = "#66FF00";
}

document.ondragleave = function(e) {
 document.body.style.backgroundColor = "#660000";
}

document.getElementById('box1').ondrop = function(e){
	e.preventDefault();
	<c:if test="${loginMember.usid eq currBoard.WRITER_USID }">
	handleFileDrop(e.dataTransfer.files[0]);
	</c:if>
  	return false;
}

function handleFileDrop(file){
	var fileReader = new FileReader();
	let rowData=new ArrayBuffer();
	chatSocket.binaryType="arraybuffer";
	fileReader.onload = function(e) {
	    rowData = e.target.result;
	    chatSocket.send('image:'+JSON.stringify(file.name));
	    chatSocket.send(rowData); //파일 소켓 전송
	};
	fileReader.readAsArrayBuffer(file);
} 

$(document).ready( function() {
	window.addEventListener("beforeunload", function(event) {
		event.preventDefault();
		console.log("화면 종료");
		chatSocket.close();
	});
});

chatSocket.onerror = function(e) {
	
	console.log(e);
}

chatSocket.onclose = function(e) {
	console.log('???????');
	console.log(e);
}

if(chatSocket.readyState==3){
	chatSocket.close();
}

chatSocket.onopen = function(e){
  	let user = {boardId:${currBoard.BOARD_ID},
              usid:${loginMember.usid},
  				message:'안녕하세요',
  				isFirst:true};
	chatSocket.send('chat:'+JSON.stringify(user));
}

chatSocket.onclose = function(e) {
	chatSocket.close();
	chatSocket = new WebSocket("wss://172.30.1.31:8443${path}/chat");
};

chatSocket.onmessage = function(e){
	if(e.data.substring(0,5) == 'image'){
		let fileName = e.data.substring(6,e.data.length);
		
		let box1 = document.getElementById('box1');
		box1.innerHTML = "";
		
		let img = document.createElement('img');
		img.setAttribute('src','${path}/resources/images/'+fileName);
		
		box1.appendChild(img);
	}else if(e.data == 'leave') {
		alert('방장이 대화를 종료하였습니다.');
		location.href = "${path}/board/boardList";
	}else{
	chatList = JSON.parse(e.data);
	console.log(chatList);
	//사용자 숫자를 알기 위한 배열
	let tempList= [];

	chatList.forEach(function(item,index){
		//동일한 usid가 있는지 확인
		if(!tempList.includes(item.usid))tempList.push(item.usid);
	})
	
	//usid 리스트
	/* console.log(tempList); */

  document.getElementById('commentPrint').innerHTML = "";

  chatList = chatList.sort((a,b) => (a.enrollDate > b.enrollDate) ? -1 : 1);

  let realChatList = [];
  
  //방장 채팅부터 넣어주기
  for(let i = 0; i < chatList.length; i++){
	  if(chatList[i].usid==${currBoard.WRITER_USID}){
		  realChatList.push(chatList[i]);
		  break;
	  }
  }
  let idx = 0;
  
  for(let i = 0; i < chatList.length; i++){
	  if(chatList[i].usid!=realChatList[idx].usid){
		  realChatList.push(chatList[i]);
		  idx++;
	  }
	  if(tempList.length==realChatList.length)break;
  }
  
  /* chatList.forEach(function(item,index){
    if(realChatList.length<tempList.length){
      if(item.usid!=realChatList[idx].usid){
        realChatList.push(item);
        idx++;
      }
    }
  }) */

  realChatList.forEach(function(item, index){
	if(item.usid==${currBoard.WRITER_USID}){
		let writerComIn = document.getElementById('writerComIn');
		writerComIn.value = item.message;
		writerComIn.style.color = '#00316d';
		writerComIn.style.fontWeight = '900';
	}else{
	    let user = document.createElement('div');
	    user.className = 'user';
	    let userCon = document.createElement('div');
	    userCon.className = 'userCon';
	    let userImgCon = document.createElement('div');
	    userImgCon.className = 'userImgCon';
	    let userImg = document.createElement('img');
	    userImg.className = 'userImg';
	    userImg.setAttribute('src','${path}/resources/profile_images/'+item.userImg);
	    userImgCon.appendChild(userImg);
	    let userNick = document.createElement('div');
	    userNick.className = 'userNick';
	    userNick.innerHTML = item.userNick;
	    userCon.appendChild(userImgCon);
	    userCon.appendChild(userNick);
	    let userComment = document.createElement('div');
	    userComment.className = 'userComment';
	    userComment.innerHTML = item.message;
	    user.appendChild(userCon);
	    user.appendChild(userComment);
	    document.getElementById('commentPrint').appendChild(user);
    }
  })
 }
}

//채팅창 엔터에 반응하기
document.getElementById('commentText').onkeypress = function(e){
	if(e.keyCode == 13){
		document.getElementById('commentTextBtn').click();
	}
}



//방장의 한마디 엔터에 반응하기
document.getElementById('writerComIn').onkeypress = function(e){
	document.getElementById('writerComIn').style.color = 'black';
	if(e.keyCode == 13){
		document.getElementById('commentText').value = document.getElementById('writerComIn').value;
		document.getElementById('commentTextBtn').click();
	}
}



//채팅입력하기
function fn_chatInsert(){
  let val = document.getElementById('commentText').value;
  document.getElementById('commentText').value = "";
  let chat = {boardId:${currBoard.BOARD_ID},
          usid:${loginMember.usid},
          message:val};
  chatSocket.send('chat:'+JSON.stringify(chat));
}
</c:if>

//좋아요 기능
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
	hasLiked();
})

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

function createObjectURL (blob) {
 if ( window.webkitURL ) {
  return window.webkitURL.createObjectURL( blob );
 } else if ( window.URL && window.URL.createObjectURL ) {
  return window.URL.createObjectURL( blob );
 } else {
  return null;
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

function uuidv4() {
	  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
	    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
	    return v.toString(16);
	  });
	}
</script>
</body>
</html>