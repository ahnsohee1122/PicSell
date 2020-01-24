<%@ page import="kh.picsell.dto.ContestDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.selectlist {
			margin:auto;
			height: 60px;
			width: 40%;
			line-height:60px;
			text-align:center;
			border: solid 5px red;
			-webkit-animation-name: movingPara;
			-webkit-animation-duration: 2s;
			animation-name: movingPara;
			animation-duration: 4s;
			animation-iteration-count: infinite;
		}
		@-webkit-keyframes movingPara {
			0% { border-color: red; }
			20% { border-color: orange; }
			40% { border-color: yellow; }
			50% { border-color: green; }
			60% { border-color: blue; }
			80% { border-color: navy; }
			100% { border-color: purple; }
		}
		@keyframes movingPara {
			0% { border-color: red; }
			20% { border-color: orange; }
			40% { border-color: yellow; }
			50% { border-color: green; }
			60% { border-color: blue; }
			80% { border-color: navy; }
			100% { border-color: purple; }
		}
        
	</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<div style="width:900px;height:400px; text-align:center">
<c:choose>
<c:when test="${list.size()==0 }">
없음
</c:when>
<c:otherwise>
<c:forEach items="${list}" var="dto">
  <div class="selectlist">채택자 ${dto.enroll_nickname} 작가님</div>
</c:forEach>
<hr>
<div><input type="button" value="공모전 상세페이지" id="gogo"></div>
<script>
$("#gogo").on("click",function(){
	
	//출품작으로가게 (뭐가뭔지모르겠음 ㅈㅅ..)
})
</script>
</c:otherwise>
</c:choose>
</div>
</body>
</html>