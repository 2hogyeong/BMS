<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="goods" value="${goodsMap.goods}" />
<c:set var="imageFileList" value="${goodsMap.imageFileList}" />
<c:choose>
	<c:when test='${not empty goods.goodsStatus}'>
		<script>
			window.onload=function() {
				var frm_mod_goods      = document.frm_mod_goods;
				var hGoodsStatus       = frm_mod_goods.hGoodsStatus;
				var goodsStatus        = hGoodsStatus.value;
				var selectGoodsStatus  = frm_mod_goods.goodsStatus;
			}		
		</script>
	</c:when>
</c:choose>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
<link href="${contextPath }/resources/css/myStyle.css" rel="stylesheet" />
<script>

	function fn_modify_goods(goodsId, attribute){
		var frm_mod_goods=document.frm_mod_goods;
		var value="";
		
		if 	    (attribute == 'goodsSort')				 value = frm_mod_goods.goodsSort.value;
		else if (attribute == 'goodsTitle')				 value = frm_mod_goods.goodsTitle.value;
		else if (attribute == 'goodsWriter')			 value = frm_mod_goods.goodsWriter.value;   
		else if (attribute == 'goodsPublisher')		 	 value = frm_mod_goods.goodsPublisher.value;
		else if (attribute == 'goodsPrice')			 	 value = frm_mod_goods.goodsPrice.value;
		else if (attribute == 'goodsSalesPrice')		 value = frm_mod_goods.goodsSalesPrice.value;
		else if (attribute == 'goodsPoint')			 	 value = frm_mod_goods.goodsPoint.value;
		else if (attribute == 'goodsPublishedDate')	{
				var temp1 = frm_mod_goods.goodsPublishedDate.value;
				var temp2 = temp1.split("-");
				value = temp2[0] + temp2[1] + temp2[2];
		}
		else if (attribute == 'goodsTotalPage')		 	 value = frm_mod_goods.goodsTotalPage.value;
		else if (attribute == 'goodsIsbn')				 value = frm_mod_goods.goodsIsbn.value;
		else if (attribute == 'goodsDeliveryPrice')	 	 value = frm_mod_goods.goodsDeliveryPrice.value;
		else if (attribute == 'goodsDeliveryDate')	{
			var temp1 = frm_mod_goods.goodsDeliveryDate.value;
			var temp2 = temp1.split("-");
			value = temp2[0] + temp2[1] + temp2[2];
		}
		else if (attribute == 'goodsStatus')			 value = frm_mod_goods.goodsStatus.value;
		else if (attribute == 'goodsContentsOrder')	 	 value = CKEDITOR.instances.goodsContentsOrder.getData();
		else if (attribute == 'goodsWriterIntro')		 value = CKEDITOR.instances.goodsWriterIntro.getData();
		else if (attribute == 'goodsIntro')			 	 value = CKEDITOR.instances.goodsIntro.getData();
		else if (attribute == 'goodsPublisherComment') 	 value = CKEDITOR.instances.goodsPublisherComment.getData();
		else if (attribute == 'goodsRecommendation')	 value = CKEDITOR.instances.goodsRecommendation.getData();
		
		$.ajax({
			type : "post",
			url : "${contextPath}/admin/goods/modifyGoodsInfo.do",
			data : {
				goodsId   : goodsId,
				attribute : attribute,
				value     : value
			},
			success : function() {
				alert("????????? ??????????????????.");
			}
		});
	}

	 function readURL(input,preview) {
	   if (input.files && input.files[0]) {
	       var reader = new FileReader();
	       reader.onload = function (e) {
	           $('#'+preview).attr('src', e.target.result);
	       }
	       reader.readAsDataURL(input.files[0]);
	   }
	 }  
	
	 
	 var cnt =1;
	 function fn_addFile(){
		  $("#target_add_file").append("<br>"+"<input type='file' name='detailImage"+cnt+"' id='detailImage"+cnt+"'  onchange=readURL(this,'previewImage"+cnt+"') />");
		  $("#target_add_file").append("<img id='previewImage"+cnt+" width=200 height=200/>");
		  $("#target_add_file").append("<input class='btn btn-info btn-xs' type='button' value='??????'  onClick=addNewImageFile('detailImage"+cnt+"','${imageFileList[0].goodsId}','detailImage')  />");
		  cnt++;
	 }
	 
	 
	 function modifyImageFile(fileId,goodsId, imageId,fileType){
	  	
		 var form = $('#FILE_FORM')[0];
	     var formData = new FormData(form);
	     formData.append("fileName", $('#'+fileId)[0].files[0]);
	     formData.append("goodsId", goodsId);
	     formData.append("imageId", imageId);
	     formData.append("fileType", fileType);
	     
	     $.ajax({
	       url: '${contextPath}/admin/goods/modifyGoodsImageInfo.do',
	       processData: false,
	       contentType: false,
	       data: formData,
	       type: 'POST',
	      success: function(result){
	         alert("???????????? ??????????????????.");
	       }
	     });
	 }
	 
	 
	 function addNewImageFile(fileId,goodsId, fileType){
		 
		  var form = $('#FILE_FORM')[0];
	      var formData = new FormData(form);
	      formData.append("uploadFile", $('#'+fileId)[0].files[0]);
	      formData.append("goodsId", goodsId);
	      formData.append("fileType", fileType);
	      
	      $.ajax({
	          url: '${contextPath}/admin/goods/addNewGoodsImage.do',
	              processData: false,
	              contentType: false,
	              data: formData,
	              type: 'post',
	              success: function(result){
	                  alert("???????????? ??????????????????.");
	              }
	        });
	  }
	 
	 
	 function deleteImageFile(goodsId,imageId,imageFileName,trId){
				
		 var tr = document.getElementById(trId);
		
		     	$.ajax({
		   		type : "post",
		   		url : "${contextPath}/admin/goods/removeGoodsImage.do",
		   		data: {
		   				goodsId		  : goodsId,
		   				imageId		  : imageId,
		    	        imageFileName : imageFileName
		    	},
		   		success : function(data, textStatus) {
		   			alert("???????????? ??????????????????.");
		            //tr.style.display = 'none';
		   		}
		   	}); 
	 	}
</script>
<style>
	td:first-child {
		text-align: center;
		font-weight: bold;
	}
</style>
</head>
<body>
	<div class="clear"></div>
	<div id="container">
		<form name="frm_mod_goods" method=post>
			<ul class="tabs">
				<li><a href="#tab1">?????? ??????</a></li>
				<li><a href="#tab2">?????? ??????</a></li>
				<li><a href="#tab3">?????? ??????</a></li>
				<li><a href="#tab4">?????? ??????</a></li>
				<li><a href="#tab5">????????? ?????? ??????</a></li>
				<li><a href="#tab6">?????????</a></li>
				<li><a href="#tab7">?????? ?????????</a></li>
			</ul>
			<div class="tab_container">
				<div class="tab_content" id="tab1">
					<table class="table table-bordered table-hover">
						<colgroup>
							<col width="25%">
							<col width="65%">
							<col width="10%">
						</colgroup>
						<tr>
							<td>?????? ??????</td>
							<td>
								<select name="goodsSort" class="form-control" style="height:30; padding:0">
									<option value="???????????? ?????????" <c:if test="${goods.goodsSort=='???????????? ?????????' }">selected </c:if>> ?????????????????????</option>
									<option value="????????? ??????"  <c:if test="${goods.goodsSort=='????????? ??????' }">selected </c:if>>???????????????</option>
									<option value="????????? ?????????" <c:if test="${goods.goodsSort=='????????? ?????????' }">selected </c:if>>?????????/?????????</option>
									<option value="?????????" <c:if test="${goods.goodsSort=='?????????' }">selected </c:if>>?????????</option>
									<option value="?????? ??????" <c:if test="${goods.goodsSort=='?????? ??????' }">selected </c:if>>??????/??????</option>
									<option value="?????????" <c:if test="${goods.goodsSort=='?????????' }">selected </c:if>>?????????</option>
									<option value="?????? ??? ??????" <c:if test="${goods.goodsSort=='?????? ??? ??????' }">selected </c:if>>??????/???/??????</option>
								</select>
							</td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="??????" onClick="fn_modify_goods('${goods.goodsId }','goodsSort')" /></td>
						</tr>
						<tr>
							<td>?????? ??????</td>
							<td>
								<select name="goodsStatus" class="form-control" style="height:30; padding:0">
									<option value="bestseller" <c:if test="${goods.goodsStatus } eq 'bestseller'"> selected</c:if> >???????????????</option>
									<option value="steadyseller" <c:if test="${goods.goodsStatus } eq 'steadyseller'"> selected</c:if> >???????????????</option>
									<option value="newbook" <c:if test="${goods.goodsStatus } eq 'newbook'"> selected</c:if> >??????</option>
									<option value="etc" <c:if test="${goods.goodsStatus } eq 'etc'"> selected</c:if>>??????</option>
								</select> 
								<input type="hidden" name="hGoodsStatus" value="${goods.goodsStatus}" /></td>
							<td><input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_goods('${goods.goodsId}','goodsStatus')" /></td>
						</tr>
						<tr>
							<td>?????? ??????</td>
							<td><input name="goodsTitle" id="goodsTitle" type="text" class="form-control" value="${goods.goodsTitle}" /></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="??????" onClick="fn_modify_goods('${goods.goodsId}','goodsTitle')" /></td>
						</tr>
						<tr>
							<td>??????</td>
							<td><input name="goodsWriter" type="text" class="form-control" value="${goods.goodsWriter}" /></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="??????" onClick="fn_modify_goods('${goods.goodsId}','goodsWriter')" /></td>
						</tr>
						<tr>
							<td>?????????</td>
							<td><input name="goodsPublisher" type="text" class="form-control" value="${goods.goodsPublisher}" /></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="??????" onClick="fn_modify_goods('${goods.goodsId}','goodsPublisher')" /></td>
						</tr>
						<tr>
							<td>?????? ??????</td>
							<td><input name="goodsPrice" type="text" class="form-control" value="${goods.goodsPrice}" /></td>
							<td><input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_goods('${goods.goodsId}','goodsPrice')" /></td>
						</tr>
						<tr>
							<td>?????? ????????????</td>
							<td><input name="goodsSalesPrice" type="text" class="form-control" value="${goods.goodsSalesPrice}" /></td>
							<td><input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_goods('${goods.goodsId}','goodsSalesPrice')" /></td>
						</tr>
						<tr>
							<td>?????? ?????? ?????????</td>
							<td><input name="goodsPoint" type="text" class="form-control" value="${goods.goodsPoint}" /></td>
							<td><input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_goods('${goods.goodsId}','goodsPoint')" /></td>
						</tr>
						<tr>
							<td>?????? ?????????</td>
							<td><input name="goodsPublishedDate" type="date" class="form-control" value="${goods.goodsPublishedDate}" /></td>
							<td><input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_goods('${goods.goodsId}','goodsPublishedDate')" /></td>
						</tr>
						<tr>
							<td>?????? ??? ????????????</td>
							<td><input name="goodsTotalPage" type="text" class="form-control" value="${goods.goodsTotalPage}" /></td>
							<td><input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_goods('${goods.goodsId}','goodsTotalPage')" /></td>
						</tr>
						<tr>
							<td>ISBN</td>
							<td><input name="goodsIsbn" type="text" class="form-control" value="${goods.goodsIsbn}" /></td>
							<td><input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_goods('${goods.goodsId}','goodsIsbn')" /></td>
						</tr>
						<tr>
							<td>?????? ?????????</td>
							<td><input name="goodsDeliveryPrice" type="text" class="form-control" value="${goods.goodsDeliveryPrice}" /></td>
							<td><input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_goods('${goods.goodsId}','goodsDeliveryPrice')" /></td>
						</tr>
						<tr>
							<td>?????? ?????? ?????????</td>
							<td><input name="goodsDeliveryDate" type="date"
								class="form-control" value="${goods.goodsDeliveryDate}" /></td>
							<td><input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_goods('${goods.goodsId}','goodsDeliveryDate')" /></td>
						</tr>
					</table>
				</div>
				<div class="tab_content" id="tab2">
					<div class="form-group">
						<textarea rows="50" cols="80" class="form-control" id="goodsContentsOrder" name="goodsContentsOrder">${goods.goodsContentsOrder}</textarea>
						<script>CKEDITOR.replace('goodsContentsOrder');</script>
						<p align="right">
							<input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_goods('${goods.goodsId}','goodsContentsOrder')" />
						</p>
					</div>
				</div>
				<div class="tab_content" id="tab3">
					<div class="form-group">
						<textarea rows="50" cols="80" class="form-control" id="goodsWriterIntro" name="goodsWriterIntro">${goods.goodsWriterIntro}</textarea>
						<script>CKEDITOR.replace('goodsWriterIntro');</script>
						<p align="right">
							<input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_goods('${goods.goodsId}','goodsWriterIntro')" />
						</p>
					</div>
				</div>
				<div class="tab_content" id="tab4">
					<div class="form-group">
						<textarea rows="50" cols="80" class="form-control" id="goodsIntro" name="goodsIntro">${goods.goodsIntro}</textarea>
						<script>CKEDITOR.replace('goodsIntro');</script>
						<p align="right">
							<input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_goods('${goods.goodsId}','goodsIntro')" />
						</p>
					</div>
				</div>
				<div class="tab_content" id="tab5">
					<div class="form-group">
						<textarea rows="50" cols="80" class="form-control" id="goodsPublisherComment" name="goodsPublisherComment">${goods.goodsPublisherComment }</textarea>
						<script>CKEDITOR.replace('goodsPublisherComment');</script>
						<p align="right">
							<input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_goods('${goods.goodsId }','goodsPublisherComment')" />
						</p>
					</div>
				</div>
				<div class="tab_content" id="tab6">
					<div class="form-group">
						<textarea rows="50" cols="80" class="form-control" id="goodsRecommendation" name="goodsRecommendation">${goods.goodsRecommendation }</textarea>
						<script>CKEDITOR.replace('goodsRecommendation');</script>
						<p align="right">
							<input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_goods('${goods.goodsId }','goodsRecommendation')" />
						</p>
					</div>
				</div>
		</div>
		</form>
		<div class="tab_content" id="tab7">
			<form id="file_form" method="post" enctype="multipart/form-data">
				<h4>???????????????</h4>
				<table class="list_view">
					<tr align="center" style="background-color : #0061f2; color:#fff; height: 50px" >
						<th>????????? ??????</th>
						<th>????????? ??????</th>
						<th colspan="2">????????? ????????????</th>
						<th>????????? ??????</th>
					</tr>
					<c:forEach var="item" items="${imageFileList}" varStatus="itemNum">
						<c:choose>
							<c:when test="${item.fileType=='main_image'}">
								<tr>
									<td>?????? ?????????</td>
									<td><input type="file" id="main_image" name="main_image"
										onchange="readURL(this,'preview${itemNum.count}');" /> <%-- <input type="text" id="image_id${itemNum.count }"  value="${item.fileName }" disabled  /> --%>
										<input type="hidden" name="imageId" value="${item.imageId}" /><br>
									</td>
									<td><img id="preview${itemNum.count}" width=200 height=200 src="${contextPath}/download.do?goodsId=${item.goodsId}&fileName=${item.fileName}" />
									</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td><input type="button" value="??????"
										class="btn btn-primary btn-xs"
										onClick="modifyImageFile('main_image','${item.goodsId}','${item.imageId}','${item.fileType}')" />
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr id="${itemNum.count-1}">
									<td>?????? ?????????${itemNum.count-1 }</td>
									<td>
										<input type="file" name="detailImage" id="detailImage"
										onchange="readURL(this,'preview${itemNum.count}');" /> <%-- <input type="text" id="image_id${itemNum.count }"  value="${item.fileName }" disabled  /> --%>
										<input type="hidden" name="imageId" value="${item.imageId }" />
										<br>
									</td>
									<td>
										<img id="preview${itemNum.count }" width=200 height=200 src="${contextPath}/download.do?goodsId=${item.goodsId}&fileName=${item.fileName}">
									</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>
										<input type="button" value="??????" class="btn btn-primary btn-xs" onClick="modifyImageFile('detailImage','${item.goodsId}','${item.imageId}','${item.fileType}')" />
										<input type="button" value="??????" class="btn btn-danger btn-xs" onClick="deleteImageFile('${item.goodsId}','${item.imageId}','${item.fileName}','${itemNum.count-1}')" />
									</td>
								</tr>
								
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<tr align="center">
			      		<td colspan="3">
					      <div id="target_add_file">
							  <%-- <img  id="preview${itemNum.count }"   width=200 height=200 src="${contextPath}/download.do?goodsId=${item.goodsId}&fileName=${item.fileName}" /> --%>
					      </div>
				       </td>
				    </tr>
					<tr>
						<td align="right" colspan="5"><input type="button" class="btn btn-outline-primary" value="????????????" onClick="fn_addFile()" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>