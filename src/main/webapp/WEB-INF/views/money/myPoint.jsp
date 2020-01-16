<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"/>     
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>

	<script> 
		jQuery(function($){             
			$("#DataTable").DataTable({
				searching:false,
				ordering:false,
				info:false,
				order:[[2,"desc"]],
				"language": {
				     "emptyTable": "판매 내역이 존재하지 않습니다.",
			     	 "paginate" :{
			     	 "previous" : "<<",
			     	 "next" : ">>"
			     	  }
			     },
				"pagingType": "simple_numbers"
			});        
		});     
	</script>

	<style>
		th{background-color:skyblue;}
	</style>
	
</head>
<body>
<h1> *내 포인트 확인하기 메뉴* </h1>

<hr>
	<h2>사용가능금액</h2>
	${point}
	<hr>
	
	<h2>충전하기</h2>
	<button id=chargePoint>충전하기</button>
	<script>
	$("#chargePoint").on("click", function(){
		location.href="${pageContext.request.contextPath}/money/charge.do";
	})
	</script>
	<hr>
	
	<h2>환급하기</h2>
	<button id=moneyBack>환급하기</button>
	<script>
	$("#moneyBack").on("click", function(){
		location.href="${pageContext.request.contextPath}/money/moneyBack.do";
	})
	</script>
	<hr>
	
	<h2>포인트 전환하기</h2>
	<button id=change>전환하기</button>
	<script>
	$("#change").on("click", function(){
		location.href = "${pageContext.request.contextPath}/money/change.do";
	})
	</script>
	<hr>
	
	<h2>포인트 입출금내역 확인</h2>
		<table id="DataTable" class="table table-bordered">
		<thead> 
		<tr>
			<th>날짜</th>
			<th>구분</th>
			<th>금액</th>
		</tr>
		<thead> 
		<tbody>
		<c:forEach items="${list}" var="list">
			<tr>
				<td id="${list.point_seq}"></td>

				<script>
				var date ="${list.point_date}";
				console.log(date)
				var change_date = date.substr( 0, 10 );
				$("#${list.point_seq}").html(change_date);
				console.log("${list.point_date}")
				console.log(change_date)
				</script>
			
				<td>${list.deal_sort}</td>
				<td>${list.point}</td>
			
			</tr>
		</c:forEach>
	</tbody>

	</table>
	<hr>

	<c:choose>
		<c:when test="${msg==null}">
		</c:when>
		<c:otherwise>
			<script>
				var msg = "${msg}";
				alert(msg);
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>