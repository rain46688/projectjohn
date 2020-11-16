<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<style>
	div.addLicenseDiv,div.removeLicenseDiv{
		display: none;
	}
</style>
<section id="content">
	<div id="forExpertTitle">
		자격증 정보
		<p style="font-size: 14px;">자격증 정보는 노출되지 않으며 관리자가 회원님이 상담전문가임을 확인하는 용도에만 쓰입니다.</p>
		<p style="font-size: 14px;">자격증은 총 세 개까지 업로드 가능합니다.</p>
	</div>
	<form action="${path}/member/myPage/applyExpert?usid=${loginMember.usid }" method="POST" id="applyExpertForm">
		<div id="forExpert1" class="divForExpert">
			<jsp:include page="/WEB-INF/views/member/uploadLicense.jsp"></jsp:include>
		</div>
		<div id="forExpert2" class="divForExpert">d</div>
		<div id="forExpert3" class="divForExpert">d</div>
		<div class="addLicenseDiv" id="addLicenseDiv1">
			<button type="button" class="addLicenseBtn licenseBtn" id="addLicenseBtn1">추가</button>
		</div>
		<div class="addLicenseDiv" id="addLicenseDiv2">
			<button type="button" class="addLicenseBtn licenseBtn" id="addLicenseBtn2">추가2</button>
		</div>
		<div class="removeLicenseDiv" id="removeLicenseDiv1">
			<button type="button" class="removeLicenseBtn licenseBtn" id="removeLicenseBtn1">삭제</button>
		</div>
		<div class="removeLicenseDiv" id="removeLicenseDiv2">
			<button type="button" class="removeLicenseBtn licenseBtn" id="removeLicenseBtn2">삭제2</button>
		</div>
		<button type="button" onclick="fn_applyExpert()">
			신청하기
		</button>
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

	//  addLicense2
	 $("#addLicenseBtn1").click(function(e){
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

	// addLicense3
	 $("#addLicenseBtn2").click(function(e){
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
	 	$("#forExpert3").html('');
	 	$("#forExpert3").css({"display":"none"});
	 	$("#removeLicenseDiv2").css({"display":"none"});
	 	$("#addLicenseDiv2").css({"display":"block"});
	 	$("#removeLicenseDiv1").css({"display":"block"});
	 });

	//  removeLicense2
	 $("#removeLicenseBtn1").click(function(e){
	 	$("#forExpert2").html('');
	 	$("#forExpert2").css({"display":"none"});
	 	$("#removeLicenseDiv1").css({"display":"none"});
	 	$("#addLicenseDiv2").css({"display":"none"});
	 	$("#addLicenseDiv1").css({"display":"block"});
	 });

	function fn_applyExpert(){
		const uploadedLicense1=$("#forExpert1 input[name='licenseFileName']").val();
		const uploadedLicense2=$("#forExpert2 input[name='licenseFileName']").val();
		const uploadedLicense3=$("#forExpert3 input[name='licenseFileName']").val();
		if(uploadedLicense1==null || uploadedLicense2==null || uploadedLicense3==null){
			alert('최소한 한 개의 자격증을 등록해야 합니다.');
		}else{
			$("#applyExpertForm").submit();
		}
	}

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>









