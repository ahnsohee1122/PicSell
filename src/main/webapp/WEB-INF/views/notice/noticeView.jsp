<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
div {
	text-align: center;
	overflow: hidden;
	box-sizing: border-box
}
</style>
</head>
<body>
	<div style="border: 1px solid black; width: 80%; margin: auto">
		<div>
			<div class="label" style="width: 12%; float: left">제목</div>
			<div style="width: 88%; float: left; text-align: center">${map.notice.notice_title}</div>
		</div>
		<div>
			<div class="label" style="width: 12%; float: left">날짜</div>
			<div style="width: 18%; float: left">${map.notice.notice_write_date}</div>
			<div class="label" style="width: 12%; float: left">조회수</div>
			<div style="width: 18%; float: left">${map.notice.notice_view_count}</div>
			<div class="label" style="width: 12%; float: left">첨부파일</div>
			<div style="width: 28%; float: left">
				<c:forEach var="fileDto" items="${map.fileDto }">
					<a
						href="${pageContext.request.contextPath}/notice/fileDownLoad.do
						?sysName=${fileDto.noticeFile_sysName}&oriName=${fileDto.noticeFile_oriName}">
						${fileDto.noticeFile_oriName }</a>
				</c:forEach>
			</div>
		</div>
		<div>${map.notice.notice_contents }</div>

		<div>
			<c:if test="${map.beforeNotice.notice_seq != null }">
				<div class="label" style="width: 12%; float: left">이전글</div>
				<div style="width: 88%; float: left; text-align: center">
					<a
						href="${pageContext.request.contextPath}/notice/detail.do?notice_seq=${map.beforeNotice.notice_seq}">
						${map.beforeNotice.notice_title} </a>
				</div>
			</c:if>
		</div>
		<div>
			<c:if test="${map.afterNotice.notice_seq != null }">
				<div class="label" style="width: 12%; float: left">다음글</div>
				<div style="width: 88%; float: left; text-align: center">
					<a
						href="${pageContext.request.contextPath}/notice/detail.do?notice_seq=${map.afterNotice.notice_seq}">
						${map.afterNotice.notice_title} </a>
				</div>
			</c:if>
		</div>
	</div>
	<%-- <c:if test="${adminInfo !=null }"> --%>
		<input type="button" id="delete" value="삭제">
		<input type="button" id="modify" value="수정">
	<%-- </c:if> --%>
	<script>
		$("#delete").on("click", function(){
			location.href="${pageContext.request.contextPath}/notice/delete.do?seq=${map.notice.notice_seq}";
		})
		
		$("#modify").on("click", function(){
			location.href="${pageContext.request.contextPath}/notice/modify.do?seq=${map.notice.notice_seq}";
		})
	</script>
</body>
</html>