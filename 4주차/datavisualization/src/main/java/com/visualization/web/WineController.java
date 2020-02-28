package com.visualization.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WineController {
	
	@RequestMapping("/highchart")
	public String showMain() {
		return "/highchart/highchart_main";
	}
	
	@RequestMapping("/highchart/each_wine")
	public String showEachWine() {
		return "/highchart/each_wine";
	}
	
	@RequestMapping("/highchart/wine_average")
	public String showWineAverage() {
		return "/highchart/wine_average";
	}
	
	@RequestMapping("/highchart/each_quality")
	public String showEachQuality() {
		return "/highchart/each_quality";
	}
	
	@RequestMapping("/plotly")
	public String showPlotlyMain() {
		return "/plotly/plotly_main";
	}
}
