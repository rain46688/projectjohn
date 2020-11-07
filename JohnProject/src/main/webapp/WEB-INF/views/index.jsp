
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재판하는존경장님</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 파비콘 -->
<link rel="icon" type="image/png" href="${path }/resources/images/favicon.ico">
<!--css파일-->
<link rel="stylesheet" href="${path}/resources/css/index.css">

<!--애니메이션-->
<link rel="stylesheet" href="https://wowjs.uk/css/libs/animate.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

</head>
<body>
    <div class="wrapper">
        <div class="title">
            <p class="first">
                당신의
            </p>
            <p class="second">
                고민을
            </p>
            <p class="third">
                재판해드립니다.
            </p>
        </div>
        <div class="scale">
            <!--저울대-->
            <img src="${path}/resources/images/scale1.png" alt="">
            
            <!--저울 봉-->
            <div class="scale-2">
                <img src="${path}/resources/images/scale2.png" alt="">
            </div>

            <!--저울 바구니 왼-->
            <div class="scale-left">
                <img src="${path}/resources/images/scale3.png" alt="">
            </div>
            <!--저울 바구니 오-->
            <div class="scale-right">
                <img src="${path}/resources/images/scale3.png" alt="">
            </div>
        </div>
        <div class="enter" onclick="location.href='${path}/member/memberLogin'">
            <p>&gt; &gt; 입장하기</p>
        </div>
    </div>

    <!--wow 애니메이션-->
    <script src="https://wowjs.uk/dist/wow.min.js"></script>
    <script>
        wow = new WOW({
            boxClass:     'wow',      //  스크롤 이벤트를 등록할 클래스 
            animateClass: 'animated', // 기본값 animated => animate.css library 를 적용한다 
            offset:       0,          // data-wow-offset 의 기본값 0 
            mobile:       true,       // 모바일에서 동작할 것인지 
            live:         true        // 새로추가되는 요소 확인하여 동작 
        })
        wow.init();
    </script>
</body>
</html>