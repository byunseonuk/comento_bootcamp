package com.visualization.vo;

public class WineVO {
	private int product_seq;
	private double fixed_acidity;
	private double volatile_acidity; 
	private double citric_acid;
	private double residual_sugar;
	private double chlorides;
	private int free_sulfur_dioxide;
	private int total_sulfur_dioxide;
	private double density;
	private double pH;
	private double sulphates;
	private double alcohol;
	private int quality;
	public int getProduct_seq() {
		return product_seq;
	}
	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}
	public double getFixed_acidity() {
		return fixed_acidity;
	}
	public void setFixed_acidity(double fixed_acidity) {
		this.fixed_acidity = fixed_acidity;
	}
	public double getVolatile_acidity() {
		return volatile_acidity;
	}
	public void setVolatile_acidity(double volatile_acidity) {
		this.volatile_acidity = volatile_acidity;
	}
	public double getCitric_acid() {
		return citric_acid;
	}
	public void setCitric_acid(double citric_acid) {
		this.citric_acid = citric_acid;
	}
	public double getResidual_sugar() {
		return residual_sugar;
	}
	public void setResidual_sugar(double residual_sugar) {
		this.residual_sugar = residual_sugar;
	}
	public double getChlorides() {
		return chlorides;
	}
	public void setChlorides(double chlorides) {
		this.chlorides = chlorides;
	}
	public int getFree_sulfur_dioxide() {
		return free_sulfur_dioxide;
	}
	public void setFree_sulfur_dioxide(int free_sulfur_dioxide) {
		this.free_sulfur_dioxide = free_sulfur_dioxide;
	}
	public int getTotal_sulfur_dioxide() {
		return total_sulfur_dioxide;
	}
	public void setTotal_sulfur_dioxide(int total_sulfur_dioxide) {
		this.total_sulfur_dioxide = total_sulfur_dioxide;
	}
	public double getDensity() {
		return density;
	}
	public void setDensity(double density) {
		this.density = density;
	}
	public double getpH() {
		return pH;
	}
	public void setpH(double pH) {
		this.pH = pH;
	}
	public double getSulphates() {
		return sulphates;
	}
	public void setSulphates(double sulphates) {
		this.sulphates = sulphates;
	}
	public double getAlcohol() {
		return alcohol;
	}
	public void setAlcohol(double alcohol) {
		this.alcohol = alcohol;
	}
	public int getQuality() {
		return quality;
	}
	public void setQuality(int quality) {
		this.quality = quality;
	}
	@Override
	public String toString() {
		return "WineVO [product_seq=" + product_seq + ", fixed_acidity=" + fixed_acidity + ", volatile_acidity="
				+ volatile_acidity + ", citric_acid=" + citric_acid + ", residual_sugar=" + residual_sugar
				+ ", chlorides=" + chlorides + ", free_sulfur_dioxide=" + free_sulfur_dioxide
				+ ", total_sulfur_dioxide=" + total_sulfur_dioxide + ", density=" + density + ", pH=" + pH
				+ ", sulphates=" + sulphates + ", alcohol=" + alcohol + ", quality=" + quality + "]";
	}

	
	
}
