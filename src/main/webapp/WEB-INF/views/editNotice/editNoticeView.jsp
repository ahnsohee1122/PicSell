<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EditNotice Detail | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
	.li {margin: auto; width: 33%; float:left; text-align: center;}
	.title {width: 60px; text-align: left;}
	.title2 {width: 80px; text-align: left;}
	.data_title {width: 400px;}
	.data_date {width: 120px;}
	.data_count {width: 50px;}
	.title, .title2, .data {border: 1px solid gray;}
	.viewBtn {width: 100px; border: 1px solid gray; background-color: #f4f2f5;}
	.noBtn {width: 120px; border: 1px solid gray; background-color: #f4f2f5;}
	#contentsP
</style>
</head>
<body>
<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="container-fluid py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto">
			<h2 class="mx-auto my-0 text-center">편집의뢰게시판</h2>
		</div>
		<div class="container mx-auto mt-5 mb-4 text-center" style="height: 40px;">
			<ul class="p-0 m-0 h-100" style="list-style-type: none; border: 1px solid gray; border-radius: 10px;">
				<li class="li h-100"><a href="${pageContext.request.contextPath}/notice/notice.do" style="font-size: 18px; line-height: 40px; color: black;">공지사항</a></li>
				<li class="li h-100"><a href="${pageContext.request.contextPath}/editNotice/notice.do" style="font-size: 18px; line-height: 40px; color: black;">편집의뢰게시판</a></li>
				<li class="li h-100"><a href="${pageContext.request.contextPath}/pieceNotice/notice.do" style="font-size: 18px; line-height: 40px; color: black;">작품의뢰게시판</a></li>
			</ul>
		</div>
		<div class="container mx-auto mt-5 mb-4 text-center">
			<table id="example" class="row-border" style="width: 100%; text-align: center;">
				<thead>
					<tr>
						<th class="title2 px-2">제목</th>
						<td class="data data_title">${map.editNotice.editNotice_title}</td>
						<th class="title px-2 text-center">날짜</th>
						<td class="data data_date">${map.editNotice.editNotice_write_date}</td>
						<th class="title px-2 text-center">조회수</th>
						<td class="data data_count">${map.editNotice.editNotice_view_count}</td>
					</tr>
					<tr>
						<th class="title2 px-2">첨부파일</th>
						<td colspan="5" class="data data_file text-left px-2">
							<c:forEach var="editFileDto" items="${map.editFileDto }">
								<a style="color: black;" href="${pageContext.request.contextPath}/editNotice/fileDownLoad.do?sysName=${editFileDto.editNoticeFile_sysName}&oriName=${editFileDto.editNoticeFile_oriName}">${editFileDto.editNoticeFile_oriName }</a>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td id="contentsP" style="height: 200px;" colspan="6" class="data text-left m-0 px-2">
							${map.editNotice.editNotice_contents }
						</td>
					</tr>
					<tr>
						<th class="title2 px-2 text-center">댓글 목록</th>
						<td colspan="5" class="data">
							<table class="w-100" id="commentTable">
								<c:forEach var="commentDto" items="${map.commentDto }">
								<tr id="comment_box">
									<td id="e${commentDto.comment_seq}" class="p-2 text-left" style="width: 50%">
										<div class="row w-100 m-auto">
											<p class="w-100" style="word-break: break-all;">${commentDto.notice_comment}</p>
										</div>
										<div class="row w-100 m-auto">
											<textarea id="c${commentDto.comment_seq }" class="col-12 col-lg-9 align-self-center px-2" style="height: 40px; display: none; resize: none;"></textarea>
											<input id="d${commentDto.comment_seq }" type="button" value="수정완료" class="mx-lg-2 my-1 my-lg-0 col-6 col-lg-2 align-self-center text-center" onclick="commentModifyComplete(${commentDto.comment_seq })" style="height: 40px; display:none; border: 1px solid darkgray; background-color: #f4f2f5; border-radius: 5px;">
										</div>
									</td>
									<td class="p-2" style="width: 20%">${commentDto.write_date }</td>
									<td class="p-2" style="width: 20%">${commentDto.writer}</td>
									<c:if test="${(loginInfo == commentDto.writer) || (adminInfo != null)}">
									<td class="p-2" style="width: 10%">
										<input type="button" value="삭제" id="a${commentDto.comment_seq }" onclick="commentDelete(${commentDto.comment_seq })" style="border: 1px solid darkgray; background-color: #f4f2f5; border-radius: 5px;">
										<input type="button" value="수정" id="b${commentDto.comment_seq }" onclick="commentModify(${commentDto.comment_seq })" style="border: 1px solid darkgray; background-color: #f4f2f5; border-radius: 5px;">
									</td>
									</c:if>
								</tr>
								</c:forEach>
							</table>
						</td>
					</tr>
					<c:if test="${loginInfo != null || adminInfo != null}">
					<tr>
						<th class="title px-2 py-0 text-center">댓글</th>
						<td class="data px-2 m-auto py-2" colspan="4">
							<div class="row align-items-center w-100 m-auto">
								<textarea id="comment" class="col align-self-center" placeholder="댓글을 입력해주세요" style="width: 100%; resize: none;"></textarea>	
							</div>
						</td>
						<td class="data p-2">
							<input type="button" id="commentBtn" value="작성" style="border: 1px solid darkgray; background-color: #f4f2f5; border-radius: 5px;">	
						</td>
					</tr>
					</c:if>
				</thead>
			</table>
		</div>
		<c:if test="${loginInfo == map.editNotice.editNotice_writer }">
		<div class="container text-center">
			<input type="button" id="delete" class="viewBtn mx-1" value="삭제">
			<input type="button" id="modify" class="viewBtn mx-1" value="수정">
		</div>
		</c:if>
		<div class="container mx-auto mt-5 mb-4 text-center">
			<table id="example" class="row-border" style="width: 100%;">
				<tr style="height: 50px;">
					<th class="title title2 px-2">이전글</th>
					<td class="data text-left px-4">
						<c:if test="${map.editNotice.editNotice_seq != null }">
							<a style="color: black;" href="${pageContext.request.contextPath}/editNotice/detail.do?editNotice_seq=${map.beforeNotice.editNotice_seq}">${map.beforeNotice.editNotice_title}</a>
						</c:if>
					</td>
				</tr>
				<tr style="height: 50px;">
					<th class="title title2 px-2">다음글</th>
					<td class="data text-left px-4">
						<c:if test="${map.afterNotice.editNotice_seq != null }">
							<a style="color: black;" href="${pageContext.request.contextPath}/editNotice/detail.do?editNotice_seq=${map.afterNotice.editNotice_seq}">${map.afterNotice.editNotice_title}</a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		<div class="container text-center">
			<input type="button" id="listGo" class="noBtn" value="목록보기">
		</div>
	</div>
	<!--zzz  -->
	<script>
		$("#delete").on("click", function(){
			location.href="${pageContext.request.contextPath}/editNotice/delete.do?seq=${map.editNotice.editNotice_seq}";
		})
		
		$("#modify").on("click", function(){
			location.href="${pageContext.request.contextPath}/editNotice/modify.do?seq=${map.editNotice.editNotice_seq}";
		})
		
		$("#listGo").on("click", function(){
			location.href="${pageContext.request.contextPath}/editNotice/notice.do";
		})
		
		/*여기부터 comment  */
		
	 	$("#commentBtn").on("click", function(){
	 		var comment = $("#comment").val().replace(/(?:\r\n|\r|\n)/g, '<br/>');
	 		if(comment == ""){
	 			alert("댓글 내용을 작성해주세요");
	 		}else{
	 			var writer = null;
	 			if(${loginInfo != null}){
	 				writer = "${loginInfo}";
	 			}else{
	 				writer = "${adminInfo}";
	 			}

				$.ajax({
					url:"${pageContext.request.contextPath}/editComment/commentWrite.do",
					type:"post",
					data:{
						editNotice_seq:"${map.editNotice.editNotice_seq}",
						writer:writer,
						comment:comment
					},

				dataType:"JSON"
				}).done(function(res){
					$("#comment").val("");

					var insertComment =
						
						'<tr id="comment_box">'
						+'<td id="e' + res.comment_seq+'" class="p-2 text-left" style="width: 50%">'
						+	'<div class="row w-100 m-auto"><p class="w-100" style="word-break: break-all;">'+res.notice_comment+'</p></div>'
						+	'<div class="row w-100 m-auto"><textarea id="c' + res.comment_seq+'" class="col-12 col-lg-9 align-self-center px-2" style="height: 40px; display: none; resize: none;"></textarea>'
						+	'<input id="d' + res.comment_seq+'" type="button" value="수정완료" onclick="commentModifyComplete('+res.comment_seq+')" style="display:none; border: 1px solid darkgray; background-color: #f4f2f5; border-radius: 5px;"></div>'
						+'</td>'
						+'<td class="p-2" style="width: 20%">' + res.write_date+'</td>'
						+'<td class="p-2" style="width: 20%">' + res.writer+'</td>'
						+'<td class="p-2" style="width: 10%">'
							+'<input type="button" class=repDelete value="삭제" id="a' + res.comment_seq + '"onclick="commentDelete('+res.comment_seq + ')" style="border: 1px solid darkgray; background-color: #f4f2f5; border-radius: 5px;">'
							+'<input type="button" class=repModify value="수정" id="b' + res.comment_seq + '"onclick="commentModify('+res.comment_seq + ')" style="border: 1px solid darkgray; background-color: #f4f2f5; border-radius: 5px;">'
						+'</td>'
						+'</tr>'; 
						
						$("#commentTable").append(insertComment);
				})	
	 		}
		}) 
		
		function commentDelete(seq){
			$.ajax({
				url:"${pageContext.request.contextPath}/editComment/commentDelete.do",
				type:"post",
				data:{
					comment_seq:seq
				}
			}).done(function(res){
				console.log(res);
				$("#a" + seq).parent().parent().remove();
			})
		};
		
		function commentModify(seq){
			$("#c" + seq).toggle();
			$("#d" + seq).toggle();
		};
		
		function commentModifyComplete(seq){
			console.log("zz");
			if($("#c" + seq).val() == ""){
				alert("변경할 내용을 작성해주세요.");
			}else{
				$.ajax({
					url:"${pageContext.request.contextPath}/editComment/commentModify.do",
					type:"post",
					data:{
						comment_seq:seq,
						comment:$("#c" + seq).val()
					}
				}).done(function(res){
					console.log(res);
					 var comment = 
		            	   $("#c" + seq).val()
		            	   + '<textarea id="c' + seq +'" style="display: none; resize: none;" rows="2" cols="80"></textarea>'
		            	   + '<input id="d' + seq +'" type="button" value="수정완료" onclick="commentModifyComplete(' + seq + ')" style="display:none; border: 1px solid darkgray; background-color: #f4f2f5; border-radius: 5px;">';
		               $("#e" + seq).html(comment)
				})
			}
		}		
	</script>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>