<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


<link href='/fullcalendar-4.3.1/packages/core/main.css' rel='stylesheet' />
<link href='/fullcalendar-4.3.1/packages/daygrid/main.css'
	rel='stylesheet' />
<link href='/fullcalendar-4.3.1/packages/timegrid/main.css'
	rel='stylesheet' />
<link href='/fullcalendar-4.3.1/packages/list/main.css' rel='stylesheet' />
<script src='/fullcalendar-4.3.1/packages/core/main.js'></script>
<script src='/fullcalendar-4.3.1/packages/daygrid/main.js'></script>
<script src='/fullcalendar-4.3.1/packages/moment/main.js'></script>
<script src='/fullcalendar-4.3.1/packages/interaction/main.js'></script>
<script src='/fullcalendar-4.3.1/packages/list/main.js'></script>
<script src='/fullcalendar-4.3.1/packages/timegrid/main.js'></script>



<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script>

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
            events:[{
            	//title:"dd",
            	//"start": "2020-01-17"
          // imageurl : "/img/icon.PNG"
            }],
            
            // 출석체크를 위한 버튼 생성 
            customButtons:{
                custom2: {
                    text:'출석체크하기', 
                    id:'check',
                    // 출석체크 버튼 누르면 출석완료 처리
             click:function(){
                 var date = $(".fc-today").attr("data-date");
                 console.log(date);
                 
                 ////////////////////////////
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
                    // $(".fc-today ").append($('<span>'+'출석완료'+'</span>'));
                     alert('오늘의 출석이 완료되었습니다. 10포인트가 지급되었습니다!');
                     calendar.addEvent({
                         
                         "start": date,
                         "color" : "white",
                         "textColor" : "white",
                          imageurl : "/img/check.PNG"
                     })
                 });
                 
                 ////////////////////////
            	 
             }
                }
            }, 
            eventRender:function(event, eventElement) {
       
            	$("td.fc-today").html("<span><img src="+event.event.extendedProps.imageurl+"></span>");
    
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
    	            },
    	            
    	            
    	            eventRender:function(event, eventElement) {
    	               
    	                  $("td.fc-today").html("<img src=/img/check.PNG>");
    	         
    	             }
    	        })
    	        
    	        // else 닫는 부분 
    	 }
    	 ///
    	 
    	    	// 가져온 달력 정보를 캘린더에 뿌린다 
                for(var i = 0;i < data.length;i++){
                    calendar.addEvent(data[i]);
                    console.log(data[i].imageurl);
                }
    	        calendar.render();      
    	//$(".fc-title").html("<span><img src="+event.event.extendedProps.imageurl+"></span>");
    	//$("a").append("악");
    	 
         }, error : function(data){
            alert('error');
           }
         
         
          })
  });

  //$("#calendar").fullcalenadr({
	//     eventRender:function(event, element) {
  //    
  //              element.find("td.fc-today").prepend("<img src="+info.extendedProps.imageurl+">");
             
 //         }  
 // })
      
     
    </script>
<style>
img {
	width: 70%;
	height: 70%;
}
</style>
</head>
<body>

	<h1>출석체크</h1>
	<div class="container calendar-container">
		<div id="calendar" style="max-width: 900px; margin: 40px auto;"></div>

	</div>

</body>
</html>