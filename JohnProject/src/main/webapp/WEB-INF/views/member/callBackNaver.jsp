<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NaverLoginSDK</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>


	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>


	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "AMmEekjxUV4y7wrTtNF7",
				/*callbackUrl: "https://localhost/john/callBackNaver",*/
				callbackUrl: "https://rclass.iptime.org/20AM_john_final/callBackNaver",
				isPopup: true,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();
       
		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					var email = naverLogin.user.getEmail();
					$.ajax({
						url:"${path}/socialDuplicate",
						data:{"email":email},
						type:"post",
						dataType:"json",
						success:function(data){
							if(data=='available'){
								window.resizeTo(850, 800);
								alert('통합 회원가입이 필요합니다.');
								window.location.replace("${path}/signUpNaver");
							}else if(data=='leaveMem'){
								window.resizeTo(850, 800);
								alert('탈퇴한 회원입니다.');
								window.close();
							}else{
								$.ajax({
									url:"${path}/socialLogin",
									data:{"email":email},
									type:"post",
									dataType:"json",
									success:function(data){
										opener.document.location.replace("${path}"+data);
										window.close();
									}
								})
							}
						}
					})
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
</body>

</html>