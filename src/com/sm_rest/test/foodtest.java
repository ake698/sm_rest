package com.sm_rest.test;

import java.io.IOException;
import java.util.List;

import com.sm_rest.bean.Food;
import com.sm_rest.dao.FoodDao;

public class foodtest {
	static FoodDao fooddao = new FoodDao();
	public static Food getFood(int id) throws IOException {
		Food food = fooddao.getFood(id);
		System.out.println(food);
		return food;
	}
	public static void getAllFood() throws IOException {
		List<Food> list = fooddao.getAllFood();
		for (Food food : list) {
			System.out.println(food);
		}
	}
	public static void insFood(Food food) throws IOException {
		fooddao.insFood(food);
	}
	public static void updFood(Food food) throws IOException {
		fooddao.updFood(food);
	}
	public static void delFood(int id) throws IOException {
		fooddao.delFood(id);
	}
	public static void main(String[] args) throws IOException {

//		getAllFood();
		Food food=getFood(4);
		food.toString();
//		food.setCost(43);
//		updFood(food);
//		food.setCount(3);
//		food.setFoodname("≈£ÎÓÏ“");
//		insFood(food);
//		delFood(6);
		
		
		
	}
}
