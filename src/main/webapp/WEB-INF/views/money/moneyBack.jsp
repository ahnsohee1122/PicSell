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
				<div id="floatMenu" class="col-5 col-md-3 col-xl-2 py-2 text-center p-0 d-none d-md-block" style="height: 310px; border: 1px solid gray; box-sizing: border-box; border-radius: 10px;">
					<div class="row m-0 px-0 w-100 text-left">
						<div class="px-3 py-2 w-100"><a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; font-size: 22px; text-decoration: none;">내 정보</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; font-size: 16px; text-decoration: none;">회원 정보 조회</a></div>
						<div class="px-3 py-1 mb-3 w-100 quickMenu"><a href="${pageContext.request.contextPath}/contest/contestchecking.do" style="color: black; font-size: 16px; text-decoration: none;">공모전 심사/승인 내역</a></div>
					</div>
					<hr class="py-1 m-auto" style="max-width: 220px;">
					<div class="row m-0 px-0 w-100 text-left">
						<div class="px-3 py-2 w-100"><a href="${pageContext.request.contextPath}/money/myPoint.do" style="color: black; font-size: 22px; text-decoration: none;">내 포인트</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/myPoint.do" style="color: black; font-size: 16px; text-decoration: none;">포인트 조회하기</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/buy_list.do" style="color: black; font-size: 16px; text-decoration: none;">구매내역 확인하기</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/sell_list.do" style="color: black; font-size: 16px; text-decoration: none;">판매내역 확인하기</a></div>
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
						<form class="mx-auto mt-4 px-2 px-ml-0" action="${pageContext.request.contextPath}/money/moneyBackProc.do" method="post" style="max-width: 400px;">
							<h4 class="text-left text-warning">작가 수익금 : ${profit}<span class="mx-1">원</span></h4>
							<h4 class="text-left text-warning">환급 할 포인트 : <input type="text" name="back_point" class="border-bottom border-warning text-warning text-right" style="width: 130px; border: 0; background-color: #f4f2f5;"><span class="mx-1">원</span></h4>
							<button class="mt-5 btn" style="width: 100px; border: 1px solid darkgray; border-radius: 10px; background-color: #f4f2f5;">환급하기</button>
						</form>
						<c:choose>
							<c:when test="${msg==null}">
							</c:when>
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