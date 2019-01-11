package com.sm_rest.springmvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sm_rest.bean.Food;
import com.sm_rest.bean.Order;
import com.sm_rest.bean.Userinfo;
import com.sm_rest.dao.FoodDao;
import com.sm_rest.dao.OrderDao;
import com.sm_rest.dao.UserDao;

@Controller
public class Rescontroller {

//所有用户
	@RequestMapping(value = "/admin/userinfo.html", method = RequestMethod.GET)
	public String userinfo(ModelMap model) throws IOException {
		UserDao userdao = new UserDao();
		List<Userinfo> userlist = userdao.getAllUser();
		model.addAttribute("users", userlist);
		return "users";
	}

	// 菜单信息
	@RequestMapping(value = "/admin/foodinfo.html", method = RequestMethod.GET)
	public String foodinfo(ModelMap model) throws IOException {
		FoodDao fooddao = new FoodDao();
		List<Food> foodlist = fooddao.getAllFood();
		model.addAttribute("foods", foodlist);
		return "foodinfo";
	}

	// 订单查询
	@RequestMapping(value = "/admin/orderinfo.html", method = RequestMethod.GET)
	public String orderinfo(ModelMap model) throws IOException {
		OrderDao odao = new OrderDao();
		List<Order> orderlist = odao.getAllOrder();
		model.addAttribute("orders", orderlist);
		return "orderinfo";
	}

	// 更新菜品
	@ResponseBody
	@RequestMapping(value = "/admin/updateFood.html", produces = "text/html; charset=UTF-8")
	public String updataFood(HttpServletRequest request) throws IOException {
		FoodDao fdao = new FoodDao();
		Food food = new Food();
//		System.out.println(request.getMethod());
		String fname = request.getParameter("foodname");
		int cost = Integer.valueOf(request.getParameter("cost"));
		food.setCost(cost);
		food.setFoodname(fname);
		if (request.getMethod().equals("GET")) {
			int id = Integer.valueOf(request.getParameter("id"));
			food.setFoodid(id);
			fdao.updFood(food);
			return "更新成功!";
		} else {
			fdao.insFood(food);
			return "添加成功";
		}
	}

	// 删除菜品
	@ResponseBody
	@RequestMapping(value = "/admin/delFood.html", produces = "text/html; charset=UTF-8")
	public String delFood(HttpServletRequest request) throws IOException {
		FoodDao fdao = new FoodDao();
		int id = Integer.valueOf(request.getParameter("id"));
		fdao.delFood(id);
		return "删除成功！";
	}

	// 首页
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String foods(ModelMap model) throws IOException {
		FoodDao fooddao = new FoodDao();
		List<Food> foodlist = fooddao.getAllFood();
		model.addAttribute("foods", foodlist);
		return "foodlist";
	}

	// 登陆
	@GetMapping(value = "/login.html")
	public String loginjsp(HttpServletRequest request) {
		return "login";
	}

	// 登陆验证
	@ResponseBody
	@PostMapping(value = "/login", produces = "text/html; charset=UTF-8")
	public String logincheck(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response)
			throws IOException {
		String name = request.getParameter("username");
		String passwd = request.getParameter("passwd");
		UserDao udao = new UserDao();
		Userinfo user = udao.getUserByName(name);
		String code = "-1";
		if (user != null && user.getPassword().equals(passwd)) {
			httpSession.setAttribute("user", name);
			code = "0";
		} else if (name.equals("admin")) {
			if (passwd.equals("redhat")) {
				httpSession.setAttribute("root", "admin");
				code = "2";
			}
		} else {
			code = "1";
		}
		return code;
	}

	// 注册
	@GetMapping(value = "/register.html")
	public String registjsp(HttpServletRequest request) {
		return "register";
	}

	// 注册验证
	@ResponseBody
	@PostMapping(value = "/register", produces = "text/html; charset=UTF-8")
	public String registcheck(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response)
			throws IOException {
		String name = request.getParameter("username");
		String passwd = request.getParameter("passwd");
		String phone = request.getParameter("phone");
		UserDao udao = new UserDao();
		Userinfo user = udao.getUserByName(name);
		String code = "-1";
		System.out.println(user);
		if (user == null) {
//				httpSession.setAttribute("user", name);
			Userinfo newuser = new Userinfo();
			newuser.setPassword(passwd);
			newuser.setPhone(phone);
			newuser.setUsername(name);
			udao.insUser(newuser);
			code = "0";
		} else {
			code = "1";
		}
		return code;
	}

	// 注销
	@ResponseBody
	@GetMapping(value = "/logout", produces = "text/html; charset=UTF-8")
	public String logout(HttpSession httpSession) throws IOException {
		httpSession.invalidate();
		return "注销成功";
	}

	// 购物车
	@GetMapping(value = "/shoplist.html")
	public String shoplist(HttpServletRequest request) {
		return "shoplist";
	}

	// 结算订单
	@ResponseBody
	@PostMapping(value = "/orderIn", produces = "text/html; charset=UTF-8")
	public String orderIn(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response)
			throws IOException {
		String money = request.getParameter("money");
		String foods = request.getParameter("foods");
		UserDao udao = new UserDao();
		String orderuser = (String) httpSession.getAttribute("user");
		Userinfo user = udao.getUserByName(orderuser);
		if (user != null) {
			// 用户验证通过
			int userid = user.getUserid();
			OrderDao odao = new OrderDao();
			Order order = new Order();
			order.setFoods(foods);
			order.setMoney(Integer.parseInt(money));
			order.setUserid(userid);
			odao.insOrder(order);
			return "结算成功！";
		} else {
			// 没通过验证
			return "用户验证失败，请重新登陆";
		}
	}

	// 用户个人订单信息
	@RequestMapping(value = "/order.html", method = RequestMethod.GET)
	public String userOrder(ModelMap model, HttpSession httpSession) throws IOException {
		OrderDao odao = new OrderDao();
		UserDao udao = new UserDao();
		String user = (String) httpSession.getAttribute("user");
		Userinfo userinfo = udao.getUserByName(user);
		if (userinfo != null) {
			int userid = userinfo.getUserid();
			List<Order> userorder = odao.getAllUserId(userid);
			model.addAttribute("orders", userorder);
			return "userOrder";
		} else {
			return "login";
		}
	}

	//test
	@ResponseBody
	@RequestMapping(value = "/hello0", method = RequestMethod.GET)
	public Food printHelloa(ModelMap model) {
		Food food = new Food();
		food.setCost(100);
		food.setFoodname("宿舍");
		return food;
	}
}
