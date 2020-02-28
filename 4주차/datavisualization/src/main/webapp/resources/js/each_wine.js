$(document).ready(function(){
	getAllWine();
});

var wineList;

function drawEachWineChart() {
	var index = $('#wine_selector').val();
	var wine = wineList[index];
	
	var categories = [];
	var seriesData = [];
	for(var key in wine){
		if(key!='product_seq'){
			categories.push(key);
			seriesData.push(wine[key]);
		}
	}

	
	$('#each_wine_line_chart').highcharts({
		title: {
			text: wine.product_seq + ' Wine Quality'
		},
		xAxis: {
			categories: categories
		},
		yAxis: {
			title: {
				text: 'Value'
			},
			plotLines: [{
  	value: 0,
  	width: 1,
  	color: '#808080'
  }]
		},
		plotOptions: {
			series: {
				color: '#FF0000'
			}
		},
		series: [
			{
				name: wine.product_seq + ' Wine',
				data: seriesData
			}
		]
		
	});

}

function drawWinePieChart() {
	var index = $('#wine_selector').val();
	var wine = wineList[index];
	var winedata = [];
	
	for(var key in wine) {
		if(key!='product_seq'){
			var obj = {};
			obj.name = key;
			obj.y = wine[key];
			obj.z = wine[key];
			winedata.push(obj);
		}
	}
	
	Highcharts.chart('each_wine_pie_chart', {
		chart: {
			type: 'variablepie'
    },
    title: {
			text: wine.product_seq + ' Wine Quality'
    },
    series: [{
        minPointSize: 0,
        innerSize: '30%',
        zMin: 0,
        name: 'winedata',
        data: winedata
    }]
		
	});
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
		}
	});
}

function setWineSelector(wineList){
	var html='';
	$.each(wineList, function(i, wine){
		html+='<option value="'+i+'">'+wine.product_seq+'</option>';
	})
	
	$('#wine_selector').html(html);
	drawEachWineChart();
	drawWinePieChart();
}