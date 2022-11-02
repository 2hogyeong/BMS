<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
	
<nav>
 <ul>
  <c:choose>
	<c:when test="${side_menu=='admin_mode'}">
	   <li>
			<h3>주요기능</h3>
			<ul>
				<li><a href="${contextPath}/admin/member/adminMemberMain.do">회원 관리</a></li>
				<li><a href="${contextPath}/admin/goods/adminGoodsMain.do">상품 관리</a></li>
				<li><a href="${contextPath}/admin/order/adminOrderMain.do">주문 관리</a></li>
				<li><a href="${contextPath}/admin/notice/adminNoticeMain.do">공지 사항</a></li>
			</ul>
		</li>
		<br><br><br>
	</c:when>
	<c:when test="${side_menu=='my_page'}">
		<li>
			<h3>정보내역</h3>
			<ul>
				<li><a href="${contextPath}/mypage/listMyOrderHistory.do">주문내역 조회</a></li>
				<li><a href="${contextPath}/mypage/myPasswordCheck.do">내 정보 수정</a></li>
				<li><a href="${contextPath}/main/main.do">메인화면으로 이동</a></li>
			</ul>
		</li>
		<br><br><br>
	</c:when>
	<c:otherwise>
		<li>
			<h3>추천 도서</h3>
			<ul>
				<li><a href="${contextPath}/main/selectStatus.do?status=bestseller">베스트셀러</a></li>
				<li><a href="${contextPath}/main/selectStatus.do?status=steadyseller">스테디셀러</a></li>
				<li><a href="${contextPath}/main/selectStatus.do?status=newbook">신간</a></li>
			</ul><br>
			<h3>상품 분류</h3>
			<ul>
				<li><a href="${contextPath}/main/selectSort.do?sort=fiction">소설/시/희곡</a></li>
				<li><a href="${contextPath}/main/selectSort.do?sort=essay">에세이</a></li>
				<li><a href="${contextPath}/main/selectSort.do?sort=computer">컴퓨터와 인터넷</a></li>
				<li><a href="${contextPath}/main/selectSort.do?sort=digital">디지털 기기</a></li>
				<li><a href="${contextPath}/main/selectSort.do?sort=examination">수험서/자격증</a></li>
				<li><a href="${contextPath}/main/selectSort.do?sort=foreign">외국어</a></li>
				<li><a href="${contextPath}/main/selectSort.do?sort=career">취업/진로</a></li>
			</ul>
		</li>
		<br><br><br>
	 </c:otherwise>
	</c:choose>	
  </ul>
</nav>
<div class="clear"></div>
<div id="banner">
	<a href="#"><img width="190" height="163" src="${contextPath}/resources/image/n-pay.jpg"> </a>
</div>
<div id="notice">
	<h2><a href="${contextPath}/main/noticeMain.do">공지사항</a></h2>
	<ul>
		<li><a href="${contextPath}/main/noticeInfo.do?num=22">BMS 개인정보 처리방침 개정 안내</a></li>
		<li><a href="${contextPath}/main/noticeInfo.do?num=23">BMS mobile 서비스 종료 안내 </a></li>
		<li><a href="${contextPath}/main/noticeInfo.do?num=24">마케팅정보 수신동의 확인 안내</a></li>
		<li><a href="${contextPath}/main/noticeInfo.do?num=25">북클럽 혜택 '커피 무료쿠폰' 종료 안내</a></li>
		<li><a href="${contextPath}/main/noticeInfo.do?num=26">BMS 이용약관 개정 안내</a></li>
	</ul>
</div>
<div id="banner">
	<a href="#"><img width="190" height="362" src="${contextPath}/resources/image/side_banner1.jpg"></a>
</div>
<div id="banner">
	<a href="#"><img width="190" height="104" src="${contextPath}/resources/image/call_center_logo.jpg"></a>
</div>
<div id="banner">
	<a href="#"><img width="190" height="69" src="${contextPath}/resources/image/QnA_logo.jpg"></a>
</div>
</html>