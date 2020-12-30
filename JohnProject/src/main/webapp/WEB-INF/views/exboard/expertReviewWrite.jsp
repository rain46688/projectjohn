<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em,
	ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
	caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby,
	section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
	font-family: 'Noto Serif KR', serif;
}

#reviewContent * {
	/*  border: 1px red solid;  */
	
}

#reviewContent {
	display: flex;
	justify-content: center;
	width: 100%;
	height: 100%;
}

#reivewMainDiv {
	width: 80%;
	height: 100%;
	display: flex;
	align-items: center;
}

#reviewCenterDiv {
	width: 100%;
	height: 60%;
	display: flex;
	flex-direction: column;
	border: 1px solid gray;
	padding: 3%;
}

textarea:focus {
	outline: none;
}

textarea {
	resize: none;
}

/* 별 */
.checked {
	color: orange;
}

.fa-star {
	cursor: pointer;
	font-size: 8vh;
}

.starRev {
	width: 100%;
	height: 30%;
	display: flex;
	justify-content: center;
}

.starRev>span {
	display: flex;
	align-items: center;
}

#reviewText {
	width: 100%;
	height: 60%;
}

#reviewText>p {
	font-size: 4vh;
	font-weight: bold;
}

#reviewTextArea {
	width: 100%;
	height: 90%;
	padding: 2%;
	font-size: 3vh;
	font-weight: bold;
	font-style: italic;
}

#rebottomDiv {
	width: 100%;
	height: 20%;
	display: flex;
	justify-content: center;
	align-items: center;
	padding-top: 8%;
}

/* 버튼 */
.button-8 {
	width: 30%;
	height: 120%;
	border: 2px solid #00316D;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
}

.button-8 .johnbtn {
	font-size: 3.2vh;
	color: #FFCC66;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
	/*  */
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.eff-8 {
	width: 100%;
	height: 100%;
	border: 90px solid #00316D;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
	box-sizing: border-box;
}

.button-8:hover .eff-8 {
	border: 0px solid #00316D;
}

.button-8:hover .johnbtn {
	color: #00316D;
}
</style>
<section id="reviewContent">

	<div id="reivewMainDiv">
		<div id="reviewCenterDiv">
			<div class="starRev">
				<span class="fa fa-star"></span> 
				<span class="fa fa-star"></span> 
				<span class="fa fa-star"></span> 
				<span class="fa fa-star"></span> 
				<span class="fa fa-star"></span>
			</div>
			<div id="reviewText">
				<p>상담 후기 입력</p>
				<textarea id="reviewTextArea" name="reText" placeholder="솔직한 후기를 적어주세요"></textarea>
			</div>
			<div id="rebottomDiv">
				<div class="button-8">
					<div class="eff-8"></div>
					<a class="johnbtn" onclick="reviewWrite();">작성 완료</a>
				</div>
				<!-- <button type="text" class="btn btn-outline-success" onclick="reviewWrite();">작성 완료</button> -->
			</div>
		</div>
	</div>

</section>

<script>
	'use strict';

	// ============================
	//화면 크기 고정
	// ============================
	$(this).resize(fixedSize);
	function fixedSize() {
		this.resizeTo(500, 500);
	};

	// ============================
	// 평점이 이미 작성되있으면 얼럿 띄우고 팝업창 꺼버리기!
	//0이 평점 기본이기때문에 0이아니면 평점이 작성된것
	// 
	// ============================
	if ("${duplicate}" != 0) {
		//console.log("이미 작성한 리뷰");
		alert("이미 작성한 후기입니다.");
		window.close();
	}

	// ============================
	//리뷰 작성
	// ============================
	function reviewWrite() {
		if (startcount() == 0) {
			alert("별점을 입력해주세요");
			return;
		}

		if ($("#reviewTextArea").val() == "") {
			alert("후기를 입력해주세요");
			return;
		}

		if ($("#reviewTextArea").val().length < 20) {
			alert("20글자 이상 입력해주세요");
			return;
		}

		$.ajax({
			url : '${path}/expert/expertReviewWriteEnd',
			data : {
				'bno' : '${bno}',
				'review' : $("#reviewTextArea").val(),
				'rating' : startcount()
			},
			dataType : 'json',
			success : function(data) {
				//console.log(data);
				if (data == 1) {
					alert("성공적으로 등록되었습니다.");
				} else {
					alert("등록에 실패하였습니다. 관리자에게 문의하세요");
				}
				window.close();
			}
		});

	};

	// ============================
	// 별 누를시 별 꽉차게 보이거나 지우기
	// ============================
	$('.starRev span').click(function() {
		$(this).parent().children('span').removeClass('checked');
		$(this).addClass('checked').prevAll('span').addClass('checked');
		//console.log("스타 카운트 : " + startcount());
		return false;
	});

	// ============================
	// 별 갯수 몇개 찍혀있는지 갯수 반환함
	// ============================
	function startcount() {
		let star = $(".fa-star");
		let count = 0;
		for (let i = 0; i < star.length; i++) {
			if ($(star[i]).hasClass('checked')) {
				count++;
			}
		}
		return count;
	};
</script>
