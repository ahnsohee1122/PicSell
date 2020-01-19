<%@ page import="kh.picsell.dto.MemberDTO" %>
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
<style>
.container{height:1800px;}
.detailpic{border:1px solid black; background-color:white; text-align:center; font-family: 'Cafe24Oneprettynight'; }
</style>
</head>
<body>
<div class="m-auto" style="text-align: center;">
            <div class="text-white" style="font-size: 32px; font-family: 'Cafe24Oneprettynight';">명예의 전당</div>
            <div class="text-white" style="font-size: 30px; font-family: 'Cafe24Oneprettynight';">￣</div>
            <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">픽셀 작가님들을 위한 명예의 전당입니다</div>
            <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">더 많은 수익을 만들어보고 싶으시다면,</div>
            <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">지금 바로 공모전에 도전해보세요!</div>
            
			
        </div>
<div class="container pb-5">
<h1 style="text-align:center">현재랭킹</h1>
    		<div class="row m-auto">
    		<c:choose>
    		<c:when test = "${likelist.size()==0}">
    		없음
    		</c:when>
    	<c:otherwise>
    	
    	<c:forEach items="${list1}" var="firdto">
    	
    	<div class="card m-auto" style="width: 15rem;border:3px solid gold;border-style: outset;">
                      <img src="${pageContext.request.contextPath}/img/ompangi.gif" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        <h5 class="card-title" style="font-size: 20px; font-family: 'Cafe24Oneprettynight';">${firdto.nickname}</h5>
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">LIKE ${firdto.likepoint }</p>
                        <p class="text-center"><a href="#" class="btn btn-outline-dark btn-sm">작가피드 보러가기</a></p>
                        <c:forEach items="${imglist1}" var="onedto">
                      ${onedto.img_seq}
                      </c:forEach>
                      </div>
                    </div>
                    
    	</c:forEach>
    	<c:forEach items="${list2}" var="secdto">
    	<div class="card m-auto" style="width: 15rem;border:3px solid silver;border-style:outset;">
                      <img src="${pageContext.request.contextPath}/img/ompangi.gif" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        <h5 class="card-title" style="font-size: 20px; font-family: 'Cafe24Oneprettynight';">${secdto.nickname }</h5>
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">LIKE ${secdto.likepoint }</p>
                        <p class="text-center"><a href="#" class="btn btn-outline-dark btn-sm">작가피드 보러가기</a></p>
                        <c:forEach items="${imglist2}" var="two">
                      ${two.img_seq}
                      </c:forEach>
                      </div>
                    </div>
    	</c:forEach>
    	<c:forEach items="${list3}" var="thirdto">
    	<div class="card m-auto" style="width: 15rem;border:3px solid #e39e66;border-style:outset;">
                      <img src="${pageContext.request.contextPath}/img/ompangi.gif" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        <h5 class="card-title" style="font-size: 20px; font-family: 'Cafe24Oneprettynight';">${thirdto.nickname }</h5>
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">LIKE ${thirdto.likepoint }</p>
                        <p class="text-center"><a href="#" class="btn btn-outline-dark btn-sm">작가피드 보러가기</a></p>
                      <c:forEach items="${imglist3}" var="three">
                      ${three.img_seq}
                      </c:forEach>
                      </div>
                    </div>
    	</c:forEach>
    	<div style="width:100%;height:4px;solid 2px black;"></div>
    	<hr>
    	<h4>작가별 대표사진</h4>
    	<div style="width:100%;height:4px;solid 2px black;"></div>
    	<div class="imglist">
    	<c:forEach items="${list1}" var="firdto">
    	<h3>1위 ${firdto.nickname} 작가님</h3>
    	<div class="card m-auto" style="width: 15rem;border:3px solid gold;border-style: outset;">
                      <img src="${pageContext.request.contextPath}/img/ompangi.gif" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">LIKE ${firdto.likepoint }</p>
                        <p class="text-center"><input type="button" class="detailpic" id="showpic${firdto.id}" value="사진보기"></p>
                       
                        <script>

                        	var nickname = "${firdto.nickname}";
                        	//$("#showpic${firdto.id}").on("click",function(){                        		
                      //  window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nickname ,"Best3사진", "width=800,height=600,resizable=no");
                        //	})
                        	
						$("body").on("click","#showpic${firdto.id}",function(){
                            window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nickname ,"Best3사진", "width=900,height=400,resizable=no");
                        })
                        </script>
                      </div>
                    </div>

    	</c:forEach>
    	</div>
    	<hr>
    	<div class="imglist">
    	<c:forEach items="${list2}" var="secdto">
    	<h3>2위 ${secdto.nickname} 작가님</h3>
    	<div class="card m-auto" style="width: 15rem;border:3px solid silver;border-style: outset;">
                      <img src="${pageContext.request.contextPath}/img/ompangi.gif" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">LIKE ${secdto.likepoint }</p>
                        <p class="text-center"><input type="button" class="detailpic" id="showpic${secdto.id}" value="사진보기"></p>
                       
                        <script>
                        
                        	var nickname1 = "${secdto.nickname}";
                        	$("#showpic${secdto.id}").on("click",function(){                        		
                        window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nickname1 ,"Best3사진", "width=900,height=400,resizable=no");
                        	})
                        </script>
                      </div>
                    </div>
 

    	</c:forEach>
    	</div>
    	<hr>
    	<div class="imglist">
    	<c:forEach items="${list3}" var="thirdto">
    	<h3>3위 ${thirdto.nickname} 작가님</h3>
    	<div class="card m-auto" style="width: 15rem;border:3px solid #e39e66;border-style:outset;">
                      <img src="${pageContext.request.contextPath}/img/ompangi.gif" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">LIKE ${thirdto.likepoint }</p>
                        <p class="text-center"><input type="button" class="detailpic" id="showpic${thirdto.id}" value="사진보기"></p>
                        
                        <script>
                        
                        	var nickname2 = "${thirdto.nickname}";
                        	$("#showpic${thirdto.id}").on("click",function(){                        		
                        window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nickname2 ,"Best3사진", "width=900,height=400,resizable=no");
                        	})
                        </script>
                      </div>
                    </div>
 
                     
    	</c:forEach>
    	</div>
    	</c:otherwise>
    		</c:choose>
    		</div>
    		</div>
</body>
    		<jsp:include page="../key/bottom.jsp" flush="false"/>
</html>