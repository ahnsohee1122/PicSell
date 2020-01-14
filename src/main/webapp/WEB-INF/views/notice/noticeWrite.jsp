<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
</head>
<script>
	$(function() {
		$("#writeBtn").on("click", function() {
			$("#notice_contents").val($(".note-editable").html());

			if ($("#title").val() == "") {
				alert("제목을 입력해주세요.");
				return;
			}

			if ($("#notice_contents").val() == "<p><br></p>") {
				alert("본문 내용을 입력해주세요.");
				return;
			}

			$("#frm").submit();
		})
	})
</script>
<body>
	<form action="${pageContext.request.contextPath}/notice/writeProc.do"
		enctype="multipart/form-data" method="post" id="frm">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="notice_title"></td>
			</tr>
			<tr>
				<td>파일첨부</td>
				<td>
				<input type='file' name='noticeFile_file' multiple='multiple'>
				</td>
			</tr>
			<tr>
				<td colspan=2><div id="summernote"></div></td>
			</tr>
			<tr>
				<textarea style="display: none" id="notice_contents"
					name="notice_contents"></textarea>
			</tr>
			<tr>
				<td><input type="button" id="writeBtn" value="등록"></td>
			</tr>
		</table>
	</form>

	<script>
		$("#summernote").summernote({
			height : 600,
			width : 1000,
		});
	</script>
</body>
</html>