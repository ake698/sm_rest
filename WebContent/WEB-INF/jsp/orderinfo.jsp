<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%@ include file="head.jsp" %>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">所有商品</a>
          <dl class="layui-nav-child">
            <dd><a href="/sm_rest/admin/userinfo.html">用户列表</a></dd>
            <dd><a href="/sm_rest/admin/foodinfo.html">菜单列表</a></dd>
            <dd class="layui-this"><a href="/sm_rest/admin/orderinfo.html">订单列表</a></dd>
            <dd><a href="#">更多...</a></dd>
          </dl>
        </li>
        <!-- 
        <li class="layui-nav-item">
          <a href="javascript:;">后台编辑</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">菜单增加</a></dd>
            <dd><a href="javascript:;">用户管理</a></dd>
            <dd><a href="">暂未开放...</a></dd>
          </dl>
        </li>
         -->

        <li class="layui-nav-item" id="addFood"><a href="#">发布新品</a></li>
      </ul>
    </div>
</div>

<div class="layui-body">
	<!-- 内容主体区域 -->
	<div style="padding: 10px;">
		<h1 align="center">订单列表</h1>
		<table class="layui-table">
			<colgroup>
    <col width="250">
    <col width="400">
				<col>
			</colgroup>
			<thead>

		<tr>
			<td>ID</td>
			<td>订单详情</td>
			<td>订单用户ID</td>
			<td>用户账号</td>
			<td>联系方式</td>
			<td>消费金额(元)</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="row" items="${orders}">
			<tr>
				<td><c:out value="${row.orderid}" /></td>
				<td><c:out value="${row.foods}" /></td>
				<td><c:out value="${row.userid}" /></td>
				<td><c:out value="${row.user[0].username}" /></td>
				<td><c:out value="${row.user[0].phone}" /></td>
				<td class="money"><c:out value="${row.money}" /></td>
			</tr>
		</c:forEach>
		</tbody>
		<tr></tr>
				<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td id="summary" style="font-size:18px"></td>

		</tr>
	</table>

	<script type="text/javascript" src="../static/jquery.min.js"></script>
	<script src="../static/layui.js"></script>
		<script>
			var summary = 0;
			layui.use('element', function() {
				var element = layui.element;
			});
			$(".money").each(function(){
			    summary = Number($(this).html()) + summary
			})
			$("#summary").html("总收入:  "+summary)
		</script>
		<script>
	$("#addFood").click(function(){
		layui.use('layer', function(){
			  var layer = layui.layer;
			  layer.open({
				    id:1,
				        type: 1,
				        title:'增加菜品',
				        skin:'layui-layer-rim',
				        area:['460px', 'auto'],
				   
				        content:
				            
				        	'<div class="layui-form-item">'
				        	+'<label class="layui-form-label">菜名</label>'
				            +'<div class="layui-input-block">'
				            +'<input type="text" name="foodname" required lay-verify="required" placeholder="请输入菜名" autocomplete="off" class="layui-input" style="width:60%">'
				            +' </div>'
				            +'</div>'	
				            
				            +'<div class="layui-form-item">'
				        	+'<label class="layui-form-label">价格</label>'
				            +'<div class="layui-input-block">'
				            +'<input type="text" name="cost" required lay-verify="required" placeholder="￥" autocomplete="off" class="layui-input" style="width:30%" >'
				            +' </div>'
				            +'</div>'	
				        ,
				        btn:['保存','取消'],
				        btn1: function (index,layero) {
				        	foodname=$("input[name='foodname']").val()
				        	cost=$("input[name='cost']").val()
				        	
				        	if(foodname!=""&&cost!=""){
				                if(!/^\d+$/.test(cost)){
				                    alert("请输入正确的价格！！");
				                 }else{

								$.post("updateFood.html",
								{
									foodname:foodname,
									cost:cost
								},	
								function(data,status){
									alert(data);
									window.location.href="foodinfo.html";
								})}
				        	}else{
				        		alert("请填写要增加的菜品信息！")
				        	}
				        	layer.close(index);
						
				        },
				        btn2:function (index,layero) {
				             layer.close(index);
				        }
				 
				    });
			  
			});  
		})
	</script>
</body>
</html>