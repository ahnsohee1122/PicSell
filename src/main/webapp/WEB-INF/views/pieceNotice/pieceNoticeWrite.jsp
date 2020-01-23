<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PieceNotice Write | PicSell</title>
<style>
	.li {margin: auto; width: 33%; float:left; text-align: center;}
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
	
	<div class="container-fluid py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto">
			<h2 class="mx-auto my-0 text-center">작품의뢰 등록</h2>
		</div>
		<div class="container mx-auto my-5">
			<form action="${pageContext.request.contextPath}/pieceNotice/writeProc.do" enctype="multipart/form-data" method="post" id="frm">
				<table style="width: 100%;">
					<tr>
						<td>제목</td>
						<td><input type="text" id="pieceNotice_title" name="pieceNotice_title" class="w-100 px-2"></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
						<input type='file' name='pieceNoticeFile_file' multiple='multiple'>
						</td>
					</tr>
					<tr>
						<td colspan=2 class="py-4"><div id="summernote" style="width: 100%;"></div></td>
					</tr>
					<tr>
						<textarea style="display: none" id="pieceNotice_contents" name="pieceNotice_contents"></textarea>
					</tr>
					<tr style="text-align: center;">
						<td colspan=2><input class="mx-1" type="button" id="writeBtn" class="inputBtn" value="등록하기" style="width: 100px;
						 border: 1px solid darkgray; background-color: #f4f2f5;">
						 <input class="mx-1" type="button" id="listBtn" class="inputBtn" value="목록보기" style="width: 100px; border: 1px solid darkgray; background-color: #f4f2f5;"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<script>
		(function($) {
			$("#summernote").summernote({
				height: 500
			});
		})(jQuery);

		$(function() {
			$("#writeBtn").on("click", function() {
				$("#pieceNotice_contents").val($(".note-editable").html());
	
				if ($("#pieceNotice_title").val() == "") {
					alert("제목을 입력해주세요.");
					return;
				}
	
				if ($("#pieceNotice_contents").val() == "<p><br></p>") {
					alert("본문 내용을 입력해주세요.");
					return;
				}
	
				$("#frm").submit();
			})
		})
		$("#listBtn").on("click",function(){
			location.href="${pageContext.request.contextPath}/pieceNotice/notice.do";
		})
	</script>
</body>
</html>