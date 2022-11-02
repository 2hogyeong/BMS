<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${contextPath }/resources/css/myStyle.css" rel="stylesheet" />
<style>
	td:first-child {
		text-align: center;
		font-weight: bold;
	}
</style>
</head>
<body>

	<form>
	<h3>공지사항</h3>
	<table class="table table-bordered table-hover">
		<colgroup>
			<col width="20%" >
			<col width="80%">
		</colgroup>
		<tr>
			<td>
				<label for="subject">제목</label>
			</td>
			<td>
	            <input type="text" class="form-control" style="display:inline; width:300px;" 
	            	name="subject"  id="subject" value="${ndto.subject }" readonly />
	        </td>
	    </tr>
		<tr>
	        <td>
	        	 <label class="small mb-1" for="writer">작성자</label>
	        </td>
	        <td>
	        	<input class="form-control" id="writer" name="writer" type="text" value="관리자" readonly />
	        </td>
        </tr>
		<tr>
			<td>
				<label for="content">작성일</label>
			</td>
			<td>
	            <fmt:formatDate value="${ndto.regDate }" pattern="yyyy-MM-dd"/>
	        </td>
	    </tr>
        <tr>
	        <td>
	        	 <label class="small mb-1">내용</label>
	        </td>
	        <td>
	        	<textarea rows="20" cols="80" id="content" name="content" readonly>${ndto.content }</textarea>
	        </td>
        </tr>         
	                              
     </table>
	     <p align="right"><input type="button" class="btn btn-indigo btn-sm" value="목록보기" onclick="location.href='${contextPath }/main/noticeMain.do'"></p>
     </form>
	

</body>
</html>