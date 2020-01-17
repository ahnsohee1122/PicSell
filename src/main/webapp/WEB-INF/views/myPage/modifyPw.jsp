<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<jsp:include page="../key/profile.jsp" flush="false"/>
	
	<div class="container-fluid m-0 py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto" style="max-width: 1500px;">
			<div class="row">
				<div id="floatMenu" class="col-5 col-md-3 col-xl-2 py-2 text-center p-0 d-none d-md-block" style="height: 310px; border: 1px solid gray; box-sizing: border-box; border-radius: 10px;">
					<div class="row m-0 px-0 w-100 text-left">
						<div class="px-3 py-2 w-100"><a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; font-size: 22px; text-decoration: none;">내 정보</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; font-size: 16px; text-decoration: none;">회원 정보 조회</a></div>
						<div class="px-3 py-1 mb-3 w-100 quickMenu"><a href="${pageContext.request.contextPath}/contest/contestchecking.do" style="color: black; font-size: 16px; text-decoration: none;">공모전 심사/승인 내역</a></div>
					</div>
					<hr class="py-1 m-auto" style="max-width: 220px;">
					<div class="row m-0 px-0 w-100 text-left">
						<div class="px-3 py-2 w-100"><a href="${pageContext.request.contextPath}/money/myPoint.do" style="color: black; font-size: 22px; text-decoration: none;">내 포인트</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/myPoint.do" style="color: black; font-size: 16px; text-decoration: none;">포인트 조회하기</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/buy_list.do" style="color: black; font-size: 16px; text-decoration: none;">구매내역 확인하기</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/sell_list.do" style="color: black; font-size: 16px; text-decoration: none;">판매내역 확인하기</a></div>
					</div>
				</div>
				<div class="col-12 col-md-9 col-xl-10 px-0 px-md-3 text-center">
					<div class="m-auto w-100 h-100 py-5" style="border: 1px solid gray; border-radius: 10px;">
						<form class="m-auto px-2 px-ml-0" style="max-width: 500px;">
							<h4>비밀번호 변경</h4>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../key/bottom.jsp" flush="false"/>

	<form action="${pageContext.request.contextPath}/myInfo/modifyPwProc.do" method="post" id="frm">
		<label>현재 비밀번호</label>
    	<input type="password" id=currentPw>
    	<div style="display:none" id="currentPwMsg">비밀번호가 옳지 않습니다.</div><br>
    
    
   		<label>새 비밀번호</label>
    	<input type="password" id="pw" name="pw" placeholder = "8 ~ 20자 이내 영문, 숫자, 특수문자(!,@,#,$,%,^,&,*)">
    	<div style="display:none" id="pwCheckMsg">잘못된 비밀번호 형식입니다.</div><br>
    
    
    	<label>비밀번호 확인</label>
    	<input type="password" id="pw_check" placeholder = "8 ~ 20자 이내 영문, 숫자, 특수문자(!,@,#,$,%,^,&,*)">
		<div style="display:none" id=reCheckMsg>비밀번호를 다시 확인해주세요.</div><br>
		
		<button id="modifyBtn">변경하기</button>
	</form>
	
	
	<script>
		var currentPwCheck = 0;
		var pwc = 0;	
		var pwcheckValid = 0;
		
		$("#currentPw").on("blur", function(){
			var currentPw = $("#currentPw").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/myInfo/currentPwCheck.do",
				type:"post",
				data:{currentPw : currentPw}
			}).done(function(res){
				console.log(res)
				console.log(currentPw)
				if(res == currentPw){
					console.log("zz");
					currentPwCheck = 1;
					$("#currentPwMsg").css("display","none");
				}else{
					currentPwCheck = 0;
					$("#currentPwMsg").css("display","block");
					$("#currentPwMsg").val("");
				}
			})
		})
		
		$("#pw").on("blur",function(){
   			var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{9,20}$/;
   			var data = $("#pw").val();
   			var result = regex.exec(data);
   			
   			if(result != null){
   				pwc = 1;
   				$("#pwCheckMsg").css("display","none");
   			}else{   				
   				$("#pwCheckMsg").css("display","block");
   				pwc = 0;
   				$("#pw").val("");
   			}
   		})
   		
   		$("#pw_check").on("blur",function(){
	   		if($("#pw").val() == $("#pw_check").val()){
	   			$("#reCheckMsg").css("display","none");
	   			pwcheckValid = 1;
	   		}else{
	   			$("#reCheckMsg").css("display","block");
	   			$("#pw_check").val("");
	   			pwcheckValid = 0;
	   		}
	   	})
	   	
	   	$("#modifyBtn").on("click", function(){
	   		var result = confirm("변경하시겠습니까?");
	   		if(result){
	   			if(currnetPwCheck == 0){
	   				alert("현재 비밀번호가 옳지 않습니다.");
	   				return false;
	   			}else if(pwc == 0){
	   				alert("비밀번호를 확인해주세요.");
	   				return false;
	   			}else if(pwcheckValid == 0){
	   				alert("새 비밀번호와 비밀번호 확인이 올바른지 확인해주세요.");
	   				return false;
	   			}else{
	   				$("#frm").submit();
	   			}	
	   		}
	   	})
		
	</script>
</body>
</html>