<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>吉大餐馆后台管理</title>
  <link rel="stylesheet" href="../static/css/layui.css">
  <script type="text/javascript" src="../static/comprehensive.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">吉大餐馆后台</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="/sm_rest">首页</a></li>
      <li class="layui-nav-item"><a href="/sm_rest/login.html">用户登陆</a></li>
     <!--   <li class="layui-nav-item"><a href="">购物车</a></li>-->
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
       你好，帅气的管理员
        </a>
      <!--   <dl class="layui-nav-child">
          <dd><a href="#" onclick="tip()">个人信息</a></dd>
          <dd><a href="#" onclick="tip()">我的订单</a></dd>
        </dl>
         -->
      </li>
      <li class="layui-nav-item" onclick="adminlogout()"><a href="#">注销</a></li>
    </ul>
  </div>
  