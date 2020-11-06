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
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
jQuery library
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
Popper JS
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
Latest compiled JavaScript
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
</head>

	<link rel="stylesheet" href="${path }/resources/css/admin/memberLogin.css">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <style>
        img.ham {
        animation: target_image 0.5s; 
        animation-iteration-count: 7;
        transform-origin: 100% 25%;
        position: absolute;
        margin-left:39%;
       
        }
 
        @keyframes target_image {
        0% { transform: rotate(-10deg); }
        50% { transform: rotate(25deg); }
        100% { transform: rotate(-10deg); }
        }

        .blink {
        animation-name: blink;
        animation-iteration-count: 9;
        animation-timing-function:ease;
        animation-duration: 0.4s;
        position: absolute;
        margin-left:33%;
        
        }

        @keyframes blink {
        from { opacity: 1.0; }
        to { opacity: 0.0; }
        }

        

    </style>
    
<body>

  <div class = "container projects">
        <!-- <h1>재판하는 존경장님</h1> -->
        
        <h1>

            <!--망치이미지-->
            <div>
                <img src="${path}/resources/images/admin/09.png" class="ham" height="110px" width="110px">
            </div>
            <div>
                <img src="${path}/resources/images/admin/tang.png" class="blink" height="80px" width="80px">
            </div>
            
            <!--로고사진-->
            <img src="${path}/resources/images/admin/logo_long_black (1).png">
        
            <div id="form_wrapper">
                
                <!--폼 왼쪽의 로고사진-->
                <div id="form_left">
                    <img src="${path}/resources/images/admin/logo_john-2.png" alt="">
                </div>

                <!--폼 오른쪽 로그인폼-->
                <div id="form_right">
                    
                    <form>
                    <div class="input_container">
                        <!-- <i class="fas fa-envelope"></i> -->
                        <input placeholder="Email" type="email" name="Email" id="" class="input_field">
                    </div>
                    <div class="input_container">
                        <!-- <i class="fas fa-lock"></i> -->
                        <input  placeholder="Password" type="password" name="Password" id="" class="input_field">
                    </div>

                    <input type="submit" value="Login" id="input_submit" class="input_field" onclick="login()">
                    </form>

					<!-- 임시입장 나중에 수정하셈  -->
					<button onclick="location.href='${path}/member/memberLoginEnd'">임시입장임시입장</button>

                    <span id="find_password">까먹었다 <a href="#"> 비밀번호</a></span>

                    <span id="create_account">
                        <a href="#">★회원가입★</a>
                    </span>

                </div>
            </div>

        </h1>

        <div class="overlay"></div>
 
    
        </div>


	

</body>
</html>