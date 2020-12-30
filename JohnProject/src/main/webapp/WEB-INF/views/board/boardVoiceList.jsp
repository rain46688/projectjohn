<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	<!-- 
		추후 업데이트 할 것
		화살표가 아이디 기준으로 움직이므로 기준점 이름을 바꿔줄 것
	 -->

<style>

#content {
}
	
#result {
	font-family: 'Noto Serif KR', serif;
 	scroll-behavior:smooth;
 	display:flex;
 	height:37em;
 	flex-direction:column;
}


.subListTitle {
	margin-left:1em;
	font-weight: 800;
	font-size: 1.75em;
	font-family: 'Noto Serif KR', serif;
}

.subListTitle a {
	margin-left: 0em;
	font-size: 14px;
	font-weight: 600;
	color:black;
	text-decoration: underline;
}

.iconCon {
  font-size:24px;
  width:10%;
}
ion-icon[name=thumbs-up-outline]{
color:orange;
}
ion-icon[name=thumbs-down-outline]{
color:silver;
}

.heart{
color:darkred;
}

	
@import url('https://fonts.googleapis.com/css2?family=DM+Mono:wght@300;400;500&display=swap');

body {
    padding: 0;
    margin: 0;
    background-color: silver;
    color: black;
    font-family: 'DM Mono', monospace;
}

.popular {
}

a {
    text-decoration: none;
}

.card-list {
    display: flex;
   	justify-content:center;
    width:100%;
    padding:2em;
    padding-right:0;
}

.card-list::-webkit-scrollbar {
    width: 10px;
    height: 10px;
}
.card-list::-webkit-scrollbar-thumb {
    background: #201c29;
    border-radius: 10px;
    box-shadow: inset 2px 2px 2px hsla(0,0%,100%,.25), inset -2px -2px 2px rgba(0,0,0,.25);
}

.card-list::-webkit-scrollbar-track {
    background: linear-gradient(90deg,#201c29,#201c29 1px,#17141d 0,#17141d);
}


.card1 {
    height: 14rem;
    width: 19rem;
    padding: 1.5rem;
    border-radius: 16px;
    background: white;
    box-shadow: 0rem 0 1rem silver;
    display: flex;
    flex-direction: column;
    transition: .2s;
    margin: 0;
    scroll-snap-align: start;
    clear: both;
    position: relative;
    cursor:pointer;
    margin-right:2em;
}
.card1 * {
	/* border:1px red solid; */
}

.card1:focus-within~.card1, .card1:hover~.card1 {
	
}

.card1:hover {
    transform: scale(1.09);
}

.card1:hover > .card1-content {
	height:20em;
}

.card1-header {
    margin-bottom: 0.5em;
}

.card1-header p {
    font-size: 14px;
    margin: 0 0 0.5rem;
    color: black;
}

.card1-header h2 {
    font-size: 20px;
    margin: 0 auto;
    text-decoration: none;
    color: inherit;
    border: 0;
}

.card1-content {
	text-overflow:eclipse;
	white-space: nowrap;
 	 overflow: hidden;
	margin-bottom:0.5rem;
	height:60%;
}

/* .card1-header h2:hover {
    background: linear-gradient(90deg,#ff8a00,#e52e71);
    text-shadow: none;
    -webkit-text-fill-color: transparent;
    -webkit-background-clip: text;
    background-clip: text;
} */

.card1:hover > .card1-header>h2{
	background: linear-gradient(90deg,#ff8a00,#e52e71);
    text-shadow: none;
    -webkit-text-fill-color: transparent;
    -webkit-background-clip: text;
    background-clip: text;
}

.card1:hover > .card1-content{
	background: linear-gradient(90deg,#ff8a00,#e52e71);
    text-shadow: none;
    -webkit-text-fill-color: transparent;
    -webkit-background-clip: text;
    background-clip: text;
}

.card1:hover .hits {
	display:inline-block;
}

.card-author {
    margin: 3rem 0 0;
    display: grid;
    grid-template-columns: 75px 1fr;
    align-items: center;
    position: relative;
    margin-top:0.5rem;
}

.author-avatar {
    grid-area: auto;
    align-self: start;
    position: relative;
    box-sizing: border-box;
}

.author-avatar img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    /* filter: grayscale(100%); */
    display: block;
    overflow: hidden;
    margin: 16px 10px;
}

.author-name {
    grid-area: auto;
    box-sizing: border-box;
}

.author-name-prefix {
    font-style: normal;
    font-weight: 700;
    color: #7a7a8c;
}

.half-circle {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 60px;
    height: 48px;
    fill: none;
    stroke: #ff8a00;
    stroke-width: 8;
    stroke-linecap: round;
    pointer-events: none;
}

.tags {
    margin: 1rem 0 2rem;
    padding: .5rem 0 1rem;
    line-height: 2;
    margin-bottom: 0;
}

.tags a {
    font-style: normal;
    font-weight: 700;
    font-size: .5rem;
    color: #7a7a8c;
    text-transform: uppercase;
    font-size: .66rem;
    border: 3px solid #28242f;
    border-radius: 2rem;
    padding: .2rem .85rem .25rem;
    position: relative;
}

.tags a:hover {
    background: linear-gradient(90deg,#ff8a00,#e52e71);
    text-shadow: none;
    -webkit-text-fill-color: transparent;
    -webkit-background-clip: text;
    -webkit-box-decoration-break: clone;
    background-clip: text;
    border-color: white;
}

.card-content{
	margin-bottom:0.5rem;
	height:40%;
}

hr { display: block; height: 1px;
    border: 0; border-top: 1px solid #ccc;
    margin: 1em 0; padding: 0; }
    
.hits{
	float:right;
}

.pagination {
	margin-top:2em;
	height: 4em;
	color:gray;
}
div.menuContainer {
	background-color: transparent;
}

#sidebarVerbal {
	background-color: rgb(255,255,255,0.1);
}

div.glider {
}

.glider-prev {
	left:100px;
	bottom: 38%;
}

.glider-next {
	right:100px;
	bottom: 38%;
}

ion-icon[name=volume-high-outline]{
color:blue;
}

</style>
<script src="${path }/resources/js/glider.js"></script>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/glider.css">
	<div id="content">
	<!-- 내용 -->
	<h1 class='subListTitle'><ion-icon name="mic-outline"></ion-icon> ${title }</h1>
		<hr>
	<div class="glider-contain">
	<div id="result" class="glider">
		
	 </div>
	 <button aria-label="Previous" class="glider-prev" style="left:50px;">«</button>
	  <button aria-label="Next" class="glider-next" style="right:50px;">»</button>
	  <div role="tablist" class="dots"></div>
	  </div>
									</div>
 								</div>
							</div>
						</div>
					</div>
                </div>
            </div>
        </div>
    </div>
<script defer>
	'use strict'
	/* new Glider(document.querySelector('.glider'), {
	  slidesToShow: 1,
	  dots: '.dots',
	  draggable: true,
	  arrows: {
	    prev: '.glider-prev',
	    next: '.glider-next'
	  }
	}); */
	
	//소켓연결
	const socket = new SockJS("https://rclass.iptime.org/${path}/list");
	let message = ''; 
	socket.onopen = function(e){
		socket.send('boardList');
	}
	
	socket.onmessage = function(e){
		let voiceList = JSON.parse(e.data);
		let html = "";
		for(let i = 0; i < voiceList.length; i++){
			if(i%8==0)html += "<div class='sliderCon'>";
			if(i%4==0)html += "<div class='card-list'>";
			html += mkCard(voiceList[i]);
			if(i%4==3)html += "</div>";
			if(i%8==7)html += "</div>";

			if(i==voiceList.length-1){
				if(i%4==3&&i%8!=7) html += "</div>";
				else html += "</div></div>";
			}
		}
		document.getElementById('result').innerHTML = html;
		new Glider(document.querySelector('.glider'), {
			  slidesToShow: 1,
			  dots: '.dots',
			  draggable: true,
			  arrows: {
			    prev: '.glider-prev',
			    next: '.glider-next'
			  }
			});
	}
	
	function mkCard(item){

		if(item!=null){
		
		let time = parseInt(item.ENROLL_DATE);
		time = new Date(time);
		time = time.customFormat("#YYYY#년 #MM#월 #DD#일");
		item.ENROLL_DATE = time;
			
		let html = "";

		html = "<div class=\"card1\" onclick=\"location.href='${path}/board/boardPage?boardNo="+item.BOARD_ID+"'\">";
	    html += "<div class=\"card1-header\">";
		html += "<p>"+item.ENROLL_DATE+" ";
		html += "<span class=\"hits\">";
		html += "<ion-icon name=\"volume-high-outline\"></ion-icon> ";
		html += "<ion-icon class=\"heart\" name=\"heart-outline\"></ion-icon> "+item.LIKE_NUM+" ";
		html += "</span></p>";
		html += "<h2>"+item.TITLE+"</h2>";
		html += "</div>";

		html += "<div class=\"card1-content\">";
		html += item.CONTENT;
		html += "</div>";

		html += "<div class=\"icons\">";
		html += "<div class=\"judge\">";
		html += "<ion-icon name=\"thumbs-up-outline\"></ion-icon> "+item.AGREE_NUM +" ";
		html += "<ion-icon name=\"thumbs-down-outline\"></ion-icon> "+item.DISAGREE_NUM +" ";
		html += "</div>";
		html += "</div>";

		html += "<div class=\"card-author\">";
		html += "<a class=\"author-avatar\" href=\"#\">";
		if(item.WRITER_PROFILE==null){
			html += "<img src=\"${path }/resources/profile_images/avatar.png\" />";
		}else {
			html += "<img src=\"${path }/resources/profile_images/"+item.WRITER_PROFILE+"\" />";
		}
		html += "</a>";
		html += "<svg class=\"half-circle\" viewBox=\"0 0 106 57\">";
		html += "<path d=\"M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4\"></path>";
		html += "</svg>";

		html += "<div class=\"author-name\">";
		html += "<div class=\"author-name-prefix\"\">글쓴이</div>";
		html += item.WRITER_NICKNAME;
		html += "</div>";
		html += "</div>";
		html += "</div>";
		return html;
		}
	}
	
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