<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>添加</title>
	<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<link rel="stylesheet" href="lib/layer/2.4/skin/layer.css" id="layui_layer_skinlayercss">
<style type="text/css" media="screen">

</style>
</head>
<%
	List<Car> carList = (List<Car>) request.getAttribute("carList");
	List<Way> wayList = (List<Way>) request.getAttribute("wayList");
	List<Status> status2List = (List<Status>) request.getAttribute("status2List");
	List<Salesman> salesmanList = (List<Salesman>) request.getAttribute("salesmanList");
 %>
<body>
	<div class="layui-layer-title" style="cursor: move;" move="ok">添加用户</div>
	<div style="width:650px;margin-left:150px;">
	<article class="page-container">
	<form method="post" class="form form-horizontal" >
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>客户姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="name" name="name" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<label for="sex-1">男</label>
					<input type="radio" name="sex" value="男" checked />
				</div>
				<div class="radio-box">
					<label for="sex-2">女</label>
					<input type="radio" name="sex" value="女"  />
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>年龄：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="age" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>职业：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="works" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>收入：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="income"  />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系方式：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="phone" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">交流方式：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box">
					<select class="select" size="1" name="way.id">
						<option value="0" selected>请选择：</option>
						<%
					     	for(int i = 0; i < wayList.size(); i++){
					     	Way way = wayList.get(i);
						 %>
						 <option value="<%=way.getId()%>"><%=way.getWay() %></option>
						 <% } %>
					</select>
				</span> 
			</div>
		</div>
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">状态：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box">
					<select class="select" size="1" name="status2.id">
						<option value="0" selected>请选择：</option>
						<%
					     	for(int i = 0; i < status2List.size(); i++){
					     	Status status = status2List.get(i);
						 %>
						 <option value="<%=status.getId()%>"><%=status.getStatus2() %></option>
						 <% } %>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">意向车型：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box">
					<select class="select" size="1" name="car.id">
						<option value="0" selected>请选择：</option>
						<%
					     	for(int i = 0; i < carList.size(); i++){
					     	Car car = carList.get(i);
						 %>
						 <option value="<%=car.getId()%>"><%=car.getBrand() %></option>
						 <% } %>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">接待销售员：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box">
					<select class="select" size="1" name="salesman.id">
						<option value="0" selected>请选择：</option>
						<%
					      for(int i = 0; i < salesmanList.size(); i++){
					     	Salesman salesman = salesmanList.get(i);
						 %>
						 <option value="<%=salesman.getId()%>">
							 <%=salesman.getName() %>
						 </option>
						 <% } %>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="note" class="textarea" ></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input id="submit" class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>
</div>					
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>

<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#submit").click(function(){
		$.ajax({
			type:"post",
			url:"addCustomer",
			data:$("form").serialize(),
			dataType:"text",
			success:function(data){
				alert(data);
				if(data == "保存成功"){
					location.href="customer";
				}
			}
		});

	});
});
</script> 
</body>
</html>
