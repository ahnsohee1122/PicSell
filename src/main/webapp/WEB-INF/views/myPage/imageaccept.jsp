
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
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>

<style>
/*    작가페이지 Main */
	.writer {width: 100%; min-height: 250px; background-image: url('${pageContext.request.contextPath}/img/write_banner.png'); background-repeat: no-repeat;}
	.explanation {margin-top: 5px; padding: 0px; background: none; border: 0; color: white; border-bottom: 1px solid white;}
	
	.modal-open {padding: 0;}
    .modal {padding: 0;}
	
/*    기본 글씨체 */
    @font-face {font-family: 'Cafe24Oneprettynight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff'); font-weight: normal; font-style: normal; }
	#accept_menu{min-width:1400px; display:inline-block}
	#accept_menu>p{float:left}
	#container{height:1800px; margin: 50px; }
	.imgtd{width:250px; height:150px}
	.imgtd>img{width:100%;}
	.state{ float:left; width: 200px; height:100px; margin: 3px;}
</style>
</head>
<body>

 <div class="container-fluid m-0 p-0">
        <div class="writer row m-0 p-0">
        <div class="m-auto" style="text-align: center;">
            <div class="text-white" style="font-size: 32px; font-family: 'Cafe24Oneprettynight';">${loginInfo} 님의 등록신청 현황</div>
            <div class="text-white" style="font-size: 30px; font-family: 'Cafe24Oneprettynight';">￣</div>
            <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">작가가 되어 나의 작품을 알리고</div>
            <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">새로운 수익을 만들어보세요!</div>
            <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">누구나 작가가 될 수 있는 기회입니다!</div>
            <button type="button" class="explanation" data-toggle="modal" data-target="#Modal" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">작가 홈이란?</button>
        </div>
        </div>
    </div>
<div>
</div>
<div id="accept_menu">
     <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;background-color: #476491;"><a href="${pageContext.request.contextPath}/img_up/acceptpage.do" class=mya style="color:white;">이미지심사/승인 내역</a></p>
     <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="${pageContext.request.contextPath}/contest/contestchecking.do" class=mya>공모전 심사/승인내역</a></p>
</div>

<div id="container">
<c:choose>
<c:when test="${list.size()==0}">
${loginInfo} 님이 등록신청한 이미지가 없습니다.
</c:when>
<c:otherwise>
<div style="margin:auto">
<div class="state">승인된 사진<br> ${ok} 개</div><div class="state">심사중인 사진 <br> ${notyet} 개</div><div class="state">승인거절된 사진 <br> ${no} 개 </div>
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
	<td class="imgtd"><img src='/writeruploadfiles/${dto.sysname}'></td>
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
<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>