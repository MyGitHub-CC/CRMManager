<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录界面</title>
	<link href="static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
	<link href="static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
	<link href="static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
	<link href="lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
  </head>
  
  <script>
  $().ready(function(){
		$("#imagecode").click(function(){
			$("#imagecode-img").attr("src","randomImage?" + Math.random());
		});
		$(":button").click(function(e){
			$.ajax({
				type:"post",
				url:"doLogin",
				data:$("form").serialize(),
				dataType:"text",
				success:function(data){
					if(data == "success"){
						window.location.href = "index" ;
					} else{
						alert(data);
						$("#imagecode-img").attr("src","randomImage?" + Math.random());
					}
				}
			});
		});
  });
  
  </script>
<body>
	<input type="hidden" id="TenantId" name="TenantId" value="" />
	<div class="header">
		<p style="line-height:60px;color:#fff;font-size:22px;font-weight:400;font-family:微软雅黑;margin-left:60px;">
			青岛大众4S店  ——  CRM客户管理系统
		</p>
	</div>
	<div class="loginWraper">
	  <div id="loginform" class="loginBox">
	    <form class="form form-horizontal" method="post">
	      <div class="row cl">
	        <label class="form-label col-xs-2"><i class="Hui-iconfont">&#xe60d;</i></label>
	        <div class="formControls col-xs-8">
	          <input id="" name="salesman.name" type="text" placeholder="账户" class="input-text size-L">
	        </div>
	      </div>
	      <div class="row cl">
	        <label class="form-label col-xs-2"><i class="Hui-iconfont">&#xe60e;</i></label>
	        <div class="formControls col-xs-9">
	          <input id="" name="password" type="password" placeholder="密码" class="input-text size-L">
	        </div>
	      </div>
	      <div class="row cl">
	        <div class="formControls col-xs-9 col-xs-offset-2">
		          <input class="input-text size-L" type="text" name="iRand" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:100px;">
		          <img src="randomImage" id="imagecode-img"  />
		           <a id="imagecode" style="color:#fff;" href="javascript:;">看不清，换一张</a> 
	         </div>
	      </div>
	      <div class="row cl">
	        <div class="formControls col-xs-8 col-xs-offset-2">
	          <label for="online">
	            <input type="checkbox" name="online" id="online" value="">
	           	 使我保持登录状态
	           </label>
	        </div>
	      </div>
	      <div class="row cl">
	        <div class="formControls col-xs-8 col-xs-offset-2">
	          <input type="button" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
	          <input type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
	        </div>
	      </div>
	    </form>
	  </div>
	</div>
	<div class="footer">Copyright 青岛大众4S店-客户管理系统   by H-ui.admin v3.0</div>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
</body>

</html>
