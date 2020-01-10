<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<div>
<div>
<table>
<tr>
<th id="seq">${dto.contest_seq}
<th>${dto.title}
<th>${dto.term_time }
<th>${dto.hosttype }
<th>${dto.host}
</tr>
</table>
</div>
<div><label>상세설명</label><div>${dto.detail}</div></div>
<div><label>상금</label><div>${dto.price}</div></div>
<div>사진들어갈곳</div>
<div><input type="button" id="accept" value="승인"><input type="button" id="nono" value="승인거절"></div>

</div>
<script>
$("#accept").on("click",function(){

	$.ajax({
		url:"accept.do",
		type:"post",
		data:{contest_seq:${dto.contest_seq}}
	}).done(function(res){
		if(res=="승인"){
			alert("승인되었습니다");
			location.href="check.do";
		}else if(res=="미승인"){
			alert("미승인되었습니다");
		}
	}).fail(function(res){
		if(res=="서버"){
		alert("서버에러입니다");}
	});
});
$("#nono").on("click",function(){
	var reok = confirm("승인을 거절하시겠습니까?");
	if(reok){
		$.ajax({
			url:"acceptno.do",
			type:"post",
			data:{contest_seq:${dto.contest_seq}}
		}).done(function(res){
			if(res=="거절"){
				alert("거절되었습니다");
				location.href="check.do";
			}else if(res=="취소"){
				alert("취소되었습니다");
			}
		}).fail(function(res){
			if(res=="서버"){
				alert("서버에러입니다");
			}
		});
	}else{
		alert("취소되었습니다");
	}
});
</script>
</body>
</html>