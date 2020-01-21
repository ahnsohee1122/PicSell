<%@ page import="kh.picsell.dto.HonorDTO" %>
<%@ page import="kh.picsell.dto.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명예의 전당</title>
<style>
.honorlist {
			min-width:230px;
			border: solid 5px gold;
			-webkit-animation-name: movingPara;
			-webkit-animation-duration: 2s;
			animation-name: movingPara;
			animation-duration: 2s;
		 animation-iteration-count: infinite;
		}
		@-webkit-keyframes movingPara {
			0% { border-color: gold; }
			20% { border-color: #fffccc; }
			40% { border-color: yellow; }
			50% { border-color: #fffccc; }
			60% { border-color: gold; }
			80% { border-color: #fffccc; }
			100% { border-color: yellow; }
		}
		@keyframes movingPara {
			0% { border-color: gold; }
			20% { border-color: #fffccc; }
			40% { border-color: yellow; }
			50% { border-color: #fffccc; }
			60% { border-color: gold; }
			80% { border-color: #fffccc; }
			100% { border-color: yellow; }
		}
</style>
<jsp:include page="../key/top.jsp" flush="false"/>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<c:choose>


<c:when test="${honorlist.size()==0}">
<h6>역대 명예의전당 수상자목록</h6>
<div class="row" style="margin-left:30px;">
<c:forEach items = "${enterlist}" var="top">
<div class="card m-auto col-3 honorlist" style="width: 15rem;margin-left:30px;">
    	<h5 style="text-align:center;font-family: 'Cafe24Oneprettynight'" id="htop${top.honorlist_seq}"></h5>
                      <img src="${pageContext.request.contextPath}/img/ompangi.gif" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">받은 득표수 ${top.honorpoint}</p>
                        <p class="text-center"><input type="button" class="detailpic" id="showpic${top.honorlist_seq}" value="사진보기"></p>
                       
                        <script>
						var when = "${top.honor_date}";
						var topyear = when.substr(0,4);
						var topmonth = when.substr(5,2);
						$("#htop${top.honorlist_seq}").html(topyear+"년 "+topmonth+"월<br>"+"${top.nickname} 작가님");
                        	//$("#showpic${firdto.id}").on("click",function(){                        		
                      //  window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nickname ,"Best3사진", "width=800,height=600,resizable=no");
                        //	})
                        	
						$("body").on("click","#showpic${top.honorlist_seq}",function(){
                            window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+"${top.nickname}" ,"Best3사진", "width=900,height=400,resizable=no");
                        })
                        </script>
                      </div>
                    </div>
</c:forEach>
</div>
</c:when>
<c:otherwise>
<hr>
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
</c:otherwise>
</c:choose>
<c:choose>

<c:when test="${list.size()==0}">
    	<h4 style="text-align:center">작가좋아요 랭킹</h4>
<div class="row">
    	<div class="imglist col-3">
    	<c:forEach items="${list1}" var="firdto">
    	<h3>1위 ${firdto.nickname} 작가님</h3>
    	<div class="card m-auto" style="width: 15rem;border:3px solid gold;border-style: outset;">
                      <img src="/profileimage/${img1.profileimg }" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      
                      <div class="card-body">
                        
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">LIKE ${firdto.likepoint }</p>
                        <p class="text-center"><input type="button" class="detailpic" id="showpic${firdto.id}" value="사진보기"></p>
                       
                        <script>

                        	var nickname1 = "${firdto.nickname}";
                        	//$("#showpic${firdto.id}").on("click",function(){                        		
                      //  window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nickname ,"Best3사진", "width=800,height=600,resizable=no");
                        //	})
                        	
						$("body").on("click","#showpic${firdto.id}",function(){
                            window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nickname1 ,"Best3사진", "width=900,height=400,resizable=no");
                        })
                        </script>
                      </div>
                    </div>

    	</c:forEach>
    	</div>
    	<div class="imglist col-3">
    	<c:forEach items="${list2}" var="secdto">
    	<h3>2위 ${secdto.nickname} 작가님</h3>
    	<div class="card m-auto" style="width: 15rem;border:3px solid silver;border-style: outset;">
                      <img src="/profileimage/${img2.profileimg }" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">LIKE ${secdto.likepoint }</p>
                        <p class="text-center"><input type="button" class="detailpic" id="showpic${secdto.id}" value="사진보기"></p>
                       
                        <script>
                        
                        	var nickname2 = "${secdto.nickname}";
                        	$("#showpic${secdto.id}").on("click",function(){                        		
                        window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nickname2 ,"Best3사진", "width=900,height=400,resizable=no");
                        	})
                        </script>
                      </div>
                    </div>
 

    	</c:forEach>
    	</div>
    	<div class="imglist col-3">
    	<c:forEach items="${list3}" var="thirdto">
    	<h3>3위 ${thirdto.nickname} 작가님</h3>
    	<div class="card m-auto" style="width: 15rem;border:3px solid #e39e66;border-style:outset;">
                       <img src="/profileimage/${img3.profileimg }" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">LIKE ${thirdto.likepoint }</p>
                        <p class="text-center"><input type="button" class="detailpic" id="showpic${thirdto.id}" value="사진보기"></p>
                        
                        <script>
                        
                        	var nickname3 = "${thirdto.nickname}";
                        	$("#showpic${thirdto.id}").on("click",function(){                        		
                        window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+nickname3 ,"Best3사진", "width=900,height=400,resizable=no");
                        	})
                        </script>
                      </div>
                    </div>
 
                     
    	</c:forEach>
    	</div>
    	</div>
</c:when>

<c:otherwise>
<hr>
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
                    <br>
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
		location.href="${pageContext.request.contextPath}/honor/mainlist.do";
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
</body>
</html>