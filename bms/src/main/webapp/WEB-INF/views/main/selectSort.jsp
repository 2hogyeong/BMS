<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>  

<div id="ad_main_banner">
	<ul class="bjqs">
	    <li><img width="775" height="145" src="${contextPath}/resources/image/main_banner01.jpg"></li>
		<li><img width="775" height="145" src="${contextPath}/resources/image/main_banner02.jpg"></li>
		<li><img width="775" height="145" src="${contextPath}/resources/image/main_banner03.jpg"></li>
	</ul>
</div>

<c:if test="${sort eq 'computer'}">
	<div class="main_book">
   <c:set var="goodsCount" value="0" />
	<h3>컴퓨터와 인터넷</h3>
	<c:forEach var="item" items="${goodsMap.computer }">
	   <c:set var="goodsCount" value="${goodsCount+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?goodsId=${item.goodsId }"><img class="link"  src="${contextPath}/resources/image/1px.gif"> </a> 
			<img width="121" height="154" src="${contextPath}/thumbnails.do?goodsId=${item.goodsId}&fileName=${item.goodsFileName}">
			<div class="title">${item.goodsTitle }</div>
			<div class="price"><fmt:formatNumber  value="${item.goodsPrice}" type="number" var="goodsPrice" />${goodsPrice}원</div>
		</div>
	   <c:if test="${goods_count==15}">
         <div class="book">
           <font size="20"> <a href="#">more</a></font>
         </div>
       </c:if>
   </c:forEach>
	</div>
	<div class="clear"></div>
</c:if>

<c:if test="${sort eq 'digital' }">
	
	<div class="main_book">
   <c:set var="goodsCount" value="0" />
	<h3>디지털 기기</h3>
	<c:forEach var="item" items="${goodsMap.digital }">
	   <c:set var="goodsCount" value="${goodsCount+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?goodsId=${item.goodsId }"><img class="link"  src="${contextPath}/resources/image/1px.gif"> </a> 
			<img width="121" height="154" src="${contextPath}/thumbnails.do?goodsId=${item.goodsId}&fileName=${item.goodsFileName}">
			<div class="title">${item.goodsTitle }</div>
			<div class="price"><fmt:formatNumber  value="${item.goodsPrice}" type="number" var="goodsPrice" />${goodsPrice}원</div>
		</div>
	   <c:if test="${goods_count==15}">
         <div class="book">
           <font size="20"> <a href="#">more</a></font>
         </div>
     </c:if>
  </c:forEach>
</div>
<div class="clear"></div>

</c:if>

<c:if test="${sort eq 'examination' }">
	
	<div class="main_book">
   <c:set var="goodsCount" value="0" />
	<h3>수험서/자격증</h3>
	<c:forEach var="item" items="${goodsMap.examination }">
	   <c:set var="goodsCount" value="${goodsCount+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?goodsId=${item.goodsId }"><img class="link"  src="${contextPath}/resources/image/1px.gif"> </a> 
			<img width="121" height="154" src="${contextPath}/thumbnails.do?goodsId=${item.goodsId}&fileName=${item.goodsFileName}">
			<div class="title">${item.goodsTitle }</div>
			<div class="price"><fmt:formatNumber  value="${item.goodsPrice}" type="number" var="goodsPrice" />${goodsPrice}원</div>
		</div>
	   <c:if test="${goods_count==15}">
         <div class="book">
           <font size="20"> <a href="#">more</a></font>
         </div>
     </c:if>
  </c:forEach>
</div>
<div class="clear"></div>

</c:if>
   
<c:if test="${sort eq 'foreign' }">
	
	<div class="main_book">
   <c:set var="goodsCount" value="0" />
	<h3>외국어</h3>
	<c:forEach var="item" items="${goodsMap.foreign }">
	   <c:set var="goodsCount" value="${goodsCount+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?goodsId=${item.goodsId }"><img class="link"  src="${contextPath}/resources/image/1px.gif"> </a> 
			<img width="121" height="154" src="${contextPath}/thumbnails.do?goodsId=${item.goodsId}&fileName=${item.goodsFileName}">
			<div class="title">${item.goodsTitle }</div>
			<div class="price"><fmt:formatNumber  value="${item.goodsPrice}" type="number" var="goodsPrice" />${goodsPrice}원</div>
		</div>
	   <c:if test="${goods_count==15}">
         <div class="book">
           <font size="20"> <a href="#">more</a></font>
         </div>
     </c:if>
  </c:forEach>
</div>
<div class="clear"></div>

</c:if>
   
<c:if test="${sort eq 'career' }">
	
	<div class="main_book">
   <c:set var="goodsCount" value="0" />
	<h3>취업/진로</h3>
	<c:forEach var="item" items="${goodsMap.career }">
	   <c:set var="goodsCount" value="${goodsCount+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?goodsId=${item.goodsId }"><img class="link"  src="${contextPath}/resources/image/1px.gif"> </a> 
			<img width="121" height="154" src="${contextPath}/thumbnails.do?goodsId=${item.goodsId}&fileName=${item.goodsFileName}">
			<div class="title">${item.goodsTitle }</div>
			<div class="price"><fmt:formatNumber  value="${item.goodsPrice}" type="number" var="goodsPrice" />${goodsPrice}원</div>
		</div>
	   <c:if test="${goods_count==15}">
         <div class="book">
           <font size="20"> <a href="#">more</a></font>
         </div>
     </c:if>
  </c:forEach>
</div>
<div class="clear"></div>

</c:if>
<c:if test="${sort eq 'essay' }">
	
	<div class="main_book">
   <c:set var="goodsCount" value="0" />
	<h3>에세이</h3>
	<c:forEach var="item" items="${goodsMap.essay }">
	   <c:set var="goodsCount" value="${goodsCount+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?goodsId=${item.goodsId }"><img class="link"  src="${contextPath}/resources/image/1px.gif"> </a> 
			<img width="121" height="154" src="${contextPath}/thumbnails.do?goodsId=${item.goodsId}&fileName=${item.goodsFileName}">
			<div class="title">${item.goodsTitle }</div>
			<div class="price"><fmt:formatNumber  value="${item.goodsPrice}" type="number" var="goodsPrice" />${goodsPrice}원</div>
		</div>
	   <c:if test="${goods_count==15}">
         <div class="book">
           <font size="20"> <a href="#">more</a></font>
         </div>
     </c:if>
  </c:forEach>
</div>
<div class="clear"></div>

</c:if>

<c:if test="${sort eq 'fiction' }">
	
	<div class="main_book">
   <c:set var="goodsCount" value="0" />
	<h3>소설/시/희곡</h3>
	<c:forEach var="item" items="${goodsMap.fiction }">
	   <c:set var="goodsCount" value="${goodsCount+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?goodsId=${item.goodsId }"><img class="link"  src="${contextPath}/resources/image/1px.gif"> </a> 
			<img width="121" height="154" src="${contextPath}/thumbnails.do?goodsId=${item.goodsId}&fileName=${item.goodsFileName}">
			<div class="title">${item.goodsTitle }</div>
			<div class="price"><fmt:formatNumber  value="${item.goodsPrice}" type="number" var="goodsPrice" />${goodsPrice}원</div>
		</div>
	   <c:if test="${goods_count==15}">
         <div class="book">
           <font size="20"> <a href="#">more</a></font>
         </div>
     </c:if>
  </c:forEach>
</div>
<div class="clear"></div>

</c:if>