package com.sm_rest.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sm_rest.bean.Food;
import com.sm_rest.bean.Order;

public class OrderDao {
	static String resource = "mybatis.xml";
	public List<Order> getOrder(int id) throws IOException {
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession();
		String statement = "com.sm_rest.mapper.orderMapper.getOrder";
		List<Order> list = session.selectList(statement,id);
		session.close();
		return list;
	}
	public List<Order> getAllUserId(int id) throws IOException {
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession();
		String statement = "com.sm_rest.mapper.orderMapper.getAllUserId";
		List<Order> list = session.selectList(statement,id);
		session.close();
		return list;
	}
	public List<Order> getAllOrder() throws IOException {
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession();
		String statement = "com.sm_rest.mapper.orderMapper.getAllOrder";
		List<Order> list = session.selectList(statement);
		session.close();
		return list;
	}
	public void insOrder(Order order) throws IOException {
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession(true);
		String statement = "com.sm_rest.mapper.orderMapper.insOrder";
		session.insert(statement,order);
		session.close();
	}
	public void delOrder(int id) throws IOException {
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession(true);
		String statement = "com.sm_rest.mapper.orderMapper.delOrder";
		session.delete(statement,id);
		session.close();
		
	}
	
}
