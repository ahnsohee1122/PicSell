<%@ page import="kh.picsell.dto.ContestDTO" %>
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
<div style="text-align:center">
<h2>${loginInfo} 님의 공모전 신청현황</h2>
</div>
<div id="container">
<div id="leftmenu">
<div style="height: 100px; width: 100%; padding-top: 30px;"><h3 style="margin-left:20px;">작가메뉴</h3></div>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="" class=mya>작가정보조회</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="${pageContext.request.contextPath}/img_up/acceptpage.do" class=mya>이미지심사/승인 내역</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;background-color: #476491;"><a href="${pageContext.request.contextPath}/contest/contestchecking.do" class=mya style="color:white;">공모전 심사/승인내역</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="" class=mya>수익금내역조회</a></p>

</div>
<div id="manage">
<c:choose>
<c:when test = "${list.size()==0 }">
${loginInfo} 님이 신청한 공모전이 없습니다.
</c:when>
<c:otherwise>
<div style="text-align:center">
<table><tr><td>승인된 공모전 : ${ok}개</td><td>승인 거절된 공모전 : ${no}개</td><td>승인대기중인 공모전 : ${notyet}개</td></tr></table>
</div>
<table id="example" class = "display" style="width:90%">
<thead>
<tr>
<th>등록번호</th>
<th>제목</th>
<th>현재상태</th>
<th>승인여부</th>
</tr>
</thead>
<tbody>
<c:forEach items = "${list}" var = "dto">
<tr>
<td>${dto.contest_seq}
<td>${dto.title}
<td id="checking${dto.contest_seq}">
<td id="accept${dto.contest_seq}">
</tr>
<script>
var checking = "${dto.checking}";
var accept = "${dto.accept}";
if(checking=="N"){
	$("#checking${dto.contest_seq}").html("심사중");
	$("#accept${dto.contest_seq}").html("심사중");
}else if(checking=="Y"){
	$("#checking${dto.contest_seq}").html("심사완료");
if(accept=="N"){
	$("#accept${dto.contest_seq}").html("등록거절 (사유 : ${dto.rejection})");
}else if(accept="Y"){
	$("#accept${dto.contest_seq}").html("등록승인");
}
}
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