<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Upload | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="https://cdn.jsdelivr.net/npm/exif-js"></script>
<style>
	.upload-list {list-style-type: none; padding: 0; margin: 0;}
	
	.list {text-align: right; padding: 10px 10px 0px 10px;}
	.left {min-height: 200px; text-align: left; padding: 0; border-bottom: 1px solid darkgray;}
	.right {text-align: left; margin: 10px 0;}
	
	li {list-style-type: none;}
	
	.canvas,.wrap{margin: 10px 0; width: 300px;}
	
	.wrap {max-height: 500px; text-align: center;}
	.innerwrap {margin: 10px 0;}
	.wrapimg>img {margin: auto; width: 100%;}
	
	canvas {display: none;}
	
	input[type=radio] {display: none; background-color: transparent;}
	input[type=radio]:checked+label {background-color: #FFEFEF;}
	label {display: inline-block; border: 1px solid darkgray; margin-right: 10px; border-radius: 3px; width: 80px; height: 30px; text-align: center; line-height: 30px;}
	label:hover {cursor: pointer;}
	
	.tag-item {display: inline-block; color: #000; border: 1px solid darkgray; padding: 3px; margin: 5px 10px 0 0; border-radius: 3px;}
	.tag-del {background-color: transparent; border: none;}
	.tagList {padding: 0;}
	
	input[type=text] {padding: 0 10px; width: 100%; max-width: 400px; border: 1px solid darkgray; border-radius: 5px;}
	
	#floatMenu {position: relative;}
	
	.closeBtn {border: 0; background-color: #f4f2f5;}
	
	#Progress_Loading {
	position: fixed;
	left: 50%;
	top: 50vh;
	transform: translate(-50%, -50%);
	background-color: transparent;
	z-index:1
}
</style>
</head>
<body>
<img src="${pageContext.request.contextPath}/img/Progress_Loading.gif" id="Progress_Loading">
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="container-fluid py-5" style="min-height: 594px; background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto">
			<h2 class="mx-auto my-0 text-center">이미지 업로드</h2>
		</div>
		<div class="container mx-auto my-5">
			<h6>공모 요강에 맞지 않은 사진은 판매가 되지 않을 수 있습니다.</h6>
			<h6>본인이 촬영한 사진만 제출 가능합니다.</h6>
			<div class="row w-100 mx-auto my-3 p-3" style="min-height:600px; border: 1px solid darkgray; border-radius: 10px;">
				<form id="uploadform" class="w-100" action="${pageContext.request.contextPath}/contest/enroll?title=${title}&contest_seq=${contest_seq}" method="post" enctype="multipart/form-data">
					<input type="file" name="files" multiple="multiple" id="file">
					<div class="row canvas w-100 h-100 mx-auto my-0 py-4"></div>
					<input type="hidden" value="" name="tag" id="rdTag" /> 
					<input type="hidden" value="" name="img_size" id="size"> 
					<input type="hidden" value="" name="make" id="make"> 
					<input type="hidden" value="" name="model" id="model"> 
					<input type="hidden" value="" name="XDimension" id="XDimension"> 
					<input type="hidden" value="" name="YDimension" id="YDimension">
					<ul class="upload-list"></ul>
					<div class="text-center">
						<button type="button" id="upload" class="mb-3 mx-1" style="width: 100px; border: 1px solid darkgray; background-color: #f4f2f5; border-radius: 10px;">등록하기</button>
						<input type="button" id ="back" value="이전으로" class="mb-3 mx-1" style="width: 100px; border: 1px solid darkgray; background-color: #f4f2f5; border-radius: 10px;">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	
	$(function(){
		$('#Progress_Loading').hide();
	})
		var file = document.getElementById('file')
		
		//이미지를 불러와서 미리보기.
		function readImage(files) {
			var preview = document.getElementsByClassName('canvas')[0]
			preview.innerHTML="";
			if(files.length == 0){
				preview.innerHTML="";
			}else{
				for(i=0; i<files.length; i++){
					console.log(files.length)
					var reader = new FileReader()
					reader.onload = function(e) {
						var wrap = document.createElement('div')
						var remove = document.createElement('input')
						var innerwrap = document.createElement('div')
						var div1 = document.createElement('div')
						var div2 = document.createElement('div')
						innerwrap.classList.add("innerwrap")
						innerwrap.classList.add("row")
						innerwrap.classList.add("w-100")
						innerwrap.classList.add("h-100")
						innerwrap.classList.add("m-auto")
						wrap.classList.add("wrap")
						wrap.classList.add("col-4")
						wrap.classList.add("m-0")
						div1.classList.add("wrapimg")
						div1.classList.add("h-100")
						div1.classList.add("px-0")
						div2.classList.add("col-1")
						div2.classList.add("wrapremove")
						div2.classList.add("px-0")
						remove.setAttribute("type","button")
						remove.setAttribute("value",'X')
						remove.classList.add('closeBtn')
						remove.classList.add('rm' + i)
						var data = e.target.result
						var img = new Image()
						img.src = data
						wrap.appendChild(innerwrap)
						div1.appendChild(remove)
						innerwrap.appendChild(div1)
						//innerwrap.appendChild(div2)
						preview.appendChild(wrap)
						div1.appendChild(img)
						//div2.appendChild(remove)
						remove.onclick=function(){
							remove.parentNode.remove();
						}
					};
					if (files)reader.readAsDataURL(files[i])
				}
			}
			
		};
		
		file.onchange = function(e){
			readImage(e.target.files)
		}

		$("#upload").on("click",function(){
			var a = document.getElementsByName('file')
			var firstcanvas = document.getElementsByClassName('canvas')
				if(firstcanvas[0].innerHTML == ""){
					alert("이미지를 등록 해주세요")
					return;
				}
			$("#uploadform").submit();
			$('#Progress_Loading').show();
		})
		
		$("#back").on("click",function(){
			history.back();	
		})
		
		
	</script>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>