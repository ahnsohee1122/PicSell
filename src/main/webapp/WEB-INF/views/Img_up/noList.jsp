<%@ page import="kh.picsell.dto.img_upDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.head{border:1px solid}
#container{
margin:auto;
width:800px;
height:1000px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<div id="container">
<div style="text-align:center;">
<h1>이미지등록 심사</h1>
</div>
<c:choose>
<c:when test = "${list.size() == 0}">
 없음
</c:when>
<c:otherwise>
<table style="width:80%;">
<tr>
<th>작성번호
<th>작성자
<th>용도
<th>승인여부
<th>태그
</tr>
<c:forEach items = "${list}" var="dto">
<tr class="head" style="text-align:center; border:1px solid;">
<td>${dto.img_seq}</td>
<td>${dto.nickname}</td>
<td>${dto.usage}</td>
<td>${dto.accept}</td>
<td>${dto.tag}</td>
<td><input type="button" id="show${dto.img_seq}" value="사진보기"></td>
</tr>

<tr id="img${dto.img_seq}" style="display:none; border:1px solid">
<td colspan=4 style="text-align:center">이미지들어갈곳<!-- <img src="${dto.sysName} "> -->
<td colspan=2><input type="button" id="ok${dto.img_seq}" value="승인">
<input type="button" id="delete${dto.img_seq}" value="삭제">
<input type="button" id="hide${dto.img_seq}" value="닫기"></td></tr>
<script>
$("#hide${dto.img_seq}").on("click",function(){
	$("#img${dto.img_seq}").css("display","none");
	$("#hide${dto.img_seq}").css("display","none");
	$("#show${dto.img_seq}").css("display",'');
});
$("#show${dto.img_seq}").on("click",function(){
	$("#img${dto.img_seq}").css("display",'');
	$("#show${dto.img_seq}").css("display","none");
	$("#hide${dto.img_seq}").css("display",'');
});
$("#ok${dto.img_seq}").on("click",function(){
	var seq = ${dto.img_seq}
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
})
			$("#delete${dto.img_seq}").on("click",function(){
				$.ajax({
					url:"delete.do",
					type:"post",
					data:{img_seq:${dto.img_seq}}
				}).done(function(res){
					if(res="성공"){alert("삭제에 성공했습니다.");
					location.href="NoList"}
					else if(res="실패"){alert("삭제에 실패했습니다.")}
				}).fail(function(res){
					alert("서버에러입니다.")
				});
			})
</script>
</c:forEach>
</table>
</c:otherwise>
</c:choose>
</div>
</body>
</html>