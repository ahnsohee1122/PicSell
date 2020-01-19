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
<form id="contestuploadform" method="post" enctype="multipart/form-data">
	<div>${contestDto.reason }</div>
	<div>${contestDto.title }</div>
	<div>${contestDto.detail }</div>
	<div>${contestDto.terms }</div>
	<div>${contestDto.enddate }</div>
	<div>${contestDto.price }</div>
	<div>${contestDto.hosttype }</div>
	<div></div>
	
	
	
	<input type="button" value="이미지업로드" id="upload">
	<input type="button" value="출품작보기" id="enrollimage">
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</form>

<script>
var loginInfo = "${loginInfo}"
$("#upload").on("click",function(){
	if(loginInfo == null){
		alert("로그인 후 이용해주세요")
		$("#gotologin").click(); 
	}else{
		location.href = "${pageContext.request.contextPath}/contest/upload?title=${contestDto.title}&contest_seq=${contestDto.contest_seq}" 
	}
})

$("#enrollimage").on("click",function(){
	location.href="${pageContext.request.contextPath}/contest/enrollList?title=${contestDto.title}&contest_seq=${contestDto.contest_seq}" 
})
</script>
</body>
</html>