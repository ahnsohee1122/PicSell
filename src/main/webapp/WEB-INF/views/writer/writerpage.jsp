<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WriterPage | PicSell</title>
<link rel="stylesheet" href="/css/justifiedGallery.css" />
<style>
	.writer {width: 100%; min-height: 250px; background-image: url('${pageContext.request.contextPath}/img/write_banner.png'); background-repeat: no-repeat;}
	.explanation {margin-top: 5px; padding: 0px; background: none; border: 0; color: white; border-bottom: 1px solid white;}
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>

	<jsp:include page="../key/profile.jsp" flush="false"/>

	<script src="/js/jquery.justifiedGallery.js"></script>
	
	<div class="container-fluid p-0 my-5" style="font-family: 'Cafe24Oneprettynight';">
		<div class="container" style="max-width: 1500px;">
			<h2>My Image</h2>
		</div>
		<div class="container" style="max-width: 1500px; border: 1px solid darkgray; border-radius: 10px;">
			<div class="col-12 col-md-12 col-xl-12 text-center px-0 py-3" id="gallery"></div>
		</div>
	</div>
	
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
		url: "${pageContext.request.contextPath}/writer/list?nickname=${memberDto.nickname}",
		type:"GET",
		data:{"currentPage" : currentPage},
		dataType:"json",
		success:function(resp){
				let length = resp.length;
				if(length==0 && currentPage==1){
					var html = "<div class='row align-items-center w-100 m-auto text-center' style='min-height: 400px;'><h5 class='m-auto'>등록된 이미지가 없습니다. 이미지를 등록 후 작가로 활동해보세요!</h5></div>"
					$("#gallery").append(html);
					isEnd = true;
				}else if(length < 5){
					isEnd = true;
				}
				for(i=0; i<resp.length;i++){
					renderList(resp[i].sysname, resp[i].tag, resp[i].img_seq)
					
				}
			
		}
	})
	};

	let renderList = function(sysname,tag,img_seq){
		var tags = tag.replace(/##/g," #");
	    tags = tags.substr(0,tags.length-1).toString();
		var html = "<div class=image><a href=${pageContext.request.contextPath}/DetailImage.do?img_seq="+img_seq+"&nickname=${memberDto.nickname} onclick=\"window.open(this.href,'','scrollbars=yes,resizable=yes,top=0, width=1300, height=950'); return false;\" class='jg-entry entry-visible' style='width: 336px; height: 224.07px; top: 2146.92px; left: 347px;'><img src=/watermarkfiles/xsmarked_"+sysname+" alt='"+tags+"'></a></div>"
		$("#gallery").append(html)
		$("#gallery").justifiedGallery({
			rowHeight : 200,
		    lastRow : 'nojustify',
		    margins : 10
		}); 
	}; 

	</script>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>