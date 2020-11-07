<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	
	<jsp:param name="title" value=" "/>
	
</jsp:include>
	
	<section id="content">
	<h2>전문가 신청한 회원</h2>
	<form name="memberEnrollFrm" action="${path }/admin/adminUpdateMemberToExpertEnd" method="post">
		<table>
			<tr>
                <th>번호</th>
                <td>
                    <input type="text" name="usid" id="usid"  value="${member.usid }" readonly>
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td>
                    <input type="text"  name="mem_name" id="mem_name" value="${member.mem_name}">
                </td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td><input type="text" name="mem_nickname" id="mem_nickname" value="${member.mem_nickname }"></td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                   <select class="form-control" name="devGender" required>
					<option value="" disabled selected>성별</option>
					<option value="M" ${member.gender=='M'?"selected":"" }>남</option>
					<option value="F" ${member.gender=='F'?"selected":"" }>여</option>
				</select>
                </td>
            </tr>
            <tr>
                <th>생일</th> 
                <td>
                    <input type="text" name="birthday" id="birthday" value="${member.birthday }">
                </td>
            </tr>
            <tr>
                <th>가입날짜</th> 
                <td>
                    <input type="text" name="enroll_date" id="enroll_date" value="${member.enroll_date }">
             	</td>
            </tr>
            <tr>
                <th>멤버등급</th> 
                <td>
                    <input type="text" name="mem_class" id="mem_class" value="${member.mem_class }">
                </td>
            </tr>
            <tr>
                <th>파일 확인하기</th> 
                <td>
                    <input type="text" name="profile_pic" id="profile_pic" value="${member.profile_pic }">
                </td>
            </tr>
           
        </table>
        <input type="submit" value="전문가 승인하기">
	</form>
	
</section>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
