<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorPage | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
	@font-face {font-family: 'Cafe24Oneprettynight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff'); font-weight: normal; font-style: normal;}
</style>
</head>
<body>
	<div class="container-fluid m-0 p-0" style="min-height: 968px; background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
 		<div class="container mx-auto py-5 text-center">
 			<h1 class="mt-5">픽셀 사이트의 에러입니다 ㅠ~ㅠ</h1>
 		</div>
 		<div class="container mx-auto my-3 py-3 text-center">
 			<h5>서비스 이용에 불편함을 드려 죄송합니다.</h5>
 			<h5>불편하시더라도 조금만 양해해 주시면 감사하겠습니다!</h5>
 			<h5>앞으로도 더 좋은 서비스로 보답하겠습니다.</h5>
 			<h5>감사합니다!</h5>
 			<h5 class="my-5">- 픽셀 드림 -</h5>
 		</div>
 		<div class="container mx-auto my-3 py-3 text-center">
 			<h5>아래의 버튼을 눌러주세요!!</h5>
 			<input type="button" value="픽셀 홈으로 가기" id="picHome" class="mt-5" style="border: 1px solid darkgray; background-color: #f4f2f5; width: 150px; height: 40px; border-radius: 10px;">
 		</div>
	</div>
	
	<script>
		$("#picHome").on("click", function() {
			location.href="${pageContext.request.contextPath}/home";
		})
	</script>
</body>
</html>