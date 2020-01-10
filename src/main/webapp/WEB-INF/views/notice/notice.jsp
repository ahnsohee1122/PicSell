<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"
	rel="stylesheet">
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<style>
td {
	text-align: center
}

.seq {
	width: 10%
}

.title {
	width: 50%
}

.writer {
	width: 10%
}

.date {
	width: 20%
}

.viewCount {
	width: 10%;
}
</style>
</head>
<body>

	<table id="example" class="row-border" style="width: 100%">
		<thead>
			<tr>
				<th class="seq">번호</th>
				<th class="title">제목</th>
				<th class="writer">글쓴이</th>
				<th class="date">날짜</th>
				<th class="viewCount">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="noticeList" items="${noticeList }">
				<tr>
					<td class="seq">${noticeList.notice_seq}</td>
					<td class="title"><a
						href="${pageContext.request.contextPath}/notice/detail.do?notice_seq=${noticeList.notice_seq}">${noticeList.notice_title}</td>
					<td class="writer">${noticeList.notice_writer}</td>
					<td class="date">${noticeList.notice_write_date}</td>
					<td class="viewCount">${noticeList.notice_view_count}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<%-- 	<c:if test="${adminInfo !=null }"> --%>
	<div>
		<input type="button" id="writeBtn" value="글쓰기">
	</div>
<%-- 	</c:if> --%>
	<script>
		$(document).ready(function() {
			$('#example').DataTable();
		});
		$($.fn.dataTable.tables(true)).DataTable().columns.adjust();
		
		$("#writeBtn").on("click", function(){
			location.href="${pageContext.request.contextPath}/notice/noticeWrite.do";
		})
	</script>
</body>
</html>