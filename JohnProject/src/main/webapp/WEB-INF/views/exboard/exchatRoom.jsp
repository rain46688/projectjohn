<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>


<style>
body {
	margin: 0;
}

#upDiv {
	height: 70%;
	width: 100%;
	border: 1px solid red;
	display: flex;
	border: 1px solid red;
	padding: 1%;
}

#video2 {
	z-index: 1;
	width: 100%;
	height: 100%;
	border: 2px solid #FFCC66;
}

#video1 {
	z-index: 2;
	position: absolute;
	right: 27%;
	top: 41.8%;
	border: 2px solid #FFCC66;
	width: 20%;
}

#videoDiv {
	padding: 3%;
	border: 1px solid gray;
	height: 100%;
	width: 80%;
	/* background-color:#05135C; */
	background-color: rgba(5, 19, 92, 0.96);
	border-radius: 8px;
	margin-right: 1%;
	box-shadow: 8px 8px 8px rgba(0, 0, 0, 0.8);
}

#textAreaDiv {
	border: 1px solid green;
	height: 100%;
	width: 30%;
	/* background-color:#05135C; */
	background-color: rgba(5, 19, 92, 0.96);
	border-radius: 8px;
	padding: 1%;
	box-shadow: 8px 8px 8px rgba(0, 0, 0, 0.8);
}

#extext {
	width: 100%;
	height: 100%;
	display: inline-block;
	border-radius: 8px;
	font-size: 20px;
	padding: 3%;
	/* 스크롤 바 투명하게 만들기 */
	overflow-x: hidden;
	-ms-overflow-style: none;
	/* background-color:#FFCC66; */
	/* display:none; */
}

/* 스크롤 바 투명하게 만들기 */
::-webkit-scrollbar {
	display: none;
}

/* 위 텍스트 영역 눌르면 옆에 테두리 생기는거 지우는 용도 */
textarea:focus {
	outline: none;
}

#dragImg {
	width: 100%;
	height: 100%;
	display: none;
	border-radius: 8px;
	/* 	background-color: #E2E2E8; */
	background-image: url(${path }/resources/images/expertimg.png);
	background-repeat: no-repeat;
	background-size: 100%;
	z-index: 2;
	padding-top: 20%;
}

#dragImg>img {
	display: block;
	width: 50%;
	height: 50%;
	margin-left: auto;
	margin-right: auto;
}

#dragImg p {
	font-size: 25px;
	text-align: center;
	font-weight: bold;
}

/* ------------------------------------------ */
#bottomDiv {
	height: 28%;
	border: 1px solid blue;
	display: flex;
}

#buttonDiv {
	border: 1px solid brown;
	height: 100%;
	width: 40%;
}

#imgDiv {
	border: 1px solid purple;
	border-radius: 8px;
	/* background-color:#05135C; */
	background-color: rgba(5, 19, 92, 0.96);
	height: 100%;
	width: 60%;
	box-shadow: 8px 8px 8px rgba(0, 0, 0, 0.8);
	margin: 0% 1% 1%;
}
</style>



<div id="content">

	<div id="upDiv">
		<div id="videoDiv">
			<video id="video2" autoplay playsinline controls preload="metadata"></video>
			<video id="video1" autoplay playsinline controls preload="metadata"></video>
		</div>
		<div id="textAreaDiv">
			<div id="dragImg"></div>
			<textarea id="extext"></textarea>
		</div>
	</div>

	<div id="bottomDiv">
		<div id="buttonDiv"></div>
		<div id="imgDiv"></div>
	</div>


</div>



<script>
	'use strict';

	//---------------------------- 드래그 파일 -------------------------------------

	let uploadFiles = [];
	let $drop = $("#extext");

	$drop.on("dragenter", function(e) {
		console.log("드래그 들어왔을떄");
		$(this).addClass('drag-over');
		$("#extext").css({
			"display" : "none"
		});
		$("#dragImg").css({
			"display" : "inline-block"
		});
	});

	let $drop2 = $("#dragImg");

	$drop2.on("dragenter", function(e) {
		console.log("드래그 들어왔을떄");
		$(this).addClass('drag-over');
	}).on("dragleave", function(e) {
		console.log("드래그 나갔을때");
		$(this).removeClass('drag-over');
		$("#dragImg").css({
			"display" : "none"
		});
		$("#extext").css({
			"display" : "inline-block"
		});
	}).on("dragover", function(e) {
		e.stopPropagation();
		e.preventDefault();
	}).on('drop', function(e) {
		console.log("드래그 항목을 떨어뜨렸을때");
		e.preventDefault();
		$(this).removeClass('drag-over');
		$("#dragImg").css({
			"display" : "none"
		});
		$("#extext").css({
			"display" : "inline-block"
		});
		let files = e.originalEvent.dataTransfer.files;
		//console.log("files : " + files);
		for (let i = 0; i < files.length; i++) {
			let file = files[i];
			let size = uploadFiles.push(file); //업로드 목록에 추가
			preview(file, size - 1); //미리보기 만들기
		}
	});
</script>
















