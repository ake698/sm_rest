<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%@ include file="head.jsp"%>

<div class="layui-side layui-bg-black">
	<div class="layui-side-scroll">
		<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
		<ul class="layui-nav layui-nav-tree" lay-filter="test">
			<li class="layui-nav-item layui-nav-itemed"><a class=""
				href="javascript:;">所有商品</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="/sm_rest/admin/userinfo.html">用户列表</a>
					</dd>
					<dd class="layui-this">
						<a href="/sm_rest/admin/foodinfo.html">菜单列表</a>
					</dd>
					<dd>
						<a href="/sm_rest/admin/orderinfo.html">订单列表</a>
					</dd>
					<dd>
						<a href="#">更多...</a>
					</dd>
				</dl></li>
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
		<h1 align="center">菜单列表</h1>
		<table class="layui-table">
			<colgroup>
    <col width="250">
    <col width="400">
				<col>
			</colgroup>
			<thead>
				<tr>
					<td>ID</td>
					<td>菜名</td>
					<td>价格</td>
					<!-- 	<td>数量</td> -->
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${foods}">
					<tr>
						<td><c:out value="${row.foodid}" /></td>
						<td><c:out value="${row.foodname}" /></td>
						<td><c:out value="${row.cost}" /></td>
						<td class="butt">
							<button
								class="layui-btn layui-btn-sm layui-btn-radius layui-btn-danger">删除</button>
							<button class="layui-btn layui-btn-sm layui-btn-radius">修改</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</div>

<div class="layui-footer">
	<!-- 底部固定区域 -->
	Power By QS
</div>
</div>
<script src="../static/layui.js"></script>
<script src="../static/jquery.min.js"></script>
<script>
	layui.use('element', function() {
		var element = layui.element;
	});
</script>
<script>
	var id = -1;
	var foodname = "test";
	var cost = 33;
	$(document).ready(function() {
		$(".butt").on("click", 'button', function() {
			if ($(this).index() == 1) {//update
				id = $(this).parent().parent().children().eq(0).html();
				foodname = $(this).parent().parent().children().eq(1).html();
				cost = $(this).parent().parent().children().eq(2).html();
				btnupdate();
			} else if ($(this).index() == 0) {
				id = $(this).parent().parent().children().eq(0).html();
				layui.use('layer', function() {
					var layer = layui.layer;
					layer.confirm('确定删除该菜品？', function(index) {
						$.get("delFood.html?id=" + id, function(data, status) {
							alert(data);
							window.location.reload();
						})
						layer.close(index);
					});
				})

			}
		})

	})
	function updateFood(foodname, cost) {
		baseurl = window.location.pathname.replace("foodinfo", "updateFood")
		nexturl = baseurl + "?id=" + id + "&foodname=" + foodname + "&cost="
				+ cost
		$.get(nexturl, function(data, status) {
			alert(data);
			window.location.reload();
		})

	}
	function btnupdate() {
		layui
				.use(
						'layer',
						function() {
							var layer = layui.layer;
							layer
									.open({
										id : 1,
										type : 1,
										title : '修改菜品',
										skin : 'layui-layer-rim',
										area : [ '460px', 'auto' ],

										content : '<div class="layui-form-item">'
												+ '<label class="layui-form-label">菜名</label>'
												+ '<div class="layui-input-block">'
												+ '<input type="text" name="foodname" required lay-verify="required" placeholder="请输入菜名" autocomplete="off" class="layui-input" style="width:60%" value="'
												+ foodname
												+ '">'
												+ ' </div>'
												+ '</div>'

												+ '<div class="layui-form-item">'
												+ '<label class="layui-form-label">价格</label>'
												+ '<div class="layui-input-block">'
												+ '<input type="text" name="cost" required lay-verify="required" placeholder="￥" autocomplete="off" class="layui-input" style="width:30%" value="'
												+ cost
												+ '">'
												+ ' </div>'
												+ '</div>',
										btn : [ '保存', '取消' ],
										btn1 : function(index, layero) {
											//alert(id)
											foodname = $(
													"input[name='foodname']")
													.val()
											//id=$("input[name='ID']").val()
											cost = $("input[name='cost']")
													.val()
											layer.close(index);
											updateFood(foodname, cost);

										},
										btn2 : function(index, layero) {
											layer.close(index);
										}

									});

						});
	}

	$("#addFood")
			.click(
					function() {
						layui
								.use(
										'layer',
										function() {
											var layer = layui.layer;
											layer
													.open({
														id : 1,
														type : 1,
														title : '增加菜品',
														skin : 'layui-layer-rim',
														area : [ '460px',
																'auto' ],

														content :

														'<div class="layui-form-item">'
																+ '<label class="layui-form-label">菜名</label>'
																+ '<div class="layui-input-block">'
																+ '<input type="text" name="foodname" required lay-verify="required" placeholder="请输入菜名" autocomplete="off" class="layui-input" style="width:60%">'
																+ ' </div>'
																+ '</div>'

																+ '<div class="layui-form-item">'
																+ '<label class="layui-form-label">价格</label>'
																+ '<div class="layui-input-block">'
																+ '<input type="text" name="cost" required lay-verify="required" placeholder="￥" autocomplete="off" class="layui-input" style="width:30%" >'
																+ ' </div>'
																+ '</div>',
														btn : [ '保存', '取消' ],
														btn1 : function(index,
																layero) {
															foodname = $(
																	"input[name='foodname']")
																	.val()
															cost = $(
																	"input[name='cost']")
																	.val()

															if (foodname != ""
																	&& cost != "") {
																if (!/^\d+$/
																		.test(cost)) {
																	alert("请输入正确的价格！！");
																} else {

																	$
																			.post(
																					"updateFood.html",
																					{
																						foodname : foodname,
																						cost : cost
																					},
																					function(
																							data,
																							status) {
																						alert(data);
																						window.location.href = "foodinfo.html";
																					})
																}
															} else {
																alert("请填写要增加的菜品信息！")
															}
															layer.close(index);

														},
														btn2 : function(index,
																layero) {
															layer.close(index);
														}

													});

										});
					})
</script>
</body>
</html>
