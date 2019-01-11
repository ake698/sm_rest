package com.sm_rest.bean;

import java.util.List;

public class Order {
	private int orderid;
	private String foods;
	private int money;
	private int userid;
	private List<Userinfo> user;
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getFoods() {
		return foods;
	}
	public void setFoods(String foods) {
		this.foods = foods;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public List<Userinfo> getUser() {
		return user;
	}
	public void setUser(List<Userinfo> user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Order [orderid=" + orderid + ", foods=" + foods + ", userid=" + userid + ", money=" + money + ", user="
				+ user + "]";
	}
	public Order(int orderid, String foods, int userid, int money, List<Userinfo> user) {
		super();
		this.orderid = orderid;
		this.foods = foods;
		this.userid = userid;
		this.money = money;
		this.user = user;
	}
	public Order() {
		super();
	}

	
}
