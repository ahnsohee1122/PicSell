
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
<div>
<c:choose>
<c:when test = "${likelist.size()==0}">
이미지없음
</c:when>
<c:otherwise>

<div id="likelist">
<h3>좋아요 순위</h3>
<c:forEach items="${likelist}"  var = "likedto">
<div class="col-12 col-md-6 col-xl-4 mt-2 mb-4" id="likeimg${dto.contest_seq}">
    				<div class="convention pb-3" style="margin: auto; width: 300px; background-color: white;">
    				<p class="px-2 py-0" style="font-size: 17px;display:none" id="enter${likedto.img_seq}">등록된사진입니다.</p>
    					<p><img src='/writeruploadfiles/${likedto.sysname}' style="width: 300px; height: 170px;"></p>
    					<p class="px-2 pb-2" style="font-size: 20px;" id="num${likedto.img_seq}">사진 번호 : ${likedto.img_seq}</p>
    					<p class="px-2 py-0" style="font-size: 17px;" id="like${likedto.img_seq}">좋아요 : ${likedto.img_like }</p>
    					<p class="px-2 py-0" style="font-size: 17px;" id="date${likedto.img_seq}"></p>
    					<input type="button" id="likeinsert${likedto.img_seq}" value="등록">
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
    	    							img_seq:seq,
    	    							oriname:"${likedto.oriname}",
    	    							sysname:"${likedto.sysname}"}
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
<table><tr><td>사진 번호 : ${viewdto.img_seq}</td><td><img src='/writeruploadfiles/${viewdto.sysname}'></td><td>조회수 : ${viewdto.viewcount}</td></tr></table>
</c:forEach>
<hr>
<h3>다운로드 순위</h3>
<c:forEach items="${downlist}" var="downdto">
<table><tr><td>사진 번호 : ${downdto.img_seq}</td><td><img src='/writeruploadfiles/${downdto.sysname}'></td><td>다운로드 횟수 : ${downdto.downcount}</td></tr></table>
</c:forEach>
</div>
</c:otherwise>
</c:choose>
<jsp:include page="../key/bottom.jsp" flush="false"/>
</div>
</body>
</html>