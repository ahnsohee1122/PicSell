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

	<h1>환급하기</h1>
	<h2>
		* 주의사항 * <br>
		 - 잔여 수익금 이하만 출금가능합니다. <br> 
		 - 잔여 수익금 5000원 이상인 경우에만 출금 가능합니다.
	</h2>
	<form action="${pageContext.request.contextPath}/money/moneyBackProc.do" method="post">
		잔여 수익금 : ${profit}<br>
		환급할 포인트 : <input type="text" name="back_point">
		<button>환급하기</button>
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

</body>
</html>