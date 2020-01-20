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
</head>
<body>

        <canvas id='canvas' width='880' height='300'>
            Canvas not supported, use another browser.
        </canvas>
        <script>
            let theWheel = new Winwheel();
        </script>

</body>
</html>