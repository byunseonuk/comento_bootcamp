package com.visualization.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.visualization.service.WineService;
import com.visualization.vo.AverageVO;
import com.visualization.vo.WineVO;

@RestController
public class WineRestController {
	
	@Autowired
	WineService wineService;
	
	@RequestMapping("/getWine/{wineNumber}")
	public Map<String,Object> getWine(@PathVariable("wineNumber") int wineNumber ) throws Exception {
		Map<String,Object> result = new HashMap<String,Object>();
		WineVO wine = wineService.getWine(wineNumber);
		
		result.put("wine",wine);
		
		return result;
		
	}
	
	@RequestMapping("/getAllWine")
	public Map<String,Object> getAllWine() throws Exception {
		Map<String,Object> result = new HashMap<String,Object>();
		List<WineVO> wineList = wineService.getAllWine();
		
		result.put("wineList",wineList);
		
		return result;
		
	}
	
	
	@RequestMapping("/getAverageCount")
	public Map<String,Object> getAverageCount() throws Exception {
		Map<String,Object> result = new HashMap<String,Object>();
		AverageVO average = wineService.getAverageCount();
		
		result.put("averageCount",average);
		
		return result;
		
	}
	
	@RequestMapping("/getAverage")
	public Map<String,Object> getAverage() throws Exception {
		Map<String,Object> result = new HashMap<String,Object>();
		WineVO WineAverage = wineService.getAverage();
		
		result.put("wineAverage",WineAverage);
		
		return result;
		
	}
	
	@RequestMapping("/getComparedWine")
	public Map<String,Object> getComparedWine(@RequestParam int wine1, @RequestParam int wine2, 
											  @RequestParam int wine3, @RequestParam int wine4 ) throws Exception {
		Map<String,Object> result = new HashMap<String,Object>();
		List<WineVO> comparedWines = wineService.getComparedWines(wine1,wine2,wine3,wine4);
		
		result.put("comparedWines",comparedWines);
		
		return result;
		
	}
	
	

}
