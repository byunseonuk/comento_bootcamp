package com.visualization.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.visualization.vo.ChartTestVO;

@RestController
public class ChartRestController {
	@GetMapping("load/data")
	public ChartTestVO loadData() {
		Map<String,Object> map = new HashMap<String,Object>();
		ChartTestVO chart = new ChartTestVO();
		String[] x = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N",
				"O","P","Q","R","S","T","U","V","W","X","Y","Z"};
		double[] y = {.08167,.01492,.02780,.04253,.12702,.02288
		,.02022,.06094,.06973,.00153,.00747,.04025
		,.02517,.06749,.07507,.01929,.00098,.05987
		,.06333,.09056,.02758,.01037,.02465,.00150
		,.01971,.00074};
		
		chart.setTitle("bar chart");
		chart.setX_title("letter");
		chart.setY_title("frequency");
		chart.setX(x);
		chart.setY(y);
		
		
		return chart;
	
	}
}

