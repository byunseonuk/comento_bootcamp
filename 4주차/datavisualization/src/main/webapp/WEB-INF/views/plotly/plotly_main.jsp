<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container {
		display: inline-flex;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plotly_main.js"></script>
</head>
<body>
	<div class="container">
		<h1>Plotly.js Chart</h1>
		<div>
			<div>
				<select id="wine_selector" onchange="drawEachWineChart()"></select>
				<div id="each_wine_pie"></div>
			</div>
			<div>
				<div id="each_wine_area"></div>
			</div>
		</div>
		<div>
			<div>
				<div id="compare_average_area"></div>
			</div>
			<div>
				<div id="average_above_below_count"></div>
			</div>
		</div>
	</div>
</body>
</html>