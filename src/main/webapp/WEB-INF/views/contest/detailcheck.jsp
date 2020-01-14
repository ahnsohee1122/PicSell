<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../key/top.jsp" flush="false"/>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<style>
.eximg{
width:300px;
display:inline-block;
}
.eximg>img{
width:100%;
}
</style>
<body>
<div>

<form class="mx-3 my-5 px-4 py-3" style="font-size: 15px; font-family: 'NanumBarunpen'; border: 1px solid darkgray; border-radius: 10px;">
				<fieldset class="form-group">
					<div class="row my-4">
				    	<label class="col-form-label col-3 col-md-2 pt-0">주최이유<strong> * </strong></label>
				      	<div class="col-9 col-md-10">
				      	<c:choose>
				    	<c:when test="${dto.reason == 'option1'}">
					        <div class="form-check my-1">
					          	<input class="form-check-input" type="radio" name="reason" id="gridRadios1" value="option1" checked readonly>
					          	<label class="form-check-label" for="gridRadios1">기업 사진 대회 공모전</label>
					        </div>
				    	</c:when>
				    	<c:when test="${dto.reason == 'option2'} ">
					        <div class="form-check my-1">
					        	<input class="form-check-input" type="radio" name="reason" id="gridRadios2" value="option2" checked readonly>
					          	<label class="form-check-label" for="gridRadios2">공공기관 사진 대회 공모전</label>
					        </div>
					      </c:when>
					     <c:when test="${dto.reason == 'option3'} ">
					        <div class="form-check my-1">
					        	<input class="form-check-input" type="radio" name="reason" id="gridRadios3" value="option3" checked readonly>
					          	<label class="form-check-label" for="gridRadios3">AI 이미지 데이터 수집 공모전</label>
					        </div>
					      </c:when>
					     <c:when test="${dto.reason =='option4'} ">
					        <div class="form-check my-1">
					        	<input class="form-check-input" type="radio" name="reason" id="gridRadios4" value="option4" checked readonly>
					          	<label class="form-check-label" for="gridRadios4">원하는 특정 이미지를 직접 공모 or 요청</label>
					        </div>
					      </c:when>
					      <c:when test="${dto.reason == 'option5'} ">
					        <div class="form-check my-1">
					        	<input class="form-check-input" type="radio" name="reason" id="gridRadios5" value="option5" checked readonly>
					          	<label class="form-check-label" for="gridRadios5">기타 :<input type="text" id="others" class="mx-2" style="width: 200px; height: 15px; background: 0; border: 0; border-bottom: 1px solid darkgray;"></label>
					        </div>
					       </c:when>
					       </c:choose>
				    	</div>
				    </div>
				    <hr>
				    <div class="row my-4 was-validated">
     					<label class="col-form-label col-3 col-md-2 pt-0">타이틀<strong> * </strong></label>
	      				<div class="col-9 col-md-10">
	      					<input type="text" class="form-control" name="title" id="validation01" value="${dto.title }" style="font-size: 15px;" readonly>
	      					<div class="invalid-feedback">주최하실 공모전의 제목을 작성해주세요!</div>
						</div>
				    </div>
				    <hr>
				    <div class="row my-4 was-validated">
     					<label class="col-form-label col-3 col-md-2 pt-0">상세설명<strong> * </strong></label>
	      				<div class="col-9 col-md-10">
	      					<textarea class="form-control invalid" name="detail" id="validationTextarea01"  style="min-height: 140px; font-size: 15px;" readonly>${dto.detail }</textarea>
	      					<div class="invalid-feedback">주최하실 공모전에 대한 설명을 자세히 작성해주세요!</div>
						</div>
				    </div>
				    <hr>
				    <div class="row my-4 was-validated">
     					<label class="col-form-label col-3 col-md-2 pt-0">조건사항<strong> * </strong></label>
	      				<div class="col-9 col-md-10">
	      					<textarea class="form-control invalid px-2 py-1" name="terms" id="validationTextarea02"style="min-height: 270px; font-size: 15px;" readonly>${dto.terms }</textarea>
	      					<div class="invalid-feedback">이미지 업로드에 참고할 조건사항을 작성해주세요!</div>
						</div>
				    </div>
				    <hr>
				    <div class="row my-4 was-validated">
     					<label class="col-form-label col-3 col-md-2 pt-0">파일첨부<strong> * </strong></label>
	      				<div class="col-9 col-md-10 ">
     					<c:forEach items="${imglist }" var="imglist">
						   <div class="eximg"><img src='/contestfiles/${imglist.sysname }'></div>
						</c:forEach>
						</div>
				    </div>
  					<hr>
				    <div class="row my-4 was-validated">
     					<label class="col-form-label col-3 col-md-2 pt-0">기간<strong> * </strong></label>
	      				<div class="col-9 col-md-10">
	      					<table class="searchBox">
            <colgroup>
                <col width="123px">
                <col width="*">
            </colgroup>
            <tbody>
                <tr>
                    <td>
                        <div class="clearfix">
                            <!-- 시작일 -->
                            <span class="demi">종료일 : </span>
                            <!-- 종료일 -->
                            <span class="dset">
                                <input type="text" class="datepicker inpType" name="enddate" id="datepicker" value="${dto.enddate }" readonly>
                               
                            </span>
                        </div>    
                    </td>
                </tr>

            <tbody>
        </table>
						</div>
                            <div class="invalid-feedback">심사 및 등록까지 최대 1주일이 걸릴수 있습니다.</div>
				    </div>
				    <hr>
				    <div class="row my-4 was-validated">
     					<label class="col-form-label col-3 col-md-2 pt-0">상금<strong> * </strong></label>
	      				<div class="col-9 col-md-10">
	      					<input type="number" class="form-control" name="price" id="validation02" value="${dto.price }" style="font-size: 15px;" readonly>
	      					<div class="invalid-feedback">주최하실 공모전의 상금을 걸어주세요! (장난으로 작성하실 경우 심사에서 거절 처리 됩니다.)</div>
						</div>
				    </div>
				    <hr>
				    <div class="row my-4 was-validated">
     					<label class="col-form-label col-3 col-md-2 pt-0">주최기관<strong> * </strong></label>
	      				<div class="col-9 col-md-10">
	      					<input type="text" name="hosttype" class="form-control" id="validation01" value="${dto.hosttype }" style="font-size: 15px;" readonly>
	      					<div class="invalid-feedback">주최하시는 기관을 작성해주세요!(기업일 경우 기업명을, 개인일 경우 성함을 작성해주세요.)</div>
						</div>
				    </div>
				    <hr>
				  	<div class="row mt-5 mb-3">
				  		<button id="accept" class="m-auto btn border border-danger rounded-lg text-black" type="submit" style="width: 150px;" id="accept">승인</button>
				  		<button id="nono" class="m-auto btn border border-danger rounded-lg text-black" type="button" style="width: 150px;" id="nono">승인거절</button>
				  	</div>
				</fieldset>
				<input type="hidden" id="why">
				<input type="hidden" id="time${dto.contest_seq}">
			</form>

</div>

	<script>
	var now = new Date();
	var year = now.getFullYear();
	var month = (now.getMonth()+1);
	var date = now.getDate();
	if((date+"").length < 2){ //날짜가 한자리면 앞에 0추가
		date = "0"+date;
	}
	if((month+"").length < 2){ //월이 한자리면 앞에 0추가
		month = "0"+month;
	}
	var sysdate = (year+"-"+month+"-"+date);
	var seq = "${contest.seq}";
	$("#time${dto.contest_seq}").val(sysdate);
	
	$("#accept").on("click",function(){
	
		$.ajax({
			url:"accept.do",
			type:"post",
			data:{contest_seq:'${dto.contest_seq}',accept_date:sysdate}
		}).done(function(res){
			if(res=="승인"){
				alert("승인되었습니다");
				location.href="check.do";
			}else if(res=="미승인"){
				alert("미승인되었습니다");
			}
		}).fail(function(res){
			if(res=="서버"){
			alert("서버에러입니다");}
		});
	});
	$("#nono").on("click",function(){
		var msg = prompt("승인 거절이유를 입력하세요");
	$("#why").val(msg);
	if(msg!=""){
			$.ajax({
				url:"acceptno.do",
				type:"post",
				data:{contest_seq:'${dto.contest_seq}',rejection:msg}
			}).done(function(res){
				if(res=="거절"){
					alert("거절되었습니다");
					location.href="check.do";
				}else if(res=="취소"){
					alert("취소되었습니다");
				}
			}).fail(function(res){
				if(res=="서버"){
					alert("서버에러입니다");
				}
			});
	}else{
		alert("거절이유를 입력해주세요");
	}
	});
	</script>
</body>
<jsp:include page="../key/bottom.jsp" flush="false"/>
</html>