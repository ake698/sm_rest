package com.sm_rest.bean;

public class Food {
	int foodid;
	String foodname;
	int cost;

	public int getFoodid() {
		return foodid;
	}
	public void setFoodid(int foodid) {
		this.foodid = foodid;
	}
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}

	@Override
	public String toString() {
		return "Food [foodid=" + foodid + ", foodname=" + foodname + ", cost=" + cost + "]";
	}
	public Food() {
		super();
	}
	public Food(int foodid, String foodname, int cost) {
		super();
		this.foodid = foodid;
		this.foodname = foodname;
		this.cost = cost;
	}
}
