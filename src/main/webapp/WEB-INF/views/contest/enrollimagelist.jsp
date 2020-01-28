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
	#page > a > span{text-align:center; width:30px}
	#page > a{width:30px}
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="container-fluid m-0 py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto">
			<h2 class="mx-auto my-0 text-center">출품작</h2>
			<!-- 선택완료 버튼을 누른 후 다운로드 버튼이 생깁니다. 선택완료 후에는 추가선택할 수 없습니다. 신중히 선택하여 주시기 바랍니다. 공모전 마감 후 14일동안 다운로드 받을 수 있습니다. 안내문구 넣어줘! -->
		</div>
		<c:choose>
		<c:when test="${loginInfo == dto.host }">
		<button type="button" style="display:none" id="alert" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
		  Launch demo modal
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">당선작 선택</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        	이미지를 선택 후 선택완료 버튼을 누르시면 다운로드 버튼이 생깁니다.<br>
		        	선택완료 버튼을 누르신 후에는 추가 선택 할 수 없습니다.<br>
		        	신중히 선택하여 주시기 바랍니다.<br>
		        	공모전 마감 후 14일 동안 다운받을 수 있습니다.
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		</c:when>
		</c:choose>
			<form action="/contest/select" id="selectform" method="post" >
			<input type="hidden" value="${dto.contest_seq}" name="contest_seq">
			<input type="hidden" value="${currentPage }" name="currentPage">
		<div class="container mx-auto my-5 p-3 text-center" style="border: 1px solid darkgray; border-radius: 10px;">
			<div class="row w-100 m-auto">
				<c:forEach items="${list }" var="list" varStatus="status">
					<div class="col-4 w-100 my-0 one p-2">
						<div class="card w-100 h-100 p-2">
							<div class="row image w-100 mx-auto text-center" style="height: 250px;">
								<a onclick="window.open('/contest/enrolldetail?contest_img_seq=${list.contest_img_seq }&title=${dto.title}','','width=1024,height=800')" style="height: 250px;" ><img src="/contestenroll/marked_${list.enroll_sysname }"></a>
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
				<div id="page" class="row w-100 mx-auto my-3 text-center" style="disply:block; text-align:center">${pagenum }</div>
				<input type="button" id="back" value="이전으로" class="m-auto" style="width: 100px; height: 30px; background-color: #f4f2f5; border: 1px solid darkgray; border-radius: 10px;">
				<c:choose>
				<c:when test="${loginInfo == dto.host}">
						<input type="button" id="select" value="선택하기" class="m-auto" style="width: 100px; height: 30px; background-color: #f4f2f5; border: 1px solid darkgray; border-radius: 10px;">
				</c:when>
				</c:choose>
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
	                $("#select").attr('type','hidden')
	                selectId.setAttribute('onclick','location.href=\'/contest/download?contest_img_seq='+e[i].contest_img_seq+'&enroll_sysname='+e[i].enroll_sysname+'\'')
				}
				
			}else if(e.length == 0){
				$("#alert").click();
				return;
			}
		}).fail(function(e){
			console.log("에러입니다")
		})
		
	});
	
		$("#back").on("click",function(){
			history.back();	
		})
	

			
			
		$("#select").on("click",function(){
			
			if(${fn:length(list) == 0}){
				alert("출품 된 작품이 없습니다")
				return;
			}else{
		
				if(confirm("선택완료 후에는 재선택 하실 수 없습니다. 선택을 완료하시겠습니까?")){
					if($("input[type=checkbox]:checked").length==0){
						alert("하나 이상의 항목을 채택해주세요")
						return;
					}

					if(${getpoint} < ${dto.price}){
						alert("상금으로 지급된 포인트가 부족하여 채택할 수 없습니다.관리자와 연락바랍니다.")
						return;
					}
					$("#select").attr('type','hidden')
					$("#selectform").submit();
					
				
				}else{
					return;
				}
			}

		});
		

	</script>
	<jsp:include page="../key/bottom.jsp" flush="false"/>
	
</body>
</html>