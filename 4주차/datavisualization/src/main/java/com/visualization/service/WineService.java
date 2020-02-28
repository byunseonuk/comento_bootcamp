package com.visualization.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.visualization.dao.WineDAO;
import com.visualization.vo.AverageVO;
import com.visualization.vo.WineVO;

@Service
public class WineService {

	@Inject
	WineDAO wineDAO;
	
	public WineVO getWine(int wineNumber) {
		// TODO Auto-generated method stub
		return wineDAO.getWine(wineNumber);
	}

	public List<WineVO> getAllWine() {
		// TODO Auto-generated method stub
		return wineDAO.getAllWine();
	}

	public AverageVO getAverageCount() {
		// TODO Auto-generated method stub
		return wineDAO.getAverageCount();
	}

	public WineVO getAverage() {
		// TODO Auto-generated method stub
		return wineDAO.getAverage();
	}

	public List<WineVO> getComparedWines(int wine1, int wine2, int wine3, int wine4) {

		int[] wines = {wine1,wine2,wine3,wine4};
		return wineDAO.getComparedWines(wines);
	}


}
