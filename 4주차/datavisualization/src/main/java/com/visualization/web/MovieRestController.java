package com.visualization.web;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.visualization.service.MovieService;
import com.visualization.vo.MovieVO;

@RestController
public class MovieRestController {

private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Inject
	private MovieService movieService;
	
	@RequestMapping(value = "/restex", method = RequestMethod.GET)
	public List<MovieVO> home() throws Exception{
		logger.info("REST TEST HOME}.");
		
		List<MovieVO> list = movieService.selectMovie();
		

		
		return list;
	}
}
