<%@ page import="kh.picsell.dto.WriterImageUpDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 상세보기</title>
<jsp:include page="../key/top.jsp" flush="false"/>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<style>
#container{height:800px;position:relative;min-width:1400px;}
#manage{width:80%; float:right;text-align:center;min-width:860px;}
#leftmenu{width:20%; float:left;height:100%;min-width:182px}
td{margin-left:40px;}
#img{width:800px;margin:auto}
img{width:100%; height:100%;}
</style>
<body>
<div style="text-align:center">
<h1>이미지 등록/심사</h1>
</div>
<div id="container">
<div id="leftmenu">
<div style="height: 100px; width: 100%; padding-top: 30px;"><h3 style="margin-left:20px;">관리자 페이지</h3></div>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="" class=mya>관리자 정보 조회</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="${pageContext.request.contextPath}/member/manage.do" class=mya>회원정보</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;background-color: #476491;"><a href="${pageContext.request.contextPath}/img_up/NoList" class=mya style="color:white;">이미지심사/승인 내역</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="${pageContext.request.contextPath}/contest/check.do" class=mya>공모전 심사/승인내역</a></p>

</div>
<div id="manage">

<div>
<div style="width:100%;text-align:center">${dto.nickname} 님의 ${dto.img_seq}번 이미지 승인신청입니다</div>
<div><table><tr><td>용도 : ${dto.usage}</td><td>사진사이즈 : ${dto.xDimension} * ${dto.yDimension}</td><td>파일크기 : ${dto.img_size}</td><td>신청일 : ${dto.img_sysdate}</td></tr></table></div>
</div>
<div id="img" style="width:80%; height:500px; text-align:center;border:1px solid;">
	<img src='/writeruploadfiles/${dto.sysname}'>
</div>
<hr>
<input type="button" value="승인" id="ok${dto.img_seq}">
<input type="button" value="승인거절" id="no${dto.img_seq}">
<input type="hidden" id="why${dto.img_seq }">
<script>

	$("#ok${dto.img_seq}").on("click",function(){
		var seq = ${dto.img_seq};
				$.ajax({
					url:"accept.do",
					type:"post",
					data:{img_seq:seq}
				}).done(function(res){
					if(res="성공"){alert("승인에 성공했습니다.");
					location.href="NoList"}
					else if(res="실패"){alert("승인에 실패했습니다.")}
				}).fail(function(res){
					alert("서버에러입니다.")
				});
	});

$("#no${dto.img_seq}").on("click",function(){
	var msg = prompt("승인거절 이유를 작성해주세요.");
	$("#why${dto.img_seq}").val(msg);
	var seq = ${dto.img_seq};
	if(msg==null){alert("취소되었습니다.");return false;}
	if(msg!=""){
	$.ajax({
		url:"delete.do",
		type:"post",
		data:{img_seq:seq,rejection:msg}
	}).done(function(res){
				$("#why${dto.img_seq}").val(msg);
				
		if(res="성공"){
			alert("승인거절에 성공했습니다.");
		location.href="NoList"}
		else if(res="실패"){alert("승인거절에 실패했습니다.")}
	}).fail(function(res){
		alert("서버에러입니다.")
	});
	
	}else{
		alert("거절 사유를 작성해주세요");
	}
	
})
</script>
</div>
</div>
<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>