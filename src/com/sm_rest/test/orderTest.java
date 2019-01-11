package com.sm_rest.test;

import java.io.IOException;
import java.util.List;

import com.sm_rest.bean.Order;
import com.sm_rest.dao.OrderDao;

public class orderTest {

	static OrderDao odao = new OrderDao();
	
	public static void getOrder(int id) throws IOException {
		List<Order> list = odao.getOrder(id);
		System.out.println(list);
		for (Order order : list) {
			System.out.println(order);
		}
	}
	public static void getAllOrder() throws IOException {
		List<Order> list = odao.getAllOrder();
		System.out.println(list);
	}
	public static void insOrder(Order order) throws IOException {
		odao.insOrder(order);
	}
	public static void main(String[] args) throws IOException {
//		getOrder(1);
//		getAllOrder();
//		Order order =  new Order();
//		order.setFoods("fasdfds");
//		order.setUserid(3);
//		insOrder(order);
//		odao.delOrder(4);
//		List<Order> allUserId = odao.getAllUserId(1);
//		System.out.println(allUserId);
	}
}
