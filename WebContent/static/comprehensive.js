function logout(){
	    cooklist = $.cookie()
	    for (cook in cooklist){
	    	$.cookie(cook,null,{expires : -1})
	    }
		$.get("/sm_rest/logout",function(data){
			alert(data)
			window.location.href="/sm_rest/"
		})
}


function adminlogout(){
	$.get("/sm_rest/logout",function(data){
		alert(data)
		window.location.href="/sm_rest/"
	})
}
function beforeshop(){
	if(user=="null"){
		alert("请先登陆之后再操作！")
		window.location.href="login.html"
	}else{
		window.location.href="shoplist.html"
	}
}


function addMark(id,obj){
	if(user=="null"){
		alert("请先登陆之后再操作！")
		window.location.href="login.html"
	}else{
	foodinfo=$(obj).parent().parent().children().children().children().children().children().eq(1).html().replace(/(^\s*)|(\s*$)/g,"");
	foodinfo = foodinfo.split("--")
	foodname = foodinfo[0]
	foodcost = foodinfo[1]
	foodcost = foodcost.substring(0,foodcost.length-1)
	flag=$.cookie(""+id)
	if(typeof(flag)!="undefined"){
		count = $.cookie(""+id)
		count = parseInt(count[count.length-1])+1
		console.log(count)
		$.cookie(id,foodname+","+foodcost+","+count)
		alert(foodname+"数量+1")
	}else{
		$.cookie(id,foodname+","+foodcost+",1")
		alert(foodname+"已经加入购物车")
	}
}
}

function account(){
	layui.use('layer', function() {
		var layer = layui.layer;
//		alert(foods)
		layer.confirm('确定结账？共计'+allmoney+"元", function(index) {
			$.post("orderIn",{money:allmoney,foods:foods},function(result){
				alert(result)
			})
		    cooklist = $.cookie()
		    for (cook in cooklist){
		    	$.cookie(cook,null,{expires : -1})
		    }
			//返回订单页面  暂时未修改
			window.location.href="/sm_rest/order.html"
			layer.close(index);
		});
	})
	
}
function tip(){
	alert("亲爱的管理员，你真帅 ！！")
}