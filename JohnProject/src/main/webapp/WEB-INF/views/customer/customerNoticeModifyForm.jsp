<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value=" "/>
	
</jsp:include>
	
	<style>
	    div#board-container{width:400px; margin:0 auto; text-align:center;}
	    div#board-container input,div#board-container button{margin-bottom:15px;}
	    div#board-container label.custom-file-label{text-align:left;}
    </style>
    
	<section id="content">
		<div id="board-container">
		<h1>게시판상세화면</h1>
		
		<form name="customerNoticeModifyFrm" action="${path }/customer/customerNoticeModifyEnd" method="post">
		<input type="text" class="form-control" name="noticeId" id="noticeId" value="${notice.noticeId }" readonly> 
        <input type="text" class="form-control" value="${notice.noticeTitle }" placeholder="제목" name="noticeTitle" id="noticeTitle"  required>
        <input type="text" class="form-control" name="noticeAdminNickname" value="${notice.noticeAdminNickname }" readonly required>
		
			<div class="input-group mb-3" style="padding: 0px;">
				<div class="input-group-prepend" style="padding: 0px;">
					<span class="input-group-text">첨부파일1</span>
				</div>
				<div class="custom-file">
					<input type="file" class="custom-file-input" name="upFile" id="upFile1"> 
					<label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
				</div>
			</div>

			
			<div class="input-group mb-3" style="padding: 0px;">
				<div class="input-group-prepend" style="padding: 0px;">
					<span class="input-group-text">첨부파일2</span>
				</div>
				<div class="custom-file">
					<input type="file" class="custom-file-input" name="upFile" id="upFile2"> 
					<label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
				</div>
			</div>
			
			<div id="preview"></div>
	        <div id="preview2"></div>

        
        
        <textarea class="form-control" name="noticeContent" placeholder="내용" required><c:out value="${notice.noticeContent }"/></textarea>
        <br>
        
        <input type="submit" value="수정완료">
        <input type="reset" value="취소">
        
        </form>
        
        </div>

        
	</section>
	
	
        <script>
        $(function(){
        	$('[name=upFile]').change(e=>{
        		const fileName=$(e.target)[0].files[0].name; 
        		$(e.target).next(".custom-file-label").html(fileName);
        		
        	})
        })
        

        
	    function submit(){
			 if (confirm("정말 수정하시겠습니까?") == true){
				 
			 }else{  
			     return;
			 }
		}
        
        $(document).ready(function (e){
	        $("input[id='upFile1']").change(function(e){

	          //div 내용 비워주기
	          $('#preview').empty();

	          var files = e.target.files;
	          var arr =Array.prototype.slice.call(files);
	          
	          //업로드 가능 파일인지 체크
	          for(var i=0;i<files.length;i++){
	            if(!checkExtension(files[i].name,files[i].size)){
	              return false;
	            }
	          }
	          
	          preview(arr);
	          
	          
	        });//file change
	        
	        function checkExtension(fileName,fileSize){

	          var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	          var maxSize = 20971520;  //20MB
	          
	          if(fileSize >= maxSize){
	            alert('파일 사이즈 초과');
	            $("input[id='upFile1']").val("");  //파일 초기화
	            return false;
	          }
	          
	          if(regex.test(fileName)){
	            alert('업로드 불가능한 파일이 있습니다.');
	            $("input[id='upFile1']").val("");  //파일 초기화
	            return false;
	          }
	          return true;
	        }
	        
	        function preview(arr){
	          arr.forEach(function(f){
	            
	            //파일명이 길면 파일명...으로 처리
	            var fileName = f.name;
	            if(fileName.length > 10){
	              fileName = fileName.substring(0,7)+"...";
	            }
	            
	            //div에 이미지 추가
	            var str = '<div style="display: inline-flex; padding: 10px;"><li>';
	            str += '<span>'+fileName+'</span><br>';
	            
	            //이미지 파일 미리보기
	            if(f.type.match('image.*')){
	              var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	              reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	                //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
	                str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
	                str += '</li></div>';
	                $(str).appendTo('#preview');
	              } 
	              reader.readAsDataURL(f);
	            }else{
	              str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
	              $(str).appendTo('#preview');
	            }
	          });//arr.forEach
	        }
	      });
	        
	        
	        $(document).ready(function (e){
		        $("input[id='upFile2']").change(function(e){

		          //div 내용 비워주기
		          $('#preview2').empty();

		          var files = e.target.files;
		          var arr =Array.prototype.slice.call(files);
		          
		          //업로드 가능 파일인지 체크
		          for(var i=0;i<files.length;i++){
		            if(!checkExtension(files[i].name,files[i].size)){
		              return false;
		            }
		          }
		          
		          preview(arr);
		          
		          
		        });//file change
		        
		        function checkExtension(fileName,fileSize){

		          var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		          var maxSize = 20971520;  //20MB
		          
		          if(fileSize >= maxSize){
		            alert('파일 사이즈 초과');
		            $("input[id='upFile2']").val("");  //파일 초기화
		            return false;
		          }
		          
		          if(regex.test(fileName)){
		            alert('업로드 불가능한 파일이 있습니다.');
		            $("input[id='upFile2']").val("");  //파일 초기화
		            return false;
		          }
		          return true;
		        }
		        
		        function preview(arr){
		          arr.forEach(function(f){
		            
		            //파일명이 길면 파일명...으로 처리
		            var fileName = f.name;
		            if(fileName.length > 10){
		              fileName = fileName.substring(0,7)+"...";
		            }
		            
		            //div에 이미지 추가
		            var str = '<div style="display: inline-flex; padding: 10px;"><li>';
		            str += '<span>'+fileName+'</span><br>';
		            
		            //이미지 파일 미리보기
		            if(f.type.match('image.*')){
		              var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
		              reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
		                //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
		                str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
		                str += '</li></div>';
		                $(str).appendTo('#preview2');
		              } 
		              reader.readAsDataURL(f);
		            }else{
		              str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
		              $(str).appendTo('#preview2');
		            }
		          });//arr.forEach
		        }
		      });
      
        </script>
	

	
