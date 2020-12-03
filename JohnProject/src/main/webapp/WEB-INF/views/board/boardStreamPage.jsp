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
  display:flex;
}

#writerProfile{
  border-radius:20px;
  overflow:hidden;
}

#writerImg {
  width:25px;
  height:25px;
}

#writerNick {
  display:flex;
  justify-content:center;
  align-items:center;
  margin-left:2.5px;
  margin-right:5px;
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
  max-height:3em;
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

#boardDate {
  text-align:right;
}

.box1 {
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
}

.box1 .inform {
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
	
	
</style>
<script>
	const ROOM_ID = "${currBoard.boardId}";
</script>
<!-- <script defer src="http://localhost:82/socket.io/socket.io.js"></script> -->
<div id="content1">
    <div id="wrapper">
      <div id="boardContent">
      <div id="titleAndLikes">
        <div id="title"><!-- ${currBoard.TITLE } -->TITLE</div>
        <div id="likeAndHits">
          <span><ion-icon id="likeButton" name="heart-outline"></ion-icon> 좋아요 <span id="likeCount">3<!-- ${currBoard.LIKE_NUM } -->
        </div>
      </div>
          <hr id="titleHr">
          <div id="writerInfo">
            <div id="writerProfile">
              <img src="" id="writerImg">
            </div>
            <div id="writerNick">
              Nickname
            </div>
            <div id="writerComment">
              <input type="text" value="방장의 한마디" id="writerComIn">
            </div>
          </div>
          <div class="box1">
            <div class="wifi-symbol">
                <div class="wifi-circle first"></div>
                <div class="wifi-circle second"></div>
                <div class="wifi-circle third"></div>
            </div>
            <div class="inform">
              이 곳에 사진을 공유해보세요
            </div>
        </div>
      <hr>
      <div id="judgeCon">
        <div class="judgeBtns" id="agreeBtn">
          <div id="agreeBtnCon">
            <button onclick="fn_judge('agree');" id="agree" type="button" class="btn btn-primary">
              <ion-icon name="thumbs-up-outline"></ion-icon>
              <br>
              찬성<!-- ${currBoard.AGREE_NAME } --></button>
          </div>
          <div class="countCon">
            <div id="agreeNum">100<!-- ${currBoard.AGREE_NUM } --></div>
          </div>
        </div>
        <div class="judgeBtns" id="disagreeBtn">
          <div id="disagreeBtnCon">
            <button onclick="fn_judge('disagree');" id="disagree" type="button" class="btn btn-primary">
              <ion-icon name="thumbs-down-outline"></ion-icon>
              <br>
              <!-- ${currBoard.DISAGREE_NAME } -->
            반대</button>
          </div>
          <div class="countCon">
          	<div id="disagreeNum">100<!-- ${currBoard.DISAGREE_NUM } --></div>
          	</div>
        </div>
      </div>
      <hr>
    </div>
        </div>
        <div id="commentSection">
          <div id="commentPrint">
            <div class="user">
            <div class="userCon">
              <div class="userImgCon">
                <img src="#" class="userImg">
              </div>
              <div class="userNick">
                다람쥐1
              </div>
            </div>
              <div class="userComment">
                안녕하세요
              </div>
          </div>
            <div class="user">
            <div class="userCon">
              <div class="userImgCon">
                <img src="#" class="userImg">
              </div>
              <div class="userNick">
                다람쥐2
              </div>
            </div>
              <div class="userComment">
                안녕하세요
              </div>
          </div>
          <div class="user">
            <div class="userCon">
              <div class="userImgCon">
                <img src="#" class="userImg">
              </div>
              <div class="userNick">
                다람쥐3
              </div>
            </div>
              <div class="userComment">
                안녕하세요
              </div>
          </div>
        </div>
        <div id="commentInsertArea">
          <input type="text" id="commentText" maxlength="30">
          <button id="commentTextBtn">전송</button>
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

const chatSocket = new SockJS("https://localhost:8443${path}/chat");

chatSocket.onopen = function(e){
  let user = {boardId:${currBoard.BOARD_ID},
              usid:${loginMember.usid}};
	chatSocket.send(JSON.stringify(user));
}


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