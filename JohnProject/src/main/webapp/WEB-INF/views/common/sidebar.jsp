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
		background-image: url("${path}/resources/images/sideBarPattern.png");
		background-repeat: repeated;
	    /* border-bottom-left-radius: 25px;
	    border-top-left-radius: 25px; */
	    overflow: auto;
	    width: 18%;
	    height: 100%;
	    background-color:#00316D;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	}
	
	
	#container_logo{
	    margin-top: 0;
		padding-top: 1.5em;
	    display: flex;
	    justify-content: center;
	    background-color: transparent;
	}

	#sidebar_logo{
    	width: 80%;
    	background-color: transparent;
	}
	
	#menu {
		font-family: 'Noto Serif KR', serif;
		margin-top:1em;
		color: white;
		font-size: 1em;
		/* border:1px solid red; */
		width:100%;
		overflow: auto;
	}
	#menu::-webkit-scrollbar {
		background-color: #05135C;
		width: 8px;
	}
	#menu::-webkit-scrollbar-thumb{
		background-color:white;
	}
	#menu::-webkit-scrollbar-track {
		background-color: #05135C;
	}
	
	.menuContainer{
		display: flex;
		flex-direction: row;
		justify-content: flex-start;
		align-items: center;
		padding-bottom: 0.5em;
 	   	padding-top: 0.5em;
 	   	padding-right:2em;
 	   	padding-left:2em;
		font-size: 1em;
		font-weight: bold;
		color: white;
		font-family: 'Noto Serif KR', serif;
		cursor:pointer;
	}
	div.menuContainer:hover {
		background-color: rgb(255,255,255,0.1);
	}
	
	div.menuContainer a {
		color:white;
	}
	
	.cate {
		font-size:0.9em;
		display:none;
	}
	div.cate {
		padding-left:4em;
	}
	#big_cate:hover div.cate {
		display:flex;
	}
	
</style>
<div id="side">

	<div id="container_logo">
		<a href="${path }/board/boardList" id="anchor_logo"> <img src="${path}/resources/images/logo_long_black.png" id="sidebar_logo" alt="로고">
		</a>
	</div>
	
	<div id="menu">
		<div class="menuContainer" id="sidebarHome" onclick="location.href='${path}/board/boardList'">
			<ion-icon name="home-outline"></ion-icon>
			<a class="menuLink nav-link" href="#">
				HOME
			</a>
		</div>
		<div class="menuContainer" id="sidebarPopular" onclick="location.href='${path}/board/boardListSmall?key=popular'">
			<ion-icon name="flame-outline"></ion-icon>
			<a class="menuLink nav-link" href="#">
				인기
			</a>
		</div>
		<div class="menuContainer" id="sidebarNew" onclick="location.href='${path}/board/boardListSmall?key=new'">
			<ion-icon name="flash-outline"></ion-icon>
			<a class="menuLink nav-link" href="#">
				최신
			</a>
		</div>
		<div class="menuContainer" id="sidebarLiked" onclick="location.href='${path}/board/boardListSmall?key=liked'">
			<ion-icon name="heart-outline"></ion-icon>
			<a class="menuLink nav-link" href="#">
				좋아한 게시물
			</a>
		</div>
		<div class="menuContainer" id="sidebarHistory" onclick="location.href='${path}/board/boardListSmall?key=history'">
			<ion-icon name="folder-open-outline"></ion-icon>
			<a class="menuLink nav-link" href="#">
				내 기록
			</a>
		</div>
		<div class="menuContainer" id="sidebarVerbal" onclick="location.href='${path}/board/boardListSmall?key=voice'">
			<ion-icon name="mic-outline"></ion-icon>
			<a class="menuLink nav-link" href="#">
				음성 재판소
			</a>
		</div>
		<div class="menuContainer" id="sidebarEx">
			<ion-icon name="people-outline"></ion-icon>
			<a class="menuLink nav-link" href="${path }/expert/expertPrintList?ca=직장 상담">
				전문가와 상담하기
			</a>
		</div>
		<div id="big_cate">
			<div class="menuContainer">
				<ion-icon name="list-outline"></ion-icon>
				<a class="menuLink nav-link" href="#">
					큰 카테고리들
				</a>
			</div>
			<div class="menuContainer cate" id="family" onclick="location.href='${path}/board/boardListSmall?key=family'">
				<ion-icon name="storefront-outline"></ion-icon>
				<a class="menuLink nav-link" href="#">
					가족문제
				</a>
			</div>
			<div class="menuContainer cate" id="work" onclick="location.href='${path}/board/boardListSmall?key=work'">
				<ion-icon name="newspaper-outline"></ion-icon>
				<a class="menuLink nav-link" href="#">
					회사문제
				</a>
			</div>
			<div class="menuContainer cate" id="friend" onclick="location.href='${path}/board/boardListSmall?key=friend'">
				<ion-icon name="accessibility-outline"></ion-icon>
				<a class="menuLink nav-link" href="#">
					친구문제
				</a>
			</div>
			<div class="menuContainer cate" id="pet" onclick="location.href='${path}/board/boardListSmall?key=pet'">
				<ion-icon name="logo-github"></ion-icon>
				<a class="menuLink nav-link" href="#">
					반려견문제
				</a>
			</div>
			<div class="menuContainer cate" id="love" onclick="location.href='${path}/board/boardListSmall?key=love'">
				<ion-icon name="heart-half-outline"></ion-icon>
				<a class="menuLink nav-link" href="#">
					연애상담
				</a>
			</div>
		</div>
	</div>
</div>