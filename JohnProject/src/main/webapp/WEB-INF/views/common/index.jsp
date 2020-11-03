<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>

.divList {
	display: table;
	width: 100%;
	height: 150px;
	text-align: center;
}

.divListBody {
	display: table-row-group;
}

.divRow {
	display: table-row;
}

.divRowTitle {
	display: table-row;
	font-size: 15px;
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px #BFBFBF;
	width: 100%;
}

.divCell {
	border-bottom: 1px #DEE2E6 solid;
	display: table-cell;
	padding: 25px 10px;
	width: 16.67%;
	font-size: 15px;
}

.empty {
	margin-top: 20px;
	font-weight: bold;
	margin-top: 15px;
	margin-left: 150%;
	width: 100%;
	font-size: 15px;


</style>
	<hr>	
<section id="content">
	메인
	
		<div class="divList">
		<div class="divListBody">

			<div class="divRowTitle shadow p-3 mb-5 bg-white rounded">
				<div class="divCell">USID</div>
				<div class="divCell">이름</div>
				<div class="divCell">성별</div>
			</div>

			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="n">
						<div class="divRow shadow p-3 mb-5 bg-white rounded" style="cursor: pointer">
							<div class="divCell">${n.USID}</div>
							<div class="divCell">${n.MEMBER_NAME}</div>
							<div class="divCell">${n.GENDER}</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="empty">디비 없음</div>
				</c:otherwise>
			</c:choose>
			<br>
		</div>
	</div>
	
	
</section>
	<hr>	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>