$(document).ready(function(){
	getWineList();
});

var wineList=[];

function drawWineCompareChart() {
	
	
	var seriesData = [];
	var categories = [];
	
	for(var key in wineList[0]){
		if(key!='product_seq')
			categories.push(key);
	}
	
	
	for(var i=0;i<wineList.length;i++){
		var obj={};
		obj.name = wineList[i].product_seq;
		console.log(obj.name);
		var data = [];
		for(var key in wineList[i]){
			if(key!='product_seq'){
				data.push(wineList[i][key]);
			}
		}
		obj.data = data;
		seriesData.push(obj);
	}

	$('#wine_compare_chart').highcharts({
		chart: {
			type: 'column'
		},
		title: {
			text: 'Wine Compare Chart'
		},
		xAxis: {
			categories: categories
		},
		yAxis: {
			text: 'Value'
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
		series: seriesData
	});
}

function getWineList() {
	var param = 'wine1='+$('input[name="wine1"]').val()+"&"
						+'wine2='+$('input[name="wine2"]').val()+"&"
						+'wine3='+$('input[name="wine3"]').val()+"&"
						+'wine4='+$('input[name="wine4"]').val();
	
	$.ajax({
		type:'GET',
		url: '/getComparedWine?'+param,
		error:function(error) {
			console.log(error);
		},
		success:function(data) {
			wineList = data.comparedWines;

			drawWineCompareChart();
		}
	});
}