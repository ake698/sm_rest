<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>吉大餐馆</title>
  <link rel="stylesheet" href="./static/css/layui.css">
  <script type="text/javascript" src="static/comprehensive.js"></script>
  <style type="text/css">
		html,body{
			width:100%;
			height:100%;
			background:#D0D0D0;
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
      <li class="layui-nav-item"><a href="">首页</a></li>
      <li class="layui-nav-item"><a href="login.html">用户登陆</a></li>
      <li class="layui-nav-item" onclick="beforeshop()"><a href="#" >购物车</a></li>
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
  
  <table width="100%">
		<tbody>
			<tr>
				<td height="40" class="top"></td>
			</tr>
				<!---header--->
			<tr>
				<td>
					<table width="800" border="0" cellpadding="0" cellspacing="0" align="center" bgcolor="#fff" class="container">
						<tbody>
						<tr>
							<td>
								
								<!---header--->
								<!--banner-bottom-->
																			<tr>
												<td height="30"></td>
											</tr>
										
											<tr>
												<td style="font-size:2.5em; text-decoration:none; color:#636363; font-family:Candara;text-align:center; font-weight:bold" class="season">
													  欢迎来到吉大餐馆
												</td>
											</tr>
											<tr>
												<td height="20"></td>
											</tr>
											<tr>
												<td style="font-size:1.3em; text-decoration:none; color:#C4C4C4; font-family:Candara;text-align:center; text-transform:none" class="season1">
												做爱做的事，吃爱吃的菜
												</td>
											</tr>
									<tr>
										<td>
										<table width="700" border="0" cellpadding="0" cellspacing="0" align="center" class="middle-container">
										<tbody>

											<c:forEach var="row" items="${foods}">
											<tr>
											<td height="30"></td>
											</tr>
											<!--trends-->
											<tr>
												<td>
													<table align="left"  width="215" style="text-align:center;margin-left:-10px">
														<tr>
															<td>
																<img src="./static/images/food.jpg" width="100%" style="border:0px solid#C4C4C4">
															</td>
														</tr>
														<tr>
															<td style="font-size:1.2em;color:#636363;font-family:Candara;line-height:2em;font-weight:bold">
																<c:out value="${row.foodname}" />--<c:out value="${row.cost}" />元
															</td>
														</tr>
														<tr>
															<td style="font-size:.9em;color:#C4C4C4;font-family:Candara;line-height:.5em">
															图片仅供参考,一切以实物为准
															</td>
														</tr>
														<tr>
															<td height="20"></td>
														</tr>
													</table>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<td>
													<button class="layui-btn" onclick='addMark(<c:out value="${row.foodid}" />,this)'> 加入购物车</button>
													
													</td>
													</c:forEach>
													</tbody>
													</table>
													</td>
													</tr>
													
								<!--gallery-->
								<!--footer-->
									<tr>
										<td>
											<table width="800"  align="center" bgcolor="#e7e7e7" border="0" cellpadding="0" cellspacing="0" class="container" >
												<tbody>
												<tr>
													<td height="30"></td>
												</tr>
													<tr>
														<td style="color: #696868; font-size: 1em;font-family: Candara; text-align:center; font-weight: normal; line-height: 2em; vertical-align:top;">
															
真理惟一可靠的标准就是永远自相符合
														</td>
													</tr>
													

													<tr>
														<td height="30" bgcolor="#e7e7e7"></td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								<!--footer-->
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td height="40"></td>
			</tr>
		</tbody>
	</table>
<script src="static/jquery.min.js"></script>
<script src="static/jquery.cookie.js"></script>
<script src="static/layui.js"></script>

<script>
var user='<%=session.getValue("user")%>'
	layui.use('element', function() {
		var element = layui.element;
	});
</script>
</body>
</html>