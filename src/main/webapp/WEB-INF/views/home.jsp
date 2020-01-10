<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> <!-- 검색 스타일시트 -->
<link href="https://fonts.googleapis.com/css?family=Inconsolata&display=swap" rel="stylesheet"> <!-- BestPic 글씨체 -->
<style>
/*    글씨체 css */
	@font-face {font-family: 'Cafe24Oneprettynight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff'); font-weight: normal; font-style: normal; }
	
/*    메인 이미지 css */
    .main {width: 100%; height: 600px; background-image: url('${pageContext.request.contextPath}/img/main_banner.jpg'); background-repeat: no-repeat; background-size: cover; background-attachment: fixed;}
    
/*    검색기능 css */
    .searchbar{margin-bottom: auto; margin-top: auto; height: 50px; background-color: white; border-radius: 30px; padding: 10px;}
    .search_input{color: white; border: 0; outline: 0; background: none; width: 0; caret-color:transparent; line-height: 30px; transition: width 0.4s linear; font-size: 14px;}
    .search_input::placeholder {color: #353535;}
    .hashTag {display: none;}
    .search_icon {color: #353535;}
    .searchbar:hover > .search_input{padding: 0 10px; width: 400px; caret-color: #e74c3c; transition: width 0.4s linear;}
    .searchbar:hover > .hashTag {display: block; text-align: left;}
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
<script>
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
</script>
</head>
<body>
	<jsp:include page="key/top.jsp" flush="false"/>
	
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
                          <input class="search_input" type="text" name="" placeholder="이미지 검색 / 두 단어 이상 검색시 띄어쓰기로 구분" style="color: #353535;">
<!--                          <button class="search_icon" style="border: 0px; background-color: #353535;"><i class="fas fa-search"></i></button>-->
                          <a href="#" class="search_icon"><i class="fas fa-search"></i></a> <!-- 검색 버튼 : a 태그 대신 위에 버튼으로 바꿀 수 있음-->
                          <div class="hashTag m-3">
                              <span class="pr-1" style="font-size: 13px;">#겨울</span>
                              <span class="pr-1" style="font-size: 13px;">#웨딩</span>
                              <span class="pr-1" style="font-size: 13px;">#인테리어</span>
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
        <div class="row m-auto" style="height: 1000px;">
            여기는 베스트사진
        </div>
    </div>
    <hr class="p-0 m-0">
    
<!--  이달의 작가님 -->
    <div class="container-fluid" style="background-color: white;">
        <div class="container px-0 py-5">
            <div class="row">
                <p class="contest01"><img src="${pageContext.request.contextPath}/img/crown.png" style="width: 50px; height: 50px;">명예의 전당<img src="${pageContext.request.contextPath}/img/crown.png" style="width: 50px; height: 50px;"></p>
            </div>
            <div class="row">
                <div class="col-12 col-xl-3">
                    <div class="card m-auto" style="width: 15rem;">
                      <img src="img/ompangi.gif" class="card-img-top m-auto" style="width: 200px; height: 200px;">
                      <div class="card-body">
                        <h5 class="card-title" style="font-size: 20px; font-family: 'Cafe24Oneprettynight';">애소</h5>
                        <p class="card-text" style="font-size: 18px; font-family: 'Cafe24Oneprettynight';"><img src="img/best_likes.png" style="width: 30px; height: 30px;">LIKE 4816</p>
                        <p class="text-center"><a href="#" class="btn btn-outline-dark btn-sm">작가피드 보러가기</a></p>
                      </div>
                    </div>
                </div>
                <div class="col-xl-9 d-none d-xl-block">
                    <div id="carousel" class="carousel slide" data-ride="carousel">
                      <div class="carousel-inner">
                        <div class="carousel-item active" style="height: 370px;">
                          <img src="${pageContext.request.contextPath}/img/pic01.jpg" class="d-block m-auto h-100">
                        </div>
                        <div class="carousel-item" style="height: 370px;">
                          <img src="${pageContext.request.contextPath}/img/pic02.jpg" class="d-block m-auto h-100">
                        </div>
                        <div class="carousel-item" style="height: 370px;">
                          <img src="${pageContext.request.contextPath}/img/pic03.jpg" class="d-block m-auto h-100">
                        </div>
                      </div>
                      <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                      </a>
                      <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                      </a>
                    </div>
                </div>
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
                        <div class="item">
                            <div class="pad15">
                                <p><img src="${pageContext.request.contextPath}/img/contest.jpg" style="width: 250px; height: 170px;"></p>
                                <p class="lead">웨딩사진 공모전</p>
                                <p class="text-danger">모집중</p>
                                <p>~ 20/01/30</p>
                                <p><a href="contest" class="btn btn-outline-dark btn-sm">참여하기</a></p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="pad15">
                                <p><img src="${pageContext.request.contextPath}/img/contest.jpg" style="width: 250px; height: 170px;"></p>
                                <p class="lead">웨딩사진 공모전</p>
                                <p class="text-danger">집계중</p>
                                <p>19/12/30 ~ 20/01/30</p>
                                <p><a href="contest" class="btn btn-outline-dark btn-sm">참여하기</a></p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="pad15">
                                <p><img src="${pageContext.request.contextPath}/img/contest.jpg" style="width: 250px; height: 170px;"></p>
                                <p class="lead">웨딩사진 공모전</p>
                                <p class="text-danger">집계중</p>
                                <p>19/12/30 ~ 20/01/30</p>
                                <p><a href="contest" class="btn btn-outline-dark btn-sm">참여하기</a></p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="pad15">
                                <p><img src="${pageContext.request.contextPath}/img/contest.jpg" style="width: 250px; height: 170px;"></p>
                                <p class="lead">웨딩사진 공모전</p>
                                <p class="text-danger">집계중</p>
                                <p>19/12/30 ~ 20/01/30</p>
                                <p><a href="contest" class="btn btn-outline-dark btn-sm">참여하기</a></p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="pad15">
                                <p><img src="${pageContext.request.contextPath}/img/contest.jpg" style="width: 250px; height: 170px;"></p>
                                <p class="lead">웨딩사진 공모전</p>
                                <p class="text-danger">집계중</p>
                                <p>19/12/30 ~ 20/01/30</p>
                                <p><a href="contest" class="btn btn-outline-dark btn-sm">참여하기</a></p>
                            </div>
                        </div>
                    </div>
                    <button class="btn border-0 leftLst"><img src="${pageContext.request.contextPath}/img/previous01.png" style="width: 17px; height: 17px;"></button>
                    <button class="btn border-0 rightLst"><img src="${pageContext.request.contextPath}/img/next01.png" style="width: 17px; height: 17px;"></button>
                </div>
            </div>
        </div>
    </div>
	
	<jsp:include page="key/bottom.jsp" flush="false"/>
</body>
</html>