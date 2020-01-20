<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src='/javascript-winwheel-2.8.0/Winwheel.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.0.5/gsap.min.js'></script>
<style>
 
#canvasContainer {
    position: relative;
    width: 300px;
}
 
#myCanvas {
    z-index: 1;
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
</head>
<body>

<div id="canvasContainer">
     <canvas id='myCanvas' width='800' height='410'>

	 </canvas>
	 <img id="prizePointer" src="${pageContext.request.contextPath}/img/bomb.png" alt="V" />
</div>	 
<script>
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
              
                  {'fillStyle' : '#eae56f', 'text' : '10원'},
                {'fillStyle' : '#89f26e', 'text' : '50원'},
                {'fillStyle' : '#7de6ef', 'text' : '100원'},
                {'fillStyle' : 'white', 'text' : '꽝'},
                {'fillStyle' : '#eae56f', 'text' : '30원'},
                {'fillStyle' : '#eae56f', 'text' : '70원'},
                {'fillStyle' : '#eae56f', 'text' : '10원'},
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
     
     $.ajax({
    	 url : "${pageContext.request.contextPath}/event/rouletProc.do",
    	 type : "post",
    	 data : {score : point}
     }).done(function(data){
    	 // Basic alert of the segment text which is the prize name.
         alert("축하합니다! " + winningSegment.text + "포인트를 획득하셨습니다!");
         console.log(winningSegment.text);	 
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

</script>

<button onClick="theWheel.startAnimation();">룰렛 돌리기</button>

</body>
</html>