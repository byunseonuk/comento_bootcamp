package com.visualization.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.visualization.vo.AverageVO;
import com.visualization.vo.WineVO;

@Repository
public class WineDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace= "com.visualization.mybatis.sql.wine";

	public WineVO getWine(int WineNumber) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".getWine",WineNumber);
	}

	public List<WineVO> getAllWine() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".getWineList");
	}

	public AverageVO getAverageCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".getAverageCount");
	}

	public WineVO getAverage() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".getAverage");
	}

	public List<WineVO> getComparedWines(int[] wines) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".getComparedWines",wines);
	}

	

}
