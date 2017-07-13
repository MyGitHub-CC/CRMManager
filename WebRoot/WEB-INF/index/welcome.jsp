<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
	<title>欢迎界面-Welcome</title>
	<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
</head>
<body style="background:url(images/car2.jpg);background-repeat:round;">
	<div class="page-container">
		<p class="f-26 text-success" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎使用青岛大众4S店  - CRM客户管理系统
		</p>
	</div>
	<div style="height:360px;" >
	
	</div>
	<footer class="footer mt-20">
		<div class="container" style="color:#000;">
			<p>感谢青岛思途科技有限公司的各位老师和同学们提供的帮助与支持.<br>
				本后台系统由
				<a style="color:#000;">青岛思途科技有限公司-cc</a>
				提供前端技术支持
			</p>
		</div>
	</footer>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
</body>

</html>
