<%@ page import="kh.picsell.dto.HonorDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../key/top.jsp" flush="false"/>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<c:choose>
<c:when test = "${list.size()==0 }">
<h3>공모전 목록 없음</h3>
</c:when>
<c:otherwise>
<c:forEach items = "${list}" var="dto">

</c:forEach>
</c:otherwise>
</c:choose>
<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>