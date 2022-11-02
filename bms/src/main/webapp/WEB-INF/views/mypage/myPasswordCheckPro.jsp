<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
</head>
<body>

	<c:if test="${check eq true }">
		<script>
			location.href='${contextPath}/mypage/myDetailInfo.do';
		</script>
	</c:if>
	<c:if test="${check eq false }">
		<script>
			alert("비밀번호가 일치하지 않습니다.");
			history.go(-1);
		</script>
	</c:if>

</body>
</html>