<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value=" "/>
	
</jsp:include>
	
	<link href="${path }/resources/css/admin/adminPage.css" rel="stylesheet" type="text/css">

	<section id="content">
	
	 <div class="main1">
        <!-- <h1>Responsive Card Grid Layout</h1> -->
        <ul class="cards">
          <li class="cards_item">
            <div class="card">
              <div class="card_image"><img src="${path}/resources/images/admin/17.jpg"></div>
              <div class="card_content">
                <h2 class="card_title">신고하기</h2>
                <!-- <p class="card_text">Demo of pixel perfect pure CSS simple responsive card grid layout</p> -->
                <button class="btn card_btn" onclick="location.href='${path}/report/customerReport'">이동하기</button>
              </div>
            </div>
          </li>
          <li class="cards_item">
            <div class="card">
              <div class="card_image"><img src="${path}/resources/images/admin/17.jpg"></div>
              <div class="card_content">
                <h2 class="card_title">공지사항</h2>
                <!-- <p class="card_text">Demo of pixel perfect pure CSS simple responsive card grid layout</p> -->
                <button class="btn card_btn" onclick="location.href='${path}/customer/customerNotice'">이동하기</button>
              </div>
            </div>
          </li>
          <li class="cards_item">
            <div class="card">
              <div class="card_image"><img src="${path}/resources/images/admin/17.jpg"></div>
              <div class="card_content">
                <h2 class="card_title">FAQ</h2>
                <!-- <p class="card_text">Demo of pixel perfect pure CSS simple responsive card grid layout</p> -->
                <button class="btn card_btn" onclick="location.href='${path}/customer/customerFaq'">이동하기</button>
              </div>
            </div>
          </li>
          <li class="cards_item">
            <div class="card">
              <div class="card_image"><img src="${path}/resources/images/admin/17.jpg"></div>
              <div class="card_content">
                <h2 class="card_title">1:1문의하기</h2>
                <!-- <p class="card_text">Demo of pixel perfect pure CSS simple responsive card grid layout</p> -->
                <button class="btn card_btn" onclick="location.href='${path}/customer/customerChat?adminUsid=31&myUsid=${loginMember.usid }'">이동하기</button>
              </div>
            </div>
          </li>
        </ul>
      </div>
	
	</section>
	

	
