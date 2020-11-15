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
</style>

<div class="licenseDiv">
    <!-- 자격증 파일 넣는 곳 -->
    <input type="file" name="licenseFileName" class="file real-input license1" accept="img/*">
    <div class="input-group col-xs-12">
        <input type="text" class="input inputFile fileNameField license1" disabled placeholder="이미지를 업로드 하세요.">
        <button type="button" class="browse button" style="width: 20%;">
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

