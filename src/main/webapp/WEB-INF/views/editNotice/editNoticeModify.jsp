<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<jsp:include page="../key/top.jsp" flush="false"/>
	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
	
	<div class="container-fluid py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto">
			<h2 class="mx-auto my-0 text-center">편집의뢰 수정</h2>
		</div>
		<div class="container mx-auto my-5">
			<form action="${pageContext.request.contextPath}/editNotice/modifyProc.do" enctype="multipart/form-data" method="post" id="frm">
				<table style="width: 100%;">
					<tr>
						<td>글번호</td>
						<td><input type="text" name="editNotice_seq" class="w-100 px-2" value='${map.editNotice.editNotice_seq }' readonly></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="editNotice_title" class="w-100 px-2" value="${map.editNotice.editNotice_title }"></td>
					</tr>
					<tr>
						<td>파일첨부</td>
						<td><input type='file' name='editNoticeFile_file' multiple='multiple'></td>
					</tr>
					<tr>
						<td>기존파일</td>
						<td>
							<c:forEach var="editFileDto" items="${map.editFileDto }">
							<div>
								${editFileDto.editNoticeFile_oriName } <input type="button" value="x"
									id="a${editFileDto.editNoticeFile_seq }" class="test"
									onclick="uploadedFileDelete(${editFileDto.editNoticeFile_seq})">
									<input type=hidden value='${editFileDto.editNoticeFile_seq }'>
							</div>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td colspan=2 class="py-4"><div id="summernote" style="width: 100%;">${map.editNotice.editNotice_contents}</div></td>
					</tr>
					<tr>
						<textarea style="display: none" id="editNotice_contents" name="editNotice_contents"></textarea>
					</tr>
					<tr style="text-align: center;">
						<td colspan=2><input class="mx-1" type="button" id="writeBtn" class="inputBtn" value="수정하기" style="width: 100px; border: 1px solid darkgray; background-color: #f4f2f5;">
						<input class="mx-1" type="button" id="listBtn" class="inputBtn" value="목록보기" style="width: 100px; border: 1px solid darkgray; background-color: #f4f2f5;"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<script>
		var removeFileSeq = null;
		function uploadedFileDelete(seq){
			removeFileSeq = seq;
			var inputTag = $("<input type=hidden>");
			$(inputTag).val(removeFileSeq);
			$(inputTag).attr("name","removeFileSeq");
			$("#frm").append($(inputTag));
			$("#a" + seq).parent("div").remove();	
		};
	
		(function($) {
			$("#summernote").summernote({
				height: 500
			});
		})(jQuery);
		
		$(function() {
			$("#writeBtn").on("click", function() {
				$("#editNotice_contents").val($(".note-editable").html());

				if ($("#title").val() == "") {
					alert("제목을 입력해주세요.");
					return;
				}

				if ($("#editNotice_contents").val() == "<p><br></p>") {
					alert("본문 내용을 입력해주세요.");
					return;
				}

				$("#frm").submit();
			})
		})
			
		$("#writeBtn").on("click",function(){
			$("#frm").submit();
		});
		$("#listBtn").on("click", function(){
			location.href="${pageContext.request.contextPath}/editNotice/notice.do";
		})
	</script>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>