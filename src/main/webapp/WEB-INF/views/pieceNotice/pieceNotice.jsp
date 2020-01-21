<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PieceNotice | PicSell</title>
<style>
	.data {text-align: center;}
	.seq {width: 10%;}
	.title {width: 50%;}
	.writer {width: 10%;}
	.date {width: 20%;}
	.viewCount {width: 10%;}
	.li {margin: auto; width: 33%; float:left; text-align: center;}
	
	.dataTables_wrapper .dataTables_paginate {width: 100%!important; text-align: center!important; margin: auto!important; color: black!important;}
		
	.dataTables_wrapper .dataTables_paginate .paginate_button {
	    border: 1px solid #f4f2f5!important;
	    background-color: #f4f2f5!important;
	    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f4f2f5), color-stop(100%, #f4f2f5))!important;
	    background: -webkit-linear-gradient(top, #f4f2f5 0%, #f4f2f5 100%)!important;
	    background: -moz-linear-gradient(top, #f4f2f5 0%, #f4f2f5 100%)!important;
	    background: -ms-linear-gradient(top, #f4f2f5 0%, #f4f2f5 100%)!important;
	    background: -o-linear-gradient(top, #f4f2f5 0%, #f4f2f5 100%)!important;
	    background: linear-gradient(to bottom, #f4f2f5 0%, #f4f2f5 100%)!important;
	}
	
	.dataTables_wrapper .dataTables_paginate span .paginate_button:hover {color: black!important;}
	.dataTables_wrapper .dataTables_paginate span .paginate_button.current {font-weight: 900!important;}
	
	.dataTables_wrapper .dataTables_paginate .paginate_button.next:hover {color: black!important;}
	.dataTables_wrapper .dataTables_paginate .paginate_button.previous:hover {color: black!important;}
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>

	<div class="container-fluid py-5" style="min-height: 950px; background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto">
			<h2 class="mx-auto my-0 text-center">작품의뢰게시판</h2>
		</div>
		<div class="container mx-auto mt-5 mb-4 text-center" style="height: 40px;">
			<ul class="p-0 m-0 h-100" style="list-style-type: none; border: 1px solid gray; border-radius: 10px;">
				<li class="li h-100"><a href="${pageContext.request.contextPath}/notice/notice.do" style="font-size: 18px; line-height: 40px; color: black;">공지사항</a></li>
				<li class="li h-100"><a href="${pageContext.request.contextPath}/editNotice/notice.do" style="font-size: 18px; line-height: 40px; color: black;">편집의뢰게시판</a></li>
				<li class="li h-100"><a href="${pageContext.request.contextPath}/pieceNotice/notice.do" style="font-size: 18px; line-height: 40px; color: black;">작품의뢰게시판</a></li>
			</ul>
		</div>
		<div class="container mx-auto my-5">
			<table id="example" class="row-border" style="width: 100%; text-align: center;">
				<thead>
					<tr>
						<th class="data seq">번호</th>
						<th class="data title">제목</th>
						<th class="data writer">글쓴이</th>
						<th class="data date">날짜</th>
						<th class="data viewCount">조회수</th>
					</tr>
				</thead>
				<tbody style="font-size: 18px;">
					<c:forEach var="pieceNoticeList" items="${pieceNoticeList }">
						<tr style="background-color: #f4f2f5;">
							<td class="seq">${pieceNoticeList.pieceNotice_seq}</td>
							<td class="title"><a style="color: black;" href="${pageContext.request.contextPath}/pieceNotice/detail.do?pieceNotice_seq=${pieceNoticeList.pieceNotice_seq}">${pieceNoticeList.pieceNotice_title}</td>
							<td class="writer"><a style="color: black;" href="${pageContext.request.contextPath}/writer/writerpage?nickname=${pieceNoticeList.pieceNotice_writer}">${pieceNoticeList.pieceNotice_writer}</td>
							<td class="date">${pieceNoticeList.pieceNotice_write_date}</td>
							<td class="viewCount">${pieceNoticeList.pieceNotice_view_count}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${loginInfo != null || adminInfo != null}">
			<div class="text-right">
				<input type="button" id="writeBtn" value="글쓰기" style="width: 150px; backgorund-color: #f4f2f5; border: 1px solid gray; border-radius: 10px;">
			</div>
			</c:if>
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
		             "emptyTable": "등록된 의뢰글이 없습니다.",
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
			location.href="${pageContext.request.contextPath}/pieceNotice/noticeWrite.do";
		})
	</script>
</body>
</html>