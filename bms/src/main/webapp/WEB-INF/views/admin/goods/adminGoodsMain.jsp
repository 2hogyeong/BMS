<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script>

	function search_member_list(fixedSearchPeriod){
	    location.href="${contextPath}/admin/goods/adminGoodsMain.do?fixedSearchPeriod="+fixedSearchPeriod; 
	}
	
	
	function fn_enable_detail_search(r_search) {
		
		var frm_delivery_list= document.frm_delivery_list;
		
		t_beginYear   = frm_delivery_list.beginYear;
		t_beginMonth  = frm_delivery_list.beginMonth;
		t_beginDay    = frm_delivery_list.beginDay;
		t_endYear     = frm_delivery_list.endYear;
		t_endMonth    = frm_delivery_list.endMonth;
		t_endDay      = frm_delivery_list.endDay;
		s_search_type = frm_delivery_list.s_search_type;
		t_search_word = frm_delivery_list.t_search_word;
		btn_search    = frm_delivery_list.btn_search;
		
		if (r_search.value == 'detail_search'){
			t_beginYear.disabled   = false;
			t_beginMonth.disabled  = false;
			t_beginDay.disabled    = false;
			t_endYear.disabled     = false;
			t_endMonth.disabled    = false;
			t_endDay.disabled      = false;
			s_search_type.disabled = false;
			t_search_word.disabled = false;
			btn_search.disabled    = false;
			
		} 
		else {
			t_beginYear.disabled   = true;
			t_beginMonth.disabled  = true;
			t_beginDay.disabled    = true;
			t_endYear.disabled     = true;
			t_endMonth.disabled    = true;
			t_endDay.disabled      = true;
			s_search_type.disabled = true;
			t_search_word.disabled = true;
			btn_search.disabled    = true;
		}
		
	}
	
	function fn_detail_search() {
	
		var frm_delivery_list = document.frm_delivery_list;
		
		beginYear   = frm_delivery_list.beginYear.value;
		beginMonth  = frm_delivery_list.beginMonth.value;
		beginDay    = frm_delivery_list.beginDay.value;
		endYear     = frm_delivery_list.endYear.value;
		endMonth    = frm_delivery_list.endMonth.value;
		endDay      = frm_delivery_list.endDay.value;
		search_type = frm_delivery_list.s_search_type.value;
		search_word = frm_delivery_list.t_search_word.value;
	
		if (beginYear < 10) 	beginYear = "0" + beginYear; 
		if (beginMonth < 10) 	beginMonth = "0" + beginMonth; 
		if (beginDay < 10) 		beginDay = "0" + beginDay; 
		if (endYear < 10) 		endYear = "0" + endYear; 
		if (endMonth < 10) 		endMonth = "0" + endMonth; 
		if (endDay < 10) 		endDay = "0" + endDay; 
		
		var url = "${contextPath}/admin/goods/adminGoodsMain.do?";
			url += "beginDate="+ beginYear + "-" + beginMonth + "-" + beginDay;
			url += "&endDate=" + endYear + "-" + endMonth + "-" + endDay;
			url += "&search_type=" + search_type;
			url += "&search_word=" + search_word;
		
		location.href=url;

	}
	
</script>
<link href="${contextPath }/resources/css/myStyle.css" rel="stylesheet" />
</head>
<body>
	<h3>?????? ??????</h3>
	<form name="frm_delivery_list" method="post" >	
		<table>
			<tbody>
				<tr>
					<td>
						<input type="radio" name="r_search_option" value="simple_search" checked onClick="fn_enable_detail_search(this)"/> ???????????? &nbsp;&nbsp;&nbsp;
						<input type="radio" name="r_search_option" value="detail_search"  onClick="fn_enable_detail_search(this)" /> ???????????? &nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						?????? ?????? &nbsp;&nbsp;
						<select name="curYear" disabled>
						    <c:forEach   var="i" begin="0" end="5">
						      <c:choose>
						        <c:when test="${endYear==endYear-i}">
						          <option value="${endYear}" selected>${endYear}</option>
						        </c:when>
						        <c:otherwise>
						          <option value="${endYear-i }">${endYear-i }</option>
						        </c:otherwise>
						      </c:choose>
						    </c:forEach>
						</select>??? 
						<select name="curMonth" disabled>
								 <c:forEach   var="i" begin="1" end="12">
							      <c:choose>
							        <c:when test="${endMonth==i}">
							          <option value="${i}"  selected>${i}</option>
							        </c:when>
							        <c:otherwise>
							          <option value="${i}">${i}</option>
							        </c:otherwise>
							      </c:choose>
							    </c:forEach>					
						</select>???
					 	<select name="curDay" disabled>
						  	<c:forEach   var="i" begin="1" end="31">
						      <c:choose>
						        <c:when test="${endDay==i}">
						          <option value="${i}"  selected>${i}</option>
						        </c:when>
						        <c:otherwise>
						          <option value="${i}">${i}</option>
						        </c:otherwise>
						      </c:choose>
						    </c:forEach>	
						</select>??? &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						<a href="javascript:search_member_list('today')">       <img src="${contextPath}/resources/image/btn_search_one_day.jpg"></a>
						<a href="javascript:search_member_list('one_week')">    <img src="${contextPath}/resources/image/btn_search_1_week.jpg"></a>
						<a href="javascript:search_member_list('two_week')">    <img src="${contextPath}/resources/image/btn_search_2_week.jpg"></a>
						<a href="javascript:search_member_list('one_month')">   <img src="${contextPath}/resources/image/btn_search_1_month.jpg"></a>
						<a href="javascript:search_member_list('two_month')">   <img src="${contextPath}/resources/image/btn_search_2_month.jpg"></a>
						<a href="javascript:search_member_list('three_month')"> <img src="${contextPath}/resources/image/btn_search_3_month.jpg"></a>
						<a href="javascript:search_member_list('four_month')">  <img src="${contextPath}/resources/image/btn_search_4_month.jpg"></a>
						&nbsp;??????
					</td>
				</tr>
				<tr>
				  <td>
					?????? ?????? &nbsp;&nbsp;
					<select name="beginYear" disabled>
					 <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${beginYear==beginYear-i}">
					          <option value="${beginYear-i}" selected>${beginYear-i}</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${beginYear-i}">${beginYear-i}</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>??? 
					<select name="beginMonth" disabled >
						 <c:forEach var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${beginMonth==i}">
					          <option value="${i }"  selected>${i}</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10}">
					              <option value="0${i}">0${i}</option>
					            </c:when>
					            <c:otherwise>
					              <option value="${i}">${i}</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>???
					 <select name="beginDay" disabled >
					  <c:forEach var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${beginDay==i }">
					          <option value="${i}"  selected>${i}</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10}">
					              <option value="0${i}">0${i}</option>
					            </c:when>
					            <c:otherwise>
					              <option value="${i}">${i}</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>???  &nbsp; ~
					
					<select name="endYear" disabled >
					 <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${endYear==endYear-i }">
					          <option value="${2021-i}" selected>${2021-i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${2021-i}">${2021-i}</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>??? 
					<select name="endMonth" disabled >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${endMonth==i}">
					          <option value="${i}"  selected>${i}</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10}">
					              <option value="0${i}">0${i}</option>
					            </c:when>
					            <c:otherwise>
					             <option value="${i}">${i}</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>???
					 <select name="endDay" disabled >
					  <c:forEach var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${endDay==i}">
					          <option value="${i}" selected>${i}</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i<10}">
					              <option value="0${i}">0${i}</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i}">${i}</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>
				  </td>
				</tr>
				<tr>
				  <td>
				    <select id="s_search_type" name="s_search_type" disabled>
						<option value="all" selected>??????</option>
						<option value="goodsId">????????????</option>
						<option value="goodsTitle">????????????</option>
						<option value="goodsWriter">??????</option>
						<option value="goodsPublisher">?????????</option>
					</select>
					<input type="text" size="30" id="t_search_word" disabled/>  
					<input type="button" value="??????" id="btn_search" onclick="fn_detail_search()"  disabled />
				  </td>
				</tr>
			</tbody>
		</table>
		<div class="clear"></div>
	</form>	
	<div align="right">
		<input type="button" class="btn btn-Light btn-sm" value="Excel Export" onclick="location.href='${contextPath}/admin/goods/goodsExcelExport.do'" />
	</div>
	<table class="list_view">
		<tbody align="center">
			<tr style="background:#8e00ff; color:#fff; height: 50px;">
				<td>????????????</td>
				<td>????????????</td>
				<td>??????</td>
				<td>?????????</td>
				<td>????????????</td>
				<td>????????????</td>
				<td>?????????</td>
			</tr>
  				<c:choose>
    				<c:when test="${empty newGoodsList }">			
					<tr>
				       <td colspan="8" class="fixed"><strong>????????? ????????? ????????????.</strong></td>
				    </tr>
			 	</c:when>
			 	<c:otherwise>
     				<c:forEach var="item" items="${newGoodsList}">
						<tr>       
							<td><strong>${item.goodsId}</strong></td>
							<td>
								<a href="${contextPath}/admin/goods/modifyGoodsForm.do?goodsId=${item.goodsId}">
								    <strong>${item.goodsTitle} </strong>
								</a> 
							</td>
							<td><strong>${item.goodsWriter}</strong></td>
							<td><strong>${item.goodsPublisher}</strong></td>
							<td><strong>${item.goodsPrice}</strong></td>
							<td><strong><fmt:formatDate value="${item.goodsCredate}" pattern="yyyy-MM-dd"/></strong></td>
							<td><strong><fmt:formatDate value="${item.goodsPublishedDate}" pattern="yyyy-MM-dd"/> </strong></td>
						</tr>
					</c:forEach>
				</c:otherwise>
  			</c:choose>
		</tbody>
	</table>
	<br>
	<div align="right">
		<input class="btn btn-indigo btn-sm" type="button" onclick="location.href='${contextPath}/admin/goods/addNewGoodsForm.do'" value="?????? ??????">
	</div>
</body>
</html>