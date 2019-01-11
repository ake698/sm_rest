<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>我的订单--吉大餐馆</title>
  <link rel="stylesheet" href="./static/css/layui.css">
  <script type="text/javascript" src="static/comprehensive.js"></script>
  <style type="text/css">
		html,body{
			width:100%;
			height:100%;
			background: #D0D0D0;
			margin:0;
			padding:0;
			}
		</style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">吉大餐馆点餐系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="/sm_rest">首页</a></li>
      <li class="layui-nav-item"><a href="login.html">用户登陆</a></li>
      <li class="layui-nav-item"><a href="shoplist.html">购物车</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
       你好${user}
        </a>
        <dl class="layui-nav-child">
         <!-- <dd><a href="">个人信息</a></dd> --> 
          <dd><a href="order.html">我的订单</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item" onclick="logout()"><a href="#" >注销</a></li>
    </ul>
  </div>
  </div>
  <!-- 导航结束 -->
  <div style="padding: 10px;">
		<h1 align="center">${user}的订单</h1>
	<table class="layui-table">
  <colgroup>
    <col width="400">
    <col width="700">
    <col>
  </colgroup>
  <thead>
    <tr>
  		<th>订单</th>
  		<th>消费详情</th>
  		<th>总消费(元)</th>
    </tr> 
  </thead>
  <tbody>
<c:forEach var="row" items="${orders}" varStatus="status">
<tr>
	<th><c:out value="${status.index+1}" /></th>
	<th><c:out value="${row.foods}" /></th>
	<th><c:out value="${row.money}" /></th>

</tr>
</c:forEach>
  </tbody>
</table>
</div>
<script src="static/jquery.min.js"></script>
<script src="static/jquery.cookie.js"></script>
<script src="static/layui.js"></script>
<script>
	layui.use('element', function() {
		var element = layui.element;
	});
	
</script>
</body>
</html>