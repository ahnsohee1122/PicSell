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
</head>
<body>

     <canvas id='myCanvas' width='800' height='410'>

</canvas>
<script>
    let theWheel = new Winwheel({
        'canvasId'    : 'myCanvas',
        'numSegments' : 8,
        'outerRadius'    : 170,
        'textAlignment'  : 'outer',   
        //'textOrientation' : 'vertical', 
        // 'textDirection'   : 'reversed',     // Set direction. normal (default) or reversed.
        'segments'    :
            [
                {'fillStyle' : '#eae56f', 'text' : '10원'},
                {'fillStyle' : '#89f26e', 'text' : '50원'},
                {'fillStyle' : '#7de6ef', 'text' : '100원'},
                {'fillStyle' : '#e7706f', 'text' : '꽝'},
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
            'callbackAfter' : 'drawTriangle()'
        }
    });
    

    // This function called after the spin animation has stopped.
    function alertPrize()
    {
        // Call getIndicatedSegment() function to return pointer to the segment pointed to on wheel.
        let winningSegment = theWheel.getIndicatedSegment();
 
        // Basic alert of the segment text which is the prize name.
        alert("You have won " + winningSegment.text + "!");
    }
 
    // Function to draw pointer using code (like in a previous tutorial).
    drawTriangle();
 
    function drawTriangle()
    {
        // Get the canvas context the wheel uses.
        let ctx = theWheel.ctx;
 
        ctx.strokeStyle = 'navy';     // Set line colour.
        ctx.fillStyle   = 'aqua';     // Set fill colour.
        ctx.lineWidth   = 2;
        ctx.beginPath();              // Begin path.
        ctx.moveTo(370, 5);           // Move to initial position.
        ctx.lineTo(430, 5);           // Draw lines to make the shape.
        ctx.lineTo(400, 40);
        ctx.lineTo(371, 5);
        ctx.stroke();                 // Complete the path by stroking (draw lines).
        ctx.fill();                   // Then fill.
    }
    
</script>

<button onClick="theWheel.startAnimation();">룰렛 돌리기</button>

</body>
</html>