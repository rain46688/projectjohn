<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!-- css -->
<style>
	input[type=file]{
		position: relative;
		top: 0;
		right: 0;
		min-width: 100%;
		min-height: 100%;
		font-size: 10px;
		text-align: right;
		filter: alpha(opacity=0);
		opacity: 0;
		outline: none;
		background: white;
		cursor: inherit;
		display: block;
	}
	.file{
		visibility: hidden;
		position: relative;
	}
	.fileNameField{
        outline: none;
        border: black solid 1px;
        background-color: white;
        width: 80%;
        margin: 0 0 15px;
        padding: 15px;
        box-sizing: border-box;
        font-size: 14px;
    }
    div#licenseDiv2, div#licenseDiv3{
        display: none;
    }
</style>
<div>
    자격증 정보
    <p style="font-size: 14px;">자격증 정보는 노출되지 않으며 관리자가 회원님이 상담전문가임을 확인하는 용도에만 쓰입니다.</p>
    <p style="font-size: 14px;">자격증은 총 세 개까지 업로드 가능합니다.</p>
</div>

<div class="licenseDiv" id="licenseDiv1">
    <!-- 자격증 파일 넣는 곳 -->
    <input type="file" name="licenseFileName" id="real-input1" class="file real-input license1" accept="img/*">
    <div class="input-group col-xs-12">
        <input type="text" class="input inputFile fileNameField license1" id="fileNameField1" disabled placeholder="이미지를 업로드 하세요.">
        <button type="button" class="browse button" id="browse1" style="width: 20%;">
            파일찾기
        </button>
    </div>
    <!-- 자격증 발급 일자 -->
    <input type="date" class="input license1" name="licenseDate">
    <!-- 자격증 종류 -->
    <input type="text" class="input license1" name="licenseType" placeholder="자격증 종류를 입력해주세요.">
    <!-- 자격증 발급 기관 -->
    <input type="text" class="input license1" name="licenseCompany" placeholder="자격증 발급 기관을 입력해주세요.">
</div>

<button type="button" id="license2Btn" onclick="fn_addLicenseDiv2()">추가</button>
<button type="button" id="license2Remove" onclick="fn_removeLicenseDiv2()" style="display: none;">삭제</button>

<div class="licenseDiv" id="licenseDiv2">
    <!-- 자격증 파일 넣는 곳 -->
    <input type="file" name="licenseFileName" id="real-input2" class="file real-input license2" accept="img/*">
    <div class="input-group col-xs-12">
        <input type="text" class="input inputFile fileNameField license2" id="fileNameField2" disabled placeholder="이미지를 업로드 하세요.">
        <button type="button" class="browse button" id="browse2" style="width: 20%;">
            파일찾기
        </button>
    </div>
    <!-- 자격증 발급 일자 -->
    <input type="date" class="input license2" name="licenseDate">
    <!-- 자격증 종류 -->
    <input type="text" class="input license2" name="licenseType" placeholder="자격증 종류를 입력해주세요.">
    <!-- 자격증 발급 기관 -->
    <input type="text" class="input license2" name="licenseCompany" placeholder="자격증 발급 기관을 입력해주세요.">
</div>

<button type="button" id="license3Btn" onclick="fn_addLicenseDiv3()" style="display: none;">추가</button>
<button type="button" id="license3Remove" onclick="fn_removeLicenseDiv3()" style="display: none;">삭제</button>

<div class="licenseDiv" id="licenseDiv3">
    <!-- 자격증 파일 넣는 곳 -->
    <input type="file" name="licenseFileName" id="real-input3" class="file real-input license3" accept="img/*">
    <div class="input-group col-xs-12">
        <input type="text" class="input inputFile fileNameField license3" id="fileNameField3" disabled placeholder="이미지를 업로드 하세요.">
        <button type="button" class="browse button" id="browse3" style="width: 20%;">
            파일찾기
        </button>
    </div>
    <!-- 자격증 발급 일자 -->
    <input type="date" class="input license3" name="licenseDate">
    <!-- 자격증 종류 -->
    <input type="text" class="input license3" name="licenseType" placeholder="자격증 종류를 입력해주세요.">
    <!-- 자격증 발급 기관 -->
    <input type="text" class="input license3" name="licenseCompany" placeholder="자격증 발급 기관을 입력해주세요.">
</div>
<script>
    // 파일관련
    //license1
    $(document).on('click','.browse',function(){
		var file=$(this).parent().parent().find('.file');
		file.trigger('click');
	});
	$(document).on('change','.file',function(){
		$(this).parent().find('.inputFile').val($(this).val().replace(/C:\\fakepath\\/i,''));
	});

    //자격증 추가
    function fn_addLicenseDiv2(){
        $("#licenseDiv2").css({"display":"block"});
        $("#license3Btn").css({"display":"block"});
        $("#license2Remove").css({"display":"block"});
        $("#license2Btn").css({"display":"none"});
    }
    function fn_removeLicenseDiv2(){
        $(".license2").val('');
        $(".license3").val('');
        $("#licenseDiv2").css({"display":"none"});
        $("#license3Btn").css({"display":"none"});
        $("#license2Remove").css({"display":"none"});
        $("#license2Btn").css({"display":"block"});
        $("#licenseDiv3").css({"display":"none"});
        $("#license3Remove").css({"display":"none"});
    }
    function fn_addLicenseDiv3(){
        $("#licenseDiv3").css({"display":"block"});
        $("#license3Remove").css({"display":"block"});
        $("#license3Btn").css({"display":"none"});
    }
    function fn_removeLicenseDiv3(){
        $(".license3").val('');
        $("#licenseDiv3").css({"display":"none"});
        $("#license3Remove").css({"display":"none"});
        $("#license3Btn").css({"display":"block"});
    }

</script>