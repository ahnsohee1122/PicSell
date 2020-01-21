<%@ page import="kh.picsell.dto.ContestDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ContestAccept | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<style>
/*    작가페이지 Main */
	.writer {width: 100%; min-height: 250px; background-image: url('${pageContext.request.contextPath}/img/accept_banner.jpg'); background-repeat: no-repeat;}
	.explanation {margin-top: 5px; padding: 0px; background: none; border: 0; color: white; border-bottom: 1px solid white;}
	
	.modal-open {padding: 0;}
    .modal {padding: 0;}
	
/*    기본 글씨체 */
    @font-face {font-family: 'Cafe24Oneprettynight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff'); font-weight: normal; font-style: normal; }
    
    .dataTables_wrapper .dataTables_paginate {width: 100%!important; text-align: center!important; margin: auto!important; color: black!important;}
		
	.dataTables_wrapper .dataTables_paginate .paginate_button {
	    border: 1px solid white!important;
	    background-color: white!important;
	    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, white), color-stop(100%, white))!important;
	    background: -webkit-linear-gradient(top, white 0%, white 100%)!important;
	    background: -moz-linear-gradient(top, white 0%, white 100%)!important;
	    background: -ms-linear-gradient(top, white 0%, white 100%)!important;
	    background: -o-linear-gradient(top, white 0%, white 100%)!important;
	    background: linear-gradient(to bottom, white 0%, white 100%)!important;
	}
	
	.dataTables_wrapper .dataTables_paginate span .paginate_button:hover {color: black!important;}
	.dataTables_wrapper .dataTables_paginate span .paginate_button.current {font-weight: 900!important;}
	
	.dataTables_wrapper .dataTables_paginate .paginate_button.next:hover {color: black!important;}
	.dataTables_wrapper .dataTables_paginate .paginate_button.previous:hover {color: black!important;}
	
	.odd {background-color: white !important;}
	
	.dataTables_filter label input {width: 150px !important; border: 1px solid darkgray !important; border-radius: 5px !important;}
	
	img {max-width: 100%; max-height: 150px;}
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="container-fluid m-0 p-0">
        <div class="writer row m-0 p-0">
	        <div class="m-auto" style="text-align: center;">
	            <div class="text-white" style="font-size: 32px; font-family: 'Cafe24Oneprettynight';">공모전 심사/승인 내역</div>
	        </div>
        </div>
    </div>
    
    <div class="container-fluid m-0 p-0" style="font-family: 'Cafe24Oneprettynight';">
    	<div class="container mt-5 px-2" style="max-width: 1500px;">
    		<h4>${loginInfo }님의 공모전 심사/승인 내역입니다.</h4>
    	</div>
    	<div class="container mb-5 px-2" style="max-width: 1500px; font-family: 'Cafe24Oneprettynight';">
    		<div class="row align-items-center w-100 m-auto text-center" style="height: 130px; border-top: 1px solid darkgray; border-bottom: 1px solid darkgray;">
    			<div class="col-4">
    				<h5>승인된 공모전</h5>
    				<h5>${ok }<span>개</span></h5>
    			</div>
    			<div class="col-4">
    				<h5>심사중인 공모전</h5>
    				<h5>${notyet }<span>개</span></h5>
    			</div>
    			<div class="col-4">
    				<h5>승인거절된 공모전</h5>
    				<h5>${no }<span>개</span></h5>
    			</div>
    		</div>
    	</div>
    	<div class="container my-5 px-2" style="max-width: 1500px;">
    		<table id="contestAccept" class="display text-center">
				<thead>
					<tr>
						<th style="width: 10%;">등록번호</th>
						<th style="width: 30%;">공모전 제목</th>
						<th style="width: 15%;">심사진행</th>
						<th style="width: 15%;">승인여부</th>
						<th style="width: 20%;">등록일</th>
						<th style="width: 10%;">비고</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="dto">
					<tr style="height:100px;">
						<td>${dto.contest_seq}</td>
						<td>${dto.title}</td>
						<td id="checking${dto.contest_seq}"></td>
						<td id="accept${dto.contest_seq}"></td>
						<td></td>
						<td></td>
					</tr>
				
					<script>
						var checking = "${dto.checking}";
						var accept = "${dto.accept}";
						if(checking=="N"){
							$("#checking${dto.contest_seq}").html("심사중");
							$("#accept${dto.contest_seq}").html("심사중");
						}else if(checking=="Y"){
							$("#checking${dto.contest_seq}").html("심사완료");
							if(accept=="N"){
								$("#accept${dto.contest_seq}").html("등록거절 (사유 : ${dto.rejection})");
							}else if(accept="Y"){
								$("#accept${dto.contest_seq}").html("등록승인");
							}
						}
					</script>
				</c:forEach>
				</tbody>
			</table>
    	</div>
    </div>
    
    <script>
		$(document).ready(function() {
			$('#contestAccept').DataTable({
		        ordering:false,
		        info:false,
		        order:[[2,"desc"]],
		        "language": {
		             "emptyTable": "등록된 심사/승인 내역이 없습니다."",
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
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>