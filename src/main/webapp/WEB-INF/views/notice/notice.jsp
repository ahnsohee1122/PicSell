<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice | PicSell</title>
<style>
	.data {text-align: center;}
	.seq {width: 10%;}
	.title {width: 50%;}
	.writer {width: 10%;}
	.date {width: 20%;}
	.viewCount {width: 10%;}
	.li {margin: auto; width: 33%; float:left; text-align: center;}
</style>
<script>

</script>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>

	<div class="container-fluid py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto">
			<h2 class="mx-auto my-0 text-center">공지사항</h2>
		</div>
		<div class="container mx-auto mt-5 mb-4 text-center" style="height: 40px;">
			<ul class="p-0 m-0 h-100" style="list-style-type: none; border: 1px solid gray; border-radius: 10px;">
				<li class="li h-100"><a href="#" style="font-size: 18px; line-height: 40px; color: black;">공지사항</a></li>
				<li class="li h-100"><a href="#" style="font-size: 18px; line-height: 40px; color: black;">편집의뢰게시판</a></li>
				<li class="li h-100"><a href="#" style="font-size: 18px; line-height: 40px; color: black;">작품의뢰게시판</a></li>
			</ul>
		</div>
		<div class="container mx-auto my-5">
			<table id="example" class="row-border" style="width: 100%; text-align: center;">
				<thead style="border-bottom: 1px solid gray;">
					<tr>
						<th class="data seq">번호</th>
						<th class="data title">제목</th>
						<th class="data writer">글쓴이</th>
						<th class="data date">날짜</th>
						<th class="data viewCount">조회수</th>
					</tr>
				</thead>
				<tbody style="font-size: 18px;">
					<c:forEach var="noticeList" items="${noticeList }">
						<tr>
							<td class="seq">${noticeList.notice_seq}</td>
							<td class="title"><a href="${pageContext.request.contextPath}/notice/detail.do?notice_seq=${noticeList.notice_seq}">${noticeList.notice_title}</td>
							<td class="writer">${noticeList.notice_writer}</td>
							<td class="date">${noticeList.notice_write_date}</td>
							<td class="viewCount">${noticeList.notice_view_count}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<input type="button" id="writeBtn" value="글쓰기">
			</div>
		</div>
	</div>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
	
	<script>
		$(document).ready(function() {
			$('#example').DataTable({
				searching:false,
		        ordering:false,
		        info:false,
		        order:[[2,"desc"]],
		        "language": {
		             "emptyTable": "등록된 공지사항이 없습니다.",
		              "paginate" :{
		              "previous" : "<<",
		              "next" : ">>"
		                }
		          },
		        "pagingType": "simple_numbers"
			});
		});
		$($.fn.dataTable.tables(true)).DataTable().columns.adjust();
		
		$("#writeBtn").on("click", function(){
			location.href="${pageContext.request.contextPath}/notice/noticeWrite.do";
		})
	</script>
</body>
</html>