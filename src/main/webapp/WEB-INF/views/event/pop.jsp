<%@page import="org.springframework.web.util.CookieGenerator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
   background-image: url('/img/popUp.PNG');
   background-repeat: no-repeat;
   background-size: cover;
   width=95%;
   height=100%;
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script language="JavaScript">

    function closePopup() {
        if (document.getElementById("check").value) {
			<%
			CookieGenerator cg = new CookieGenerator();
			cg.setCookieName("popupYN");
			cg.setCookieMaxAge(24*60*60);
			cg.addCookie(response, "N");
			%>
			self.close();
		}
	}
</script>


</head>
<body>
	<button id="goEvent">출석하러 가기</button>
  <input type="checkbox" id="check" onclick="closePopup();">
    <br>
    <fontsize=3> <b>하루에 한번만 보기</b> </font>
	
	<script>
   $("#goEvent").on("click", function(){

         window.opener.location = '${pageContext.request.contextPath}/event/attendance_check.do';
         window.close();

   })

</script>
</body>
</html>