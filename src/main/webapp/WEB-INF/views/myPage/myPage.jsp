<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
						<div class="px-3 py-1 mb-3 w-100 quickMenu"><a href="${pageContext.request.contextPath}/myInfo/modiPage.do" style="color: black; font-size: 16px; text-decoration: none;">공모전 심사/승인 내역</a></div>
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
						<form class="m-auto px-2 px-ml-0" style="max-width: 500px;">
							<div class="form-group row mx-auto my-3">
								<label for="selectId" class="col-3 col-form-label">아이디</label>
							    <div class="col-9">
							      <input type="text" class="form-control text-right" id="selectId" style="border: 0; background-color: #f4f2f5; border-bottom: 1px solid darkgray; border-radius: 0;" value="hihi" readonly>
							    </div>
							</div>
							<div class="form-group row mx-auto my-3">
								<label for="selectPw" class="col-3 col-form-label">비밀번호</label>
							    <div class="col-9">
							      <input type="password" class="form-control text-right" id="selectPw" style="border: 0; background-color: #f4f2f5; border-bottom: 1px solid darkgray; border-radius: 0;" value="" readonly>
							    </div>
							</div>
							<div class="form-group row mx-auto my-3">
								<label for="selectName" class="col-3 col-form-label">이름</label>
							    <div class="col-9">
							      <input type="text" class="form-control text-right" id="selectName" style="border: 0; background-color: #f4f2f5; border-bottom: 1px solid darkgray; border-radius: 0;" value="" readonly>
							    </div>
							</div>
							<div class="form-group row mx-auto my-3">
								<label for="selectNickName" class="col-3 col-form-label">닉네임</label>
							    <div class="col-9">
							      <input type="text" class="form-control text-right" id="selectNickName" style="border: 0; background-color: #f4f2f5; border-bottom: 1px solid darkgray; border-radius: 0;" value="" readonly>
							    </div>
							</div>
							<div class="form-group row mx-auto my-3">
								<label for="selectEmail" class="col-3 col-form-label">이메일</label>
							    <div class="col-9">
							      <input type="text" class="form-control text-right" id="selectEmail" style="border: 0; background-color: #f4f2f5; border-bottom: 1px solid darkgray; border-radius: 0;" value="" readonly>
							    </div>
							</div>
							<div class="form-group row mx-auto my-3">
								<label for="selectEmail" class="col-3 col-form-label">이메일 수신</label>
							    <div class="col-9">
							      <input type="text" class="form-control text-right" id="selectEmail" style="border: 0; background-color: #f4f2f5; border-bottom: 1px solid darkgray; border-radius: 0;" value="" readonly>
							    </div>
							</div>
							<div class="form-group row mx-auto mt-5">
								<button id="info_modify" class="m-auto btn rounded-lg text-black" type="button" style="width: 150px; border: 1px solid darkgray;">수정하기</button>
								<button id="info_withdrawal" class="m-auto btn rounded-lg text-black" type="button" style="width: 150px; border: 1px solid darkgray;" data-toggle="modal" data-target="#Withdrawal">탈퇴하기</button>
								<div class="modal fade" id="Withdrawal" role="dialog" aria-labelledby="Label" aria-hidden="true" style="top: 110px;">
								<div class="modal-dialog" role="document">
									<div class="modal-content" style="margin: auto; width: 450px;">
										<div class="modal-header">
								        	<h5 class="modal-title" id="exampleModalLabel" style="font-size: 20px;">탈퇴하기</h5>
								        	<button type="button" class="close py-3" data-dismiss="modal" aria-label="Close">
									        	<span aria-hidden="true" style="font-family: 'Dovemayo-Medium'; font-size: 15px;">&times;</span>
									        </button>
								      	</div>
									    <div class="modal-body text-left" style="font-family: 'Cafe24Oneprettynight';">
									    	<h6 class="py-2" style="font-size: 17px;">정말로 탈퇴하시겠습니까?<br>회원탈퇴 이후 픽셀 내에 저장된 회원의 모든 데이터는 삭제되며<br>포인트 및 수익금 잔액 또한 삭제됩니다.</h6>
									        <h6 class="py-2" style="font-size: 17px;">비밀번호를 입력해주세요.</h6>
									        <input type="password" class="form-control px-1" id="withPw" placeholder="예) picsell1234@" style="font-size: 14px; font-family: 'Dovemayo-Medium'; border: 0; background-color: white; border-bottom: 1px solid darkgray; border-radius: 0;">
									    </div>
									    <div class="modal-footer"><button type="button" class="btn btn-secondary m-auto" style="width: 150px; font-family: 'Cafe24Oneprettynight';" data-dismiss="modal">탈퇴하기</button></div>
								    </div>
								  </div>
								</div>
							</div>
						</form>
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