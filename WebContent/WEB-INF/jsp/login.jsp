<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>吉大餐馆会员登陆</title>
<link href="static/css/login.css" rel="stylesheet" type="text/css" media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<!-- -->
<script>var __links = document.querySelectorAll('a');function __linkClick(e) { parent.window.postMessage(this.href, '*');} ;for (var i = 0, l = __links.length; i < l; i++) {if ( __links[i].getAttribute('data-t') == '_blank' ) { __links[i].addEventListener('click', __linkClick, false);}}</script>
<script src="static/jquery.min.js"></script>
<script>$(document).ready(function(c) {
	$('.alert-close').on('click', function(c){
		$('.message').fadeOut('slow', function(c){
	  		$('.message').remove();
		});
	});	  
});
</script>
</head>
<body>
<!-- contact-form -->	
<div class="message warning">
<div class="inset">
	<div class="login-head">
		<h1>吉大餐馆会员登陆</h1>
		 <div class="alert-close"> </div> 			
	</div>
		<form method="post" action="login.html">
			<li>
				<input type="text" name="username" class="text" value="Username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}"><a href="#" class=" icon user"></a>
			</li>
				<div class="clear"> </div>
			<li>
				<input type="password" name="passwd" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}"> <a href="#" class="icon lock"></a>
			</li>
			<div class="clear"> </div>
			<div class="submit">
				<input type="submit" value="Sign in" >
				<h4><a href="register.html">没有账号？点击注册</a></h4>
						  <div class="clear">  </div>	
			</div>
				
		</form>
		</div>					
	</div>
	</div>
	<div class="clear"> </div>
<!--- footer --->
<div class="footer">
	<p>Power By JiDaRest</p>
</div>
<script>
$("form").submit(function(e){
	event.preventDefault();
	  username = $("input[name='username']").val()
	  passwd = $("input[name='passwd']").val()
	  $.post("login",{username:username,passwd:passwd},function(data,result){
		  if(data=="1"){
			  alert("账号或者密码错误！请重新输入!")
		  }else if(data=="0"){
			  alert("登陆成功！")
			  window.location.href="/sm_rest"
		  }else if(data=="2"){
			  alert("帅气管理员登陆成功！")
			  window.location.href="/sm_rest/admin/userinfo.html"
		  }
	  })
	  
	});
</script>
</body>
</html>