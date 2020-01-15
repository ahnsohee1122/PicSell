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
	구매 ID : ${dto.receipt_id}<br>
	가격 : 	${dto.price}<br>
	결제 방식 : ${dto.payment_name}<br>
	구매 날짜 : ${dto.requested_at}<br>
</body>
</html>