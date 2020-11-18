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
<%--  <link rel="stylesheet" href="${path }/resources/css/splide-sea-green.min.css">
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
	background-color: brown;
	display: flex;
}

#reviewDiv {
	background-color: red;
	height: 100%;
	width: 50%;
}

#categoryDiv {
	background-color: blue;
	height: 100%;
	width: 50%;
}

/* 캐러셀 */

.splide__slide>div{
	width:500px;
	height:400px;
	font-size:20px;
	border:1px solid black;
}


</style>

<section id="content">

	<div id="upDiv">
	
	<div class="splide">
	<div class="splide__track">
		<ul class="splide__list">
			<li class="splide__slide"><div>Slide 01</div></li>
			<li class="splide__slide"><div>Slide 02</div></li>
			<li class="splide__slide"><div>Slide 03</div></li>
		</ul>
	</div>
	
	<div class="splide__progress">
		<div class="splide__progress__bar">
		</div>
	</div>
</div>
		
		
	</div>


	<div id="downDiv">
		<div id="reviewDiv"></div>
		<div id="categoryDiv"></div>
	</div>

</section>




<script>



var splide = new Splide( '.splide' );
let rate = 1;
splide.on( 'autoplay:playing', function ( rate ) {
	console.log( rate ); // 0-1
} );

splide.mount();


</script>
