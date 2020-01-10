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
<div id="container">
<div id="leftmenu">
<div style="height: 100px; width: 100%; padding-top: 30px;"><h3 style="margin-left:20px;">관리자 메뉴</h3></div>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="" class=mya>회원관리</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="/img_up/NoList" class=mya>사진등록승인</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;background-color: #476491;"><a href="/contest/check.do" class=mya style="color:white;">공모전등록승인</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="" class=mya>게시판관리</a></p>

</div>
<div id="manage">
<h1>공모전승인</h1>
<c:choose>
<c:when test = "${list.size() ==0 }">
<h3 style="text-align:center">신청된 공모전없음</h3>
</c:when>
<c:otherwise>
<table id="example" class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>기간</th>
                            <th>주최분류</th>
                            <th>주최자</th>
                       
                        </tr>
                    </thead>
                    <tbody>

<c:forEach items = "${list}" var="dto">
<tr>
<td>${dto.contest_seq }
<td><a href="detailcheck.do?contest_seq=${dto.contest_seq}">${dto.title }</a>
<td>${dto.term_time }
<td>${dto.hosttype }
<td>${dto.host }

</tr>
<script>

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