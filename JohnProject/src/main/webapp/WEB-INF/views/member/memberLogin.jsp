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
<!--jQuery library-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 파비콘 -->
<link rel="icon" type="image/png" href="${path }/resources/images/favicon.ico">
<!-- css -->
<link rel="stylesheet" href="${path }/resources/css/admin/memberLogin.css">
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<!-- 네이버 아이디로 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
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
    50% { transform: rotate(20deg); }
    100% { transform: rotate(-10deg); }
    }

    .blink {
    animation-name: blink;
    animation-iteration-count: 7;
    animation-timing-function:ease;
    animation-delay: 0.05s;
    animation-duration: 0.5s;
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
                    <form id="loginForm" action="${path}/memberLoginEnd" method="POST">
                        <div class="input_container">
                            <input placeholder="Email" type="email" name="memEmail" id="mem_email" class="input_field">
                        </div>
                        <div class="input_container">
                            <input  placeholder="Password" type="password" name="memPwd" id="memPwd" class="input_field">
                        </div>
                        <div id="saveIdContainer">
                            <input type="checkbox" id="saveId" name="saveId">&nbsp;아이디 저장
                        </div>
                        <button type="button" id="input_submit" class="input_field" onclick="fn_login()">Login</button>
                        <div id="naverIdLogin"></div>
                    </form>

                    <span id="find_password">까먹었다&nbsp;<a onclick="fn_findIdPage();">아이디</a>&nbsp;<a onclick="fn_findPwPage();">비밀번호</a></span>

                    <span id="create_account">
                        <a onclick="fn_signUp();">★회원가입★</a>
                    </span>
                </div>
            </div>
        </h1>
        <div class="overlay"></div>
    </div>
    <script>
        //아이디 저장
        $(document).ready(function(){
            //쿠키에 저장된 아이디를 불러와서 넣기
            var savedId=getCookie("savedId");
            if(savedId!=null){
                $("#mem_email").val(savedId);
            }
            
            if($("#mem_email").val()!=""){
                $("#saveId").attr("checked",true);
            }

            $("#saveId").change(function(){
                if($("#saveId").is(":checked")){
                    setCookie("savedId",$("#mem_email").val(),7);
                }else{
                    deleteCookie("savedId");
                }
            });

            $("#mem_email").keyup(function(){
                if($("#saveId").is(":checked")){
                    setCookie("savedId",$("#mem_email").val(),7);
                }
            })
        });

        //쿠키 관련 세팅들
        function setCookie(cookieName, value, exdays){
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
            document.cookie = cookieName + "=" + cookieValue;
        }
        
        function deleteCookie(cookieName){
            var expireDate = new Date();
            expireDate.setDate(expireDate.getDate() - 1);
            document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
        }
        
        function getCookie(cookieName) {
            cookieName = cookieName + '=';
            var cookieData = document.cookie;
            var start = cookieData.indexOf(cookieName);
            var cookieValue = '';
            if(start != -1){
                start += cookieName.length;
                var end = cookieData.indexOf(';', start);
                if(end == -1)end = cookieData.length;
                cookieValue = cookieData.substring(start, end);
            }
            return unescape(cookieValue);
        }

        //로그인 버튼 클릭시
        function fn_login(){
            $("#loginForm").submit();
        };

        //엔터로 입장하기
        $('#memPwd').on('keypress', function(e){
            if(e.keyCode==13) {
                $("#input_submit").click();
            }
        });  

        //아이디 찾기
        function fn_findIdPage(){
            const url="${path }/findIdPage";
            const title="findIdPage";
            const status="left=500, top=100, width=500, height=500";

            open(url, title, status);
        }

        //비밀번호 찾기
        function fn_findPwPage(){
            const url="${path }/findPwPage";
            const title="findPwPage";
            const status="left=500, top=100, width=500, height=500";

            open(url, title, status);
        }

        //회원가입으로 가는 길
        function fn_signUp(){
            const url="${path}/signUp";
            const title="signUp";
            const status="left=500, top=100, width=850, height=800";

            open(url,title,status);
        }
    </script>
    <!-- 네이버아이디로로그인 초기화 Script -->
    <script type="text/javascript">
        var naverLogin = new naver.LoginWithNaverId(
            {
                clientId: "AMmEekjxUV4y7wrTtNF7",
                /*callbackUrl: "https://localhost/john/callBackNaver",*/
                callbackUrl: "https://rclass.iptime.org/20AM_john_final/callBackNaver",
                isPopup: true, /* 팝업을 통한 연동처리 여부 */
                loginButton: {color: "white", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
            }
        );
        
        /* 설정정보를 초기화하고 연동을 준비 */
        naverLogin.init();
        
    </script>
</body>
</html>


