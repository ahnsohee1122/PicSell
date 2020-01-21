
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
.pics{float:left; margin-left:30px;width:25%; height:200px;}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<c:choose>
<c:when test = "${imglist1.size()==0 }">
사진없음 </c:when>
<c:otherwise>
<div style="width:100%; height:300px;">
<c:forEach items="${imglist1}" var="onedto">
  <div class="card m-auto pics">
                      <p class="card-title">사진번호 : ${onedto.img_seq}</p>
                      <img src="/watermarkfiles/xsmarked_${onedto.sysname}" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      
                      <div class="card-body">
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">LIKE ${onedto.img_like }</p>
                        
                      </div>
                    </div>
</c:forEach>
</div>
</c:otherwise>
</c:choose>
</body>
</html>