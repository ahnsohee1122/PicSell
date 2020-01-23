<%@ page import="kh.picsell.dto.HonorDTO" %>
<%@ page import="kh.picsell.dto.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> <!-- 검색 스타일시트 -->
<link href="https://fonts.googleapis.com/css?family=Inconsolata&display=swap" rel="stylesheet"> <!-- BestPic 글씨체 -->
<link rel="stylesheet" href="/css/justifiedGallery.css" />
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

/*    글씨체 css */
   @font-face {font-family: 'Cafe24Oneprettynight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff'); font-weight: normal; font-style: normal; }
   
/*    메인 이미지 css */
    .main {width: 100%; height: 600px; background-image: url('${pageContext.request.contextPath}/img/main_banner.jpg'); background-repeat: no-repeat; background-size: cover; background-attachment: fixed;}
    
/*    검색기능 css */
    .searchbar{margin-bottom: auto; margin-top: auto; height: 50px; background-color: white; border-radius: 30px; padding: 10px;}
    .search_input{padding: 0 10px; color: white; border: 0; width: 400px; background: none; line-height: 30px; font-size: 14px;}
    .search_input::placeholder {color: #353535;}
    .hashTag {text-align: left;}
    .search_icon {color: #353535;}
    .searchbar:hover > .search_icon{color: #e74c3c;}
    .search_icon{height: 30px; width: 30px; float: right; display: flex; justify-content: center; align-items: center; border-radius: 50%; color:dark; text-decoration:none;}
    
/*    이달의 작가님 css */
    .contest01 {width: 100%; margin: 0 0 40px 0; padding: 0px; text-align: center; font-size: 27px; font-family: 'Cafe24Oneprettynight';}
    .card-text {font-size: 16px;}
    
/*    이달의 공모전 css */
    .contest02 {width: 100%; margin: 0 0 40px 0; padding: 0px; text-align: center; font-size: 27px; font-family: 'Cafe24Oneprettynight';}
    .contest02::after {display: inline-block; margin: 0 0 3px 15px; height: 1px; content: ""; text-shadow: none; background-color: #999; width: 30%;}
    .contest02::before {display: inline-block; margin: 0 15px 3px 0; height: 1px; content: ""; text-shadow: none; background-color: #999; width: 30%;}
    
    .MultiCarousel {float: left; overflow: hidden; margin: auto; padding: 0; width: 100%; position: relative;}
    .MultiCarousel .MultiCarousel-inner {transition: 1s ease all; float: left;}
    .MultiCarousel .MultiCarousel-inner .item {float: left;}
    .MultiCarousel .MultiCarousel-inner .item > div {text-align: center; margin: auto; background: white; color: black; width: 250px; height: 380px;}
    .MultiCarousel .leftLst, .MultiCarousel .rightLst {position: absolute; border-radius: 30%; top: calc(50% - 20px);}
    .MultiCarousel .leftLst {left: 20px;}
    .MultiCarousel .rightLst {right: 20px;}
    .MultiCarousel .leftLst.over, .MultiCarousel .rightLst.over {pointer-events: none;}
    
    .lead {font-weight: 500; font-family: 'Cafe24Oneprettynight'; font-size: 26px;}
</style>


<script type="text/javascript"> 

   // === 베스트 공모전 캐러셀 ===
   $(document).ready(function () {
       var itemsMainDiv = ('.MultiCarousel');
       var itemsDiv = ('.MultiCarousel-inner');
       var itemWidth = "";
   
       $('.leftLst, .rightLst').click(function () {
           var condition = $(this).hasClass("leftLst");
           if (condition)
               click(0, this);
           else
               click(1, this)
       });
       ResCarouselSize();
   
       $(window).resize(function () {
           ResCarouselSize();
       });
   
       //this function define the size of the items
       function ResCarouselSize() {
           var incno = 0;
           var dataItems = ("data-items");
           var itemClass = ('.item');
           var id = 0;
           var btnParentSb = '';
           var itemsSplit = '';
           var sampwidth = $(itemsMainDiv).width();
           var bodyWidth = $('body').width();
           $(itemsDiv).each(function () {
               id = id + 1;
               var itemNumbers = $(this).find(itemClass).length;
               btnParentSb = $(this).parent().attr(dataItems);
               itemsSplit = btnParentSb.split(',');
               $(this).parent().attr("id", "MultiCarousel" + id);
   
   
               if (bodyWidth >= 1200) {
                   incno = itemsSplit[3];
                   itemWidth = sampwidth / incno;
               }
               else if (bodyWidth >= 992) {
                   incno = itemsSplit[2];
                   itemWidth = sampwidth / incno;
               }
               else if (bodyWidth >= 768) {
                   incno = itemsSplit[1];
                   itemWidth = sampwidth / incno;
               }
               else {
                   incno = itemsSplit[0];
                   itemWidth = sampwidth / incno;
               }
               $(this).css({ 'transform': 'translateX(0px)', 'width': itemWidth * itemNumbers });
               $(this).find(itemClass).each(function () {
                   $(this).outerWidth(itemWidth);
               });
   
               $(".leftLst").addClass("over");
               $(".rightLst").removeClass("over");
           });
       }
   
       //this function used to move the items
       function ResCarousel(e, el, s) {
           var leftBtn = ('.leftLst');
           var rightBtn = ('.rightLst');
           var translateXval = '';
           var divStyle = $(el + ' ' + itemsDiv).css('transform');
           var values = divStyle.match(/-?[\d\.]+/g);
           var xds = Math.abs(values[4]);
           if (e == 0) {
               translateXval = parseInt(xds) - parseInt(itemWidth * s);
               $(el + ' ' + rightBtn).removeClass("over");
   
               if (translateXval <= itemWidth / 2) {
                   translateXval = 0;
                   $(el + ' ' + leftBtn).addClass("over");
               }
           }
           else if (e == 1) {
               var itemsCondition = $(el).find(itemsDiv).width() - $(el).width();
               translateXval = parseInt(xds) + parseInt(itemWidth * s);
               $(el + ' ' + leftBtn).removeClass("over");
   
               if (translateXval >= itemsCondition - itemWidth / 2) {
                   translateXval = itemsCondition;
                   $(el + ' ' + rightBtn).addClass("over");
               }
           }
           $(el + ' ' + itemsDiv).css('transform', 'translateX(' + -translateXval + 'px)');
       }
   
       //It is used to get some elements from btn
       function click(ell, ee) {
           var Parent = "#" + $(ee).parent().attr("id");
           var slide = $(Parent).attr("data-slide");
           ResCarousel(ell, Parent, slide);
       }
   
   });
   // === 베스트 공모전 캐러셀 끝 ===
	   

	
	   // 출석체크 이벤트 팝업창 
	function getCookie(name) {
		var cookie = document.cookie;
		if (document.cookie != "") {
			var cookie_array = cookie.split("; ");
			for ( var index in cookie_array) {
				var cookie_name = cookie_array[index].split("=");
				if (cookie_name[0] == "popupYN") {
					return cookie_name[1];
				}
			}
		}
		return;
	}
	function openPopup(url) {
		var cookieCheck = getCookie("popupYN");
		if (cookieCheck != "N")
			window.open(url, '', 'width=400,height=375,left=0,top=0')
	}
	
</script>
</head>
<body  onload="javascript:openPopup('${pageContext.request.contextPath}/event/pop.do')">
   <jsp:include page="key/top.jsp" flush="false"/>
   <script src="/js/jquery.justifiedGallery.js"></script>
   
<!--  Main -->
    <div class="container-fluid p-0">
        <div class="main text-center">
            <div style="position: relative; top: 40%;">
                <div class="text-white" style="font-family: 'Cafe24Oneprettynight'; font-size: 4vmin;">저작권 걱정 없이 사용하는 상업용 이미지</div>
                <div class="text-white" style="font-size: 4vmin;">ㅡ</div>
                <div class="text-light mt-4 mb-4">
                    <div class="container h-100">
                      <div class="d-flex justify-content-center h-100">
                        <div class="searchbar">
                             <input id="search" class="search_input" type="text" name="" placeholder="이미지 검색 / 두 단어 이상 검색시 띄어쓰기로 구분" style="color: #353535;">
                           <button id="searchBtn" class="search_icon" style="border: 0px; background-color: white !important;"><i class="fas fa-search"></i></button>
                           <div class="hashTag m-3">
                              <span class="pr-1" style="font-size: 13px;"><a href="/Search.do?tag=겨울" style="color: white;">#겨울</a></span>
                               <span class="pr-1" style="font-size: 13px;"><a href="/Search.do?tag=웨딩" style="color: white;">#웨딩</a></span>
                               <span class="pr-1" style="font-size: 13px;"><a href="/Search.do?tag=인테리어" style="color: white;">#인테리어</a></span>
                            </div>
                        </div>
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<!--  Best Pic -->
    <div class="container-fluid p-0">
        <div class="row mt-4 mb-0 mx-auto px-3">
           <span style="font-family: 'Cafe24Oneprettynight'; font-size: 30px;">BEST PIC</span>
        </div>
        <hr class="p-0 m-0">
        <div class="row m-auto">
           <div class="col-12 col-md-12 col-xl-12 text-center px-0 py-3" id="gallery">
        	<c:forEach items="${imagelist }" var="imagelist">
           		 <div><a href='${pageContext.request.contextPath}/DetailImage.do?img_seq=${imagelist.img_seq }&nickname=${imagelist.nickname }' onclick="window.open(this.href,'','scrollbars=yes,resizable=yes,top=0, width=1300, height=950'); return false;" class='jg-entry entry-visible' style='width: 336px; height: 224.07px; top: 2146.92px; left: 347px;'><img src="/watermarkfiles/xsmarked_${imagelist.sysname }" ></a></div>
         	</c:forEach>
            </div>
           
        </div>
    </div>
    <hr class="p-0 m-0">

<!--  명예의 전당 -->    
    <div class="container-fluid" style="background-color: white;">
    	<div class="container px-0 py-5">
    		<div class="row w-100 m-auto text-center">
               <p class="contest01"><img src="${pageContext.request.contextPath}/img/crown.png" style="width: 50px; height: 50px;">명예의 전당<img src="${pageContext.request.contextPath}/img/crown.png" style="width: 50px; height: 50px;"></p>
            </div>
            <div class="row w-100 m-auto text-center" style="font-family: 'Cafe24Oneprettynight';">
            <c:choose>
			<c:when test="${loginInfo == null and adminInfo == null}">
				<div class="col-12 col-lg-3 p-0 m-auto">
					<div class="card py-3 m-auto" style="width: 17.5rem;">
						<h5 style="text-align: center;" id="htop${latelyhonor.honorlist_seq}"></h5>
	  					<img src="/profileimage/${latelyimg.profileimg}" class="card-img-top m-auto" style="width: 200px; height: 200px;">
					  	<div class="card-body p-0">
							<p class="card-text text-left mx-auto my-2 " style="font-size: 18px; font-family: 'Cafe24Oneprettynight'; width: 200px;"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">${latelyhonor.nickname}<span class="ml-1">작가님</span></p>
							<p class="card-text text-left mx-auto my-2" style="font-size: 18px; font-family: 'Cafe24Oneprettynight'; width: 200px;"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">${latelyhonor.honorpoint}<span class="ml-1">등록</span></p>
							<a href="#" class="btn btn-outline-secondary py-1 my-2">작가 피드 보러가기</a>
							
							<script>
								var when = "${latelyhonor.honor_date}";
								var topyear = when.substr(0,4);
								var topmonth = when.substr(5,2);
								$("#htop${latelyhonor.honorlist_seq}").html(topyear + " 년 " + topmonth + " 월 ");
		                        $("body").on("click","#showpic${latelyhonor.honorlist_seq}",function(){
		                            window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+"${latelyhonor.nickname}" ,"Best3사진", "width=900,height=400,resizable=no");
		                        })
	                        </script>
					  	</div>
					</div>
				</div>
				<div class="col-12 col-lg-9 d-none d-lg-block">
					<div class="w-100 h-100 px-3 py-4" style="border: 1px solid #dfdfdf; border-radius: 5px;">
						<div class="row w-100 mx-auto mb-3 text-left">
							<h4 class="w-100 mb-4">* 명예의 전당이란? *</h4>
							<h5 class="w-100">픽셀을 활발하게 이용해주시는 작가님들을 위해</h5>
							<h5 class="w-100">투표를 진행하여 작가님의 명예를 높여드리는 픽셀만의 이벤트입니다.</h5>
							<h5 class="w-100">픽셀의 회원이 되어 수익도 얻고, 명예의 전당까지 도전해보세요!</h5>
						</div>
						<hr class="mt-4 p-3">
						<div class="row w-100 mx-auto">
							<div class="col-6">
								<h5>투표하러가기</h5>
								<input type="button" value="gogo" id="govote" class="mt-3 btn btn-outline-primary" style="width: 100px">
							</div>
	                   		<div class="col-6">
	                   			<h5>역대 명예의전당 보러가기</h5>
	                   			<input type="button" value="gogo" id="gohonorlist" class="mt-3 btn btn-outline-primary" style="width: 100px">
	                   		</div>
						</div>
						<script>
		                    $("#govote").on("click",function(){
		                    	alert("로그인후 이용해주세요");
		                    	$("#gotologin").trigger('click');
		                    })
		                    
		                    $("#gohonorlist").on("click",function(){
		                    	location.href="${pageContext.request.contextPath}/honor/gohonorlist.do"
		                    })
                    </script>
					</div>
				</div>
			</c:when>
			<c:when test="${adminInfo!=null}">
				<div class="col-12 col-lg-3 p-0 m-auto">
					<div class="card py-3 m-auto" style="width: 17.5rem;">
						<h5 style="text-align: center;" id="htop${latelyhonor.honorlist_seq}"></h5>
	  					<img src="/profileimage/${latelyimg.profileimg}" class="card-img-top m-auto" style="width: 200px; height: 200px;">
					  	<div class="card-body p-0">
							<p class="card-text text-left mx-auto my-2 " style="font-size: 18px; font-family: 'Cafe24Oneprettynight'; width: 200px;"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">${latelyhonor.nickname}<span class="ml-1">작가님</span></p>
							<p class="card-text text-left mx-auto my-2" style="font-size: 18px; font-family: 'Cafe24Oneprettynight'; width: 200px;"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">${latelyhonor.honorpoint}<span class="ml-1">등록</span></p>
							<a href="#" class="btn btn-outline-secondary py-1 my-2">작가 피드 보러가기</a>
							
							<script>
								var when = "${latelyhonor.honor_date}";
								var topyear = when.substr(0,4);
								var topmonth = when.substr(5,2);
								$("#htop${latelyhonor.honorlist_seq}").html(topyear + " 년 " + topmonth + " 월 ");
		                        $("body").on("click","#showpic${latelyhonor.honorlist_seq}",function(){
		                            window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+"${latelyhonor.nickname}" ,"Best3사진", "width=900,height=400,resizable=no");
		                        })
	                        </script>
					  	</div>
					</div>
				</div>
				<div class="col-12 col-lg-9 d-none d-lg-block">
					<div class="w-100 h-100 px-3 py-4" style="border: 1px solid #dfdfdf; border-radius: 5px;">
						<div class="row w-100 mx-auto mb-3 text-left">
							<h4 class="w-100 mb-4">* 명예의 전당이란? *</h4>
							<h5 class="w-100">픽셀을 활발하게 이용해주시는 작가님들을 위해</h5>
							<h5 class="w-100">투표를 진행하여 작가님의 명예를 높여드리는 픽셀만의 이벤트입니다.</h5>
							<h5 class="w-100">관리자님들은, 투표를 등록하거나 종료 해주세요!</h5>
						</div>
						<hr class="mt-4 p-3">
						<div class="row w-100 mx-auto">
							<div class="col-6">
								<h5>명예의전당 등록/종료하기</h5>
								<input type="button" value="gogo" id="honorcontroll" class="mt-3 btn btn-outline-primary" style="width: 100px">
							</div>
	                   		<div class="col-6">
	                   			<h5>역대 명예의전당 보러가기</h5>
	                   			<input type="button" value="gogo" id="gohonorlist" class="mt-3 btn btn-outline-primary" style="width: 100px">
	                   		</div>
						</div>
						<script>
							$("#honorcontroll").on("click",function(){
		                    	location.href="${pageContext.request.contextPath}/honor/inserthonor.do";	
		                    })
		                    
		                    $("#gohonorlist").on("click",function(){
		                    	location.href="${pageContext.request.contextPath}/honor/gohonorlist.do"
		                    })
                    </script>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-12 col-lg-3 p-0 m-auto">
					<div class="card py-3 m-auto" style="width: 17.5rem;">
						<h5 style="text-align: center;" id="htop${latelyhonor.honorlist_seq}"></h5>
	  					<img src="/profileimage/${latelyimg.profileimg}" class="card-img-top m-auto" style="width: 200px; height: 200px;">
					  	<div class="card-body p-0">
							<p class="card-text text-left mx-auto my-2 " style="font-size: 18px; font-family: 'Cafe24Oneprettynight'; width: 200px;"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">${latelyhonor.nickname}<span class="ml-1">작가님</span></p>
							<p class="card-text text-left mx-auto my-2" style="font-size: 18px; font-family: 'Cafe24Oneprettynight'; width: 200px;"><img src="${pageContext.request.contextPath}/img/best_likes.png" style="width: 30px; height: 30px;">${latelyhonor.honorpoint}<span class="ml-1">등록</span></p>
							<a href="#" class="btn btn-outline-secondary py-1 my-2">작가 피드 보러가기</a>
							
							<script>
								var when = "${latelyhonor.honor_date}";
								var topyear = when.substr(0,4);
								var topmonth = when.substr(5,2);
								$("#htop${latelyhonor.honorlist_seq}").html(topyear + " 년  " + topmonth + " 월 ");
		                        $("body").on("click","#showpic${latelyhonor.honorlist_seq}",function(){
		                            window.open("${pageContext.request.contextPath}/honor/mandetail.do?nickname="+"${latelyhonor.nickname}" ,"Best3사진", "width=900,height=400,resizable=no");
		                        })
	                        </script>
					  	</div>
					</div>
				</div>
				<div class="col-12 col-lg-9 d-none d-lg-block">
					<div class="w-100 h-100 px-3 py-4" style="border: 1px solid #dfdfdf; border-radius: 5px;">
						<div class="row w-100 mx-auto mb-3 text-left">
							<h4 class="w-100 mb-4">* 명예의 전당이란? *</h4>
							<h5 class="w-100">픽셀을 활발하게 이용해주시는 작가님들을 위해</h5>
							<h5 class="w-100">투표를 진행하여 작가님의 명예를 높여드리는 픽셀만의 이벤트입니다.</h5>
							<h5 class="w-100">활발하게 이용해주신 작가님들이라면, 명예의 전당에 도전해보세요!</h5>
						</div>
						<hr class="mt-4 p-3">
						<div class="row w-100 mx-auto">
							<div class="col-6">
								<h5>투표하러가기</h5>
								<input type="button" value="gogo" id="govote" class="mt-3 btn btn-outline-primary" style="width: 100px">
							</div>
	                   		<div class="col-6">
	                   			<h5>역대 명예의전당 보러가기</h5>
	                   			<input type="button" value="gogo" id="gohonorlist" class="mt-3 btn btn-outline-primary" style="width: 100px">
	                   		</div>
						</div>
						<script>
							$("#govote").on("click",function(){
		                    	location.href="${pageContext.request.contextPath}/honor/govote.do"
		                    })
		                    
		                    $("#gohonorlist").on("click",function(){
		                    	location.href="${pageContext.request.contextPath}/honor/gohonorlist.do"
		                    })
                    </script>
					</div>
				</div>
			</c:otherwise>
			</c:choose>
            </div>
    	</div>
    </div>
    
<!--  이달의 공모전 -->
    <div class="container-fluid" style="background-color: #f4f2f5;">
        <div class="container px-0 py-5">
            <div class="row">
                <p class="contest02">이달의 공모전</p>
            </div>
            <div class="row">
                <div class="MultiCarousel" data-items="1,2,3,3" data-slide="1" id="MultiCarousel"  data-interval="1000">
                    <div class="MultiCarousel-inner">
                        <c:forEach items="${list }" var="list">
                        <div class="item">
                            <div class="pad15">
                                <p><img src="${pageContext.request.contextPath}/img/contest.jpg" style="width: 250px; height: 170px;"></p>
                                <p class="lead">${list.title }</p>
                                <p class="text-danger">집계중</p>
                                <p>${list.enddate }</p>
                                <p><a href="${pageContext.request.contextPath}/contest/detail?title=${list.title}&contest_seq=${list.contest_seq}" class="btn btn-outline-dark btn-sm">참여하기</a></p>
                            </div>
                        </div>
                        </c:forEach>
                        
                    </div>
                    <button class="btn border-0 leftLst"><img src="${pageContext.request.contextPath}/img/previous01.png" style="width: 17px; height: 17px;"></button>
                    <button class="btn border-0 rightLst"><img src="${pageContext.request.contextPath}/img/next01.png" style="width: 17px; height: 17px;"></button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    $("#gallery").justifiedGallery({
		rowHeight : 200,
	    lastRow : 'hide',
	    margins : 10
	}); 
    
    
    $("#searchBtn").on("click",function(){
		search();
    })
    
    $("#search").on("keyup",function(e){
    	if(e.keyCode == 13){
    		search();
    	}
    })
    
    function search(){
    	var tag = $("#search").val();
    	var writer = tag.substr(1);
    	
        var regex = /^\s*$/;
        var result = regex.exec(tag);
    	
    	if(result){
    		alert("키워드를 입력하세요");
    		return;
    	}else if(tag.charAt(0) == '@'){
    		$.ajax({
    			url:"/WriterExist.do",
    			type:"post",
    			data:{writer:writer}
    		}).done(function(resp){
    			console.log(resp);
    			if(resp == "yes"){
    				location.href = "/writer/writerpage?nickname="+writer;
    			}else if(resp == "no"){
    				alert("존재하는 작가가 아닙니다.");
    			}
    		}).fail(function(){
    			
    		});
    	}else{
    		location.href = "/Search.do?tag=" + encodeURI(tag);
    	}
    }
    
    </script>
   
   <jsp:include page="key/bottom.jsp" flush="false"/>
</body>
</html>