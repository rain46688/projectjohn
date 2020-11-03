<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템 메세지</title>

</head>
<body>
	<%-- 메세지 : ${msg} 패스 : ${path} 로케이션 : ${loc} 컨텍스트 : ${pageContext.request.contextPath } --%>

	<script>
		alert("${msg}");

		location.replace('${path}${loc}');
	</script>

</body>
</html>