<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${contextPath}/resources/css/myStyle.css" rel="stylesheet" />
</head>
<body>

<h3>내 상세 정보</h3>
	<form action="${contextPath}/mypage/myPasswordCheckPro.do">	
		<table class="table table-bordered table-hover">
				<tr>
					<td align="center">
						<label for="memberId">아이디</label>
					</td>
					<td>
						<input name="memberId" id="memberId" type="text" class="form-control"  value="${memberId}"  readonly/>
					</td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td>
					  	<input type="password" name="memberPw" id="memberPw" class="form-control">
					</td>
				</tr>
		 </table>
	     <p align="right">
	     	<input type="submit" class="btn btn-outline-primary btn-sm" value="확인">
	     </p>
     </form>


</body>
</html>