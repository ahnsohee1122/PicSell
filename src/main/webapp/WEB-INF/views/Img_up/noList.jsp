<%@ page import="kh.picsell.dto.img_upDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 등록/심사</title>
<jsp:include page="../key/top.jsp" flush="false"/>
				<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
               <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"rel="stylesheet">
<script	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<style>
#container{height:800px;position:relative;min-width:1400px;}
#manage{width:80%; float:right;text-align:center;min-width:860px;}
#leftmenu{width:20%; float:left;height:100%;min-width:182px}
</style>
</head>
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
<c:choose>
<c:when test = "${list.size() == 0}">
 등록신청된 이미지없음
</c:when>
<c:otherwise>
<table id="example" class = "display" style="width:90%">
<thead>
<tr>
<th>작성번호</th>
<th>작성자</th>
<th>용도</th>
<th>승인여부</th>
<th>태그</th>
<th>컨트롤</th>
</tr>
</thead>
<tbody>
<c:forEach items = "${list}" var="dto">
<tr class="head" style="text-align:center; border:1px solid;">
<td>${dto.img_seq}</td>
<td>${dto.nickname}</td>
<td>${dto.usage}</td>
<td>${dto.accept}</td>
<td>${dto.tag}</td>
<td><input type="button" id="show${dto.img_seq}" value="사진보기"></td>
</tr>


<script>

$("#show${dto.img_seq}").on("click",function(){
	location.href="${pageContext.request.contextPath}/img_up/detailview?img_seq=${dto.img_seq}";
});

</script>
</c:forEach>
</tbody>
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