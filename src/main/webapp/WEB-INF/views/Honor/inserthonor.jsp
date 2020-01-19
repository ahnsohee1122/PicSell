
<%@ page import="kh.picsell.dto.WriterImageUpDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.pics{float:left; margin-left:50px;}
</style>
<jsp:include page="../key/top.jsp" flush="false"/>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

<div class="container pb-5">
    		<div class="row m-auto">
<c:choose>
<c:when test = "${memlist.size()==0}">
이미지없음
</c:when>
<c:otherwise>

<div id="likelist" style="width:100%">
<h3>좋아요 순위</h3>
<c:forEach items="${memlist}"  var = "dto">
<h3>${dto.nickname} 작가님</h3>
<div class="card m-auto pics" style="width: 15rem;float:left;">
                      <img src="${pageContext.request.contextPath}/img/ompangi.gif" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">LIKE ${dto.likepoint }</p>
                        <p class="text-center"><input type="button" class="detailpic" id="showpic${dto.id}" value="사진보기"></p><br>
                        <input type="button" value="등록하기" id="insert${dto.id}">
                        <script>
                        $("#insert${dto.id}").on("click",function(){
                        	$.ajax({
                        		url:"${pageContext.request.contextPath}/honor/insertcheck.do",
                        		type:"post",
                        		data:{nickname:"${dto.nickname}"}
                        	}).done(function(res){
                        		if(res=="중복"){
                        			alert("이미등록되었습니다");
                        		}else if(res=="가능"){
                        			$.ajax({
                        				url:"${pageContext.request.contextPath}/honor/insert.do",
                        				type:"post",
                         				data:{nickname:"${dto.nickname}"}
                        			}).done(function(res){
                        				if(res=="성공"){
                        					alert("등록되었습니다");
                        					return false;
                        				}else if(res=="실패"){}
                        				alert("실패했습니다");
                        			}).fail(function(res){
                        				if(res=="실패"){
                        					alert("서버에러입니다")
                        				}
                        			})
                        		}
                        		
                        	}).fail(function(res){
                        		if(res=="서버"){
                        			alert("서버문제입니다");
                        		}
                        	});
                        })
                        
                        	var nickname = "${dto.nickname}";
                        	$("#showpic${thirdto.id}").on("click",function(){                        		
                        window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nickname ,"Best3사진", "width=900,height=400,resizable=no");
                        	})
                        </script>
                      </div>
                    </div>
</c:forEach>
</div>
</c:otherwise>
</c:choose>
<hr>
<h6>새로운 명예의전당을 시작하려면 삭제를 눌러주세요</h6>
<input type="button" value="삭제" id="delete">
<script>
$("#delete").on("click",function(){
	$.ajax({
		url:"${pageContext.request.contextPath}/honor/delete.do",
		type:"post"
	}).done(function(res){
		if(res=="삭제"){
			alert("기존 명예의전당 목록을 삭제했습니다 \n위의 Best3작가님들을 등록하세요");
		}else if(res=="실패"){
			alert("실패했습니다");
		}
	}).fail(function(res){
		if(res=="서버"){
			alert("서버문제입니다");
		}
	});
})
</script>
</div>
</div>
<jsp:include page="../key/bottom.jsp" flush="false"/>

</body>
</html>