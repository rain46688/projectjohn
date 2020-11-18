<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<style>
	/* 
		추후 업데이트 : 
		스크롤바 커스터마이징
		스크롤시 로고 fixed
	 */
	#side {
	    border-bottom-left-radius: 7.5px;
	    border-top-left-radius: 7.5px;
	    overflow: auto;
	    width: 18%;
	    height: 100%;
	    background-color:#05135C;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	}
	
	#side ::-webkit-scrollbar {
		background-color: #05135C;
		width: 4px;
	}
	
	#side::-webkit-scrollbar-track {
		background-color: #05135C;
	}
	
	#container_logo {
		/* border:1px solid red; */
	}
	
	#menu {
		margin-top:1em;
		color: white;
		font-size: 1em;
		/* border:1px solid red; */
		width:100%;
	}
	
	.menusOnSide {
		cursor:pointer;
		padding-bottom: 0.5em;
		padding-top: 0.5em;
		width:100%;
		/* border:1px solid red; */
	}
	
	.menusOnSide:hover {
		background-color: #384F9C;
	}
	
	.menuImages {
		width:1.5em;
		height:1.5em;
		margin-right:2em;
		margin-left:1em;
		margin-top:0;
		padding-bottom:0.1em;
		/* border:1px solid red; */
	}
</style>
<div id="side">

	<div id="container_logo">
		<a href="${path }/board/boardList" id="anchor_logo"> <img src="${path}/resources/images/logo_long_black.png" id="sidebar_logo" alt="로고">
		</a>
	</div>
	
	<div id="menu">
		<div id="homeBtn" class="menusOnSide">
			<img class="menuImages" src="${path}/resources/images/home.png">
			HOME
		</div>
		<div id="popular" class="menusOnSide">
			<img class="menuImages" src="${path}/resources/images/popular.png">
			인기
		</div>
		<div id="liked" class="menusOnSide">
			<img class="menuImages" src="${path}/resources/images/like.png">
			좋아한 게시물
		</div>
		<div id="history" class="menusOnSide">
			<img class="menuImages" src="${path}/resources/images/history.png">
			내 기록
		</div>
		<hr style="border-top:1px solid gray">
		<div id="subList" class="menusOnSide">
			<img class="menuImages" src="${path}/resources/images/sub.png">
			구독한 채널
		</div>
		<hr style="border-top:1px solid gray">
		<div id="cates" class="menusOnSide">
			<img class="menuImages" src="${path}/resources/images/cate.png">
			큰 카테고리들
		</div>
		<div id="cates" class="menusOnSide">
			<img class="menuImages" src="${path}/resources/images/cate.png">
			큰 카테고리들
		</div>
		<div id="cates" class="menusOnSide">
			<img class="menuImages" src="${path}/resources/images/cate.png">
			큰 카테고리들
		</div>
		<div id="cates" class="menusOnSide">
			<img class="menuImages" src="${path}/resources/images/cate.png">
			큰 카테고리들
		</div>
		<div id="cates" class="menusOnSide">
			<img class="menuImages" src="${path}/resources/images/cate.png">
			큰 카테고리들
		</div>
		<div id="cates" class="menusOnSide">
			<img class="menuImages" src="${path}/resources/images/cate.png">
			큰 카테고리들
		</div>
	</div>
</div>