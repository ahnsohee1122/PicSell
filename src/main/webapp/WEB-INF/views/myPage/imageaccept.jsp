
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../key/top.jsp" flush="false"/>
				<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
                <link
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"
	rel="stylesheet">
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<style>
#container{height:1200px;position:relative;min-width:1400px;}
#manage{width:80%; float:right;text-align:center;min-width:860px;}
#leftmenu{width:20%; float:left;height:100%;min-width:182px}
img{ width: 300px; height: 300px;}
</style>
</head>
<body>
<div>
<h2>${loginInfo} 님의 이미지 등록신청 현황</h2>
</div>
<div id="container">
<div id="leftmenu">
<div style="height: 100px; width: 100%; padding-top: 30px;"><h3 style="margin-left:20px;">작가메뉴</h3></div>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="" class=mya>작가정보조회</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;background-color: #476491;"><a href="${pageContext.request.contextPath}/img_up/acceptpage.do" class=mya style="color:white;">이미지심사/승인 내역</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="${pageContext.request.contextPath}/contest/contestchecking.do" class=mya>공모전 심사/승인내역</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="" class=mya>수익금내역조회</a></p>

</div>
<div id="manage">
<c:choose>
<c:when test="${list.size()==0}">
${loginInfo} 님이 등록신청한 이미지가 없습니다.
</c:when>
<c:otherwise>
<div style="margin:auto">
<table><tr><td>승인된 사진 : ${ok} 개</td><td>심사중인 사진 : ${notyet} 개</td><td>승인거절된 사진 : ${no} 개 </td></tr></table>
</div>
<table id="example" class="display" style="width:90%">
<thead>
<tr>
<th>등록번호</th>
<th>사진</th>
<th>심사진행</th>
<th>승인여부</th>
<th>등록일</th>
<th>삭제</th>
</tr>
</thead>
<tbody>
<c:forEach items="${list}" var="dto">
<tr style="height:100px;" >
<td>${dto.img_seq}</td>
<td><img src='/writeruploadfiles/${dto.sysname}'></td>
<td id="checking${dto.img_seq}"></td>
<td id="accept${dto.img_seq}"></td>
<td id="time${dto.img_seq}"></td>
<td id="btn${dto.img_seq}"></td>
</tr>
<script>
var why = "${dto.rejection}";
var checking = "${dto.checking}";
var accept = "${dto.accept}";
var date = "${dto.img_sysdate}";
if(checking=="N"){
	$("#checking${dto.img_seq}").html("심사중");
	$("#accept${dto.img_seq}").html("심사중");
}else if(checking=="Y"){
		$("#checking${dto.img_seq}").html("심사완료");
		$("#btn${dto.img_seq}").html('<input type="button" id="delete${dto.img_seq}" value="삭제">')	
	if(accept=="N"){
		$("#accept${dto.img_seq}").html("등록거절 (사유 : ${dto.rejection})");
	}else if(accept="Y"){
		$("#accept${dto.img_seq}").html("등록승인");
	}
}
var showdate = date.substr(0,16);
$("#time${dto.img_seq}").html(showdate);
$("#delete${dto.img_seq}").on("click",function(){
	var seq = ${dto.img_seq};
	var result = confirm("정말 사진을 삭제하시겠습니까?");
	if(result){
		$.ajax({
			url:"${pageContext.request.contextPath}/img_up/del.do",
			type:"post",
			data:{img_seq:seq}
		}).done(function(res){
			if(res=="성공"){
				alert("삭제에 성공했습니다");
				location.href="${pageContext.request.contextPath}/img_up/acceptpage.do";
			}else if(res=="실패"){
				alert("삭제에 실패했습니다");
			}
		}).fail(function(res){
			if(res=="서버"){
				alert("서버에러입니다 관리자에게 문의주세요");
			}
		});
		
	}else{
		alert("취소했습니다.");
	}
});


</script>
</c:forEach>
</tbody>
</table>
<script>
$(document).ready(function() {
	$('#example').DataTable();
});
$($.fn.dataTable.tables(true)).DataTable().columns.adjust();


</script>
</c:otherwise>
</c:choose>
</div>
</div>
<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>