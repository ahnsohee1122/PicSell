<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchList | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="/css/justifiedGallery.css"/>
<style>
	span.history{border:1px solid black; border-radius:3px; padding:5px;}
    .filter-remove{color:red; margin:15px;}
    .filter-remove:hover{cursor:pointer;}
    .btn{padding:10px; width:130px;}
            
/*    글씨체 css */
	@font-face {font-family: 'Cafe24Oneprettynight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff'); font-weight: normal; font-style: normal; }
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<script src="/js/jquery.justifiedGallery.js"></script>
	
	<div class="container-fluid py-5" style="font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto text-center">
			<h2 class="mx-auto my-0 text-center">검색 결과</h2>
			
	            <input type="text" id="search" name="tag" value="${searchKeyword }" class="px-2" style="width: 350px; height: 40px; border: 1px solid darkgray;">
	            <button type="button" id="searchBtn" style="width: 50px; height: 41px; border: 1px solid darkgray; background-color: white;">검색</button>
	        
		</div>
	</div>
    <div class="container-fluid py-2" style="border-top: 1px solid darkgray; border-bottom: 1px solid darkgray; font-family: 'Cafe24Oneprettynight';"> 
    	<div class="row py-2 text-center">
    		<div class="dropdown ml-2 mb-2 mb-lg-0">
	        	<button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border: 1px solid darkgray; border-radius: 5px;">정렬</button>
	            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	            	<a class="dropdown-item" data-category="orderBy" data-value="img_sysdate" href="#">최신순</a>
	                <a class="dropdown-item" data-category="orderBy" data-value="viewcount" href="#">조회순</a>
	            </div>
	        </div>
	        <div class="dropdown ml-2 mb-2 mb-lg-0">
	            <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border: 1px solid darkgray; border-radius: 5px;">파일형식</button>
	            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	                <a class="dropdown-item" data-category="file_extension" data-value="jpg" href="#">JPG</a>
	                <a class="dropdown-item" data-category="file_extension" data-value="png" href="#">PNG</a>
	            </div>
	        </div>
	        <div class="dropdown ml-2 mb-2 mb-lg-0">
	            <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border: 1px solid darkgray; border-radius: 5px;">사용범위</button>
	            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	                <a class="dropdown-item" data-category="usage" data-value="상업용" href="#">상업적 용도</a>
	                <a class="dropdown-item" data-category="usage" data-value="비상업용" href="#">에디토리얼 용도</a>
	            </div>
	        </div>
	        <div class="dropdown ml-2">
	            <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border: 1px solid darkgray; border-radius: 5px;">결과 내 재검색</button>
	            <div class="dropdown-menu px-2 m-auto text-center" aria-labelledby="dropdownMenuButton" style="width: 290px;">
	                <input type="text" id="keyword2" style="width: 200px; border: 1px solid darkgray;">
	                <button id="keyword2Btn" style="width: 60px; border: 1px solid darkgray; background-color: white;">확인</button>
	            </div>
	        </div>
    	</div>
        <div class="row">
        	<div id="historyBox">
	            <input type="hidden" name="tag" value="${searchKeyword }" class="mx-2">
	        </div>
        </div>
    </div>  
	<div id=wrapper class="container-fluid px-0" style="min-height: 600px; font-family: 'Cafe24Oneprettynight';">
		<div id="gallery"></div>
	</div>

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
	
	    let fetchList = function(count){
	        if(isEnd == true){
		        return;
	        }
	
	        $.ajax({
	        	url: "/Align.do",
	            type:"GET",
	            data:{
	            	count : count,
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
	                    
	                if(length == 0 && count == 1){
	                	$("#gallery").remove(); // JustifiedGallery 가 적용된 <div id=gallery> 에서는 밑에 응답 div 추가해도 안 보임(이유는 모름). 그래서 삭제하고 다시 만들어 주는거~
	                    $("#wrapper").append("<div id=gallery></div>");
	        	        var html = "<div class='py-5'><p style='font-size: 30px;'>죄송합니다.</p><p>찾으시는 이미지에 대한 검색결과가 없습니다.</p></div>"
	        	        $("#gallery").css("text-align","center");
	        	        $("#gallery").append(html);
	        	        isEnd = true;
	        	        return;
	                }else if(length == 0 && count != 1){
	                 	isEnd = true;
	                  	return;
	                }
	                 
	                for(i=0; i<resp.length;i++){
		            	console.log(resp[i].sysname);
		                renderList(resp[i].sysname, resp[i].tag, resp[i].img_seq, resp[i].nickname);
	                }
	                console.log("여기까지 화면에 이미지 개수 : " + $('.image').length);
	                console.log("===========================================");
	            }
	        })
	    }
	
	    let renderList = function(sysname, tag, img_seq, nickname){
	    	tags = tag.replace(/{/gi,"").replace(/}/gi,"");
	
	        var html = "<div class='image'><a href='/DetailImage.do?img_seq="+img_seq+"&nickname="+nickname+"' onclick=\"window.open(this.href,'','scrollbars=yes,resizable=yes,top=0, width=1300, height=950'); return false;\" class='jg-entry entry-visible' style='width: 336px; height: 224.07px; top: 2146.92px; left: 347px;'><img src=/watermarkfiles/xsmarked_"+sysname+" alt="+tags+"></a></div>"
	        $("#gallery").append(html);
	        $("#gallery").justifiedGallery({
	        	rowHeight : 200,
	            lastRow : 'nojustify',
	            margins: 10
	        });
	        $("#gallery").justifiedGallery('norewind');
	    }
	        
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
	    		location.href = "/Search.do?tag=" + tag;
	    	}
	    }
	       
        $("#keyword2Btn").on("click",function(){
        	input_keyword2();
        })
        
        $("#keyword2").on("keyup",function(e){
	    	if(e.keyCode == 13){
	    		input_keyword2();
	    	}
	    })
	    
	    function input_keyword2(){
        	var name = "keyword2";
            var value = $("#keyword2").val();
                
            if(value == ""){
            	alert("키워드를 입력해주세요.");
            }else{
                var filter2 = $("#historyBox span input[name="+name+"]");
                if(filter2.length == 0){
                    var span = $("<span class='span-box h-100'><input type=hidden name="+name+" value='"+value+"'><span style='border: 1px solid darkgray' class='history ml-2' name="+name+">포함된 키워드: "+value+"<span class='filter-remove pl-2 m-0 text-right'>x</span></span></span>");
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
        }

        $(".dropdown-item").on("click",function(){
        	var name = $(this).data("category");
            var value = $(this).data("value");
            var print_value = $(this).html();
            console.log("name: " + name);
            console.log("value: " + value);
            console.log("print_value: " + print_value);
            var filter = $("#historyBox span input[name="+name+"]");

            if(filter.length == 0){
                var span = $("<span class='span-box h-100'><input type=hidden name="+name+" value="+value+"><span style='border: 1px solid darkgray' class='history ml-2' name="+name+">"+print_value+"<span class='filter-remove pl-2 m-0 text-right'>x</span></span></span>");
                $("#historyBox").append(span);
            }else{
                $(".span-box > input[name="+name+"]").prop("value",value);
                $(".span-box > input[name="+name+"] ~ span[name="+name+"]").html(print_value);
                $(".span-box > input[name="+name+"] ~ span[name="+name+"]").append("<span class=filter-remove>x</span>");
            }
            $("#gallery").empty(); // 모든 자식 노드 삭제
            isEnd = false;
            count = 2;
            fetchList(1);
		})

        $("body").on("click",".filter-remove",function(){	
        	$(this).closest(".span-box").remove();
            $("#gallery").empty(); // 모든 자식 노드 삭제
            isEnd = false;
            count = 2;
            fetchList(1);
		})
	</script>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>