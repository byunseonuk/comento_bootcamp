$(document).ready(function(){
	getTotalWineAverage();
	getWineAverageCount();
});


function drawWineAverageColumnChart(wineAverage) {
	
	var categories = [];
	var seriesData = [];

	for(var key in wineAverage){
		if(key!='product_seq'){
			categories.push(key);
			seriesData.push(parseFloat(wineAverage[key]));
		}
	}

	
	$('#wine_average_chart').highcharts({
		chart: {
    	type: 'column'
    },
		title: {
			text: ' Wine Quality Average'
		},
		xAxis: {
			categories: categories
		},
		yAxis: {
			title: {
				text: 'Value'
			}
		},
		tooltip: {
	        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
	        footerFormat: '</table>',
	        shared: true,
	        useHTML: true
	    },
	    plotOptions: {
	        column: {
	            pointPadding: 0.2,
	            borderWidth: 0
	        }
	    },
		series: [
			{
				name: 'Wine Average',
				data: seriesData
			}
		]
		
	});
}

function drawWineAverageCountColumnChart(averageCount) {
	var categories = [];
	var seriesData = [];

	for(var key in averageCount){
		if(key!='product_seq'){
			categories.push(key);
			seriesData.push(averageCount[key]);
		}
	}

	
	$('#wine_averageCount_chart').highcharts({
		chart: {
    	type: 'column'
    },
		title: {
			text: ' Wine Quality Average Above / Below'
		},
		tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        },
        series: {
					pointWidth: 50
				}
    },
		xAxis: {
			categories: categories
		},
		yAxis: {
			title: {
				text: 'Value'
			}
		},
		series: [
			{
				name: 'Wine AverageCount',
				data: seriesData
			}
		]
		
	});
}



function getTotalWineAverage(){
	$.ajax({
		type:'GET',
		url: '/getAverage',
		error:function(error) {
			console.log(error);
		},
		success:function(data) {
			drawWineAverageColumnChart(data.wineAverage);
		}
	})
}

function getWineAverageCount(){
	$.ajax({
		type:'GET',
		url: '/getAverageCount',
		error:function(error) {
			console.log(error);
		},
		success:function(data) {
			drawWineAverageCountColumnChart(data.averageCount);
		}
	})
}