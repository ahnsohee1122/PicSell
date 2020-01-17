<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
				info:false,
				order:[[1,"desc"]],
				"language": {
				     "emptyTable": "포인트 내역이 존재하지 않습니다.",
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
		img{width:200px; height:200px;}
		tr:hover{background-color:#edf2ef!important;}
	</style>
	
</head>
<body>
	<h1>PicSell 회원님들의 포인트 입출금 내역 확인</h1>

	<table id="DataTable" class="table table-bordered">
	<thead> 
		<tr>
			<th>닉네임</th>
			<th>거래 날짜</th>
			<th>거래 구분</th>
			<th>거래 금액</th>
			<th>돈 종류 구분</th>
		</tr> 
	</thead>
	<tbody>
	<c:forEach items="${list}" var="list">
		<tr>
			<td>${list.nickname}</td>
			<td>${list.point_date} </td>
			<td>${list.deal_sort}</td>
			<td>${list.point}</td>
			<td>${list.money_sort}</td>
		</tr>
		
	</c:forEach>
	</tbody>

</body>
</html>