<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#box {
	width: 400px;
	margin: auto;
}

.left {
	float: left;
}

.right {
	float: right;
	height: 100%;
}

.column {
	border-bottom: 1px solid black;
	height: 30px;
}

.text {
	padding-bottom: 1px;
	height: 100%;
	box-sizing: border-box;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<form
		action="${pageContext.request.contextPath}/myInfo/infoModifyProc.do?id=${memberDto.id }" method="post" id="frm">
		<div id="box">
			<div class="column">
				<span class="left">이메일</span> <span class="right">${memberDto.email }</span><br>
			</div>
			<div class="column">
				<span class="left">이름</span> <span class="right"><input
					class="text" id="name" name="name" type="text"
					value="${memberDto.name }"></span><br>
			</div>
			<div class="column">
				<span class="left">닉네임</span> <span class="right"><input
					class="text" type="text" id="nickname" name="nickname"
					value="${memberDto.nickname }"></span><br>
			</div>
			<div class="column">
				<span class="left">비밀번호 변경</span> <span class="right">value</span><br>
			</div>
			<div class="column">
				<span class="left">이메일 수신</span> <span class="right"><input
					type="radio" name="email_receive" value="Y" checked>수신동의<input
					type="radio" name="email_receive" value="N">수신거부</span><br>
			</div>
		</div>
		<input type="button" id="submit_btn" value="수정완료">
	</form>

	<script>
		$("#submit_btn")
				.on(
						"click",
						function() {
							var nameRegex = /^[가-힣]+$/;
							var nameData = $("#name").val();
							var nameResult = nameRegex.exec(nameData);

							if (nameResult == null) {
								alert("이름을 확인해주세요.");
								return;
							} else if ($("#nickname").val() != "${memberDto.nickname}") {
								var nickname = $("#nickname").val();
								$
										.ajax(
												{
													url : "${pageContext.request.contextPath}/member/nickCheck.do",
													type : "post",
													data : {
														nickname : nickname
													}
												}).done(function(res) {
											if (res == "중복된 별명입니다.") {
												alert("별명이 중복됩니다.");
												return;
											}
										})
							} else {
								$("#frm").submit();
							}

						})
	</script>
</body>
</html>