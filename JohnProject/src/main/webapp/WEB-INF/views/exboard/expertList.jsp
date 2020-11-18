<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>




<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" " />
</jsp:include>

<script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/js/splide.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/splide.min.css">
<%-- <link rel="stylesheet" href="${path }/resources/css/splide-core.min.css"> --%>
<%-- <link rel="stylesheet" href="${path }/resources/css/splide-default.min.css"> --%>
<link rel="stylesheet" href="${path }/resources/css/splide-sea-green.min.css">
<%-- <link rel="stylesheet" href="${path }/resources/css/splide-skyblue.min.css"> --%>

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
}

#upDiv {
	border: 1px solid black;
	width: 100%;
	height: 60%;
	/* 	background-color:black; */
}

#downDiv {
	border: 1px solid brown;
	width: 100%;
	height: 40%;
	/* background-color: brown; */
	display: flex;
}

#reviewDiv {
	/*  background-color: red;  */
	height: 100%;
	width: 50%;
}

#categoryDiv {
	/* background-color: blue; */
	height: 100%;
	width: 50%;
}

/* 가로 슬라이드 */
.splide {
	height: 100%;
}

.splide__track * {
	border: 1px solid red;
	height: 100%;
}

.splide__slide>div {
	width: 100%;
	height: 100%;
	font-size: 20px;
	margin: 10px;
	border: 1px solid black;
	display: inline-block;
}

/* 세로 슬라이드  */
.splide2 {
	width: 100%;
	height: 100%;
}

.splide__slide {
	width: 100%;
	height: 100%;
}

.splide__slide>img {
	width: 100%;
	height: 100%;
}

#downDiv .splide__arrow, #downDiv .splide__pagination {
	display: none;
}

/*  */
#categoryDiv {
	padding: 20px;
	font-family: sans-serif;
	background: #f2f2f2;
}

img {
	width: 100%; /* need to overwrite inline dimensions */
	height: auto;
}

h2 {
	margin-bottom: .5em;
}

.grid-container {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	grid-gap: 1em;
}

/* hover styles */
.location-listing {
	position: relative;
}

.location-image {
	line-height: 0;
	overflow: hidden;
}

.location-image img {
	filter: blur(0px);
	transition: filter 0.3s ease-in;
	transform: scale(1.1);
}

.location-title {
	font-size: 1.5em;
	font-weight: bold;
	text-decoration: none;
	z-index: 1;
	position: absolute;
	height: 100%;
	width: 100%;
	top: 0;
	left: 0;
	opacity: 0;
	transition: opacity .5s;
	background: rgba(90, 0, 10, 0.4);
	color: white;
	/* position the text in t’ middle*/
	display: flex;
	align-items: center;
	justify-content: center;
}

.location-listing:hover .location-title {
	opacity: 1;
}

.location-listing:hover .location-image img {
	filter: blur(2px);
}

/* for touch screen devices */
@media ( hover : none) {
	.location-title {
		opacity: 1;
	}
	.location-image img {
		filter: blur(2px);
	}
}
</style>

<section id="content">
	<div id="upDiv">
		<div class="splide">
			<div class="splide__track">
				<ul class="splide__list">
					<li class="splide__slide">
						<div>Slide 01</div>
					</li>
					<li class="splide__slide">
						<div>Slide 02</div>
					</li>
					<li class="splide__slide">
						<div>Slide 03</div>
					</li>
					<li class="splide__slide">
						<div>Slide 04</div>
					</li>
					<li class="splide__slide">
						<div>Slide 05</div>
					</li>
					<li class="splide__slide">
						<div>Slide 06</div>
					</li>
					<li class="splide__slide">
						<div>Slide 07</div>
					</li>
					<li class="splide__slide">
						<div>Slide 08</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div id="downDiv">
		<div id="reviewDiv">
			<div class="splide2">
				<div class="splide__track">
					<ul class="splide__list">
						<li class="splide__slide"><img src="${path }/resources/images/expert.png"></li>
						<li class="splide__slide"><img src="${path }/resources/images/expert.png"></li>
						<li class="splide__slide"><img src="${path }/resources/images/expert.png"></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="categoryDiv">

			<div class="child-page-listing">
				<div class="grid-container">
					<article id="3685" class="location-listing">
						<a class="location-title" href="#"> San Francisco</a>
						<div class="location-image">
							<a href="#"> <img width="300" height="169" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/san-fransisco-768x432.jpg"
								alt="san francisco"></a>
						</div>
					</article>
					<article id="3688" class="location-listing">
						<a class="location-title" href="#"> London</a>
						<div class="location-image">
							<a href="#"> <img width="300" height="169" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/london-768x432.jpg" alt="london"></a>
						</div>
					</article>
					<article id="3691" class="location-listing">
						<a class="location-title" href="#"> New York</a>
						<div class="location-image">
							<a href="#"> <img width="300" height="169" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/new-york-768x432.jpg" alt="new york"></a>
						</div>
					</article>
					<article id="3694" class="location-listing">
						<a class="location-title" href="#"> Cape Town</a>
						<div class="location-image">
							<a href="#"> <img width="300" height="169" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/cape-town-768x432.jpg" alt="cape town"></a>
						</div>
					</article>
					<article id="3697" class="location-listing">
						<a class="location-title" href="#"> Beijing</a>
						<div class="location-image">
							<a href="#"> <img width="300" height="169" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/beijing-768x432.jpg" alt="beijing"></a>
						</div>
					</article>
					<article id="3700" class="location-listing">
						<a class="location-title" href="#"> Paris</a>
						<div class="location-image">
							<a href="#"> <img width="300" height="169" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/paris-768x432.jpg" alt="paris">
							</a>
						</div>
					</article>
				</div>
			</div>

		</div>
	</div>
</section>


<script>
	'use strict';

	//MDB Lightbox Init
	$(function() {
		$("#mdb-lightbox-ui").load("mdb-addons/mdb-lightbox-ui.html");
	});

	// 가로 슬라이드
	new Splide('.splide', {
		perPage : 4,
		rewind : true,
		autoplay : true,
		type : 'loop'
	}).mount();

	// 세로 슬라이드
	new Splide('.splide2', {
		direction : 'ttb',
		height : "33vh",
		rewind : true,
		autoplay : true,
		type : 'loop'
	}).mount();
</script>
