$(document).ready(function(){
	getAllWine();
	getWineAverage();
	getAverageCount();
});

var wineList;
var wineAverage;
function drawEachWineChart(){
	var index = $('#wine_selector').val();
	var wine = wineList[index];
	
	var dataKey = [];
	var dataValue = [];
	for(var key in wine){
		if(key!='product_seq'){
			dataKey.push(key);
			dataValue.push(wine[key]);
		}
	}
	
	drawEachWinePieChart(dataKey, dataValue);
	drawEachWineAreaChart(dataKey, dataValue);
	drawCompareAverageAreaChart(dataKey, dataValue);
	
}

function drawEachWinePieChart(labels, values){
	var data = [{
		values: values,
		labels: labels,
		type: 'pie'
	}];
	
	var layout = {
			title: {
				text: 'Wine Quality Pie Chart',
				font: {
					size: 24
				}
			},
			height:500,
			width:500
	};
	
	Plotly.newPlot('each_wine_pie',data,layout);
}

function drawEachWineAreaChart(x, y){
	var wine = {
			x: x,
			y: y,
			fill: 'tozeroy',
			type: 'scatter'
			
	};
	
	var layout = {
			title: {
				text: 'Wine Quality Area Chart',
				font: {
					size: 24
				}
			},
			height:500,
			width:500
	};
	
	var data = [wine];
	Plotly.newPlot('each_wine_area',data,layout);
}

function drawCompareAverageAreaChart(x, y) {
	
	var wine = {
			x: x,
			y: y,
			fill: 'tozeroy',
			type: 'scatter'
	};
	
	var ax=[];
	var ay=[];
	
	for(var key in wineAverage){
		if(key!='product_seq'){
			ax.push(key);
			ay.push(wineAverage[key]);
		}
	}
	
	console.log(ax);
	console.log(ay);
	
	var average = {
			x: ax,
			y: ay,
			fill: 'tonexty',
			type: 'scatter'
	}
	
	var layout = {
			title: {
				text: 'Wine Compare Average Area Chart',
				font: {
					size: 24
				}
			},
			height:500,
			width:500
	};
	
	var data = [wine, average];
	
	Plotly.newPlot('compare_average_area',data,layout);
	
}

function drawAverageAboveOrBelowCountPieChart(averageCount) {

	var x =[];
	var y =[];
	for(var key in averageCount){
		x.push(key);
		y.push(averageCount[key]);
	}
	
	var data = [
		{
			x:x,
			y:y,
			type: 'bar'
		}
	];
	
	var layout = {
			title: {
				text: 'Average Above/Below Count',
				font: {
					size: 24
				}
			},
			height:500,
			width:500
	};
	
	Plotly.newPlot('average_above_below_count',data,layout);
}

function getAllWine(){
	$.ajax({
		type:'GET',
		url: '/getAllWine',
		error:function(error) {
			console.log(error);
		},
		success:function(data) {
			wineList = data.wineList;
			setWineSelector(wineList);
			drawEachWineChart();
		}
	});
}

function getWineAverage() {
	$.ajax({
		type:'GET',
		url: '/getAverage',
		error:function(error) {
			console.log(error);
		},
		success:function(data) {
			wineAverage = data.wineAverage;

		}
	});
}

function getAverageCount() {
	$.ajax({
		type:'GET',
		url: '/getAverageCount',
		error:function(error) {
			console.log(error);
		},
		success:function(data) {
		
			drawAverageAboveOrBelowCountPieChart(data.averageCount);
		}
	});
}

function setWineSelector(wineList){
	var html='';
	$.each(wineList, function(i, wine){
		html+='<option value="'+i+'">'+wine.product_seq+'</option>';
	})
	
	$('#wine_selector').html(html);
	drawEachWinePieChart();
	drawEachWineAreaChart();
}