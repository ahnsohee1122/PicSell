<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PieceNotice Detail | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
	.li {margin: auto; width: 33%; float:left; text-align: center;}
	.title {width: 60px; text-align: left;}
	.title2 {width: 90px; text-align: left;}
	.data_title {width: 400px;}
	.data_date {width: 120px;}
	.data_count {width: 50px;}
	th, td {border: 1px solid gray;}
	tfoot {min-height: 500px;}
	.viewBtn {width: 100px; border: 1px solid gray; background-color: #f4f2f5;}
	.noBtn {width: 120px; border: 1px solid gray; background-color: #f4f2f5;}
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="container-fluid py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto">
			<h2 class="mx-auto my-0 text-center">작품의뢰</h2>
		</div>
		<div class="container mx-auto mt-5 mb-4 text-center" style="height: 40px;">
			<ul class="p-0 m-0 h-100" style="list-style-type: none; border: 1px solid gray; border-radius: 10px;">
				<li class="li h-100"><a href="${pageContext.request.contextPath}/notice/notice.do" style="font-size: 18px; line-height: 40px; color: black;">공지사항</a></li>
				<li class="li h-100"><a href="#" style="font-size: 18px; line-height: 40px; color: black;">편집의뢰게시판</a></li>
				<li class="li h-100"><a href="#" style="font-size: 18px; line-height: 40px; color: black;">작품의뢰게시판</a></li>
			</ul>
		</div>
		<div class="container mx-auto mt-5 mb-4 text-center">
			<table id="example" class="row-border" style="width: 100%; text-align: center;">
				<thead>
					<tr>
						<th class="title px-2">제목</th>
						<td class="data_title">${map.pieceNotice.pieceNotice_title}</td>
						<th class="title px-2 text-center">날짜</th>
						<td class="data_date">${map.pieceNotice.pieceNotice_write_date}</td>
						<th class="title px-2 text-center">조회수</th>
						<td class="data_count">${map.pieceNotice.pieceNotice_view_count}</td>
					</tr>
					<tr>
						<th class="title px-2">첨부파일</th>
						<td colspan="5" class="data_file text-left px-2">
							<c:forEach var="pieceFileDto" items="${map.pieceFileDto }">
								<a style="color: black;" href="${pageContext.request.contextPath}/pieceNotice/fileDownLoad.do?sysName=${pieceFileDto.pieceNoticeFile_sysName}&oriName=${pieceFileDto.pieceNoticeFile_oriName}"> ${pieceFileDto.pieceNoticeFile_oriName }</a>
							</c:forEach>
						</td>
					</tr>
				</thead>
				<tfoot  style="border: 1px solid gray;">
					<tr>
						<td colspan="6" class="text-left m-0 px-2">${map.pieceNotice.pieceNotice_contents }</td>
					</tr>
				
				
				
				
				
				
					<!-----comment code----------------------------  -->
					<tr>
						<td colspan="6" class="text-left m-0 px-2">
						<div>댓글목록</div>
						<div id="comment_box" style="height:100px; overflow:auto; overflow-x:hidden;">
							<c:forEach var="commentDto" items="${map.commentDto }">
								<div>${commentDto.writer} : ${commentDto.notice_comment} : ${commentDto.write_date }
									
									<input type="button" value="삭제" style="display:none;"
									id="a${commentDto.comment_seq }" 
									onclick="commentDelete(${commentDto.comment_seq })">
									
									<input type="button" value="수정" 
									id="b${commentDto.comment_seq }" 
									onclick="commentModify(${commentDto.comment_seq })"><br>
									
									<textarea id="c${commentDto.comment_seq }" style="display:none;"></textarea>
									<input id="d${commentDto.comment_seq }" style="display:none;" 
									type="button" value="수정완료"
									onclick="commentModifyComplete(${commentDto.comment_seq })">
								</div>
							</c:forEach>
							
						<div>
						</td>
					</tr>
					<tr>
						<td colspan="1" class="text-left m-0 px-2">
						<div>댓글</div>
						<td colspan="4" class="">
						<div><textarea style="width:100%; height:100%;" id="comment"></textarea></div>
						<td colspan="1">
						<div><input type="button" id="commentBtn" value="작성"></div>
					</td>
					</tr>
					<!-- ---------comment code---------------------------------------------------- -->
				
				
				
				
				
				
				
				
				
				</tfoot>
			</table>
		</div>
		<div class="container text-center">
		<%-- <c:if test="${adminInfo !=null }"> --%>
			<input type="button" id="delete" class="viewBtn mx-1" value="삭제">
			<input type="button" id="modify" class="viewBtn mx-1" value="수정">
		<%-- </c:if> --%>
		</div>
		<div class="container mx-auto mt-5 mb-4 text-center">
			<table id="example" class="row-border" style="width: 100%;">
				<tr style="height: 50px;">
					<th class="title2 px-2">이전글</th>
					<td class="text-left px-4">
						<c:if test="${map.beforeNotice.pieceNotice_seq != null }">
							<a style="color: black;" href="${pageContext.request.contextPath}/pieceNotice/detail.do?pieceNotice_seq=${map.beforeNotice.pieceNotice_seq}">${map.beforeNotice.pieceNotice_title}</a>
						</c:if>
					</td>
				</tr>
				<tr style="height: 50px;">
					<th class="title2 px-2">다음글</th>
					<td class="text-left px-4">
						<c:if test="${map.afterNotice.pieceNotice_seq != null }">
							<a style="color: black;" href="${pageContext.request.contextPath}/pieceNotice/detail.do?pieceNotice_seq=${map.afterNotice.pieceNotice_seq}">${map.afterNotice.pieceNotice_title}</a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		<div class="container text-center">
			<input type="button" id="listGo" class="noBtn" value="목록보기">
		</div>
	</div>
	
	<script>
		$("#delete").on("click", function(){
			location.href="${pageContext.request.contextPath}/pieceNotice/delete.do?seq=${map.pieceNotice.pieceNotice_seq}";
		})
		
		$("#modify").on("click", function(){
			location.href="${pageContext.request.contextPath}/pieceNotice/modify.do?seq=${map.pieceNotice.pieceNotice_seq}";
		})
		
		$("#listGo").on("click", function(){
			location.href="${pageContext.request.contextPath}/pieceNotice/notice.do";
		})
		
		/*여기부터 comment  */
		
	 	$("#commentBtn").on("click", function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/pieceComment/commentWrite.do",
				type:"post",
				data:{
					pieceNotice_seq:"${map.pieceNotice.pieceNotice_seq}",
					writer:"회원",
					comment:$("#comment").val()
				}
			}).done(function(res){
				console.log(res);
				$("#comment_box").append("<div>" + $("#comment").val() + "</div>");
			})
		}) 
		
		function commentDelete(seq){
			$.ajax({
				url:"${pageContext.request.contextPath}/pieceComment/commentDelete.do",
				type:"post",
				data:{
					comment_seq:seq
				}
			}).done(function(res){
				console.log(res);
				$("#a" + seq).parent("div").remove();
			})
		};
		
		function commentModify(seq){
			$("#c" + seq).css("display","block");
			$("#d" + seq).css("display","block");
		};
		
		function commentModifyComplete(seq){
			console.log("zz");
			if($("#c" + seq).val() == ""){
				alert("변경할 내용을 작성해주세요.");
			}else{
				$.ajax({
					url:"${pageContext.request.contextPath}/pieceComment/commentModify.do",
					type:"post",
					data:{
						comment_seq:seq,
						comment:$("#c" + seq).val()
					}
				}).done(function(res){
					console.log(res);
				})
			}
		}
		
		
		
		
		
		
		
		
		
	</script>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>