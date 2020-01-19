<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.image{
	width: 300px;
	height: 500px;
}
.image>img{
width:100%;
}
.nickname{
	width:300px;
	height:100px;
}
</style>
</head>
<body>
<c:forEach items="${list }" var="list">

		<div class="image"><img src="/contestenroll/${list.enroll_sysname }"><div class="nickname">@${list.enroll_nickname }</div></div>


</c:forEach>
</body>
</html>