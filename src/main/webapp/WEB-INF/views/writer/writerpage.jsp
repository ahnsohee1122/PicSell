<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="/css/justifiedGallery.css" />
<style>
	.writer {width: 100%; min-height: 250px; background-image: url('${pageContext.request.contextPath}/img/write_banner.png'); background-repeat: no-repeat;}
	.explanation {margin-top: 5px; padding: 0px; background: none; border: 0; color: white; border-bottom: 1px solid white;}
	
	
</style>
</head>

<body>
<jsp:include page="../key/top.jsp" flush="false"/>
<script src="/js/jquery.justifiedGallery.js"></script>
	
	
	  <div class="container-fluid m-0 p-0">
        <div class="writer row m-0 p-0">
        <div class="m-auto" style="text-align: center;">
            <div class="text-white" style="font-size: 32px; font-family: 'Cafe24Oneprettynight';">@${writerdto.nickname }</div>
            <div class="text-white" style="font-size: 30px; font-family: 'Cafe24Oneprettynight';">${imginfo.imgcount }</div>
            <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">${imginfo.downcount }</div>
            <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">${imginfo.viewcount }</div>
            <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">${imginfo.imglike }</div>
      		 <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">${imginfo.likepoint }</div>
			    </div>
			  </div>
			</div>
   
    
    
    		<div id="gallery"></div>
    
  

	<script>

	let isEnd = false;
	var count = 2;
	
	$(function(){
		$(window).scroll(function(){
			let $window = $(this);
			let scrollTop = $window.scrollTop();
			let windowHeight = $window.height();
			let documentHeight = $(document).height();
			
			
			if(scrollTop + windowHeight +10 > documentHeight){
				fetchList(count);
				count++;
			}
		})	
		fetchList(1);
	})

		let fetchList = function(currentPage){
		if(isEnd == true){
			return;
		}

	$.ajax({
		url: "${pageContext.request.contextPath}/writer/list",
		type:"GET",
		data:{"currentPage" : currentPage},
		dataType:"json",
		success:function(resp){
			console.log(resp)
			let length = resp.length;
			console.log(length)
			if(length < 5){
				isEnd = true;
			}
			for(i=0; i<resp.length;i++){
				renderList(resp[i].sysname, resp[i].tag)
			}
		
		}
	})
	}

	let renderList = function(sysname,tag){
		tags = tag.replace(/{/gi,"#").replace(/}/gi,"")
		console.log("result : " + tags)
		
		var html = "<div class=image><a><img src=/writeruploadfiles/"+sysname+" alt="+tags+"></a></div>"
		$("#gallery").append(html)
		$("#gallery").justifiedGallery({
			rowHeight : 100,
		    lastRow : 'nojustify',
		    margins : 10
		}); 
	}

</script>
<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>
