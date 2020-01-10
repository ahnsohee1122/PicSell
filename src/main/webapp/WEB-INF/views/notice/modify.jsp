<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body>
	<form action="${pageContext.request.contextPath}/notice/modifyProc.do"
		enctype="multipart/form-data" method="post" id="frm">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="notice_title"
					value="${map.notice.notice_title }"></td>
			</tr>
			<tr>
				<td>파일첨부</td>

				<td>
					<div>
						<input type="file" name="noticeFile_file0" multiple="multiple">
						<button class="removeFile" type="button">삭제</button>
					</div>
				</td>

			</tr>
			<tr>


				<td>기존파일</td>
				<td><c:forEach var="fileDto" items="${map.fileDto }">
						<div>
							${fileDto.noticeFile_oriName } <input type="button" value="x"
								id="a${fileDto.noticeFile_seq }" class="test"
								onclick="uploadedFileDelete(${fileDto.noticeFile_seq})">
								<input type=hidden value='${fileDto.noticeFile_seq }'>
						</div>
					</c:forEach></td>
			</tr>
			<tr>
				<td colspan=2><div id="summernote">${map.notice.notice_contents}</div></td>
			</tr>
			<tr>
				<textarea style="display: none" id="notice_contents"
					name="notice_contents"></textarea>
			</tr>
			<tr>
				<td><input type="button" id="writeBtn" value="수정"></td>
			</tr>
		</table>
	</form>

	<script>

	function uploadedFileDelete(seq){
		var removeFileSeq = $(this).closest("div").find("input").val();
		var inputTag = $("<input type=hidden>");
		$(inputTag).val(removeFileSeq);
		$(inputTag).attr("name","removeFileSeq");
		$("#frm").append($(inputTag));
		$("#a" + seq).parent("div").remove();
		
	};

	$("#summernote").summernote({
		height : 600,
		width : 1000,
	});
		
	$("#writeBtn").on("click",function(){
		$("#frm").submit();
	});

	
	
	</script>
</body>
</html>