<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value=" "/>
	
</jsp:include>
	
	<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');

#wrapper {
    margin: 0 auto;
    margin-top: 2em;
    padding: 1em;
    width: 52.5em;
    text-align: center;
    align-items: center;
    margin-bottom: 3em;
/*     border: 0.5px solid rgb(224, 224, 224); */
    border-radius: 1em;
    overflow: auto;
    background-color:#ffcc66;
    font-family: 'Noto Sans KR', sans-serif;
    
  }
  


#title {
	text-align: left;
}

.form-control, #cke_editor1{
	border-radius:10px;
}


#imageUpload {
	border:1px  rgb(224, 224, 224) solid;
	text-align: left;
	height: 6em;
	border-radius: 7px;
}


/* #submitBtn>button{
	width: 100%;
	height: 2.5em;
	color: white;
	background-color: gray;
}

#submitBtn>button:hover{
	color: black;
	background-color: white; */
	
#bbtn{
margin-top:3%;
border-color: #ffcc66;
   color: white; 
   background-color: #003478;

}

#bbtn:hover,
#bbtn:focus {
    background-color: #ffcc66;
    border-color: #003478;
    color: #003478; 

}

#imageUpload {
	text-align: left;
	overflow: hidden;
}
#imageUpload>label {
	height: 100%;
	width: 6em;
	float: left;
	font-size: larger;
}

#imageUpload>label>p{
	margin-top: 0.1em;
}

#image-prev {
	width: 35.25em;
	height: 6em;
	border-radius: 5px;
	overflow: hidden;
	float: left;
}

#image-prev>img {
	width: 7.05em;
	height: 100%;
}

.marginTop{
	margin-top: 0.5em;
}

#maxMems {
	display:none;
}

</style>
    
	
		<div id="content">
		<div id="wrapper">
		<div id="title"><h4><img src="${path }/resources/images/admin/pencil.png" width="24px" height="29px">&nbsp;게시글 수정하기</h4></div>
		<hr color="black">
		<div id="editor">
		<form name="customerNoticeModifyFrm" action="${path }/customer/customerNoticeModifyEnd" 
		id="frm" method="post" enctype="multipart/form-data">
		
		<div class="input-group marginTop">
		<input type="text" class="form-control" name="noticeId" id="noticeId" value="${notice.noticeId }" readonly> 
        </div>
        <div class="input-group marginTop">
        <input type="text" class="form-control" value="${notice.noticeTitle }" placeholder="제목" name="noticeTitle" id="noticeTitle"  required>
        </div>
        <div class="input-group marginTop">
        <input type="text" class="form-control" name="noticeAdminNickname" id="noticeAdminNickname" value="${notice.noticeAdminNickname }" readonly required>
		</div>
<!-- 			<div class="input-group mb-3" style="padding: 0px;">
				<div class="input-group-prepend" style="padding: 0px;">
					<span class="input-group-text">첨부파일1</span>
				</div>
				<div class="custom-file">
					<input type="file" class="custom-file-input" name="upFile" id="upFile1"> 
					<label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
				</div>
			</div> -->

			
<!-- 			<div class="input-group mb-3" style="padding: 0px;">
				<div class="input-group-prepend" style="padding: 0px;">
					<span class="input-group-text">첨부파일2</span>
				</div>
				<div class="custom-file">
					<input type="file" class="custom-file-input" name="upFile" id="upFile2"> 
					<label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
				</div>
			</div> -->
			
			<!-- <div id="preview"></div>
	        <div id="preview2"></div> -->

        
        <div id="textEditor" class="marginTop">
        <textarea class="form-control" name="noticeContent" id="editor1" placeholder="내용" required>
        <c:out value="${notice.noticeContent }"/></textarea>
        </div>
        
        <div id="submitBtn">
        <button class="marginTop btn btn-outline-secondary" type="button" onclick="fn_submit();" id="bbtn">수정완료</button>
        <input type="reset" class="marginTop btn btn-outline-secondary" id="bbtn" value="취소">
        </div>
        
		
        </form>
        
        
        </div>
		</div>
      	</div>
        
	
		<script type="text/javascript">
		CKEDITOR.replace( 'noticeContent',{
			width:'100%',
			height:'1000px'
		});
	
		</script>
	
        <script>
        $(function(){
    		CKEDITOR.replace('editor1',{
    			filebrowserUploadUrl: '${path}/customer/customerNoticeFileUpload',
    			width: '100%',
    		    height: 400
    		})


    	})
    	
    	function fn_submit(){
    		let value = CKEDITOR.instances.editor1.getData();
        	console.log(value);
 			if (confirm("정말 수정하시겠습니까?") == true){
				 
    		document.getElementById('editor1').value = value;
    		
    		document.getElementById('frm').submit();
    		
    		
			 }else{  
			     return;
			 }
    	}
        
        
        /* $(function(){
        	$('[name=upFile]').change(e=>{
        		const fileName=$(e.target)[0].files[0].name; 
        		$(e.target).next(".custom-file-label").html(fileName);
        		
        	})
        }) */
        

        
/* 	    function submit(){
			 if (confirm("정말 수정하시겠습니까?") == true){
				 
			 }else{  
			     return;
			 }
		} */
        
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
	

	
