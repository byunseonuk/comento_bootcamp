package com.visualization.dao;

import java.util.List;

import com.visualization.vo.MovieVO;

public interface MovieDAO {
	public List<MovieVO> selectMovie() throws Exception;
}
