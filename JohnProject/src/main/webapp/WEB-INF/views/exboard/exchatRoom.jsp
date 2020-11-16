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
	border: 25px solid rgba(5, 19, 92, 0.96);
	border-radius: 8px;
	/* background-color:#05135C; */
	/* background-color: rgba(5, 19, 92, 0.96); */
	background-color:white;
	height: 100%;
	width: 60%;
	box-shadow: 8px 8px 8px rgba(0, 0, 0, 0.8);
	margin: 0% 1% 1%;
	display:inline-block;
	padding:2%;
	overflow-x: hidden;
	-ms-overflow-style: none;
}

.upload{
	width:222px;
	height:222px;
	padding:1%;
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
				<c:if test="${loginMember.memClass == '전문가'}">
			<textarea id="extext"></textarea>
			</c:if>
				<c:if test="${loginMember.memClass != '전문가'}">
					<textarea id="extext" readonly></textarea> 
				</c:if>
			
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
		}
		
		//---------------------------- 드래그 파일 전송 -------------------------------------
		
		let formData = new FormData();
		$.each(uploadFiles, function(i, file) {
			if (file.upload != 'disable') //삭제하지 않은 이미지만 업로드 항목으로 추가
				formData.append('upFile', file, file.name);
		});
	 	$.ajax({
			url : '${path}/expert/upload',
			data : formData,
			type : 'post',
			contentType : false,
			processData : false,
			dataType : "json",
			success : function(data) {
				console.log("파일 업로드 완료 data : " + data);
				let msg = "";
				$.each(data, function(i, item) {
					console.log("i : " + i + ", item : " + item);
					msg += item + "|";
				});
				console.log(msg);
				//sendMessage(new ExboardMsg("FILE", "", msg));
				$("#previewImg").html("");
				imgDivPrint(msg);
				//배열 초기화 안그러면 계속 들어감..
				uploadFiles = [];
			}
		});
	});
	
	function imgDivPrint(msg){
		console.log("msg : "+msg);
		let list = msg.split('|');
		let imgprint = "";
		for(let i in list){
			console.log(list[i]);
			if(i == list.length-1){
				console.log("나감");
				break;
			}
			imgprint+="<img  class='upload' src='${path}/resources/upload_images/"+list[i]+"' title='"+list[i]+"' onclick='imgView(event);' style='cursor: pointer'/>";
		}
		let con = $("#imgDiv").html()+imgprint;
		$("#imgDiv").html("");
		$("#imgDiv").html(con);
		$("#imgDiv").scrollTop($("#imgDiv")[0].scrollHeight);
		list="";
		imgprint="";
		console.log("msg2 : "+msg);
	}
	
	//---------------------------- 사진 크게 보기 -------------------------------------
	
	function imgView(e){
		window.open('${path}/resources/upload_images/'+$(e.target).attr( 'title' ),'이미지','width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes');
	};
	
	
</script>
















