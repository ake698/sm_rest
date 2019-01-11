<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>吉大餐馆购物车</title>
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
		<h1 align="center">我的购物车</h1>
		<table class="layui-table">
			<colgroup>
    <col width="250">
    <col width="400">
				<col>
			</colgroup>
			<thead>

		<tr>
			<td>编号</td>
			<td>菜名</td>
			<td>单价</td>
			<td>数量</td>
			<td>消费金额(元)</td>
		</tr>
		</thead>
		<tbody id="table">

			
		<tr id="last">
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td id="money">总计消费</td>
		</tr>
		
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td><button class="layui-btn" onclick="account()">结账</button><button class="layui-btn layui-btn-danger" onclick="cleanup()">清空</button></td>
		</tr>

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
<script type="text/javascript">
table=$("#last")
foodlist = $.cookie()
var allmoney = 0
var foods=""
number=0
for(i in foodlist){
	if(i=="csrftoken"){
		continue
	}
	food=foodlist[i]
	infos = food.split(",")
	foodname = infos[0]
	foodcost = infos[1]
	foodcount= infos[2]
	money = parseInt(foodcost)*parseInt(foodcount)
	allmoney = money + allmoney
	number = number+1
	console.log(money)
	console.log("食物:"+foodname)
	console.log("价格:"+foodcost)
	console.log("数量:"+foodcount)
	foods = foodname+"-"+foodcost+"-"+foodcount + "," + foods 
	
	table.before("<tr><td>"+number+"</td><td>"+foodname+"</td><td>"+foodcost+"</td><td>"+foodcount+"</td><td>"+money+"</td></tr>")
$("#money").html("共计消费:  "+allmoney)
}
function cleanup(){
    cooklist = $.cookie()
    for (cook in cooklist){
    	$.cookie(cook,null,{expires : -1})
    }
    window.location.reload()
}
</script>
</body>
</html>