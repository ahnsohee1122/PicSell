<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPoint | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
	.quickMenu:hover {background-color: #EAEAEA;}
	#withPw::placeholder {color: gray;}
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="container-fluid m-0 py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<h2 class="mx-auto my-0 text-center">마이 페이지</h2>
	</div>
	
	<jsp:include page="../key/profile.jsp" flush="false"/>
	
	<div class="container-fluid m-0 py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto" style="max-width: 1500px;">
			<div class="row">
				<div id="floatMenu" class="col-5 col-md-3 col-xl-2 py-2 text-center p-0 d-none d-md-block" style="height: 410px; border: 1px solid gray; box-sizing: border-box; border-radius: 10px;">
					<div class="row m-0 px-0 w-100 text-left">
						<div class="px-3 py-2 w-100"><a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; font-size: 22px; text-decoration: none;">내 정보</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; font-size: 16px; text-decoration: none;">회원 정보 조회</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/myInfo/modiPage.do" style="color: black; font-size: 16px; text-decoration: none;">회원 정보 수정</a></div>
						<div class="px-3 py-1 mb-3 w-100 quickMenu"><a href="#" style="color: black; font-size: 16px; text-decoration: none;">공모전 심사/승인 내역</a></div>
					</div>
					<hr class="py-1 m-auto" style="max-width: 220px;">
					<div class="row m-0 px-0 w-100 text-left">
						<div class="px-3 py-2 w-100"><a href="#" style="color: black; font-size: 22px; text-decoration: none;">내 포인트</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="#" style="color: black; font-size: 16px; text-decoration: none;">포인트 잔액 조회</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="#" style="color: black; font-size: 16px; text-decoration: none;">포인트 충전하기</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="#" style="color: black; font-size: 16px; text-decoration: none;">포인트 환급하기</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="#" style="color: black; font-size: 16px; text-decoration: none;">포인트 전환하기</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="#" style="color: black; font-size: 16px; text-decoration: none;">포인트 내역 확인</a></div>
					</div>
				</div>
				<div class="col-12 col-md-9 col-xl-10 px-0 px-md-3 text-center">
					<div class="m-auto w-100 h-100 py-5" style="border: 1px solid gray; border-radius: 10px;">
						내 포인트
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$("#info_modify").on("click", function() {
			location.href = "${pageContext.request.contextPath}/myInfo/modiPage.do";
		})
	</script>

	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>