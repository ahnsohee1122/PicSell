<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>

        <style>
            span.history{border:1px solid black; border-radius:3px; padding:5px; margin:5px;}
            .filter-remove{color:red; margin:15px;}
            .filter-remove:hover{cursor:pointer;}
        </style>

        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <link rel="stylesheet" href="/css/justifiedGallery.css" />
        <script src="/js/jquery.justifiedGallery.js"></script>
    </head>

    <body>

        <form action="/Search.do" method="get" id="frm">
            <input type="text" id="search" name="tag" value="${searchKeyword }"><button>검색</button>
        </form>

        <br> 
        <br>

        <div>
            <input class="filter" type="radio" name="file_extension" value="jpg">jpg
            <input class="filter" type="radio" name="file_extension" value="png">png
        </div>

        <div>
            <input class="filter" type="radio" name="usage" value="상업">상업
            <input class="filter" type="radio" name="usage" value="교육">교육
        </div>

        <div>
            <input class="filter" type="radio" name="orderBy" value="img_sysdate">최신순
            <input class="filter" type="radio" name="orderBy" value="viewcount">조회순
        </div>

        <div>
            <span>결과 내 재검색</span>
            <input type="text" id="keyword2"><button id="keyword2Btn">확인</button>
        </div>


        <div id=historyBox>
            <input type="hidden" name="tag" value="${searchKeyword }">
            <br>
        </div>

        <div id="gallery"></div>

        <script>
	        let isEnd = false;
	        var count = 2;

	        $(function(){
	        	var timeout;
	            $(window).scroll(function(){
	            	clearTimeout(timeout);  
	            	timeout = setTimeout(function() {
	                	let $window = $(this);
	    	                let scrollTop = $window.scrollTop();
	    	                let windowHeight = $window.height();
	    	                let documentHeight = $(document).height();
	    	                
	    	                if(scrollTop + windowHeight + 5 > documentHeight){
	    	                    fetchList(count);
	    	                    count++;
	    	                }
	                }, 50);
	            })   
	            fetchList(1);
	        })
	
	        let fetchList = function(currentPage){

	            if(isEnd == true){
	                return;
	            }
	
	            $.ajax({
	                url: "/Align.do",
	                type:"GET",
	                data:{
	                    currentPage : currentPage,
	                    tag: $("#historyBox input[name=tag]").val(),
	                    file_extension: $("#historyBox input[name=file_extension]").val(),
	                    usage: $("#historyBox input[name=usage]").val(),
	                    orderBy: $("#historyBox input[name=orderBy]").val(),
	                    keyword2: $("#historyBox input[name=keyword2]").val()
	                },
	                dataType:"json",
	                success:function(resp){
	                    console.log(resp)
	                    let length = resp.length;
	                    console.log(length)
	                    if(length < 5){
	                        isEnd = true;
	                    }
	                    
	                    if(length == 0){
	                    	$("#gallery").remove(); // JustifiedGallery 가 적용된 <div id=gallery> 에서는 밑에 응답 div 추가해도 안 보임(이유는 모름). 그래서 삭제하고 다시 만들어 주는거~
	                    	$("body").append("<div id=gallery></div>");
	        	            var html = "<div><p>죄송합니다.</p><p>찾으시는 이미지에 대한 검색결과가 없습니다.</p></div>"
	        	            $("#gallery").css("text-align","center");
	        	            $("#gallery").append(html);
	        	            return;
	                    }
	                    
	                    for(i=0; i<resp.length;i++){
	                        console.log(resp[i].sysName)
	                        renderList(resp[i].sysName, resp[i].tag);
	                    }
	                    console.log("여기까지 화면에 이미지 개수 : " + $('.image').length);
	                    console.log("===========================================");
	                }
	            })
	        }
	
	        let renderList = function(sysName,tag){
	            tags = tag.replace(/{/gi,"#").replace(/}/gi,"");
	
	            var html = "<div class=image><a href=#><img src=/writeruploadfiles/"+sysName+" alt="+tags+"></a></div>"
	            $("#gallery").append(html);
	            $("#gallery").justifiedGallery({
	                rowHeight : 200,
	                lastRow : 'nojustify',
	                margins : 10
	            }); 
	        }
	        
	        
	        
	        $("#frm").on("submit",function(){
	        	var keyword = $("#search").val();
	        	if(keyword == ""){
	        		alert("키워드를 입력해주세요.");
	        		return false;
	        	}
	        })
	        
            $("#keyword2Btn").on("click",function(){
                var name = "keyword2";
                var value = $("#keyword2").val();
                
                if(value == ""){
                	alert("키워드를 입력해주세요.");
                }else{
                    var filter2 = $("#historyBox span input[name="+name+"]");

                    if(filter2.length == 0){
                        var span = $("<span class=span-box><input type=hidden name="+name+" value='"+value+"'><span class=history name="+name+">포함된 키워드: "+value+"<span class=filter-remove>x</span></span></span>");
                        $("#historyBox").append(span);
                    }else{
                        $(".span-box > input[name="+name+"]").prop("value",value);
                        $(".span-box > input[name="+name+"] ~ span[name="+name+"]").html("포함된 키워드: " +value);
                        $(".span-box > input[name="+name+"] ~ span[name="+name+"]").append("<span class=filter-remove>x</span>");
                    }
                    $("#gallery").empty(); // 모든 자식 노드 삭제
    				isEnd = false;
    				count = 2;
                    fetchList(1);
                }
            })

            $(".filter").on("change",function(){
                if($(".filter:checked")){
                    var name = $(this).prop("name");
                    var value = $(this).prop("value");
                    // 		console.log(name);
                    // 		console.log(value);

                    var filter = $("#historyBox span input[name="+name+"]");
                    // 	 	console.log(filter.length);

                    if(filter.length == 0){
                        var span = $("<span class=span-box><input type=hidden name="+name+" value="+value+"><span class=history name="+name+">"+value+"<span class=filter-remove>x</span></span></span>");
                        $("#historyBox").append(span);
                    }else{
                        $(".span-box > input[name="+name+"]").prop("value",value);
                        $(".span-box > input[name="+name+"] ~ span[name="+name+"]").html(value);
                        $(".span-box > input[name="+name+"] ~ span[name="+name+"]").append("<span class=filter-remove>x</span>");
                    }
                    $("#gallery").empty(); // 모든 자식 노드 삭제
                    isEnd = false;
                    count = 2;
                    fetchList(1);
                }
            })

            $("body").on("click",".filter-remove",function(){	
            	$(this).closest(".span-box").remove();
            	$("#gallery").empty(); // 모든 자식 노드 삭제
            	isEnd = false;
            	count = 2;
            	fetchList(1);
            })
            
        </script>
    </body>
</html>