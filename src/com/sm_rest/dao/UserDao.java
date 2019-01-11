package com.sm_rest.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sm_rest.bean.Userinfo;

public class UserDao {

	static String resource = "mybatis.xml";

	public Userinfo getUser(int id) throws IOException {
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession();
		String statement = "com.sm_rest.mapper.userMapper.getUser";
		Userinfo user = session.selectOne(statement,id);
		session.close();
		return user;
	}
	public Userinfo getUserByName(String name) throws IOException {
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession();
		String statement = "com.sm_rest.mapper.userMapper.getUserByname";
		Userinfo user = session.selectOne(statement,name);
		session.close();
		return user;
	}
	public void delUser(int id) throws IOException {
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession(true);
		String statement = "com.sm_rest.mapper.userMapper.delUser";
		session.delete(statement,id);
		session.close();
	}
	public void updUser(Userinfo user) throws IOException {
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession(true);
		String statement = "com.sm_rest.mapper.userMapper.updUser";
		session.update(statement,user);
		session.close();
	}
	public void insUser(Userinfo user) throws IOException {
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession(true);	
		String statement = "com.sm_rest.mapper.userMapper.insUser";
		session.insert(statement,user);
		session.close();
	}
	public List<Userinfo> getAllUser() throws IOException{
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession();
		String statement = "com.sm_rest.mapper.userMapper.getAllUser";
		List userlist = session.selectList(statement);
		session.close();
		return userlist;
	}
}
