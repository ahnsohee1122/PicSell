<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChangePoint | PicSell</title>
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
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/moneyBack.do" style="color: black; font-size: 16px; text-decoration: none;">포인트 환급</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/change.do" style="color: black; font-size: 16px; text-decoration: none;">포인트 전환</a></div>
					</div>
				</div>
				<div class="col-12 col-md-9 col-xl-10 px-0 px-md-3 text-center">
					<div class="m-auto w-100 h-100 py-5" style="border: 1px solid gray; border-radius: 10px;">
						<form class="mx-auto px-2 px-ml-0" style="max-width: 660px;">
							<h4>포인트 거래소</h4>
							<h4 class="my-3 text-left">* 포인트 거래소? *</h4>
							<h6 class="text-left">- 포인트 거래소는 작가 수익금을 내 포인트로 전환할 수 있는 곳을 말합니다.</h6>
							<h6 class="text-left">- 작가 수익금 포인트(P)를 다운로드 가능 금액(원)으로 전환할 수 있습니다.</h6>
							<h6 class="text-left">- 전환한 금액만큼 작가 수익금 포인트에서 차감되어 다운로드 가능 금액으로 전환됩니다.</h6>
							<h6 class="text-left">- 1포인트는 1원입니다.</h6>
							<h6 class="text-left">- 전환된 다운로드 가능 금액으로 픽셀의 이미지를 구매할 수 있습니다.</h6>
							<h6 class="text-left">- email : picsell@gmail.com / 문의전화 : 010-7327-3143</h6>
							<h6 class="text-left">- 문의 가능 시간 : 평일 09시 ~ 18시</h6>
							<h6 class="text-left">- 이 거래소는 판매 수익금을 현금으로 환전하는 메뉴가 아닙니다.</h6>
							<h6 class="text-left">- 작가 수익금을 현금으로 환전/출금하기 원하시는 작가님께서는 [환급하기] 메뉴를 이용해 주시기 바랍니다.</h6>
							<h6 class="text-left">- 내 포인트를 작가 수익금으로 전환할 수는 없으니 이 점 주의 바랍니다.</h6>
						</form>
						<form class="mx-auto mt-4 px-2 px-ml-0" action="${pageContext.request.contextPath}/money/moneyBackProc.do" method="post" style="max-width: 660px;">
							<h4 class="text-left text-warning">전환 가능한 수익금 : ${profit}<span class="mx-1">원</span></h4>
							<h4 class="text-left text-warning">전환 할 금액 : <input type="text" id="money" name="money" class="border-bottom border-warning text-warning text-right" style="width: 130px; border: 0; background-color: #f4f2f5;"><span class="mx-1">원</span></h4>
							<button id=change class="mt-5 btn" style="width: 100px; border: 1px solid darkgray; border-radius: 10px; background-color: #f4f2f5;">전환하기</button>
						</form>
						<c:choose>
							<%-- 페이지에 처음 들어왔을 때 --%>
							<c:when test="${msg==null}">
							
							</c:when>
							<%-- 메시지가 있을 때 --%>
							<c:otherwise>
								<script>
									var msg = "${msg}";
									alert(msg);
								</script>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>