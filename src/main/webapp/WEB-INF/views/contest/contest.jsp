<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contest | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
/*    공모전 Main */
    .contest {width: 100%; min-height: 250px; background-image: url('../img/contest_banner.jpg'); background-repeat: no-repeat;}
    .explanation {margin-top: 5px; padding: 0px; background: none; border: 0; color: white; border-bottom: 1px solid white;}
    
    .modal-open {padding: 0;}
    .modal {padding: 0;}
    
    .convention {font-family: 'Cafe24Oneprettynight';}
    
/*    기본 글씨체 */
    @font-face {font-family: 'Cafe24Oneprettynight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff'); font-weight: normal; font-style: normal; }
/*    Modal 글씨체 */
    @font-face {font-family: '777Balsamtint'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/777Balsamtint.woff') format('woff'); font-weight: normal; font-style: normal; }
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
<!--  공모전 Main -->
    <div class="container-fluid m-0 p-0">
        <div class="contest row m-0 p-0">
        <div class="m-auto" style="text-align: center;">
            <div class="text-white" style="font-size: 32px; font-family: 'Cafe24Oneprettynight';">공모전</div>
            <div class="text-white" style="font-size: 30px; font-family: 'Cafe24Oneprettynight';">￣</div>
            <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">픽셀 작가님들을 위한 이미지 공모전을 시작합니다!</div>
            <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">더 많은 수익을 만들어보고 싶으시다면,</div>
            <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">지금 바로 공모전에 도전해보세요!</div>
            <button type="button" class="explanation" data-toggle="modal" data-target="#Modal" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">공모전이란?</button>
			<div class="modal fade" id="Modal" role="dialog" aria-labelledby="Label" aria-hidden="true" style="top: 110px;">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content" style="margin: auto; width: 430px;">
			      <div class="modal-body text-left" style="font-family: '777Balsamtint';">
			          	<h5 class="py-3">공모전이란?</h5>
			          	<h5 class="py-2">픽셀에서 활동하시는 작가님들께<br>더 많은 수익과 기회를 드리고자,<br>픽셀에서 공모전을 시작합니다!</h5>
			          	<h5 class="py-2">픽셀이 직접 주관한 공모전,<br>특정 기업 혹은 고객이 주관하는 공모전,<br>공공기관이나 지자체에서 주관하는 공모전 등<br>재밌는 공모전이 많이 열릴 계획이에요.</h5>
			          	<h5 class="py-2">픽셀에 없는 사진들이 필요하시다면?<br>새로운 공모전을 열어 작가님들께 사진을 부탁해보세요!</h5>
			          	<h5 class="py-2">많은 참여 부탁드립니다!</h5>
			          	<h5 class="py-2">* 각각의 공모전 요강을 확인해보시고<br>해당 공모전에 맞는 이미지를 업로드 해주세요.</h5>
			          	<h5 class="py-2">* 공모전을 열고 싶은 고객님들은<br>우측 ＇새로운 공모전 열기＇를 통해 신청해주세요.</h5>
			      </div>
			      <div class="modal-footer"><button type="button" class="btn btn-secondary m-auto" style="width: 150px; font-family: '777Balsamtint';" data-dismiss="modal">확인</button></div>
			    </div>
			  </div>
			</div>
        </div>
        </div>
    </div>
    
<!--  공모전 게시글 -->
    <div class="container-fluid p-0" style="background-color: #f4f2f5;">
    	<div class="pt-5 p-0 m-auto w-80" style="max-width: 1040px;">
    		<div class="row p-0 m-0 text-right">
    			<div class="col-8 col-xs-4 col-sm-7 col-md-10 col-lg-9 col-xl-12 m-auto px-2 px-md-0 px-lg-1 px-xl-0"><a id="contestopen" class="btn text-primary border border-primary" style="font-size: 13px;">새로운 공모전 열기</a></div>
    		</div>
    	</div>
    	<div class="container pb-5">
    		<div class="row w-100 m-auto">
    			<c:choose>
				<c:when test = "${list.size() == 0 }">
					<div class="row align-items-center w-100 m-auto text-center" style="min-height: 470px; font-family: 'Cafe24Oneprettynight';">
						<h5 class="m-auto">진행중인 공모전이 없습니다.</h5>
					</div>
				</c:when>
				<c:otherwise>
				<c:forEach items="${list}" var="dto">
				<div class="col-12 col-md-6 col-xl-4 mt-2 mb-4" id="contest${dto.contest_seq}">
    				<div class="convention pb-3" style="margin: auto; width: 300px; min-height: 370px; background-color: white;">
    					<div class="text-center">
    						<img src="${pageContext.request.contextPath}/img/contest_image.PNG" style="width: 300px; height: 170px;">
    						<div class="card-img-overlay py-5 w-100" style="height: 170px;">
							    <p class="m-auto pt-1 text-center align-self-center" style="font-size: 46px; font-weight: 500;">${dto.grouping }</p>
							</div>
    					</div>
    					<p class="px-2 pt-2" style="font-size: 20px; min-height: 70px;"><a href="${pageContext.request.contextPath}/contest/detail?title=${dto.title }&contest_seq=${dto.contest_seq}" style="color: black;">${dto.title }</a></p>
    					<p class="px-2 py-0" style="font-size: 17px;" id="price${dto.contest_seq}"></p>
    					<p class="px-2 py-0" style="font-size: 17px;" id="date${dto.enddate }">기간 : <span class="mr-1">~</span>${dto.enddate}</p>
    					<p class="px-2 py-0" style="font-size: 17px; color:red; display:none;" id="time${dto.contest_seq }">기간  지남</p>
    				</div>
    				</div>
    			<input type="hidden" id="hid${dto.contest_seq}" value="${dto.price}">
    			
    			
    			<script>
    			var num = $("#hid${dto.contest_seq}").val();
    			console.log(num);
    			function addComma(num) {
    				  var regexp = /\B(?=(\d{3})+(?!\d))/g;
    				  return num.toString().replace(regexp, ',');
    				}
  				$("#price${dto.contest_seq}").html("상금 : "+(addComma(num))+"원");
  			    			
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
    				console.log("기간안지남")

    			}else if(inputyear==outputyear){ //년도 같을때
    				if(inputmonth>outputmonth){
    					console.log("기간안지남");
    				}
    				else if(inputmonth=outputmonth){    					
    					if(inputdate>=outputdate){
    						console.log("기간안지남");
    					}else{
    						console.log("기간지남");
    						$("#time${dto.contest_seq}").css("display","block");
    					}
    				}else{
    				console.log("기간지남");
    				$("#time${dto.contest_seq}").css("display","block");
    				}	

        			}else{
        				console.log("기간지남");
        				$("#time${dto.contest_seq}").css("display","block");
        			}
    			
    			</script>
			</c:forEach>
			</c:otherwise>
			</c:choose>
    		</div>
    	</div>
    </div>
    
    
    <script>
    var loginInfo = "${sessionScope.loginInfo}";
    var adminInfo = "${sessionScope.adminInfo}";
    
    	$("#contestopen").on("click",function(){
    		if(loginInfo=="" && adminInfo==""){
    			alert("로그인 후 이용해주세요");
    			$("#gotologin").click();    			
    		}else{
    			location.href = "newOpen.do"
    		}
    	})
    
    </script>
    
    
    <jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>