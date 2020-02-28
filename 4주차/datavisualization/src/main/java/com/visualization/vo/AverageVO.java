package com.visualization.vo;

public class AverageVO {
	private int above;
	private int below;
	public int getAbove() {
		return above;
	}
	public void setAbove(int above) {
		this.above = above;
	}
	public int getBelow() {
		return below;
	}
	public void setBelow(int below) {
		this.below = below;
	}
	@Override
	public String toString() {
		return "AverageVO [above=" + above + ", below=" + below + "]";
	}
	
}
