<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../common_resource.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/each_quality.js"></script>
</head>
<body>
	<h2>Each Quality</h2>
	<div id="wine_compare_chart"></div>
	<div class="input_wrap">
		<input type="number" name="wine1" value="1"/>
		<input type="number" name="wine2" value="2"/>
		<input type="number" name="wine3" value="3"/>
		<input type="number" name="wine4" value="4"/>
		<button onclick="getWineList()">비교하기</button>
	</div>
</body>
</html>