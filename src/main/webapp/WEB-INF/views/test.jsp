<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<input type="button" id="notice" value="notice">
<input type="button" id="myInfo" value="myInfo">
<input type="button" id="infoModify" value="infoModify">
<input type="button" id="pieceNotice" value="pieceNotice">
<input type="button" id="editNotice" value="editNotice">
	<script>
		$("#notice").on("click",function(){
			location.href="${pageContext.request.contextPath}/notice/notice.do"
		})
		
		$("#myInfo").on("click", function(){
			location.href="${pageContext.request.contextPath}/myInfo/myInfo.do"
		})
		
		$("#infoModify").on("click",function(){
			location.href="${pageContext.request.contextPath}/myInfo/infoModify.do"
		})
		
		$("#pieceNotice").on("click",function(){
			location.href="${pageContext.request.contextPath}/pieceNotice/notice.do"
		})
		
		$("editNotice").on("click", function(){
			location.href="${pageContext.request.contextPath}/editNotice/notice.do"
		})
	</script>
</body>
</html>