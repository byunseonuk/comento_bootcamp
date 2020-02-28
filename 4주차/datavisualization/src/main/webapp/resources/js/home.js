$(document).ready(function(){
	load_movielist();
});

function load_movielist() {
	var movieList;
	var html
	
	$("#load_movieList").click(function(){
		var url = "/restex";
		
		$.ajax({
			type: "GET",
			url: url,
			success: function(args) {
				movieList = args;
				for(var i=0;i<movieList.length;i++){
					html = "<tr>"
						+"<td>"+movieList[i].movie_name+"</td>"
						+"<td>"+movieList[i].director+"</td>"
						+"<td>"+movieList[i].type+"</td>"
						+"</tr>";
					$("#movieList").append(html);
				}
				
				console.log(args);
			},
			beforeSend: function(){
				$("#movieList").empty();
			},
			error: function(e) {
				alert(e.responseText);
			}
		
		});
	});
}