<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<h1>*포인트를 수익금으로 전환하기*</h1>
전환 가능한 수익금 : ${profit} <br>
<form action="${pageContext.request.contextPath}/money/changeProc.do" method="post">
전환 금액  : <input type="text" id="money" name="money"> <br>
- 작가 수익금 포인트(P)를 다운로드 가능 금액(원)으로 전환할 수 있습니다. <br>
- 전환한 금액만큼 작가 수익금 포인트에서 차감되어 다운로드 가능 금액으로 전환됩니다. <br>
- 1포인트는 1원입니다. <br>
- 전환된 다운로드 가능 금액으로 크라우드픽의 이미지를 구매할 수 있습니다. <br>
- email : help@picsell.net / 문의전화 : 070-1234-5678 <br>
- 문의 가능 시간 : 평일 10시 ~ 19시 <br>
- 이 메뉴는 판매 수익금을 현금으로 환전하는 메뉴가 아닙니다. <br>
- 작가 수익금을 현금으로 환전/출금하기 원하시는 작가님께서는 [환급하기] 메뉴를 이용해 주시기 바랍니다. <br>
<button id=change>수익금 전환</button>
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
	
</body>
</html>