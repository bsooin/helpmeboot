package org.helpme.domain;

public class RatingVO {
	private int oneStar;
	private int twoStar;
	private int threeStar;
	private int fourStar;
	private int fiveStar;
	private int sum;
	private double starAvg;
	
	public RatingVO() {
		this.fiveStar = 0;
		this.fourStar = 0;
		this.threeStar = 0;
		this.twoStar = 0;
		this.oneStar = 0;
		this.sum = 0;
		this.starAvg=0;
		
	}
	
	public RatingVO(int oneStar, int twoStar, int threeStar, int fourStar, int fiveStar) {
		super();
		this.oneStar = oneStar;
		this.twoStar = twoStar;
		this.threeStar = threeStar;
		this.fourStar = fourStar;
		this.fiveStar = fiveStar;
		this.sum = fiveStar+fourStar+threeStar+twoStar+oneStar;
		this.starAvg = 0;
		calStar();
	}


	public void calStar() {
		starAvg = (oneStar+twoStar*2+threeStar*3+fourStar*4+fiveStar*5)/(double)sum;
		starAvg = (Math.round(starAvg*100))/100.0;
		oneStar = (int)(oneStar*100/(double)sum);
		twoStar = (int)(twoStar*100/(double)sum);
		threeStar = (int)(threeStar*100/(double)sum);
		fourStar = (int)(fourStar*100/(double)sum);
		fiveStar = (int)(fiveStar*100/(double)sum);
	}

	public int getFiveStar() {
		return fiveStar;
	}

	public void setFiveStar(int fiveStar) {
		this.fiveStar = fiveStar;
	}

	public int getFourStar() {
		return fourStar;
	}

	public void setFourStar(int fourStar) {
		this.fourStar = fourStar;
	}

	public int getThreeStar() {
		return threeStar;
	}

	public void setThreeStar(int threeStar) {
		this.threeStar = threeStar;
	}

	public int getTwoStar() {
		return twoStar;
	}

	public void setTwoStar(int twoStar) {
		this.twoStar = twoStar;
	}

	public int getOneStar() {
		return oneStar;
	}

	public void setOneStar(int oneStar) {
		this.oneStar = oneStar;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public double getStarAvg() {
		return starAvg;
	}

	public void setStarAvg(double starAvg) {
		this.starAvg = starAvg;
	}

	@Override
	public String toString() {
		return "StarVO [fiveStar=" + fiveStar + ", fourStar=" + fourStar + ", threeStar=" + threeStar + ", twoStar="
				+ twoStar + ", oneStar=" + oneStar + ", sum=" + sum + ", starAvg=" + starAvg + "]";
	}
	
	
	
	
	
}
