<%@ page import="kh.picsell.dto.MemberDTO" %>
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
                <link
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"
	rel="stylesheet">
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<style>
#container{height:800px;position:relative;min-width:1400px;}
#manage{width:80%; float:right;text-align:center;min-width:860px;}
#leftmenu{width:20%; float:left;height:100%;min-width:182px}
</style>
</head>
<body>
<div id="container">
<div id="leftmenu">
<div style="height: 100px; width: 100%; padding-top: 30px;"><h3 style="margin-left:20px;">관리자 메뉴</h3></div>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;background-color: #476491;"><a href="" class=mya style="color:white;">회원관리</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="/img_up/NoList" class=mya>사진등록승인</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="" class=mya>공모전등록승인</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="" class=mya>게시판관리</a></p>

</div>
<div id="manage">
<h1>회원관리</h1>
<c:choose>
<c:when test = "${list.size() ==0 }">
<h3 style="text-align:center">회원없음</h3>
</c:when>
<c:otherwise>
<table id="example" class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>별명</th>
                            <th>이메일</th>
                            <th>블랙리스트 등급</th>
                            <th>등급조정</th>
                        </tr>
                    </thead>
                    <tbody>

<c:forEach items = "${list}" var="dto">
<tr>
<td>${dto.id }
<td>${dto.name }
<td>${dto.nickname }
<td>${dto.email }
<td>${dto.black }
<td><input type="button" value="블랙" id="blackup${dto.id}">
<input type="button" value="블랙해제" id="blackdown${dto.id}">
</tr>
<script>
$("#blackup${dto.id}").on("click",function(){
	if(${dto.black}>=2){
		alert("더이상 블랙업을 할수 없습니다.");
	}else{
	$.ajax({
		url:"blackup.do",
		type:"post",
		data:{id:"${dto.id}"}
	}).done(function(res){
		if(res="블랙업"){alert("블랙up");
		location.href="manage.do"}
		else if(res="실패"){alert("블랙down")}
	}).fail(function(res){
		alert("서버에러입니다.")
	});
	}
});
$("#blackdown${dto.id}").on("click",function(){
	if(${dto.black}<=0){
		alert("더이상 블랙다운을 할수 없습니다");
	}else{
	$.ajax({
		url:"blackdown.do",
		type:"post",
		data:{id:"${dto.id}"}
	}).done(function(res){
		if(res="블랙다운"){alert("블랙down");
		location.href="manage.do"}
		else if(res="실패"){alert("블랙down")}
	}).fail(function(res){
		alert("서버에러입니다.")
	});
	}
});
</script>
</c:forEach>
</tbody>
<tfoot>
<tr>
</tr>
</tfoot>
</table>
<script>
$(document).ready(function() {
	$('#example').DataTable();
});
$($.fn.dataTable.tables(true)).DataTable().columns.adjust();


</script>
</c:otherwise> 
</c:choose>
</div>
</div>
<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>