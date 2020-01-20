<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enroll Image List | PicSell</title>
<style>
	.one {max-height: 450px;}
	.image > img {margin: auto; width: 100%; height: 100%;}
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="container-fluid m-0 py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto">
			<h2 class="mx-auto my-0 text-center">출품작</h2>
		</div>
		<div class="container mx-auto my-5 p-3 text-center" style="border: 1px solid darkgray; border-radius: 10px;">
			<div class="row w-100 m-auto">
				<c:forEach items="${list }" var="list">
					<div class="col-4 w-100 my-0 one p-2">
						<div class="card w-100 h-100 p-2">
							<div class="row image w-100 mx-auto text-center" style="height: 250px;">
								<img src="/contestenroll/${list.enroll_sysname }">
							</div>
						  	<div class="row align-items-center image w-100 mx-auto text-center py-3" style="height: 50px;">
						    	<p class="nickname mx-auto"><a href="#" style="text-decoration: none;"><span class="mx-1">@</span>${list.enroll_nickname }</a></p>
						  	</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row w-100 mx-auto my-3 text-center">
				<input type="button" value="이전으로" class="m-auto" style="width: 100px; height: 30px; background-color: #f4f2f5; border: 1px solid darkgray; border-radius: 10px;">
			</div>
		</div>
	</div>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>