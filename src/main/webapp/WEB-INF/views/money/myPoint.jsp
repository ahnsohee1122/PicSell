<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPoint | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"/>     
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<style>
	.odd > td {background-color: #f4f2f5; height: 40px; line-height: 40px;}
	.even > td {background-color: #f4f2f5; height: 40px; line-height: 40px;}
	
	.table-bordered th {border: 0 !important;}

	.dataTables_wrapper .dataTables_paginate {width: 100%!important; text-align: center!important; margin: auto!important; color: black!important;}
		
	.dataTables_wrapper .dataTables_paginate .paginate_button {
	    border: 1px solid #f4f2f5!important;
	    background-color: #f4f2f5!important;
	    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f4f2f5), color-stop(100%, #f4f2f5))!important;
	    background: -webkit-linear-gradient(top, #f4f2f5 0%, #f4f2f5 100%)!important;
	    background: -moz-linear-gradient(top, #f4f2f5 0%, #f4f2f5 100%)!important;
	    background: -ms-linear-gradient(top, #f4f2f5 0%, #f4f2f5 100%)!important;
	    background: -o-linear-gradient(top, #f4f2f5 0%, #f4f2f5 100%)!important;
	    background: linear-gradient(to bottom, #f4f2f5 0%, #f4f2f5 100%)!important;
	}
	
	.dataTables_wrapper .dataTables_paginate span .paginate_button:hover {color: black!important;}
	.dataTables_wrapper .dataTables_paginate span .paginate_button.current {font-weight: 900!important;}
	
	.dataTables_wrapper .dataTables_paginate .paginate_button.next:hover {color: black!important;}
	.dataTables_wrapper .dataTables_paginate .paginate_button.previous:hover {color: black!important;}
	
	.rowBtn {width: 50%;}
</style>
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
	$($.fn.dataTable.tables(true)).DataTable().columns.adjust();
</script>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<jsp:include page="../key/profile.jsp" flush="false"/>
	
	<div class="container-fluid m-0 py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto" style="max-width: 1500px;">
			<div class="row">
				<div id="floatMenu" class="col-5 col-md-3 col-xl-2 py-2 text-center p-0 d-none d-md-block" style="height: 410px; border: 1px solid gray; box-sizing: border-box; border-radius: 10px;">
					<div class="row m-0 px-0 w-100 text-left">
						<div class="px-3 py-2 w-100"><a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; font-size: 22px; text-decoration: none;">My Page</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; font-size: 16px; text-decoration: none;">회원 정보 조회</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/buy_list.do" style="color: black; font-size: 16px; text-decoration: none;">구매 내역 확인</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/myPoint.do" style="color: black; font-size: 16px; text-decoration: none;">포인트 입출금 내역 확인</a></div>
						<div class="px-3 py-1 mb-3 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/charge.do" style="color: black; font-size: 16px; text-decoration: none;">포인트 충전</a></div>
					</div>
					<hr class="py-1 m-auto" style="max-width: 220px;">
					<div class="row m-0 px-0 w-100 text-left">
						<div class="px-3 py-2 w-100"><a href="${pageContext.request.contextPath}/writer/writerpage?nickname=${sessionScope.loginInfo}" style="color: black; font-size: 22px; text-decoration: none;">Writer Page</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/writer/writerpage?nickname=${sessionScope.loginInfo}" style="color: black; font-size: 16px; text-decoration: none;">작가 정보 조회</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/profit_list.do" style="color: black; font-size: 16px; text-decoration: none;">수익 & 판매 내역 확인</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/moneyBack.do" style="color: black; font-size: 16px; text-decoration: none;">수익금 환급</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/change.do" style="color: black; font-size: 16px; text-decoration: none;">수익금 전환</a></div>
					</div>
				</div>
				<div class="col-12 col-md-9 col-xl-10 px-0 px-md-3 text-center">
					<div class="m-auto w-100 h-100 py-5" style="border: 1px solid gray; border-radius: 10px;">
						<form class="m-auto px-2 px-ml-0" style="max-width: 600px;">
							<h4>포인트 입출금 내역</h4>
						</form>
						<form class="mx-auto mt-5 px-3 px-ml-0 text-center" style="max-width: 100%;">
							<table id="DataTable" class="row-border">
								<thead> 
									<tr>
										<th>날짜</th>
										<th>구분</th>
										<th>금액</th>
									</tr>
								<thead> 
								<tbody>
									<c:forEach items="${list}" var="list">
										<tr style="background-color: #f4f2f5;">
											<td id="${list.point_seq}"></td>
											<script>
												var date ="${list.point_date}";
												console.log(date);
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
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$("#chargePoint").on("click", function(){
			location.href="${pageContext.request.contextPath}/money/charge.do";
		})
		
		$("#moneyBack").on("click", function(){
			location.href="${pageContext.request.contextPath}/money/moneyBack.do";
		})
		
		$("#change").on("click", function(){
			location.href = "${pageContext.request.contextPath}/money/change.do";
		})
	</script>
	
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
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>