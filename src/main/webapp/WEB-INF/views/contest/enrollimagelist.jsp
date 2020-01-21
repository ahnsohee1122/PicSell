<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enroll Image List | PicSell</title>
<style>
	.one {max-height: 450px;}
	.image > a > img {margin: auto; width: 100%; height: 100%;}
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="container-fluid m-0 py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto">
			<h2 class="mx-auto my-0 text-center">출품작</h2>
			<!-- 선택완료 버튼을 누른 후 다운로드 버튼이 생깁니다. 선택완료 후에는 추가선택할 수 없습니다. 신중히 선택하여 주시기 바랍니다. 공모전 마감 후 14일동안 다운로드 받을 수 있습니다. 안내문구 넣어줘! -->
		</div>
			<form action="/contest/select" >
			<input type="hidden" value="${dto.contest_seq}" name="contest_seq">
		<div class="container mx-auto my-5 p-3 text-center" style="border: 1px solid darkgray; border-radius: 10px;">
			<div class="row w-100 m-auto">
				<c:forEach items="${list }" var="list" varStatus="status">
					<div class="col-4 w-100 my-0 one p-2">
						<div class="card w-100 h-100 p-2">
							<div class="row image w-100 mx-auto text-center" style="height: 250px;">
								<a href="#" onclick=window.open(/contest/enrolldetail?contest_seq=${dto.contest_seq},'','scrollbars=yes,resizable=yes,top=0, width=1300, height=950');' return false;><img src="/contestenroll/${list.enroll_sysname }"></a>
							</div>
						  	<div class="row align-items-center image w-100 mx-auto text-center py-3" style="height: 50px;">
						    	<p class="nickname mx-auto"><a href='${pageContext.request.contextPath}/writer/writerpage?nickname=${list.enroll_nickname }' style="text-decoration: none;"><span class="mx-1">@</span>${list.enroll_nickname }</a></p>
						  		<c:choose>
						  		<c:when test="${loginInfo == dto.host }">
						  			<input type="checkbox" name="select" value="${list.contest_img_seq }" id="select${list.contest_img_seq }" class=select><label for="select${list.contest_img_seq }">선택</label>
						  		</c:when>
						  		</c:choose>
						  	</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row w-100 mx-auto my-3 text-center">
				<input type="button" id="back" value="이전으로" class="m-auto" style="width: 100px; height: 30px; background-color: #f4f2f5; border: 1px solid darkgray; border-radius: 10px;">
				<input type="submit" id="select" value="선택하기" class="m-auto" style="width: 100px; height: 30px; background-color: #f4f2f5; border: 1px solid darkgray; border-radius: 10px;">
			</div>
		</div>
				</form>
	</div>
	
	<script>
	var select = document.getElementsByClassName('select')
	var label = document.getElementsByTagName('label')
	
	$(function(){
		$.ajax({
			url:"/contest/alreadyselect",
			type:"GET",
			dataType:"json",
			data:{"contest_seq" : "${dto.contest_seq}"}
		}).done(function(e){
			console.log(e.length)
			if(!e.length == 0 ){
				for(j=0; j<'${fn:length(list)}'; j++){
					select[j].setAttribute('type','hidden')
					label[j].innerHTML=""
				} 
				
				for(i = 0; i < e.length; i++){
					var selectId = document.getElementById("select"+e[i].contest_img_seq)
					selectId.setAttribute('type','button')
					selectId.setAttribute('value','다운로드')
	                selectId.classList.add('download')
	                selectId.setAttribute('onclick','location.href=\'/contest/download?contest_img_seq='+e[i].contest_img_seq+'&enroll_sysname='+e[i].enroll_sysname+'\'')
				}
				
			}else if(e.length == 0){
				return;
			}
		}).fail(function(e){
			console.log("에러입니다")
		})
		
	})
	
		$("#back").on("click",function(){
			history.back();	
		})
	

		
		
		
			
			
		
			
			
		
		
		


	</script>
	<jsp:include page="../key/bottom.jsp" flush="false"/>
	
</body>
</html>