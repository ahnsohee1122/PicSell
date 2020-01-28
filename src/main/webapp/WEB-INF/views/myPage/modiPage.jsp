<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Info Modify | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
	.quickMenu:hover {background-color: #EAEAEA;}
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<jsp:include page="../key/profile.jsp" flush="false"/>
	
	<div class="container-fluid m-0 py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto" style="max-width: 1500px;">
			<div class="row">
				<div id="floatMenu" class="col-5 col-md-3 col-xl-2 py-2 text-center p-0 d-none d-md-block" style="height: 410px; border: 1px solid gray; box-sizing: border-box; border-radius: 10px;">
					<div class="row m-0 px-0 w-100 text-left">
						<div class="px-3 py-2 w-100"><a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; font-size: 22px; text-decoration: none;">My Page</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; font-size: 16px; text-decoration: none;">회원 정보 조회</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/buy_list.do" style="color: black; font-size: 16px; text-decoration: none;">구매 내역 확인</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/myPoint.do" style="color: black; font-size: 16px; text-decoration: none;">포인트 입출금 내역 확인</a></div>
						<div class="px-3 py-1 mb-3 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/charge.do" style="color: black; font-size: 16px; text-decoration: none;">포인트 충전</a></div>
					</div>
					<hr class="py-1 m-auto" style="max-width: 220px;">
					<div class="row m-0 px-0 w-100 text-left">
						<div class="px-3 py-2 w-100"><a href="${pageContext.request.contextPath}/writer/writerpage?nickname=${sessionScope.loginInfo}" style="color: black; font-size: 22px; text-decoration: none;">Writer Page</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/writer/writerpage?nickname=${sessionScope.loginInfo}" style="color: black; font-size: 16px; text-decoration: none;">작가 정보 조회</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/profit_list.do" style="color: black; font-size: 16px; text-decoration: none;">수익 & 판매 내역 확인</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/moneyBack.do" style="color: black; font-size: 16px; text-decoration: none;">수익금 환급</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/change.do" style="color: black; font-size: 16px; text-decoration: none;">수익금 전환</a></div>
					</div>
				</div>
				<div class="col-12 col-md-9 col-xl-10 px-0 px-md-3 text-center">
					<div class="m-auto w-100 h-100 py-5" style="border: 1px solid gray; border-radius: 10px;">
						<form action="${pageContext.request.contextPath}/myInfo/infoModifyProc.do?id='${memberDto.id }'"  id="frm" class="m-auto px-2 px-ml-0" style="max-width: 500px;">
							<h4>회원정보 수정</h4>
							<div class="form-group row mx-auto my-3">
								<label for="modifyId" class="col-3 col-form-label">아이디</label>
							    <div class="col-9">
							      <input type="text" class="form-control text-right" id="modifyId" name="id" style="border: 0; background-color: #f4f2f5; border-bottom: 1px solid darkgray; border-radius: 0;" value="${memberDto.id }" readonly>
							    </div>
							</div>
							<div class="form-group row mx-auto my-3">
								<label for="modifyPw" class="col-3 col-form-label">비밀번호</label>
							    <div class="col-9">
							    	<div class="h-100" style="border-bottom: 1px solid darkgray; border-radius: 0; text-align: right;">
							    		<button type="button" class="text-center mt-1 p-0" id="modifyPw2" style="width: 100px; background-color: #f4f2f5; border: 1px solid darkgray; border-radius: 10px;">변경하기</button>
							    	</div>
							    </div>
							</div>
							<div class="form-group row mx-auto my-3">
								<label for="modifyName" class="col-3 col-form-label">이름</label>
							    <div class="col-9">
							      	<input type="text" class="form-control text-right" id="modifyName" name="name" style="border: 0; background-color: #f4f2f5; border-bottom: 1px solid darkgray; border-radius: 0;" value="${memberDto.name }">
							   		<div id="alert_name_form" class="px-1 alert4 invalid-feedback">잘못된 이름 형식입니다.</div>
							    </div>
							</div>
							<div class="form-group row mx-auto my-3">
								<label for="modifyNickName" class="col-3 col-form-label">닉네임</label>
							    <div class="col-9">
							      <input type="text" class="form-control text-right" id="modifyNickName" name="nickname" style="border: 0; background-color: #f4f2f5; border-bottom: 1px solid darkgray; border-radius: 0;" value="${memberDto.nickname }" readonly>
								<!-- 	<div id="alert_nickname" class="px-1 alert5 invalid-feedback">이미사용중인 닉네임입니다.</div> -->
							    </div>
							</div>
							<div class="form-group row mx-auto my-3">
								<label for="modifyEmail" class="col-3 col-form-label">이메일</label>
							    <div class="col-9">
							      <input type="text" class="form-control text-right" id="modifyEmail" name="email" style="border: 0; background-color: #f4f2f5; border-bottom: 1px solid darkgray; border-radius: 0;" value="${memberDto.email }" readonly>
							    </div>
							</div>
							<div class="form-group row mx-auto my-3">
							    <div class="col-9 ml-auto">
							    	<div class="form-control h-100 px-0" style="border: 0; background-color: #f4f2f5; border-bottom: 1px solid darkgray; border-radius: 0; text-align: right;">
							    		<button type="button"  data-toggle="modal" data-target="#modiEmail" id="mailc" style="width: 100px; background-color: #f4f2f5; border: 1px solid darkgray; border-radius: 10px;">메일변경</button>
							    		<div id="emailcheck" class="px-1 alert6 invalid-feedback">잘못된 이메일 입니다.</div>
							    	</div>
							    </div>
							</div>
							<div class="modal fade" id="modiEmail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="top: 250px;">
  								<div class="modal-dialog" role="document">
    								<div class="modal-content m-auto" style="width: 450px;">
		      							<div class="modal-header">
		        							<h5 class="modal-title" id="exampleModalLabel">이메일 인증 서비스</h5>
		        							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		         	 							<span aria-hidden="true">&times;</span>
		        							</button>
		      							</div>
		      							<div class="modal-body text-left">
			          						<div class="form-group">
				          						<label class="col-form-label pt-0" style="font-family: 'Cafe24Oneprettynight';">이메일</label>
									            <div>
										            <input type="text" class="form-control" id="emailval" style="width: 300px; float: left;" placeholder="예) picsell@gmail.com">
										            <input type="button" id="mailsend" value="메일인증" class="mx-2" style="width: 100px; height: 38px; border: 1px solid darkgray; background-color: white; border-radius: 10px;">
										            <div id="mai1" class="px-1 alert7 invalid-feedback">사용가능한 이메일입니다.</div>
										            <div id="mai2" class="px-1 alert8 invalid-feedback">이미사용중인 이메일입니다.</div>
										            <div id="mai3" class="px-1 alert9 invalid-feedback">이메일 주소를 입력해주세요.</div>
									            </div>
		 							        </div>
									        <div class="form-group">
									        	<label class="col-form-label pt-0" style="font-family: 'Cafe24Oneprettynight';">인증번호</label>
									        	<div>
									        		<input type="text" class="form-control" id="mailvalue" placeholder="예) rQQPrsS4wK">
									        		<div id="mailvaluecheck1" class="px-1 alert10 invalid-feedback">인증 완료되었습니다.</div>
										        	<div id="mailvaluecheck2" class="px-1 alert11 invalid-feedback">인증번호를 다시 확인하여 입력해주세요.</div>
									        	</div>
									        </div>
		      							</div>
									    <div class="modal-footer">
									    	<div class="m-auto"><button type="button" id="close" class="btn border border-secondary text-black" style="background-color: white;" data-dismiss="modal">취소</button></div>
									    	<div class="m-auto"><button type="button" class="btn border-secondary text-black" id="checkmail">확인</button></div>
									   	</div>
								    </div>
								</div>
							</div>
							<div class="form-group row mx-auto my-3">
								<label for="modifyEmail" class="col-3 col-form-label">이메일 수신</label>
							    <div class="col-9 text-right px-0 align-self-end">
							     <c:choose>
							    <c:when test="${memberDto.email_receive  == 'Y'}">
							    	<div class="form-check form-check-inline text-right">
										<input class="form-check-input" type="radio" name="email_receive" id="email_Y" value="Y" checked="checked">
									  	<label class="form-check-label" for="email_Y">수신동의</label>
									</div>
									<div class="form-check form-check-inline text-right">
										<input class="form-check-input" type="radio" name="email_receive" id="email_N" value="N">
									  	<label class="form-check-label" for="email_N">수신거부</label>
									</div>
									</c:when>
								<c:when test="${memberDto.email_receive  == 'N'}">
							    	<div class="form-check form-check-inline text-right">
										<input class="form-check-input" type="radio" name="email_receive" id="email_Y" value="Y">
									  	<label class="form-check-label" for="email_Y">수신동의</label>
									</div>
									<div class="form-check form-check-inline text-right">
										<input class="form-check-input" type="radio" name="email_receive" id="email_N" value="N" checked="checked">
									  	<label class="form-check-label" for="email_N">수신거부</label>
									</div>
								</c:when>
							</c:choose>
							  </div>
							</div>
							<div class="form-group row mx-auto mt-5">
								<button id="signup_join" class="m-auto btn rounded-lg text-black" style="width: 150px; border: 1px solid darkgray;">수정하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../key/bottom.jsp" flush="false"/>
	
	<script>
	var namec = 1;
	var nicknamec = 1;
	var mailValid = 1;
	var mailValue = 1;
	
	$("#modifyName").on("blur",function(){
			var regex = /^[가-힣]{2,4}$/;
			var data = $("#modifyName").val();
			var result = regex.exec(data);
			
			if(result != null){
				$("#alert_name_form").css("display", "none");
				namec = 1;
			}else{
				$("#alert_name_form").css("display", "block");
				namec = 0;
				$("#name").val("");
			}
		})
		
/* 	$("#modifyNickName").on("blur",function(){
   			var nickname = $("#modifyNickName").val();
   			
   			if(nickname==""){
   				nicknamec=0;
   				alert("닉네임 입력해줘")
   			}
   			else{
   				if('${memberDto.nickname}' == $("#modifyNickName").val()){
   					$("#alert_nickname").css("display","none");
   				}else{
   					$.ajax({
   						url:"${pageContext.request.contextPath}/member/nickCheck.do",
   						type:"post",
   						data:{nickname:nickname}
   					}).done(function(res){
   						if(res == "사용가능한 별명입니다."){
   						$("#alert_nickname").css("display","none");
   					}
   						else if(res == "중복된 별명입니다."){
   							$("#alert_nickname").css("display","block");
   							$("#nickname").val("");
   							nicknamec = 0;
   					}

   					}).fail(function(res){
   						$("#alert_nickname_form").css("display", "none");
   						});
   					}
   				}
   		}) */
   	
   		$("#mailc").on("show.bs.modal",function(){
   			var button = $(event.relatedTarget)
      	 	var recipient = button.data('whatever')
      	 	var modal = $(this)
      	    modal.find('.modal-title').text("PicSell 이메일인증")
      	    modal.find('.modal-body input').val(recipient)
   		})
   		
   		$("#mailvalue").on("blur",function(){
 			var value = $("#mailvalue").val();
 			$.ajax({
 				url:"../mail/valuecheck.do",
 				type:"post",
 				data:{value:value}
 			}).done(function(res){
 				if(res=="ㅇㅋ"){
 					$("#mailvaluecheck1").css("display", "block");
 					$("#mailvaluecheck2").css("display", "none");
 					$("#mailvaluecheck1").css("font-size", "15px");
 				}else if(res=="ㄴㄴ"){
 					$("#mailvaluecheck2").css("display", "block");
 					$("#mailvaluecheck1").css("display", "none");
 					$("#mailvaluecheck2").css("font-size", "15px");
 					$("#mailvalue").val("");
 				}
 			}).fail(function(res){
 				alert("서버에러입니다 관리자에게 연락주세요");
 			})
 		})
 		
   		$("#emailval").on("blur",function(){
			var email = $("#emailval").val();
			var regex = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
			var data = $("#emailval").val();
			var result = regex.exec(data);
			
			if(result != null){
			$.ajax({
				url:"${pageContext.request.contextPath}/member/mailCheck.do",
				type:"post",
				data:{email:email}
			}).done(function(res){
				if(res == "사용 가능한 메일주소입니다."){
					$("#mai1").css("display", "block");
					$("#mai3").css("display", "none");
					$("#mai1").css("font-size","15px");
					
					   }
				
				else if(res == "중복된 메일주소입니다."){
					$("#mai2").css("display", "block");
					$("#mai3").css("display", "none");
					$("#mai2").css("font-size","15px");
					$("#emailval").val("");
				}
			}).fail(function(res){
				alert("서버문제입니다 관리자에게 문의하세요");
			});}else{
				$("#mai3").css("display", "block");
				$("#mai1").css("display", "none");
				$("#mai2").css("display", "none");
				$("#mai3").css("font-size","15px");
				$("#mai").val("");
			}
		})
		
		 $("#mailsend").on("click",function(){
			 var regex = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
	   			var data = $("#emailval").val();
	   			var result = regex.exec(data);
	   			if(data==""){
					alert("이메일을 입력해주세요");
				}
	   			if(result != null){
	  				$.ajax({
	  					url:"../mail/signmail.do",
	  					type:"post",
	  					data:{email:data}
	  				}).done(function(res){
	  					alert("인증메일이 전송되었습니다");
	  					emailc = 1;
	  				}).fail(function(res){
	  					alert("서버에러입니다 관리자에게 문의하세요");
	  				});
	   			}else{
	   				emailc = 0;
	   			}   
			   });
	
		$("#checkmail").on("click",function(){
			var email = $("#emailval").val();
			var value = $("#mailvalue").val();
			if(email==""){
			alert("이메일을먼저 입력해주세요");
			}else if(value==""){alert("인증번호를 입력해주세요")}
			else{
				$.ajax({
					url:"../mail/valuecheck.do",
					type:"post",
					data:{value:value}
				}).done(function(res){
					if(res=="ㅇㅋ"){
						$("#mailvaluecheck1").css("display", "block");
						$("#mailvaluecheck2").css("display", "none");
						$("#mailvaluecheck1").css("font-size", "15px");
						alert("인증완료되었습니다!");
						$("#close").trigger("click");
						$("#modifyEmail").val(email);
						$("#emailval").val("");
						$("#mailvalue").val("");
				mailvalue = 1;
			}else if(res=="ㄴㄴ"){
				$("#mailvaluecheck2").css("display", "block");
				$("#mailvaluecheck1").css("display", "none");
				$("#mailvaluecheck2").css("font-size","15px");
				$("#mailvalue").val("");
			}
			}).fail(function(res){
				alert("서버에러입니다 관리자에게 연락주세요");
			});
		}
	})
   		$("#signup_join").on("click",function(){
   			var result = confirm("수정을 진행하시겠습니까?(수정완료 후에는 재로그인 해주세요.)")
   			if(result){
   				$("#frm").submit();
   			}else{
   				return false;
   			}
   		})
   		$("#modifyPw2").on("click",function(){
   			location.href="${pageContext.request.contextPath}/myInfo/modifyPw.do"
   		})
	</script>
</body>
</html>