<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/highchart_main.css" rel="stylesheet" />
<%@include file="../common_resource.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="side_nav">
			<ul>
				<li data-show="each_wine">Each Wine Quality</li>
				<li data-show="wine_average">Wine Average</li>
				<li data-show="each_quality">Each Quality</li>
			</ul>
		</div>
		<div class="chart_wrap">
			<iframe src="/highchart/wine_average" id="showChart"></iframe>
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
			addSideNavClickEvent();
		});
	
		var baseUrl = '/highchart/';
	
		function addSideNavClickEvent(){
			$('.side_nav > ul').click(function(event){
				var clickEl = event.target;
				var url = baseUrl+$(clickEl).data('show');
				
				$('#showChart').attr('src',url);
				
			});
		}
	</script>
</body>
</html>