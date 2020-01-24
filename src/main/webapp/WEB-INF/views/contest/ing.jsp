<%@ page import="kh.picsell.dto.ContestDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	            <div class="text-white" style="font-size: 32px; font-family: 'Cafe24Oneprettynight';">공모전 현황</div>
	        </div>
        </div>
    </div>
     <div class="container-fluid m-0 p-0" style="font-family: 'Cafe24Oneprettynight';">
    	<div class="container mt-5 px-2" style="max-width: 1500px;">
    		<h4>공모전 현황</h4>
    	</div>
    	<c:choose>
    	<c:when test="${list.size() == 0}">
    	공모전없음
    	</c:when>
    	<c:otherwise>
    	<div class="container my-5 px-2" style="max-width: 1500px;">
    		<table id="imageAccept" class="display text-center">
    		<thead>
                        <tr>
                            <th style="width: 10%;">번호</th>
                            <th style="width: 15%;">제목</th>
                            <th style="width: 20%;">기간</th>
                            <th style="width: 15%;">주최분류</th>
                            <th style="width: 20%;">주최자</th>
                            <th style="width: 15%;">진행여부</th>
                            <th style="width: 5%;">비고</th>
                       
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
<td id="yn${dto.contest_seq}">
<td><input type="button" value="채택자보기" id="sh${dto.contest_seq}" style="display:none">

<script>
var yn  = "${dto.selectimage}";
if(yn=="Y"){
	$("#yn${dto.contest_seq}").html("채택완료");
}else{
	$("#yn${dto.contest_seq}").html("진행중")
}
var a = "${dto.enddate}";

var inputyear = a.substr(0,4); //게시끝나는년도
var inputmonth = a.substr(5,2); //끝나는월
var inputdate = a.substr(8,2); //끝나는일

var startyear = a.substr(0,4);
var startmonth = a.substr(5,2);
var startdate = a.substr(8,2);
var startday = (startyear+""+startmonth+""+startdate); //시작일

console.log(startday); //


var now = new Date();
var year = now.getFullYear();
var month = (now.getMonth()+1);
var date = now.getDate();
if((date+"").length < 2){ //날짜가 한자리면 앞에 0추가
	date = "0"+date;
}
if((month+"").length < 2){ //월이 한자리면 앞에 0추가
	month = "0"+month;
}
var sysdate = (year+"-"+month+"-"+date);
var outputyear = sysdate.substr(0,4);
var outputmonth = sysdate.substr(5,2);
var outputdate = sysdate.substr(8,2);

if(inputyear>outputyear){ //년도확인
	if(yn=="Y"){
		$("#yn${dto.contest_seq}").html("채택완료");
		$("#sh${dto.contest_seq}").css("display","block");
	}else{
		$("#yn${dto.contest_seq}").html("진행중")
	}

}else if(inputyear==outputyear){ //년도 같을때
	if(inputmonth>outputmonth){
		if(yn=="Y"){
			$("#yn${dto.contest_seq}").html("채택완료");
			$("#sh${dto.contest_seq}").css("display","block");
		}else{
			$("#yn${dto.contest_seq}").html("진행중")
		}
	}
	else if(inputmonth=outputmonth){    					
		if(inputdate>=outputdate){
			if(yn=="Y"){
				$("#yn${dto.contest_seq}").html("채택완료");
				$("#sh${dto.contest_seq}").css("display","block");
			}else{
				$("#yn${dto.contest_seq}").html("진행중")
			}
		}else{
			if(yn=="Y"){
				$("#yn${dto.contest_seq}").html("채택완료");
				$("#sh${dto.contest_seq}").css("display","block");
			}else{
				$("#yn${dto.contest_seq}").html("종료(채택안함)")
			}

		}
	}else{
		if(yn=="Y"){
			$("#yn${dto.contest_seq}").html("채택완료");
			$("#sh${dto.contest_seq}").css("display","block");
		}else{
			$("#yn${dto.contest_seq}").html("종료(채택안함)")
		}

	}	

	}else{
		if(yn=="Y"){
			$("#yn${dto.contest_seq}").html("채택완료");
			$("#sh${dto.contest_seq}").css("display","block");
		}else{
			$("#yn${dto.contest_seq}").html("종료(채택안함)")
		}
		
	}
		
		
		$("#sh${dto.contest_seq}").on("click",function(){
			window.open("${pageContext.request.contextPath}/contest/selectlist.do?contest_seq="+${dto.contest_seq} ,"채택자", "width=900,height=400,resizable=no");
		})
</script>
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