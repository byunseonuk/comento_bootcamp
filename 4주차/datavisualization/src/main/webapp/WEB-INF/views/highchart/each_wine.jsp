<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../common_resource.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/each_wine.js"></script>
<script src="https://code.highcharts.com/modules/variable-pie.js"></script>
</head>
<body>
	<h2>Each Wine</h2>
	<div>
		<select id="wine_selector" onchange="drawEachWineChart()"></select>
	</div>
	<div id="each_wine_line_chart"></div>
	<div id="each_wine_pie_chart"></div>
	
</body>
</html>