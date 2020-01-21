<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EventPage | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link href='/fullcalendar-4.3.1/packages/core/main.css' rel='stylesheet' />
<link href='/fullcalendar-4.3.1/packages/daygrid/main.css' rel='stylesheet' />
<link href='/fullcalendar-4.3.1/packages/timegrid/main.css' rel='stylesheet' />
<link href='/fullcalendar-4.3.1/packages/list/main.css' rel='stylesheet' />
<script src='/fullcalendar-4.3.1/packages/core/main.js'></script>
<script src='/fullcalendar-4.3.1/packages/daygrid/main.js'></script>
<script src='/fullcalendar-4.3.1/packages/moment/main.js'></script>
<script src='/fullcalendar-4.3.1/packages/interaction/main.js'></script>
<script src='/fullcalendar-4.3.1/packages/list/main.js'></script>
<script src='/fullcalendar-4.3.1/packages/timegrid/main.js'></script>
<script src='/javascript-winwheel-2.8.0/Winwheel.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.0.5/gsap.min.js'></script>
<style>
/*    출석체크 글씨체 */
	@font-face {font-family: 'Cafe24Ssukssuk'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Ssukssuk.woff') format('woff'); font-weight: normal; font-style: normal; }
	@font-face {font-family: 'Cafe24Dongdong'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Dongdong.woff') format('woff'); font-weight: normal; font-style: normal; }
	@font-face {font-family: 'Arita-dotum-Medium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Arita-dotum-Medium.woff') format('woff'); font-weight: normal; font-style: normal; }
	
	.fc-custom2-button {width: 100px; border: 1px solid #A6C14C; background-color: #FFFEEA; color: #A6C14C; font-family: 'Arita-dotum-Medium';}
	.fc-custom2-button:hover {width: 100px; border: 1px solid #FFFEEA; background-color: #A6C14C; color: white; font-family: 'Arita-dotum-Medium';}
		
	.fc-content {margin: auto; width: 100px !important; text-align: center; height: 100px; background-image: url('${pageContext.request.contextPath}/img/pass.png'); background-size: 100px; background-repeat: no-repeat;}
	.fc-title{font-family: 'Cafe24Dongdong';}
	.fc-day-grid-event{margin:auto; height:1px;padding:0px; width:1px;}
	.fc-content{margin-top:-5px; margin-left:-50px; width:100px; height:100px;}
	
	#canvasContainer {
    position: relative;
    width: 300px;
}
 
#myCanvas {
    z-index: 200;
}
 
#prizePointer {
    position: absolute;
    left: 330px;
    top: 10px;
    z-index: 999;
    width:100px;
    height:100px;
}

</style>

<script>



</script>




</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="modal fade" id="rouletteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
   
  </div>
   <div id="canvasContainer">
						<canvas id='myCanvas' width='800' height='410'></canvas>
						<img id="prizePointer" src="${pageContext.request.contextPath}/img/bomb.png" alt="V" />
						
					</div>
					<button onClick="theWheel.startAnimation();">룰렛 돌리기</button>
					<button type="button" data-dismiss="modal" id="closeBtn">X</button>
</div>
	
	<div>룰렛으로 가기 위한 버튼 
		<button id="rulet">룰렛 페이지로 고고</button>
	</div>
	<script>
		$("#rulet").on("click", function(){
			location.href="${pageContext.request.contextPath}/event/rulet.do";
		})
	</script>
	<div class="container-fluid m-0 py-5" style="height: 250px; background-color: #FFFEEA; font-family: 'Cafe24Ssukssuk';">
		<div class="container text-center h-100">
			<h4 class="my-3" style="font-size: 25px;">부지런한 자가 득템한다!</h4>
			<h1 class="mt-4" style="font-size: 60px;">출석<img src="${pageContext.request.contextPath}/img/calendar.png" class="mx-3" style="width: 50px; height: 50px;">체크</h1>
		</div>
	</div>
	<div class="container-fluid m-0 py-5" style="background-color: #A6C14C; font-family: 'Cafe24Dongdong';">
		<div class="container calendar-container py-3" style="max-width: 1200px; background-color: white;">
			<div id="calendar"></div>
		</div>
	</div>
	
	

<script>

// 룰렛 
    let theWheel = new Winwheel({
        'canvasId'    : 'myCanvas',
        'drawMode' : 'image',  // drawMode must be set to image.
        'drawText'  : true,       // Set this to true for text to be rendered for image wheels.
        'numSegments' : 8,  // The number of segments must be specified.
        'outerRadius'    : 170,
        'centerY'     : 230,
        'textAlignment'  : 'outer',
        'textOrientation' : 'curved',   // Set text properties.
        'textAlignment'   : 'outer',
        'textMargin'      : 5,
        'textFontFamily'  : 'courier',
        'imageOverlay' : true,   // Set imageOverlay to true to display the overlay.
        'lineWidth'    : 4,          // Overlay uses wheel line width and stroke style so can set these
        'strokeStyle'  : 'red',       // as desired to change appearance of the overlay.
        //'textOrientation' : 'vertical', 
        // 'textDirection'   : 'reversed',     // Set direction. normal (default) or reversed.
        'segments'    :
            [
              //  {'fillStyle' : '#eae56f', 'text' : '10원'},
              //  {'fillStyle' : '#89f26e', 'text' : '50원'},
              //  {'fillStyle' : '#7de6ef', 'text' : '100원'},
              //  {'fillStyle' : '#e7706f', 'text' : '꽝'},
              //  {'fillStyle' : '#eae56f', 'text' : '30원'},
              //  {'fillStyle' : '#eae56f', 'text' : '70원'},
              //  {'fillStyle' : '#eae56f', 'text' : '10원'},
              //  {'fillStyle' : '#eae56f', 'text' : '꽝'}
              
                  {'fillStyle' : '#eae56f', 'text' : '10P'},
                {'fillStyle' : '#89f26e', 'text' : '50P'},
                {'fillStyle' : '#7de6ef', 'text' : '100P'},
                {'fillStyle' : 'white', 'text' : '꽝'},
                {'fillStyle' : '#eae56f', 'text' : '30P'},
                {'fillStyle' : '#eae56f', 'text' : '70P'},
                {'fillStyle' : '#eae56f', 'text' : '20P'},
                {'fillStyle' : '#eae56f', 'text' : '꽝'}
            ],
        'lineWidth'   : 1,
        'animation' :
        {
            'type'     : 'spinToStop',
            'duration' : 5,
            'spins'    : 8,
 
            // Remember to do something after the animation has finished specify callback function.
            'callbackFinished' : 'alertPrize()',
 
            // During the animation need to call the drawTriangle() to re-draw the pointer each frame.
            //'callbackAfter' : 'drawTriangle()'
        }
    });
    

    // This function called after the spin animation has stopped.
    function alertPrize()
    {
        // Call getIndicatedSegment() function to return pointer to the segment pointed to on wheel.
        let winningSegment = theWheel.getIndicatedSegment();
        var point = winningSegment.text;
        var point_result = 0;
        if(point=="꽝"){
       
        }else{
        	var regex = /\d+/;
         	var result = regex.exec(point);	
         	console.log(result[0]);
         	point_result = result[0];
        }
     $.ajax({
    	 url : "${pageContext.request.contextPath}/event/rouletProc.do",
    	 type : "post",
    	 data : {score : point_result}
     }).done(function(){
    	 if(point_result==0){
    		 alert("꽝입니다! 다음 기회에!");
    	 }else{
         alert("축하합니다! " + point + "를 획득하셨습니다!");
         console.log(winningSegment.text);
    	 }
     }).fail(function(data){
    	 alert("시스템 오류가 발생했습니다. 다시 시도해주세요.");
     })
     
    
    }

    // 이미지 넣는 부분 
 	// Create new image object in memory.
    let wheelImg = new Image();
     
    // Create callback to execute once the image has finished loading.
    wheelImg.onload = function()
    {
        theWheel.wheelImage = wheelImg;    // Make wheelImage equal the loaded image object.
        theWheel.draw();                    // Also call draw function to render the wheel.
    }
     
    // Set the image source, once complete this will trigger the onLoad callback (above).
    wheelImg.src = "${pageContext.request.contextPath}/img/bomb.png";
    
 // 출석체크 
	document.addEventListener('DOMContentLoaded', function() {
    	  
    $.ajax({	  
    	url: "${pageContext.request.contextPath}/event/getEvent",
        type: "get",
        dataType:"json",
        // 값을 성공적으로 받아온 경우 
        success: function(data){
    		if("${event}"==0){
    			console.log("출석이력이 없음");
        		var calendarEl = document.getElementById('calendar');
       			var calendar = new FullCalendar.Calendar(calendarEl, {
        			plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
		            header:{
		           		left:'title',
		                center:'none',
		                right:'custom2'
		            },
            		// 출석체크를 위한 버튼 생성 
            		customButtons:{
                		custom2: {
                    		text:'출석체크', 
                    		id:'check',
                    		///////////////////////////////////////////////////
                    		// 출석체크 버튼 누르면 출석완료 처리
             				click:function(){
                 				var date = $(".fc-today").attr("data-date");
                 				$(".fc-custom2-button").attr('data-toggle','modal');
                 				$(".fc-custom2-button").attr('data-target','#rouletteModal');
                 				$(".fc-custom2-button").attr('data-backdrop','static');
                 				$(".fc-custom2-button").attr('data-keyboard','false');
                 				
                 
                 				
                 
                 				console.log(date);                 
                 				// ajax로 출석 정보를 저장한다 
				                 $.ajax({
				                 	url: "${pageContext.request.contextPath}/event/insertEvent",
				                    type: "post",
				                    data : {event_date:date},
				                    dataType: "json"
				                 }).done(function(data){
				                    // 버튼이 출석완료로 바뀐다 
				                    $(".fc-custom2-button").prop('disabled', true);
				                    $(".fc-custom2-button").html('출석완료');
				                    // 달력에 출석완료 이벤트가 표시된다 
				                    alert('오늘의 출석이 완료되었습니다. 10포인트가 지급되었습니다!');
				                    calendar.addEvent({
				                    	
                         				"start": date,
                         				"color" : "#FCF8E3",
                         				"textColor" : "white"
                     				})
                 				});
             				}
		            		////////////////////////////////////////////////////
		            
		            
		            
                		}
            		}
        		});
    	 	}else if("${event}"==1){
    		 	console.log("출석이력이 있음");
    		 	var calendarEl = document.getElementById('calendar');
    	        var calendar = new FullCalendar.Calendar(calendarEl, {
    	         	
    	        	plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
    	            header:{
    	            	left:'title',
    	                center:'none',
    	                right:'custom2'
    	            },
    	            // 출석체크를 위한 버튼 생성 
    	            customButtons:{
    	            	custom2: {
    	                	text:'출석완료' 
    	                }
    	            }
    	        })
    	 	}
    	 	// 가져온 달력 정보를 캘린더에 뿌린다 
            for(var i = 0;i < data.length;i++){
            	calendar.addEvent(data[i]);
                console.log(data[i].imageurl);
            }
    	    calendar.render();      
    	 	}, error : function(data){
            	alert('error');
           	}
		})
	});

</script>

	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>