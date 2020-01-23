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
.imgspan{margin-right:40px;}
</style>
<body>
   <div class="container-fluid m-0 p-0" style="font-family: 'Cafe24Oneprettynight';text-align:center;">
    	<div class="container mt-5 px-2" style="max-width: 1500px;background-color:#dedede;">
    		<h3>이미지 심사/승인</h3>
    	</div>



<div style="margin:auto;text-align:center">
<div style="font-size: 15px; font-family: 'NanumBarunpen'; border: 1px solid darkgray; border-radius: 10px;">
<div>${dto.nickname} 님의 ${dto.img_seq}번 이미지 승인신청입니다</div>
<div><span class="imgspan">용도 : ${dto.usage}</span><span class="imgspan">사진사이즈 : ${dto.xDimension} * ${dto.yDimension}</span><span  class="imgspan" id="size${dto.img_seq}"></span><span  class="imgspan">신청일 : ${dto.img_sysdate}</span></div>
</div>
<span>
	<img src='/writeruploadfiles/${dto.sysname}' style="width: 450px; height: 280px;text-align:center">
</span><br>
<div style="margin-top:50px;">
<span class="imgspan">태그 : ${dto.tag }</span></div>
<hr>
<input type="button" value="승인" id="ok${dto.img_seq}">
<input type="button" value="승인거절" id="no${dto.img_seq}">
<input type="hidden" id="why${dto.img_seq }">
<script>

var size = ${dto.img_size};
var value = size/1048576;
var showvalue = value.toFixed(2);
$("#size${dto.img_seq}").html("파일크기 : "+showvalue+"MB");

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