<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReturnPoint | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<jsp:include page="../key/profile.jsp" flush="false"/>
	
	<div class="container-fluid m-0 py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto" style="max-width: 1500px;">
			<div class="row">
				<div id="floatMenu" class="col-5 col-md-3 col-xl-2 py-2 text-center p-0 d-none d-md-block" style="height: 410px; border: 1px solid gray; box-sizing: border-box; border-radius: 10px;">
					<div class="row m-0 px-0 w-100 text-left">
						<div class="px-3 py-2 w-100"><a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; font-size: 22px; text-decoration: none;">My Page</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; font-size: 16px; text-decoration: none;">회원 정보 조회</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/buy_list.do" style="color: black; font-size: 16px; text-decoration: none;">구매 내역 확인</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/myPoint.do" style="color: black; font-size: 16px; text-decoration: none;">포인트 입출금 내역 확인</a></div>
						<div class="px-3 py-1 mb-3 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/charge.do" style="color: black; font-size: 16px; text-decoration: none;">포인트 충전</a></div>
					</div>
					<hr class="py-1 m-auto" style="max-width: 220px;">
					<div class="row m-0 px-0 w-100 text-left">
						<div class="px-3 py-2 w-100"><a href="${pageContext.request.contextPath}/writer/writerpage?nickname=${sessionScope.loginInfo}" style="color: black; font-size: 22px; text-decoration: none;">Writer Page</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/writer/writerpage?nickname=${sessionScope.loginInfo}" style="color: black; font-size: 16px; text-decoration: none;">작가 정보 조회</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/profit_list.do" style="color: black; font-size: 16px; text-decoration: none;">수익 & 판매 내역 확인</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/moneyBack.do" style="color: black; font-size: 16px; text-decoration: none;">수익금 환급</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/change.do" style="color: black; font-size: 16px; text-decoration: none;">수익금 전환</a></div>
					</div>
				</div>
				<div class="col-12 col-md-9 col-xl-10 px-0 px-md-3 text-center">
					<div class="m-auto w-100 h-100 py-5" style="border: 1px solid gray; border-radius: 10px;">
						<form class="mx-auto px-2 px-ml-0" style="max-width: 400px;">
							<h4>환급하기</h4>
							<h4 class="my-3 text-left">* 주의사항 *</h4>
							<h6 class="text-left">- 작가 수익금만 출금 가능합니다.</h6>
							<h6 class="text-left">- 작가 수익금 5000원 이상인 경우에만 출금 가능합니다.</h6>
						</form>
						<form class="mx-auto mt-4 px-2 px-ml-0" id="frm" action="${pageContext.request.contextPath}/money/moneyBackProc.do" method="post" style="max-width: 400px;">
							<h4 class="text-left text-warning">작가 수익금 : ${profit}<span class="mx-1">원</span></h4>
							<h4 class="text-left text-warning">환급 할 포인트 : <input type="text" id="back_point" name="back_point" class="border-bottom border-warning text-warning text-right" style="width: 130px; border: 0; background-color: #f4f2f5;"><span class="mx-1">원</span></h4>
							<input type=button id="btn" class="mt-5 btn" style="width: 100px; border: 1px solid darkgray; border-radius: 10px; background-color: #f4f2f5;" value="환급하기">
						</form>
						<script>
						$("#btn").on("click", function(){
							var back_point = $("#back_point").val();
							if("${profit}"<back_point){
								alert("출금하시려는 포인트가 가지고 계신 포인트보다 많습니다.");
							}else if(back_point<5000){
								alert("5000원 미만은 출금할 수 없습니다.");
							}else{
								var back_point = $("#back_point").val();
								$.ajax({
									 url : "${pageContext.request.contextPath}/money/moneyBackProc.do",
							    	 type : "post",
							    	 data : {back_point : back_point}
								}).done(function(data){
									alert("환급이 완료되었습니다. 환급은 결제방식에 따라 최대 1~2일정도 소요됩니다.");
									location.replace("${pageContext.request.contextPath}/money/profit_list.do");
								})	
							}
						
						})
						</script>

					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>