<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="/js/jquery.justifiedGallery.js"></script>
<link rel="stylesheet" href="/css/justifiedGallery.css" />
<style>

</style>
</head>

<body>
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
				renderList(resp[i].sysName, resp[i].tag)
			}
		
		}
	})
	}

	let renderList = function(sysName,tag){
		tags = tag.replace(/{/gi,"#").replace(/}/gi,"")
		console.log("result : " + tags)
		
		var html = "<div class=image><a><img src=/writeruploadfiles/"+sysName+" alt="+tags+"></a></div>"
		$("#gallery").append(html)
		$("#gallery").justifiedGallery({
			rowHeight : 200,
		    lastRow : 'nojustify',
		    margins : 10
		}); 
	}

</script>
</body>
</html>
