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
	<label>name:<input type="text" id="name" value="${memberDto.name }" readonly></label>
	<label>nickname<input type="text" id="nickName" value="${memberDto.nickname }" readonly></label>
	<label>email<input type="text" id="email" value="${memberDto.email }" readonly></label>
	<label>likepoint<input type="text" id="likePoint" value="${memberDto.likepoint }" readonly></label>
	
</body>
</html>