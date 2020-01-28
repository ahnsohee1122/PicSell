<%@ page import="kh.picsell.dto.HonorDTO" %>
<%@ page import="kh.picsell.dto.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoVote | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="container-fluid m-0 py-5 text-center" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<c:choose>
		<c:when test="${votecheck==1}">
		<h2>실시간 투표 순위</h2>
		<div class="row w-100 mx-auto my-5 text-center">
			<c:forEach items="${hlist1}" var="hfir">
				<div class="card py-2 mx-auto my-3 text-center" style="width: 17.5rem; border: 3px solid gold; border-style: outset;">
					<h5><span class="mx-1">1위 : </span>${hfir.nickname}<span class="mx-1">작가님</span></h5>
	  				<img src="/profileimage/${img1.profileimg }" class="card-img-top m-auto" style="width: 200px; height: 200px;">
					<div class="card-body px-0">
						<p class="card-text mx-auto " style="font-size: 18px; font-family: 'Cafe24Oneprettynight'; width: 200px;"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;"><span class="mr-1">현재 투표수</span>${hfir.honorpoint}</p>
						<input type="button" value="사진보기" class="btn btn-outline-secondary py-1" id="showpic${hfir.honor_seq}">
												
						<script>
					
							
							$("body").on("click","#showpic${hfir.honor_seq}",function(){
		                        window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+"${hfir.nickname}" ,"Best3사진", "width=900,height=400,resizable=no");
		                    })
	                    </script>
					</div>
				</div>
			</c:forEach>
			<c:forEach items="${hlist2}" var="sfir">
				<div class="card py-2 mx-auto my-3 text-center" style="width: 17.5rem; border: 3px solid silver; border-style: outset;">
					<h5><span class="mx-1">2위 : </span>${sfir.nickname}<span class="mx-1">작가님</span></h5>
	  				<img src="/profileimage/${img2.profileimg }" class="card-img-top m-auto" style="width: 200px; height: 200px;">
					<div class="card-body px-0">
						<p class="card-text mx-auto " style="font-size: 18px; font-family: 'Cafe24Oneprettynight'; width: 200px;"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;"><span class="mr-1">현재 투표수</span>${sfir.honorpoint}</p>
						<input type="button" value="사진보기" class="btn btn-outline-secondary py-1" id="showpic${sfir.honor_seq}">
												
						<script>
						
							
							$("body").on("click","#showpic${sfir.honor_seq}",function(){
		                        window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+"${sfir.nickname}" ,"Best3사진", "width=900,height=400,resizable=no");
		                    })
	                    </script>
					</div>
				</div>
    		</c:forEach>
	    	<c:forEach items="${hlist3}" var="tfir">
	    		<div class="card py-2 mx-auto my-3 text-center" style="width: 17.5rem; border: 3px solid #e39e66; border-style: outset;">
					<h5><span class="mx-1">3위 : </span>${tfir.nickname}<span class="mx-1">작가님</span></h5>
	  				<img src="/profileimage/${img3.profileimg }" class="card-img-top m-auto" style="width: 200px; height: 200px;">
					<div class="card-body px-0">
						<p class="card-text mx-auto " style="font-size: 18px; font-family: 'Cafe24Oneprettynight'; width: 200px;"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;"><span class="mr-1">현재 투표수</span>${tfir.honorpoint}</p>
						<input type="button" value="사진보기" class="btn btn-outline-secondary py-1" id="showpic${tfir.honor_seq}">
												
						<script>
							
							
							$("body").on("click","#showpic${tfir.honor_seq}",function(){
		                        window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+"${tfir.nickname}" ,"Best3사진", "width=900,height=400,resizable=no");
		                    })
	                    </script>
					</div>
				</div>	
	    	</c:forEach>
		</div>
		<hr style="width: 500px;">
    	<div class="row w-100 m-auto text-center">
			<input type="button" value="홈으로" id="gohome" class="btn mx-auto text-center mt-3" style="border: 1px solid darkgray; backgorund-color: #f4f2f5;">
		</div>
			
	    <script>
		   	$("#gohome").on("click",function(){
		   		location.href="${ageContext.request.contextPat}/home";
		   	})
	    </script>
		</c:when>
		<c:otherwise>
		<h2>명예의 전당 투표하기</h2>
		<h5 class="mt-5 mb-3">이번달 명예의 전당 후보 작가님들 입니다!</h5>
		<h5>당신의 명예의 전당에 투표해 주세요!</h5>
		<div class="row w-100 mx-auto my-5 text-center">
			<c:forEach begin="0" end="2" step="1" var="i">
				<div class="card py-3 mx-auto my-3 text-center" style="width: 17.5rem;">
	  				<img src="/profileimage/${mList[i].profileimg }" class="card-img-top m-auto" style="width: 200px; height: 200px;">
					<div class="card-body px-0">
						<p class="card-text mx-auto " style="font-size: 18px; font-family: 'Cafe24Oneprettynight'; width: 200px;"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">${list[i].nickname}<span class="ml-1">작가님</span></p>
						<input type="button" value="사진보기" class="btn btn-outline-secondary py-1" id="sshowpic${list[i].honor_seq}">
												
						<script>
							$("#sshowpic${list[i].honor_seq}").on("click",function(){
	                        	window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+"${list[i].nickname}" ,"Best3사진", "width=900,height=400,resizable=no");
	                        });
	                    </script>
					</div>
					<input type="radio" name="who" value="${list[i].nickname}" class="text-center m-auto" style="width: 15px; height: 15px;">
				</div>
			</c:forEach>
		</div>
		<hr style="width: 500px;">
		<div class="row w-100 m-auto text-center">
			<input type="button" value="투표하기" id="vote" class="btn mx-auto text-center mt-3" style="border: 1px solid darkgray; backgorund-color: #f4f2f5;">
		</div>

		<script>
			$("#vote").on("click",function(){
				var radioVal = $('input[name="who"]:checked').val();
				if(radioVal==null){
					alert("투표할 작가님을 선택해주세요");
				}else{
			$.ajax({
				url:"${pageContext.request.contextPath}/honor/vote.do",
				type:"post",
				data:{nickname:radioVal}
			}).done(function(res){
				if(res=="이미완료"){
					alert("이미 투표를 완료했습니다");
					return false;
				}else if(res=="ㅇ"){
					alert("투표를 성공적으로 완료했습니다");
					location.href="${pageContext.request.contextPath}/honor/govote.do";
				}else if(res=="ㄴ"){
					alert("투표에 실패했습니다");
					return false;
				}
				else if(res=="s"){
					alert("투표에 실패했습니다");
					return false;
				}
			}).fail(function(res){
				if(res=="서버"){
					alert("서버문제입니다 관리자에게 문의바랍니다");
					return false;
				}
			});}
			})
		</script>
		</c:otherwise>
		</c:choose>
	</div>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>