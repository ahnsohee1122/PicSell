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
<style>
/*    출석체크 글씨체 */
	@font-face {font-family: 'Cafe24Ssukssuk'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Ssukssuk.woff') format('woff'); font-weight: normal; font-style: normal; }
	@font-face {font-family: 'Cafe24Dongdong'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Dongdong.woff') format('woff'); font-weight: normal; font-style: normal; }
	@font-face {font-family: 'Arita-dotum-Medium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Arita-dotum-Medium.woff') format('woff'); font-weight: normal; font-style: normal; }
	
	.fc-custom2-button {width: 100px; border: 1px solid #A6C14C; background-color: #FFFEEA; color: #A6C14C; font-family: 'Arita-dotum-Medium';}
	.fc-custom2-button:hover {width: 100px; border: 1px solid #FFFEEA; background-color: #A6C14C; color: white; font-family: 'Arita-dotum-Medium';}
	
	img {margin: auto; width: 100px; height: 100px;}
	
	.fc-content {text-align: center; }
	.fc-title{font-family: 'Cafe24Dongdong';}
</style>
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
                    		text:'출석체크', 
                    		id:'check',
                    		// 출석체크 버튼 누르면 출석완료 처리
             				click:function(){
                 				var date = $(".fc-today").attr("data-date");
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
				                 	// $(".fc-today ").append($('<span>'+'출석완료'+'</span>'));
				                    alert('오늘의 출석이 완료되었습니다. 10포인트가 지급되었습니다!');
				                    calendar.addEvent({
                         				"start": date,
                         				"color" : "white",
                         				"textColor" : "white",
                          				imageurl : "/img/check.PNG"
                     				})
                 				});
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
    	 	}
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
	//	eventRender:function(event, element) {    
    //		element.find("td.fc-today").prepend("<img src="+info.extendedProps.imageurl+">"); 
 	//	}  
 	//})
</script>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
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
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>