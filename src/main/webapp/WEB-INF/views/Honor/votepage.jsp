<%@ page import="kh.picsell.dto.HonorDTO" %>
<%@ page import="kh.picsell.dto.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoVote | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="container-fluid m-0 py-5 text-center" style="height: 700px; background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<c:choose>
		<c:when test="${votecheck==1}">
		<h2>실시간 투표 순위</h2>
		<div class="row w-100 m-auto">
			<c:forEach items="${hlist1}" var="hfir">
				
			</c:forEach>
		</div>
		</c:when>
		</c:choose>
		<c:otherwise>
		<h2>명예의 전당 투표하기</h2>
		<h5 class="mt-5 mb-3">이번달 명예의 전당 후보 작가님들 입니다!</h5>
		<h5>당신의 명예의 전당에 투표해 주세요!</h5>
		<div class="row w-100 m-auto">
			<c:forEach begin="0" end="2" step="1" var="i">
			
			</c:forEach>
		</div>
		</c:otherwise>
	</div>
	
<c:choose>
<c:when test="${votecheck==1}">
<h3>현재 투표순위</h3>
<div class="row">
<c:forEach items="${hlist1}" var="hfir">
    	<div class="card m-auto col-3" style="width: 15rem;border:3px solid gold;border-style: outset;margin-left:30px;">
    	<h5 style="text-align:center">1위 ${hfir.nickname} 작가님</h5>
                      <img src="/profileimage/${img1.profileimg }" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">현재 투표수 ${hfir.honorpoint}</p>
                        <p class="text-center"><input type="button" class="detailpic" id="showpic${hfir.honor_seq}" value="사진보기"></p>
                       
                        <script>

                        	var nick1 = "${hfir.nickname}";
                        	//$("#showpic${firdto.id}").on("click",function(){                        		
                      //  window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nickname ,"Best3사진", "width=800,height=600,resizable=no");
                        //	})
                        	
						$("body").on("click","#showpic${hfir.honor_seq}",function(){
                            window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nick1 ,"Best3사진", "width=900,height=400,resizable=no");
                        })
                        </script>
                      </div>
                    </div>

    	</c:forEach>
    	<c:forEach items="${hlist2}" var="sfir">
    	<div class="card m-auto col-3" style="width: 15rem;border:3px solid silver;border-style: outset;margin-left:30px;">
    	<h5 style="text-align:center">2위 ${sfir.nickname} 작가님</h5>
                      <img src="/profileimage/${img2.profileimg }" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">현재 투표수 ${sfir.honorpoint}</p>
                        <p class="text-center"><input type="button" class="detailpic" id="showpic${sfir.honor_seq}" value="사진보기"></p>
                       
                        <script>

                        	var nick2 = "${sfir.nickname}";
                        	//$("#showpic${firdto.id}").on("click",function(){                        		
                      //  window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nickname ,"Best3사진", "width=800,height=600,resizable=no");
                        //	})
                        	
						$("body").on("click","#showpic${sfir.honor_seq}",function(){
                            window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nick2 ,"Best3사진", "width=900,height=400,resizable=no");
                        })
                        </script>
                      </div>
                    </div>

    	</c:forEach>
    	<c:forEach items="${hlist3}" var="tfir">
    	<div class="card m-auto col-3" style="width: 15rem;border:3px solid #e39e66;border-style: outset;margin-left:30px;">
    	<h5 style="text-align:center">3위 ${tfir.nickname} 작가님</h5>
                      <img src="/profileimage/${img3.profileimg }" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">현재 투표수 ${tfir.honorpoint}</p>
                        <p class="text-center"><input type="button" class="detailpic" id="showpic${tfir.honor_seq}" value="사진보기"></p>
                       
                        <script>

                        	var nick3 = "${tfir.nickname}";
                        	//$("#showpic${firdto.id}").on("click",function(){                        		
                      //  window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nickname ,"Best3사진", "width=800,height=600,resizable=no");
                        //	})
                        	
						$("body").on("click","#showpic${sfir.honor_seq}",function(){
                            window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nick3 ,"Best3사진", "width=900,height=400,resizable=no");
                        })
                        </script>
                      </div>
                    </div>

    	</c:forEach>
    	</div>
    	<hr>
    	<input type="button" value="홈으로" id="gohome">
    	<script>
    	$("#gohome").on("click",function(){
    		location.href="${ageContext.request.contextPat}/home";
    	})
    	</script>
</c:when>
<c:otherwise>
<h5>이번달 명예의전당후보 작가님들입니다</h5><br>
<h5>투표해주세요!</h5>
<div class="row">
<c:forEach begin="0" end="2" step="1" var="i">
<div class="card m-auto col-2" style="width: 15rem;border:3px solid black;border-style:outset;margin-left:30px;">
                      <img src="/profileimage/${mList[i].profileimg }" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">${list[i].nickname} 작가님</p>
                        <p class="text-center"><input type="button" class="detailpic" id="sshowpic${list[i].honor_seq}" value="사진보기"></p>
                        
                        <script>
                        
                        	
                        	$("#sshowpic${list[i].honor_seq}").on("click",function(){
                        window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+"${list[i].nickname}" ,"Best3사진", "width=900,height=400,resizable=no");
                        	});
                        </script>
                      </div>
                    <div style="text-align:center">
                    <input type="radio" name="who" value="${list[i].nickname}" style="text-align:center">
                    </div>
                    </div>
          
</c:forEach>
</div>
<hr style="width:500px;">
<div style="text-align:center">
<input type="button" value="투표" id="vote"></div>
<script>
$("#vote").on("click",function(){
	var radioVal = $('input[name="who"]:checked').val();
	if(radioVal==null){
		alert("투표할 작가님을 선택해주세요");
	}else{
$.ajax({
	url:"${pageContext.request.contextPath}/honor/vote.do",
	type:"post",
	data:{nickname:radioVal}
}).done(function(res){
	if(res=="이미완료"){
		alert("이미 투표를 완료했습니다");
		return false;
	}else if(res=="ㅇ"){
		alert("투표를 성공적으로 완료했습니다");
		location.href="${pageContext.request.contextPath}/honor/govote.do";
	}else if(res=="ㄴ"){
		alert("투표에 실패했습니다");
		return false;
	}
	else if(res=="s"){
		alert("투표에 실패했습니다");
		return false;
	}
}).fail(function(res){
	if(res=="서버"){
		alert("서버문제입니다 관리자에게 문의바랍니다");
		return false;
	}
});}
})
</script>
</c:otherwise>
</c:choose>
<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>