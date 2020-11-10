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
	#fileNameField{
        outline: none;
        border: black solid 1px;
        background-color: white;
        width: 59%;
        height: 36px;
        margin: 0 10px 15px;
        padding: 5px;
        box-sizing: border-box;
        font-size: 14px;
    }
	button.pcbtn{
        outline: none;
        background: #735020;
        min-width: 100px;
        width: 15%;
        height: 36px;
        border: none;
        padding: 5px;
        color: #FFFFFF;
        font-size: 14px;
        cursor: pointer;
        text-align: center;
        margin: 0 0 15px 10px;
    }
</style>
<!-- 자격증 파일 넣는 곳 -->
<input type="file" name="license_file_name" id="real-input" class="file" accept="img/*">
<div class="input-group col-xs-12">
    <input type="text" class="inputFile" id="fileNameField" disabled placeholder="이미지를 업로드 하세요.">
    <button type="button" class="browse pcbtn" onclick="fn_browseFile();">
        파일찾기
    </button>
</div>
<!-- 자격증 발급 일자 -->
<input type="date" class="input" name="license_date">
<!-- 자격증 종류 -->
<!-- 자격증 발급 기관 -->
<script>
    // 파일관련
    $(document).on('click','.browse',function(){
		var file=$(this).parent().parent().find('.file');
		file.trigger('click');
	});
	$(document).on('change','.file',function(){
		$(this).parent().find('.inputFile').val($(this).val().replace(/C:\\fakepath\\/i,''));
	});
</script>