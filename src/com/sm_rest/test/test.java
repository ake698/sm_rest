package com.sm_rest.test;

import java.io.IOException;
import java.util.List;

import com.sm_rest.bean.Userinfo;
import com.sm_rest.dao.FoodDao;
import com.sm_rest.dao.UserDao;

public class test {
	static UserDao userdao = new UserDao();
	
	public static Userinfo getUser(int id) throws IOException {
		Userinfo user = userdao.getUser(id);
		return user;
	}
	public static void delUser(int id) throws IOException {
		userdao.delUser(id);
	}
	public static void updateUser(Userinfo user) throws IOException {		
		userdao.updUser(user);
	}
	public static void getAll() throws IOException {
		List<Userinfo> list=userdao.getAllUser();
		for (Userinfo userinfo : list) {
			System.out.println(userinfo);
		}
	}
	public static void insUser(Userinfo user) throws IOException {
		userdao.insUser(user);
	}

	
	public static void main(String[] args) throws IOException {
		
//		delUser();
		
//		Userinfo user = userdao.getUserByName("assefgsd");
//		System.out.println(user);
//		user.setUsername("test");
//		userdao.updUser(user);
		
//		getAll();

//		insUser(user);
//		getAll();
		
	}
}
