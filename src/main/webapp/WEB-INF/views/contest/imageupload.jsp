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
	
	.canvas {margin: 10px 0; width: 300px;}
	.canvas>img {width: 100%; height:100%;}
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
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="container-fluid py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto">
			<h2 class="mx-auto my-0 text-center">공모전 출품</h2>
		</div>
		<div class="container mx-auto my-5">
			<div class="row">
				<div class="col-3 col-md-2 h-100 p-0 text-center" style="border-radius: 10px;">
					<button type="button" class="add-item m-auto" id="floatMenu" style="width: 80%; background-color: #f4f2f5; border: 1px solid darkgray; border-radius: 10px;">이미지 추가</button>
				</div>
				<div class="col-9 col-md-10 h-100 p-0" style="border: 1px solid darkgray; border-radius: 10px;">	
					<form id="uploadform" action="${pageContext.request.contextPath}/contest/enroll?title=${title}&contest_seq=${contest_seq}" method="post" enctype="multipart/form-data">
						<input type="hidden" value="" name="tag" id="rdTag" /> 
						<input type="hidden" value="" name="img_size" id="size"> 
						<input type="hidden" value="" name="make" id="make"> 
						<input type="hidden" value="" name="model" id="model"> 
						<input type="hidden" value="" name="XDimension" id="XDimension"> 
						<input type="hidden" value="" name="YDimension" id="YDimension">
						<ul class="upload-list"></ul>
						<div class="text-center">
							<button  id="upload" class="mb-3" style="width: 100px; border: 1px solid darkgray; background-color: #f4f2f5; border-radius: 10px;">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(document).ready(function() {
	
			// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
			var floatPosition = parseInt($("#floatMenu").css('top'));
			// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	
			$(window).scroll(function() {
				// 현재 스크롤 위치를 가져온다.
				var scrollTop = $(window).scrollTop();
				var newPosition = scrollTop + floatPosition + "px";
	
				/* 애니메이션 없이 바로 따라감
				 $("#floatMenu").css('top', newPosition);
				 */
	
				$("#floatMenu").stop().animate({
					"top" : newPosition
				}, 500);
	
			}).scroll();
	
		});

		var addButton = document.getElementsByClassName('add-item')[0]
		var list = document.getElementsByClassName('upload-list')[0]
		var count = 0
		
	
			var fileList = []
			var imageList=[]
		//이미지를 불러와서 미리보기.
		function readImage(files,thumb) {
			thumb.innerHTML="";
		console.log(files)
		for(i=0; i<files.length; i++){
			
				var reader = new FileReader()
				reader.onload = function(e) {
				var data = e.target.result
				var img = new Image()
				img.src = data
				thumb.appendChild(img)
				};
			if (files)reader.readAsDataURL(files[i])
		}
			 
		};
		
		
		
		function leftTemplate(cnt) {
			var left = document.createElement('div')
			var input = document.createElement('input')
			var thumb = document.createElement('div')
			thumb.classList.add("canvas")
			left.classList.add('left')
			input.setAttribute('type', 'file')
			input.setAttribute('multiple','multiple')
			input.setAttribute('name', 'files')
			input.setAttribute('accept','image/*')
			input.onchange = function(e) {
				
				for(i=0; i<e.target.files.length; i++){
					imageList.push(e.target.files[i])
					
				var filename = e.target.files[i].name
				var reg = /(.*?)\.(jpg|jpeg|png|bmp|JPG|JPEG|PNG|BMP)$/;
				var maxSize  =30  * 1024 * 1024 //30MB
				var filesize = e.target.files[i].size
				
						var isAvailable = true;
					EXIF.getData(e.target.files[i], function(e){ 
						var xPixel = EXIF.getTag(this,"PixelXDimension")
						var yPixel = EXIF.getTag(this,"PixelXDimension")
				
						console.log(xPixel)
						if(!filename.match(reg)) {
							alert("해당 파일은 이미지 파일이 아닙니다.");
							$("input[type=file]").val("");
							isAvailable = false;
							return;
						}
						
						if(xPixel == null || yPixel == null || xPixel < 1024 || yPixel < 1024){
							alert("최소 해상도는 1024픽셀 이상이어야 합니다.")
							isAvailable = false;
							console.log(isAvailable)
							$("input[type=file]").val("");
							return;
					
						}
						
						if(filesize > maxSize){
							alert("첨부파일 사이즈는 30MB 이내로 등록 가능합니다.")
							$("input[type=file]").val("");
							isAvailable = false;
							return;
						}
						
						
						//첨부파일 추가시 이미지 미리보기 function실행.
						
					})		
						if(isAvailable){
							readImage(e.target.files,thumb)
						}
					
				};
			
					
			}
			left.appendChild(input)
			left.appendChild(thumb)
	
			return left
		}
		
	
		
	
		$("#upload").on("click",function(){
			var a = document.getElementsByName('file')
			var firstlist = document.getElementsByClassName('list')
			var ctext = document.getElementsByClassName('ctext')
			var tags = document.getElementsByClassName('tagList')
			
 			
			if(firstlist.length == 0){
				alert("이미지를 첨부해주세요")
				return;
			}
			for(i=0; i<a.length; i++){
				if(a[i].value == ""){
					alert("이미지를 첨부해주세요.")
					return;
				}
		
				if(firstlist[i].querySelectorAll(".usagebtn")[0].checked == false & firstlist[i].querySelectorAll(".usagebtn")[1].checked == false){
					alert((i+1)+"번째 이미지의 용도를 선택해주세요")
					return;
				}
				
				if(ctext[i].value == ""){
					alert((i+1)+"번째 이미지의 재산권 및 초상권에 대한 정보를 적어주세요.")
					ctext[i].focus();
					return;
				}
				
				if(tags[i].childElementCount == 0 || tags[i].childElementCount < 5){
					alert((i+1)+"번째 이미지의 태그를 최소 5개이상 입력해주세요.")
					$(".taginput"+i).focus()
					return;
				}
					
			}

			$("#uploadform").submit();
		})
		
		
		function setItem() {
			var item = document.createElement('li')
			var remove = document.createElement('input')
			var left = leftTemplate(count)
			var hr = document.createElement('hr')

			item.classList.add('list')
			remove.setAttribute("type","button")
			remove.setAttribute("value",'X')
			remove.classList.add('closeBtn')
			remove.classList.add('rm' + count)
			
			
			remove.onclick = function() {
			if(remove.className === "closeBtn rm0"){
				return;
				
				}else{
				list.removeChild(item)
				list.removeChild(hr)
				count--;
				console.log("- : " + count)
				}
			}
			
			
				item.appendChild(remove)
				item.appendChild(left)
				list.appendChild(item)
				list.appendChild(hr)
				count++
				console.log("+ : " + count)

			if (count >= 10) {
				alert("최대 10개까지 업로드 가능합니다")
			}

		}

		addButton.addEventListener('click', setItem)
		setItem()
	
		
	</script>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>