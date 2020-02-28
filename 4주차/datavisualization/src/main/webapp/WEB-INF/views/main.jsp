<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="pie"></div>
	<div id="bar"></div>
	<div id="line"></div>
	
	<script src="https://d3js.org/d3.v3.min.js"></script>
	<script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.v0.6.3.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function(){
			sendAjax();
		});
		
		function sendAjax() {
			
					d3.json('/load/data').get(function(err, data){
						console.log(data);
						//drawPieChart(data);
						drawBarChart(data);
						//drawLineChart(data);
					});

					

		}
		
		function drawPieChart(data){
			console.log(data);
			var width = 540,
					height = 540,
					// outerRadius = Math.min(width,height)/2,
					// innerRadius = outerRadius*5,
					radius = 200
					color = d3.scale.category20();
			var vis = d3.select("#pie")
				.append("svg:svg")
					.attr("width",width)
					.attr("height",height)
					.append("svg:g")
						.attr("transform", "translate("+width/2+","+height/2+")")
						.data([data]);
			
			var arc = d3.svg.arc().innerRadius(radius).outerRadius(radius-50);
			
			var pie = d3.layout.pie().value(function(d) { 
				console.log(d);
				return d.frequency; }).sort(null);
			console.log(vis);
			console.log(arc);
			console.log(pie);
			
			var arcs = vis.selectAll("g.slice").data(pie)
			.enter()
			.append("svg:g")
				.attr("class","slice");
		
			arcs.append("svg:path")
				.attr("d",arc)
				.attr("fill", function(d, i){ 
					console.log(d);
					console.log(i);
					return color(i); 
				});
			
			arcs.append("svg:text")
				.attr("dy",".53em")
				.attr("text-anchor","middle")
				.attr("transform",function(d) { 
					return "translate("+arc.centroid(d)+") rotate("+angle(d)+")";
				})
				.text(function(d,i) { return d.x[i]+" "+d.y[i]; })
		
			vis.append("svg:text")
			.attr("dy",".35em")
			.attr("text-anchor","middle")
			.text("알파벳")
			.attr("class","title");


			
			function angle(d) {
				var a = (d.startAngle+d.endAngle)*90/Math.PI-90;
				return a>90?a-180:a;
			}
			


		}		
		
		function drawBarChart(data) {
			var margin = {top: 40, right: 20, bottom: 30, left: 40},
		    width = 960 - margin.left - margin.right,
		    height = 500 - margin.top - margin.bottom;

			var formatPercent = d3.format(".0%");
	
			var x = d3.scale.ordinal()
			    .rangeRoundBands([0, width], .1);
	
			var y = d3.scale.linear()
			    .range([height, 0]);
	
			var xAxis = d3.svg.axis()
			    .scale(x)
			    .orient("bottom");
	
			var yAxis = d3.svg.axis()
			    .scale(y)
			    .orient("left")
			    .tickFormat(formatPercent);
	
			var tip = d3.tip()
			  .attr('class', 'd3-tip')
			  .offset([-10, 0])
			  .html(function(d) {
			    return "<strong>Frequency:</strong> <span style='color:red'>" + d.frequency + "</span>";
			  })
	
			var svg = d3.select("#bar").append("svg")
			    .attr("width", width + margin.left + margin.right)
			    .attr("height", height + margin.top + margin.bottom)
			  .append("g")
			    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
	
			svg.call(tip);
	
			//d3.json(data, type, function(error, data) {
			 // x.domain(data.map(function(d) { return d.letter; }));
			 // y.domain([0, d3.max(data, function(d) { return d.frequency; })]);
			 x.domain(data.x.map(function(d) { return d.letter; }));
			 y.domain([0, d3.max(data.y, function(d) { return d.frequency; })]);
			  svg.append("g")
			      .attr("class", "x axis")
			      .attr("transform", "translate(0," + height + ")")
			      .call(xAxis);
	
			  svg.append("g")
			      .attr("class", "y axis")
			      .call(yAxis)
			    .append("text")
			      .attr("transform", "rotate(-90)")
			      .attr("y", 6)
			      .attr("dy", ".71em")
			      .style("text-anchor", "end")
			      .text("Frequency");
				
			  svg.selectAll(".bar")
			      .data(data.x)
			    .enter().append("rect")
			      .attr("class", "bar")
			      .attr("x", function(d) { console.log(d);return x(d.letter); })
			      .attr("width", x.rangeBand())
			  
	      svg.selectAll(".bar")
			      .data(data.y)
			    .enter().append("rect")
			      .attr("class", "bar")
			      .attr("y", function(d) { console.log(d); return y(d.frequency); })
			      .attr("height", function(d) { return height - y(d.frequency); })
			      .on('mouseover', tip.show)
			      .on('mouseout', tip.hide)
	
			//});
		}
		
		function drawLineChart(data) {
			var margin = {top: 40, right: 20, bottom: 30, left: 40},
		    width = 960 - margin.left - margin.right,
		    height = 500 - margin.top - margin.bottom;

			var formatPercent = d3.format(".0%");
	
			var x = d3.scale.ordinal()
			    .rangeRoundBands([0, width], .1);
	
			var y = d3.scale.linear()
			    .range([height, 0]);
	
			var xAxis = d3.svg.axis()
			    .scale(x)
			    .orient("bottom");
	
			var yAxis = d3.svg.axis()
			    .scale(y)
			    .orient("left")
			    .tickFormat(formatPercent);
			
			var line = d3.svg.line()
				.x(function(d){ return x(d.letter); })
				.y(function(d){ return y(d.frequency); })
				.interpolate("cardinal");
			
			var svg = d3.select("#line").append("svg")
			    .attr("width", width + margin.left + margin.right)
			    .attr("height", height + margin.top + margin.bottom)
			  .append("g")
			    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
			
			
			d3.json(data, type, function(error, data) {
				  x.domain(data.map(function(d) { return d.letter; }));
				  y.domain([0, d3.max(data, function(d) { return d.frequency; })]);
			
				  svg.append("path")	
					.attr("class", "line")
					.attr("d", line(data));
			 
					// Add the X Axis
					svg.append("g")		
						.attr("class", "x axis")
						.attr("transform", "translate(0," + height + ")")
						.call(xAxis);
				 
					// Add the Y Axis
					svg.append("g")		
						.attr("class", "y axis")
						.call(yAxis);
			
			});
		}
		
		function type(d) {
			console.log(d);
		  d.frequency = +d.frequency;
		  return d;
		}
	</script>
</body>
</html>