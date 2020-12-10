<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<head>
	<!-- 글씨체 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<style>
	#content *{
		font-family: 'Noto Serif KR', serif;
	}
	div.divForExpert, div#forExpertTitle, div.licenseTitle{
		display: none;
	}
	div.addLicenseDiv,div.removeLicenseDiv{
		display: none;
		text-align: center;
		margin: 0 auto;
	}
	div#forExpertTitle{
		margin:50px auto;
		margin-bottom: 0;
		width: 50%;
		font-size: 1.2rem;
	}
	div#forExpertTitle p{
		margin-left: 0.7rem;
	}
	div.licenseTitle{
		width: 50%;
		margin: 2.5rem auto;
		margin-bottom: 0;
		padding: 1rem;
		padding-bottom: 0;
		background-color: white;
		font-size: 1.2rem;
	}
	hr.divDivided{
		color: black;
		width: 20%;
		margin-top: 0.2rem;
		margin-left: 0;
		margin-bottom: 0;
		border: 1px black solid;
	}
	div.divForExpert{
		width: 50%;
		margin: 2.5rem auto;
		margin-top: 0;
		padding: 1rem;
		background-color: white;
	}
	button.licenseBtn{
		min-width: 100px;
        width: 10%;
        padding: 5px;
        font-size: 0.9rem;
        cursor: pointer;
        text-align: center;
        margin: 1rem auto;
		background-color: white;
	}
</style>
<section id="content">
	<div id="forExpertTitle">
		&nbsp;자격증 정보
		<p style="font-size: 1rem;">자격증 정보는 노출되지 않으며 관리자가 회원님이 상담전문가임을 확인하는 용도에만 쓰입니다.</p>
		<p style="font-size: 1rem;">자격증은 총 세 개까지 업로드 가능합니다.</p>
	</div>
	<form action="${path}/member/myPage/applyExpert?usid=${loginMember.usid }" method="POST" id="applyExpertForm" enctype="multipart/form-data">
		<div id="licenseTitle1" class="licenseTitle">
			자격증 1
			<hr class="divDivided">
		</div>
		<div id="forExpert1" class="divForExpert"></div>
		<div id="licenseTitle2" class="licenseTitle">
			자격증 2
			<hr class="divDivided">
		</div>
		<div id="forExpert2" class="divForExpert"></div>
		<div id="licenseTitle3" class="licenseTitle">
			자격증 3
			<hr class="divDivided">
		</div>
		<div id="forExpert3" class="divForExpert"></div>
		<div class="addLicenseDiv" id="addLicenseDiv1">
			<button type="button" class="addLicenseBtn licenseBtn btn btn-outline-dark licenseBtn" id="addLicenseBtn1">추가</button>
		</div>
		<div class="addLicenseDiv" id="addLicenseDiv2">
			<button type="button" class="addLicenseBtn licenseBtn btn btn-outline-dark licenseBtn" id="addLicenseBtn2">추가</button>
		</div>
		<div class="removeLicenseDiv" id="removeLicenseDiv1">
			<button type="button" class="removeLicenseBtn licenseBtn btn btn-outline-dark licenseBtn" id="removeLicenseBtn1">삭제</button>
		</div>
		<div class="removeLicenseDiv" id="removeLicenseDiv2">
			<button type="button" class="removeLicenseBtn licenseBtn btn btn-outline-dark licenseBtn" id="removeLicenseBtn2">삭제</button>
		</div>
		<div class="addLicenseDiv" style="display: block;">
			<button type="button" class="btn btn-outline-dark licenseBtn" onclick="fn_applyExpert()">
				신청하기
			</button>
		</div>
	</form>
</section>
<script>
	// 파일관련
	$(document).on('click','.browse',function(){
		var file=$(this).parent().parent().find('.file');
		file.trigger('click');
	});
	$(document).on('change','.file',function(){
		$(this).parent().find('.inputFile').val($(this).val().replace(/C:\\fakepath\\/i,''));
	});

	//addLicense1
	$(function(){
		$("#licenseTitle1").css({"display":"block"});
		$("#forExpertTitle").css({"display":"block"});
		$.ajax({
			url: "${path}/divForExpert",
			type: "get",
			dataType: "html",
			success:function(data){
				$("#forExpert1").html(data);
				$("#forExpert1").css({"display":"block"});
				$("#addLicenseDiv1").css({"display":"block"});
			}
		});
	});
	//addLicense2
	$("#addLicenseBtn1").click(function(e){
		$("#licenseTitle2").css({"display":"block"});
		$("#addLicenseDiv1").css({"display":"none"})
		$.ajax({
			url: "${path}/divForExpert",
			type: "get",
			dataType: "html",
		success:function(data){
			$("#forExpert2").html(data);
			$("#forExpert2").css({"display":"block"});
			$("#addLicenseDiv2").css({"display":"block"});
			$("#removeLicenseDiv1").css({"display":"block"});
		}
		});
	});

	//addLicense3
	$("#addLicenseBtn2").click(function(e){
		$("#licenseTitle3").css({"display":"block"});
		$("#addLicenseDiv2").css({"display":"none"});
		$("#removeLicenseDiv1").css({"display":"none"});
		$.ajax({
			url: "${path}/divForExpert",
			type: "get",
			dataType: "html",
		success:function(data){
			$("#forExpert3").html(data);
			$("#forExpert3").css({"display":"block"});
			$("#removeLicenseDiv2").css({"display":"block"});
		}
		});
	});

	//removeLicense3
	$("#removeLicenseBtn2").click(function(e){
		$("#licenseTitle3").css({"display":"none"});
		$("#forExpert3").html('');
		$("#forExpert3").css({"display":"none"});
		$("#removeLicenseDiv2").css({"display":"none"});
		$("#addLicenseDiv2").css({"display":"block"});
		$("#removeLicenseDiv1").css({"display":"block"});
	});

	//removeLicense2
	$("#removeLicenseBtn1").click(function(e){
		$("#licenseTitle2").css({"display":"none"});
		$("#forExpert2").html('');
		$("#forExpert2").css({"display":"none"});
		$("#removeLicenseDiv1").css({"display":"none"});
		$("#addLicenseDiv2").css({"display":"none"});
		$("#addLicenseDiv1").css({"display":"block"});
	});

	function fn_applyExpert(){
		$("#applyExpertForm").submit();
	}
</script>
</body>
</html>