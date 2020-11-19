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
  	  div#board-container input{margin-bottom:15px;}
    </style>
    
	<section id="content">
	  
		<div id="board-container">
	        <form name="boardFrm" action="${path}/report/customerReportEnd"   method="post" enctype="multipart/form-data" > <!-- 파일업로드시 enctype 멀티파트 써주는거 잊지말기!!!!!!!!!!!! -->
	           
	          
	            <input type="text" class="form-control" name="reportBoardId" id="reportBoardId" value="23" > <!-- 신고대상게시물번호 --><!-- 변경요망 -->
	            <input type="text" class="form-control" placeholder="제목" name="reportTitle" id="reportTitle" required> <!-- 제목 -->
	            <input type="text" class="form-control" name="reportTargetNickname" id="reportTargetNickname"  
	            	value="김땡땡" readonly><!-- 신고할회원 --><!-- 변경요망 -->
	 		
	 			<input type="hidden"  name="reportWriterUsid" value="${loginMember.getUsid()}">
	 			<input type="hidden"  name="reportTargetUsid" value="52"><!-- 변경요망 -->
	 			<input type="hidden"  name="reportUserNickname" value="${loginMember.getMemNickname() }">
	 			
	 			<hr>
	        
	            <select name="reportType" id="reportType" class="form-control" >
				  <option value="" selected disabled>-- 신고유형 --</option>
				  <option value="홍보성">홍보성</option>
				  <option value='권리침해'>권리침해</option>
				  <option value='선정성'>선정성</option>
				  <option value='인신공격'>인신공격</option>
				  <option value='기타'>기타</option>
				</select>
				
				<hr>
				
	            <div class="input-group mb-3" style="padding:0px;">
	                <div class="input-group-prepend" style="padding:0px;">
	                    <span class="input-group-text">첨부파일1</span>
	                </div>
	            <div class="custom-file">
	                    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
	                    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
	                </div>
	            </div>
	            
	   
	             <div class="input-group mb-3" style="padding:0px;">
	                <div class="input-group-prepend" style="padding:0px;">
	                    <span class="input-group-text">첨부파일2</span>
	                </div>
	                <div class="custom-file">
	                    <input type="file" class="custom-file-input" name="upFile" id="upFile2">
	                    <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
	                </div>
	            </div>
	            
	            <div id="preview"></div>
	            <div id="preview2"></div>
	            
	            <textarea class="form-control" name="reportContent" placeholder="내용" required></textarea>
	            <br />
	            <input type="submit" class="btn btn-outline-info" value="신고하기" >
	            <input type="reset" class="btn btn-outline-info" value="취소" >
	        </form>
	        
	        <script type="text/javascript">
	        $(function(){
	        	$('[name=upFile]').change(e=>{
	        		const fileName=$(e.target)[0].files[0].name; 
	        		$(e.target).next(".custom-file-label").html(fileName);
	        		
	        	})
	        })
	        
	   		
			/* var fileCheck = document.getElementById("upFile").value;
			    if(!fileCheck){
			        alert("파일을 첨부해 주세요");
			        return false;
			    } */
			    
			    
		    /* if(boardFrm.reportType[0].checked==false &&
		    		boardFrm.reportType[1].checked==false &&
		    		boardFrm.reportType[2].checked==false &&
		    		boardFrm.reportType[3].checked==false &&
		    		boardFrm.reportType[4].checked==false &&
		    		boardFrm.reportType[5].checked==false) {
		            alert("신고 유형을 선택해주세요");
		            return false;
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
	        
	        
	    </div>
	</section>
	

	
