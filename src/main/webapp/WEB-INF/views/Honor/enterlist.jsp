<%@ page import="kh.picsell.dto.HonorListDTO" %>
<%@ page import="kh.picsell.dto.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<jsp:include page="../key/top.jsp" flush="false"/>
<c:choose>
<c:when test="${list.size()==0 }">
목록이 없습니다
</c:when>
<c:otherwise>
<c:forEach begin="0" end="${list.size()-1}" step="1" var="i">
<div class="card m-auto col-2" style="width: 15rem;border:3px solid black;border-style:outset;margin-left:30px;">
                      <img src="/profileimage/${mList[i].profileimg }" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">${list[i].nickname} 작가님</p>
                        <p class="text-center"><input type="button" class="detailpic" id="sshowpic${list[i].honorlist_seq}" value="사진보기"></p>
                        
                        <script>
                        
                        	
                        	$("#sshowpic${list[i].honorlist_seq}").on("click",function(){
                        window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+"${list[i].nickname}" ,"Best3사진", "width=900,height=400,resizable=no");
                        	});
                        </script>
                      </div>
                    <div style="text-align:center">
                    <input type="radio" name="who" value="${list[i].nickname}" style="text-align:center">
                    </div>
                    </div>
          
</c:forEach>
</c:otherwise>
</c:choose>
<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>