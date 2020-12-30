<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!-- css -->
<style>
	input[type=file]{
		display:none;
	}
	.file{
		visibility: hidden;
		position: relative;
	}
	div.input-group .fileNameField{
        outline: none;
        border: black solid 1px;
        background-color: white;
        width: 50%;
        height: 2.5rem;
        margin: 1rem auto 5px 10%;
		margin-bottom: 5px;
        padding: 5px;
        box-sizing: border-box;
        font-size: 1rem;
        float: left;
        color: gray;
    }
    div.input-group button.browse{
        min-width: 100px;
        width: 10%;
        padding: 5px;
        font-size: 0.9rem;
        cursor: pointer;
        text-align: center;
        margin: 1rem auto;
        margin-right: 10%;
        float: left;
    }
    .inputUL{
        clear: both;
        outline: none;
        border: black solid 1px;
        background-color: white;
        width: 50%;
        height: 2.5rem;
        margin: 1rem 10%;
        padding: 5px;
        box-sizing: border-box;
        font-size: 1rem;
        color: gray;
    }
</style>

<div class="licenseDiv">
    <!-- 자격증 파일 넣는 곳 -->
    <input type="file" name="licenseFileName" class="file real-input license1" accept="img/*">
    <div class="input-group col-xs-12">
        <input type="text" class="inputUL inputFile fileNameField license1" disabled placeholder="자격증 파일을 업로드 하세요.">
        <button type="button" class="browse button btn btn-outline-dark" style="width: 20%;">
            파일찾기
        </button>
    </div>
    <!-- 자격증 발급 일자 -->
    <input type="date" class="inputUL license1" name="licenseDate">
    <!-- 자격증 종류 -->
    <div class="input-group col-xs-12" style="width: 80%; margin: 0 10%;">
        <div style="margin: 1rem 0; width: 30%; text-align: left;">
            자격증 종류
        </div>
        <select name="licenseType" class="inputUL" style="width: 60%; margin-right: 0;">
			<option selected>선택 안함</option>
            <c:forEach items="${likindList }" var="lity">
                <option value="${lity}">${lity}</option>
            </c:forEach>
        </select>
    </div>
    <!-- 자격증 발급 기관 -->
    <div class="input-group col-xs-12" style="width: 80%; margin: 0 10%;">
        <div style="margin: 1rem 0; width: 30%; text-align: left;">
            자격증 발급 기관
        </div>
        <select name="licenseCompany" class="inputUL" style="width: 60%; margin-right: 0;">
			<option selected>선택 안함</option>
            <c:forEach items="${comkindList }" var="comli">
                <option value="${comli}">${comli}</option>
            </c:forEach>
        </select>
    </div>
</div>

