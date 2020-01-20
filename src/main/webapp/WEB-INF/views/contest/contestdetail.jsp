<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ContestDetail | PicSell</title>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="container-fulid py-5 m-0" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container" style="height: 50px;">
			<div class="row w-100 mx-auto">
				<div class="col p-0 text-left">
					<input type="button" value="출품작보기" id="enrollimage" class="btn btn-outline-info" style="width: 100px;">
				</div>
				<div class="col p-0 text-right">
					<input type="button" value="이미지업로드" id="upload" class="btn btn-outline-info" style="width: 100px;">
				</div>
			</div>
		</div>
		<div class="container">
			<form id="contestuploadform" method="post" class="p-3" enctype="multipart/form-data" style="background-color: white;">
				<h4 class="mb-5" style="font-weight: 700;">${contestDto.title }</h4>
				<h5 class="mt-4" style="font-size: 18px;">[ 상세설명 ]</h5>
				<h6 class="my-3">${contestDto.detail }</h6>
				<h5 class="mt-4" style="font-size: 18px;">[ 조건사항 ]</h5>
				<h6 class="my-3">${contestDto.terms }</h6>
				<div class="row w-100 mx-auto mt-4 py-4" style="border-top: 1px solid gray; border-bottom: 1px solid gray;">
					<table>
						<tr>
							<th class="text-left" style="min-width: 70px; line-height: 30px;">주최이유</th>
							<td class="text-left px-2" style="min-width: 100px; line-height: 30px;">${contestDto.reason }</td>
						</tr>
						<tr>
							<th class="text-left" style="min-width: 70px; line-height: 30px;">기간</th>
							<td class="text-left px-2" style="min-width: 100px; line-height: 30px;">${contestDto.enddate }<span class="mx-1">까지</span></td>
						</tr>
						<tr>
							<th class="text-left" style="min-width: 70px; line-height: 30px;">상금</th>
							<td class="text-left px-2" style="min-width: 100px; line-height: 30px;">${contestDto.price }<span class="mx-1">원</span></td>
						</tr>
					</table>
				</div>
				<div class="row w-100 mx-auto">
					<div class="row w-100 mx-auto">
						<h5 class="mt-4" style="font-size: 18px;">[ 예시사진 ]</h5>
					</div>
					<div class="row w-100 mx-auto" style="height: 200px; border: 1px solid red;">
						여기다가 사진 넣으면 되고,, 사진 넣고나면 바로위에 style 모조리 지워주세용
					</div>
				</div>
				<div class="row w-100 mx-auto my-4 text-center">
					<input type="button" value="목록으로" class="mx-auto" style="width: 100px; height: 30px; background-color: white; border: 1px solid darkgray; border-radius: 10px;">
				</div>
			</form>
		</div>
	</div>
	
	<script>
		var loginInfo = "${loginInfo}"
		
		$("#upload").on("click",function(){
			if(loginInfo == null){
				alert("로그인 후 이용해주세요")
				$("#gotologin").click(); 
			}else{
				location.href = "${pageContext.request.contextPath}/contest/upload?title=${contestDto.title}&contest_seq=${contestDto.contest_seq}" 
			}
		})
		
		$("#enrollimage").on("click",function(){
			location.href="${pageContext.request.contextPath}/contest/enrollList?title=${contestDto.title}&contest_seq=${contestDto.contest_seq}" 
		});
	</script>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>