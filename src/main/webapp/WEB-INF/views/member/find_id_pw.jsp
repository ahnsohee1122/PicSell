<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID/PW | PicSell</title>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="container-fluid p-0 py-5" style="height: 1000px; background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container">
			<h2 class="mx-3 mt-4 mb-5 text-center">아이디/비밀번호 찾기</h2>
		</div>
		<div class="container mx-auto mt-5 mb-4" style="height: 700px;">
			<div class="m-auto mx-3 py-4 pl-3 pl-lg-5 pr-3" style="max-width: 800px; border: 1px solid darkgray; border-radius: 10px;">
				<form id="IDfrm" action="findidProc.do" method="post">
					<div class="row">
						<h5 class="w-100 mx-3 mt-4 mb-4">아이디 찾기</h5>
						<label class="col-form-label col-3 col-lg-3 pt-0 my-3">이름</label>
				      	<div class="col-9 col-lg-9 mb-3 my-3">
					      	<input type="text" class="form-control" id="IDfindId" name="IdfindId" placeholder="예) 홍길동 or (주)픽셀 (실명 or 회사명)" style="max-width: 300px; font-size: 15px;">
				      	</div>
						<label class="col-form-label col-3 col-lg-3 pt-0 my-3">이메일</label>
				      	<div class="col-9 col-lg-9 mt-3">
					      	<input type="text" class="form-control" id="IDfindEmail" name="IdfindEmail" placeholder="예) picsell@gmail.com" style="max-width: 300px; font-size: 15px;">
				      	</div>
				      	<div id="IDfindval1" class="px-1 m-auto text-center text-lg-left invalid-feedback" style="max-width: 350px; font-size: 16px;">가입되지 않은 정보입니다.</div>
				      	<div id="IDfindval2" class="px-1 m-auto text-center text-lg-left invalid-feedback" style="font-size: 16px;"></div>
				      	<div class="col-12 p-0 mt-5 mb-3 mx-auto text-center">
				  			<button id="IDfind" class="m-auto rounded-lg text-black" type="button" style="width: 150px; border: 1px solid darkgray; background-color: #f4f2f5;">아이디 찾기</button>
				  		</div>
					</div>
				</form>
				<hr>
				<form id="PWfrm" action="findpwProc.do" method="post">
					<div class="row">
						<h5 class="w-100 mx-3 mt-4 mb-4">비밀번호 찾기</h5>
						<label class="col-form-label col-3 col-lg-3 pt-0 my-3">아이디</label>
				      	<div class="col-9 col-lg-9 mb-3 my-3">
					      	<input type="text" class="form-control" id="PWfindId" name="PWfindId" placeholder="예) picsell1234" style="max-width: 300px; font-size: 15px;">
				      	</div>
						<label class="col-form-label col-3 col-lg-3 pt-0 my-3">이메일</label>
				      	<div class="col-9 col-lg-9 my-3">
					      	<input type="text" class="form-control" id="PWfindEmail" name="PWfindEmail" placeholder="예) picsell@gmail.com" style="max-width: 300px; font-size: 15px;">
				      	<button id="sendmail" class="m-auto rounded-lg text-black" type="button" style="width: 150px; border: 1px solid darkgray; background-color: #f4f2f5;">메일전송</button>
				      	</div>
				      	<label class="col-form-label col-3 col-lg-3 pt-0 my-3">인증번호</label>
				      	<div class="col-9 col-lg-9 mt-3">
					      	<input type="text" class="form-control" id="PWfindValue" name="PWfindValue" placeholder="예) rQQPrsS4wK" style="max-width: 300px; font-size: 15px;">
				      	</div>
				      	<div id="PWfindval" class="px-1 invalid-feedback">닉네임을 확인해 주시기 바랍니다.</div>
				      	<div class="col-12 p-0 mt-5 mb-3 mx-auto text-center">
				  			<button id="PWfind" class="m-auto rounded-lg text-black" type="button" style="width: 150px; border: 1px solid darkgray; background-color: #f4f2f5;">비밀번호 찾기</button>
				  		</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
		$("#IDfind").on("click",function(){
			var name = $("#IDfindId").val();
			var email = $("#IDfindEmail").val();
			console.log(name+":"+email);
			if(name!="" && email!=""){
				$.ajax({
						url:"${pageContext.request.contextPath}/member/findidProc.do",
						type:"post",
						data:{email:email,name:name}
					}).done(function(res){
						if(res == "회원목록없음"){
							$("#IDfindval1").css("display", "block");
							$("#IDfindval2").css("display","none");
						}
						else {
							$("#IDfindval2").html("회원님의 ID는 [ "+res+" ]입니다.");
							$("#IDfindval2").css("display","block");
							$("#IDfindval1").css("display", "none");
						}
					}).fail(function(res){
						$("#alert_nickname_form").html(res).css("color","red");
					});
			}else{
				alert("입력되지 않은 정보가 있습니다.");
			}
		})
		
		//이메일인증
		$("#sendmail").on("click",function(){
			var email = $("#PWfindEmail").val();
			var id = $("#PWfindId").val();
			if(id==""){
				alert("ID를 입력해주세요");
				return;
			}else if(email==""){
				alert("이메일을 입력해주세요");
				return;
			}
			else if(email != "" || id != ""){
			$.ajax({
				url:"${pageContext.request.contextPath}/mail/mail.do",
				type:"post",
				data:{email:email}
			}).done(function(res){
				alert("인증번호가 발송되었습니다");
			}).fail(function(res){
				alert("메일주소를 확인해주세요");
			});
			}
		})
		
		$("#PWfind").on("click",function(){
			var input = $("#PWfindValue").val();
			//var email_key = "${AuthenticationKey}"; //이걸 컨트롤러로 보내서처리
			var id = $("#PWfindId").val();
			var email = $("#PWfindEmail").val();
			if(id!=null && email!=null && input!=null){
				$.ajax({
						url:"${pageContext.request.contextPath}/member/pwchange.do",
						type:"post",
						data:{email:email,input:input,id:id}
					}).done(function(res){
						if(res == "변경완료"){
							alert("인증번호로 임시비밀번호가 변경되었습니다.");
							location.href="../home";
						}
						else if(res == "변경실패"){
							alert("아이디와 이메일을 다시한번 확인해주세요");
						}else if(res == "인증번호"){
							alert("인증번호를 다시 확인해주세요");
						}
					}).fail(function(res){
						if(res=="실패했습니다"){
							alert("서버에러입니다 관리자에게 문의하세요");
					}
				});
			}else{
				alert("입력되지 않은 정보가 있습니다.");
			}
	})
	</script>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>