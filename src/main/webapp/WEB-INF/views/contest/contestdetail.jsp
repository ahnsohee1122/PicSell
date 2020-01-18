<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../key/top.jsp" flush="false"/>
<form id="contestuploadform" action="${pageContext.request.contextPath}/contest/upload?title=${contestDto.title}&contest_seq=${contestDto.contest_seq}" method="post" enctype="multipart/form-data">
	<div>${contestDto.reason }</div>
	<div>${contestDto.title }</div>
	<div>${contestDto.detail }</div>
	<div>${contestDto.terms }</div>
	<div>${contestDto.enddate }</div>
	<div>${contestDto.price }</div>
	<div>${contestDto.hosttype }</div>
	<div></div>
	
	
	
	<input type="submit" value="이미지업로드">
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</form>
</body>
</html>