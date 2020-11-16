<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<style>
	#side {
	    border-bottom-left-radius: 7.5px;
	    border-top-left-radius: 7.5px;
	    width: 18%;
	    height: 100%;
	    background-color:#05135C;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	}
	#menu {
		color: white;
		font-size: 1em;
		border:1px solid red;
		width:100%;
	}
	
	.menusOnSide {
		margin-bottom: 0.15em;
		width:100%;
		border:1px solid red;
	}
</style>
<div id="side">

	<div id="container_logo">
		<a href="${path }/board/boardList" id="anchor_logo"> <img src="${path}/resources/images/logo_long_black.png" id="sidebar_logo" alt="로고">
		</a>
	</div>
	
	<div id="menu">
		<div id="homeBtn" class="menusOnSide">
			<img src="${path}/resources/images/home.png" width="10em" height="10em">
			HOME
		</div>
		<div id="popular" class="menusOnSide">
			인기
		</div>
		<div id="liked" class="menusOnSide">
			좋아한 게시물
		</div>
		<div id="history" class="menusOnSide">
			내 기록
		</div>
		<hr style="border-top:1px solid white">
		<div id="subList" class="menusOnSide">
			구독한 채널
		</div>
		<hr style="border-top:1px solid white">
		<div id="cates" class="menusOnSide">
			큰 카테고리들
		</div>
	</div>
</div>