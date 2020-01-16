<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
input[type="file"] { /* 파일 필드 숨기기 */ position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }

</style>
</head>
<body>
	<div class="container-fluid m-0" style="background-color: #f4f2f5;">
		<div class="container" style="max-width: 1500px;">
			<div class="row">
				<div id="profilediv" class="col-5 col-md-3 col-xl-2 text-center px-0 py-3" style="border: 1px solid gray; box-sizing: border-box; border-radius: 10px;">
			<form method="post" enctype="multipart/form-data" id="fileform">
			<c:choose>
			<c:when test="${memberDto.profileimg == null }">
					<img id="profile"  src="${pageContext.request.contextPath}/img/user.png"class="img-thumbnail" style="width: 150px; height: 140px; border-radius: 50%;"><br>
					<label for="profileimg" style="width: 150px; border: 1px solid darkgray; background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">대표이미지설정</label>
					<input type="file" id="profileimg" name="file" class="mt-3" value="대표 이미지 설정" style="width: 150px; border: 1px solid darkgray; background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
				</c:when>
				<c:otherwise>
					<img id="profile"  src="/profileimage/${memberDto.profileimg }"class="img-thumbnail" style="width: 150px; height: 140px; border-radius: 50%;"><br>
					<label for="profileimg" style="width: 150px; border: 1px solid darkgray; background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">대표이미지설정</label>
					<input type="file" id="profileimg" name="file" class="mt-3" value="대표 이미지 설정" style="width: 150px; border: 1px solid darkgray; background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
				</c:otherwise>
				</c:choose>
				</form>
				</div>
				<div class="col-7 col-md-9 col-xl-10 text-center">
					<div class="m-auto w-100 h-100" style="border-radius: 10px; background-color: #B0B0B0; color: white;">
						<div class="row m-auto h-50 px-3 align-items-end">
							<div style="font-size: 30px; font-family: 'Cafe24Oneprettynight';">@${memberDto.nickname }</div>
						</div>
						<hr class="m-auto p-0" style="max-width: 1200px; background-color: white; font-family: 'Cafe24Oneprettynight';">
						<div class="row m-auto h-50 px-3 px-lg-4 py-2">
						
							<div class="col-6 col-md-4 col-lg-3  col-xl-2 text-left p-0" style="max-width: 110px;">
								<img src="${pageContext.request.contextPath}/img/image_num.png" class="p-0 mr-2" style="width: 25px; height: 25px;" data-toggle="tooltip" data-placement="top" title="이미지 수">
								<span class="p-0 my-0" style="height: 25px; font-size: 18px;" id="imgcount">${imginfo.imgcount }</span>
							</div>
						
							<div class="col-6 col-md-4 col-lg-3 col-xl-2 text-left p-0" style="max-width: 110px;">
								<img src="${pageContext.request.contextPath}/img/download_num.png" class="p-0 mr-2" style="width: 22px; height: 22px;" data-toggle="tooltip" data-placement="top" title="다운로드 수">
								<span class="p-0 my-0" style=" height: 25px; font-size: 18px;" id="downcount">${imginfo.downcount }</span>
							</div>
	
							<div class="col-6 col-md-4 col-lg-3 col-xl-2 text-left p-0" style="max-width: 110px;">
								<img src="${pageContext.request.contextPath}/img/inquiry_num.png" class="p-0 mr-2" style="width: 25px; height: 27px;" data-toggle="tooltip" data-placement="top" title="조회 수">
								<span class="p-0 my-0" style="height: 25px; font-size: 18px;" id="viewcount">${imginfo.viewcount }</span>
							</div>

							<div class="col-6 col-md-4 col-lg-3 col-xl-2 text-left p-0" style="max-width: 110px;">
								<img src="${pageContext.request.contextPath}/img/heart_num.png" class="p-0 my-1 mr-2" style="width: 22px; height: 20px;" data-toggle="tooltip" data-placement="top" title="이미지 좋아요">
								<span class="p-0 my-0" style="height: 25px; font-size: 18px;" id="imglike">${imginfo.imglike }</span>
							</div>

							<div class="col-6 col-md-4 col-lg-3 col-xl-2 text-left p-0" style="max-width: 110px;">
								<img src="${pageContext.request.contextPath}/img/writer_num.png" class="p-0 my-1 mr-2" style="width: 22px; height: 22px;" data-toggle="tooltip" data-placement="top" title="작가 좋아요">
								<span class="p-0 my-0" style="height: 25px; font-size: 18px;" id="likepoint">${imginfo.likepoint }</span>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(function () {
	  		$('[data-toggle="tooltip"]').tooltip()

		})
		
		$("#profileimg").on("change",function(e){	
			var form = $("#fileform")[0]
			console.log(form)
			var data = new FormData(form);
			data.append("file",$("#profileimg")[0].files[0])
			
			$.ajax({
				url:"${pageContext.request.contextPath}/myInfo/profileimg?nickname=${sessionScope.loginInfo}",
				type:"POST",
				enctype : "multipart/form-data",
				data: data,
				contentType : false,
				processData : false,
				cache : false
				}).done(function(resp){
				console.log(resp)
				$("#profile").attr('src',resp)
			})
			
			 
		})
		
	</script>
</body>
</html>