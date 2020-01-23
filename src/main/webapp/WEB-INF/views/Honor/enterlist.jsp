<%@ page import="kh.picsell.dto.HonorListDTO" %>
<%@ page import="kh.picsell.dto.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EnterList | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="container-fluid m-0 py-5 text-center" style="min-height: 800px; background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<c:choose>
		<c:when test="${list.size()==0 }">
			<div class="row w-100 h-100">
				<h4>역대의 명예의 전당이 없습니다.</h4>
			</div>
		</c:when>
		<c:otherwise>
			<h2>역대 명예의 전당 리스트</h2>
			<div class="row w-100 mx-auto my-5 text-center">
				<c:forEach begin="0" end="${list.size()-1}" step="1" var="i">
					<div class="col-12 col-md-6 col-lg-5 col-xl-3 my-3">
						<h5 id="htop${list[i].honorlist_seq}"></h5>
						<div class="card py-3 mx-auto my-3 text-center" style="width: 17.5rem;">
			  				<img src="/profileimage//profileimage/${mList[i].profileimg }" class="card-img-top m-auto" style="width: 200px; height: 200px;">
							<div class="card-body px-0">
								<p class="card-text mx-auto " style="font-size: 18px; font-family: 'Cafe24Oneprettynight'; width: 200px;"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">${list[i].nickname}<span class="ml-1">작가님</span></p>
								<input type="button" value="사진보기" class="btn btn-outline-secondary py-1" id="sshowpic${list[i].honorlist_seq}">
														
								<script>
									var when = "${list[i].honor_date}";
									var topyear = when.substr(0,4);
									var topmonth = when.substr(5,2);
									$("#htop${list[i].honorlist_seq}").html(topyear + " 년  " + topmonth + " 월 ");
			               			$("#sshowpic${list[i].honorlist_seq}").on("click", function(){
			                        	window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+"${list[i].nickname}" ,"Best3사진", "width=900,height=400,resizable=no");
			                        });
			                    </script>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:otherwise>
		</c:choose>
		<div class="row w-100 m-auto text-center">
			<input type="button" value="홈으로" id="gohome" class="btn mx-auto text-center mt-3" style="border: 1px solid darkgray; backgorund-color: #f4f2f5;">
		</div>
	</div>
	
	<script>
		$("#gohome").on("click",function(){
	   		location.href="${ageContext.request.contextPat}/home";
	   	})
	</script>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>