<%@ page import="kh.picsell.dto.ContestDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공모전 심사/승인</title>
				<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
                <link
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"
	rel="stylesheet">
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
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
	            <div class="text-white" style="font-size: 32px; font-family: 'Cafe24Oneprettynight';">이미지 심사/승인</div>
	        </div>
        </div>
    </div>
   <div class="container-fluid m-0 p-0" style="font-family: 'Cafe24Oneprettynight';">
    	<div class="container mt-5 px-2" style="max-width: 1500px;">
    		<h4>공모전 심사/승인</h4>
    	</div>
<c:choose>
<c:when test = "${list.size() ==0 }">
<h3 style="text-align:center">신청된 공모전없음</h3>
</c:when>
<c:otherwise>
<div class="container my-5 px-2" style="max-width: 1500px;">
    		<table id="imageAccept" class="display text-center">
    		<thead>
                        <tr>
                            <th style="width: 10%;">번호</th>
                            <th style="width: 20%;">제목</th>
                            <th style="width: 30%;">기간</th>
                            <th style="width: 20%;">주최분류</th>
                            <th style="width: 20%;">주최자</th>
                       
                        </tr>
                    </thead>
                    <tbody>

<c:forEach items = "${list}" var="dto">
<tr>
<td>${dto.contest_seq }
<td><a href="detailcheck.do?contest_seq=${dto.contest_seq}">${dto.title }</a>
<td>${dto.enddate }
<td>${dto.hosttype }
<td>${dto.host }

</tr>

</c:forEach>
</tbody>
<tfoot>
<tr>
</tr>
</tfoot>
</table>
</div>
<script>
	    $(document).ready(function() {
			$('#imageAccept').DataTable({
		        ordering:false,
		        info:false,
		        order:[[2,"desc"]],
		        "language": {
		             "emptyTable": "등록된 공지사항이 없습니다.",
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
</c:otherwise>
</c:choose>
</div>

<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>