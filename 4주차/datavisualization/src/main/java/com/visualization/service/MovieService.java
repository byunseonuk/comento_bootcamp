package com.visualization.service;

import java.util.List;

import com.visualization.vo.MovieVO;

public interface MovieService {
	public List<MovieVO> selectMovie() throws Exception;
}
