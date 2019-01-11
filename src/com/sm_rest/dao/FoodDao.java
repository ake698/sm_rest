package com.sm_rest.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sm_rest.bean.Food;

public class FoodDao {
	static String resource = "mybatis.xml";

	public Food getFood(int id) throws IOException {
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession();
		String statement = "com.sm_rest.mapper.foodMapper.getFood";
		Food food = session.selectOne(statement,id);
		session.close();
		return food;
	}
	public void delFood(int id) throws IOException {
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession(true);
		String statement = "com.sm_rest.mapper.foodMapper.delFood";
		session.delete(statement,id);
		session.close();
	}
	public void updFood(Food food) throws IOException {
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession(true);
		String statement = "com.sm_rest.mapper.foodMapper.updFood";
		session.update(statement,food);
		session.close();
	}
	public void insFood(Food food) throws IOException {
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession(true);	
		String statement = "com.sm_rest.mapper.foodMapper.insFood";
		session.insert(statement,food);
		session.close();
	}
	public List<Food> getAllFood() throws IOException{
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession();
		String statement = "com.sm_rest.mapper.foodMapper.getAllFood";
		List userlist = session.selectList(statement);
		session.close();
		return userlist;
	}
}
