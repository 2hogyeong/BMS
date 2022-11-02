<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${contextPath }/resources/css/myStyle.css" rel="stylesheet" />
</head>
<body>

	<table class="list_view">
		<tbody align="center">
		<colgroup>
			<col width="10%">
			<col width="40%">
			<col width="20%">
			<col width="20%">
			<col width="10%">
		</colgroup>
			<tr align="center" style="background:#8e00ff; color:#fff; height: 50px;">
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>날짜</td>
				<td>조회수</td>
			</tr>
  				<c:choose>
    				<c:when test="${empty NoticeList }">			
					<tr align="center">
				       <td colspan="8" class="fixed"><strong>공지사항이 없습니다.</strong></td>
				    </tr>
			 	</c:when>
			 	<c:otherwise>
     				<c:forEach var="item" items="${NoticeList}">
						<tr align="center">       
							<td><strong>${item.num}</strong></td>
							<td>
								<a href="${contextPath}/main/noticeInfo.do?num=${item.num}">
								    <strong>${item.subject} </strong>
								</a> 
							</td>
							<td><strong>${item.writer}</strong></td>
							<td><strong><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd"/></strong></td>
							<td><strong>${item.readCount }</strong></td>
						</tr>
					</c:forEach>
				</c:otherwise>
  			</c:choose>
		</tbody>
	</table>

</body>
</html>