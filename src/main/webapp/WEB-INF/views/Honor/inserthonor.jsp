
<%@ page import="kh.picsell.dto.WriterImageUpDTO" %>
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
</head>
<body>

<div class="container pb-5">
    		<div class="row m-auto">
<c:choose>
<c:when test = "${likelist.size()==0}">
이미지없음
</c:when>
<c:otherwise>

<div id="likelist">
<h3>좋아요 순위</h3>
<c:forEach items="${likelist}"  var = "likedto">
<div class="col-12 col-md-6 col-xl-4 mt-2 mb-4" id="likeimg${dto.contest_seq}" style="float:left">
    				<div class="convention pb-3" style="margin: auto; width: 300px; background-color: white;">
    				<p class="px-2 py-0" style="font-size: 17px;display:none" id="enter${likedto.img_seq}">등록된사진입니다.</p>
    					<p><img src='/writeruploadfiles/${likedto.sysname}' style="width: 300px; height: 170px;"></p>
    					<p class="px-2 pb-2" style="font-size: 20px;" id="num${likedto.img_seq}">사진 번호 : ${likedto.img_seq}</p>
    					<p class="px-2 pb-2" style="font-size: 20px;" id="who${likedto.img_seq}">작성자 : ${likedto.nickname}</p>
    					<p class="px-2 py-0" style="font-size: 17px;" id="like${likedto.img_seq}">좋아요 : ${likedto.img_like }</p>
    					<p class="px-2 py-0" style="font-size: 17px;" id="date${likedto.img_seq}"></p>
    					<input type="button" id="${pageContext.request.contextPath}/likeinsert${likedto.img_seq}" value="등록">
    					<p class="px-2 py-0" style="font-size: 17px; color:red; display:none;" id="no${likedto.img_seq}">이미 등록된사진입니다</p>
    				</div>
    				</div>
    				<script>
    				var seq = ${likedto.img_seq};
    				var date = "${likedto.img_sysdate}";
    				var inputdate = date.substr(0,16);
    				$("#date${likedto.img_seq}").html("등록일 : "+inputdate);
    				$("#likeinsert${likedto.img_seq}").on("click",function(){
    					$.ajax({
    						url:"${pageContext.request.contextPath}/honor/insertcheck.do",
    						type:"post",
    						data:{img_seq:${likedto.img_seq}}
    					}).done(function(res){
    						if(res=="중복"){
    							$("#no${likedto.img_seq}").css("display","block");
    						}else if(res=="가능"){
    							$("#no${likedto.img_seq}").css("display","none");
    							$.ajax({
    								url:"${pageContext.request.contextPath}/honor/insert.do",
    	    						type:"post",
    	    						data:{nickname:"${likedto.nickname}",
    	    							img_seq:${likedto.img_seq},
    	    							oriname:"${likedto.oriname}",
    	    							sysname:"${likedto.sysname}" }
    							}).done(function(res){
    								if(res=="성공"){
    									alert("등록되었습니다");
    									$("#enter${likedto.img_seq}").css("display","block");
    								}else if(res=="실패"){
    									alert("실패했습니다")
    								}
    							}).fail(function(res){
    								if(res=="실패"){
    									alert("서버문제입니다");
    								}
    							});
    						}
    					}).fail(function(res){
    						if(res=="서버"){
    							alert("서버문제입니다");
    						}
    					});
    				});
    				</script>

</c:forEach>
<hr>
<h3>조회수 순위</h3>
<c:forEach items="${viewlist}" var="viewdto">
<div class="col-12 col-md-6 col-xl-4 mt-2 mb-4" id="likeimg${dto.contest_seq}" style="float:left">
    				<div class="convention pb-3" style="margin: auto; width: 300px; background-color: white;">
    				<p class="px-2 py-0" style="font-size: 17px;display:none" id="enter${viewdto.img_seq}">등록된사진입니다.</p>
    					<p><img src='/writeruploadfiles/${viewdto.sysname}' style="width: 300px; height: 170px;"></p>
    					<p class="px-2 pb-2" style="font-size: 20px;" id="num${viewdto.img_seq}">사진 번호 : ${viewdto.img_seq}</p>
    					<p class="px-2 pb-2" style="font-size: 20px;" id="who${viewdto.img_seq}">작성자 : ${viewdto.nickname}</p>
    					<p class="px-2 py-0" style="font-size: 17px;" id="like${viewdto.img_seq}">조회수: ${viewdto.viewcount }</p>
    					<p class="px-2 py-0" style="font-size: 17px;" id="date${viewdto.img_seq}"></p>
    					<input type="button" id="likeinsert${viewdto.img_seq}" value="등록">
    					<p class="px-2 py-0" style="font-size: 17px; color:red; display:none;" id="no${viewdto.img_seq}">이미 등록된사진입니다</p>
    				</div>
    				</div>
    				<script>
    				var seq = ${viewdto.img_seq};
    				var date = "${viewdto.img_sysdate}";
    				var inputdate = date.substr(0,16);
    				$("#date${viewdto.img_seq}").html("등록일 : "+inputdate);
    				$("#likeinsert${viewdto.img_seq}").on("click",function(){
    					$.ajax({
    						url:"${pageContext.request.contextPath}/honor/insertcheck.do",
    						type:"post",
    						data:{img_seq:${viewdto.img_seq}}
    					}).done(function(res){
    						if(res=="중복"){
    							$("#no${viewdto.img_seq}").css("display","block");
    						}else if(res=="가능"){
    							$("#no${viewdto.img_seq}").css("display","none");
    							$.ajax({
    								url:"${pageContext.request.contextPath}/honor/insert.do",
    	    						type:"post",
    	    						data:{nickname:"${viewdto.nickname}",
    	    							img_seq:${viewdto.img_seq},
    	    							oriname:"${viewdto.oriname}",
    	    							sysname:"${viewdto.sysname}" }
    							}).done(function(res){
    								if(res=="성공"){
    									alert("등록되었습니다");
    									$("#enter${viewdto.img_seq}").css("display","block");
    								}else if(res=="실패"){
    									alert("실패했습니다")
    								}
    							}).fail(function(res){
    								if(res=="실패"){
    									alert("서버문제입니다");
    								}
    							});
    						}
    					}).fail(function(res){
    						if(res=="서버"){
    							alert("서버문제입니다");
    						}
    					});
    				});
    				</script>
</c:forEach>
<hr>
<h3>다운로드 순위</h3>
<c:forEach items="${downlist}" var="downdto">
<div class="col-12 col-md-6 col-xl-4 mt-2 mb-4" id="likeimg${dto.contest_seq}" style="float:left">
    				<div class="convention pb-3" style="margin: auto; width: 300px; background-color: white;">
    				<p class="px-2 py-0" style="font-size: 17px;display:none" id="enter${downdto.img_seq}">등록된사진입니다.</p>
    					<p><img src='/writeruploadfiles/${downdto.sysname}' style="width: 300px; height: 170px;"></p>
    					<p class="px-2 pb-2" style="font-size: 20px;" id="num${downdto.img_seq}">사진 번호 : ${downdto.img_seq}</p>
    					<p class="px-2 pb-2" style="font-size: 20px;" id="who${downdto.img_seq}">작성자 : ${downdto.nickname}</p>
    					<p class="px-2 py-0" style="font-size: 17px;" id="like${downdto.img_seq}">다운로드횟수 : ${downdto.downcount }</p>
    					<p class="px-2 py-0" style="font-size: 17px;" id="date${downdto.img_seq}"></p>
    					<input type="button" id="likeinsert${downdto.img_seq}" value="등록">
    					<p class="px-2 py-0" style="font-size: 17px; color:red; display:none;" id="no${downdto.img_seq}">이미 등록된사진입니다</p>
    				</div>
    				</div>
    				<script>
    				var seq = ${downdto.img_seq};
    				var date = "${downdto.img_sysdate}";
    				var inputdate = date.substr(0,16);
    				$("#date${downdto.img_seq}").html("등록일 : "+inputdate);
    				$("#likeinsert${downdto.img_seq}").on("click",function(){
    					$.ajax({
    						url:"${pageContext.request.contextPath}/honor/insertcheck.do",
    						type:"post",
    						data:{img_seq:${downdto.img_seq}}
    					}).done(function(res){
    						if(res=="중복"){
    							$("#no${downdto.img_seq}").css("display","block");
    						}else if(res=="가능"){
    							$("#no${downdto.img_seq}").css("display","none");
    							$.ajax({
    								url:"${pageContext.request.contextPath}/honor/insert.do",
    	    						type:"post",
    	    						data:{nickname:"${downdto.nickname}",
    	    							img_seq:${downdto.img_seq},
    	    							oriname:"${downdto.oriname}",
    	    							sysname:"${downdto.sysname}" }
    							}).done(function(res){
    								if(res=="성공"){
    									alert("등록되었습니다");
    									$("#enter${downdto.img_seq}").css("display","block");
    								}else if(res=="실패"){
    									alert("실패했습니다")
    								}
    							}).fail(function(res){
    								if(res=="실패"){
    									alert("서버문제입니다");
    								}
    							});
    						}
    					}).fail(function(res){
    						if(res=="서버"){
    							alert("서버문제입니다");
    						}
    					});
    				});
    				</script>
</c:forEach>
</div>
</c:otherwise>
</c:choose>
</div>
</div>
<jsp:include page="../key/bottom.jsp" flush="false"/>

</body>
</html>