<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>客户信息管理</title>
	<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
	<style type="text/css" media="screen">
	/* CSS Document */
	/*分页*/
	#pageGro{ width:400px; height:25px; float:right;}
	#pageGro div,#pageGro div ul li{ font-size:12px; color:#666; line-height:26px; float:left; margin-left:5px;}
	#pageGro div ul li{ width:22px; text-align:center; border:1px solid #ccc; cursor:pointer;}
	#pageGro div ul li.on{ color:#fff; background:#3c90d9; border:1px solid #3c90d9;}
	#pageGro .pageUp,#pageGro .pageDown{ width:63px; border:1px solid #ccc; cursor:pointer;}
	#pageGro .pageUp{ text-indent:23px; background:url(images/pageUp.png) 5px 8px no-repeat;}
	#pageGro .pageDown{ text-indent:5px; background:url(images/pageDown.png) 46px 8px no-repeat;}
	#pageGro .pageBegin,#pageGro .pageEnd{ width:60px; border:1px solid #ccc; cursor:pointer;text-align:center;}
	</style>
</head>

<%
	List<Customer> customers = (List<Customer>) request.getAttribute("customers");
	Customer conditonCustomer = new Customer();
	if(request.getAttribute("customer") != null){
		conditonCustomer = (Customer) request.getAttribute("conditonCustomer");
	}
	String name = "";
	if(conditonCustomer.getName() != null){
		name = conditonCustomer.getName();
	}
	int ye = (Integer) request.getAttribute("ye");
	int maxPage = (Integer) request.getAttribute("maxPage");
	List<String> ages = (List<String>) request.getAttribute("ages");
 %>
<body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span> 用户中心
	<span class="c-gray en">&gt;</span> 用户管理
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
		<i class="Hui-iconfont">&#xe68f;</i>
	</a>
</nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="customer-name" name="name" 
		value="<%if(name != null){out.print(name);} %>" />
		<button type="submit" class="btn btn-success radius" id="select" name="">
			<i class="Hui-iconfont">&#xe665;</i> 搜用户
		</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="javascript:;" id="deleteCustomers" class="btn btn-danger radius">
				<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
			</a> 
		</span> 
		<span class="r">共有数据：<strong>88</strong> 条</span> 
	</div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>序号</th>
				<th>客户姓名</th>
				<th>性别</th>
				<th>年龄</th>
				<th>职业</th>
				<th>收入（元/月）</th>
				<th>联系方式</th>
				<th>意向车型</th>
				<th>日期</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(int i = 0; i < customers.size(); i++){
				Customer customer = customers.get(i);
		%>
			<tr class="text-c">
				<td><input type="checkbox" value="1" name=""></td>
				<td><%=customer.getId() %></td>
				<td><%=customer.getName() %></td>
				<td><%=customer.getSex() %></td>
				<td><%=customer.getAge() %></td>
				<td><%=customer.getWork() %></td>
				<td class="text-l"><%=customer.getIncome() %></td>
				<td><%=customer.getPhone() %></td>
				<td><%=customer.getModels() %></td>
				<td><%=customer.getDates() %></td>
				<td class="td-status">
					<span class="label label-success radius">
						<%=customer.getStatus() %>
					</span>
				</td>
				
				<td class="td-manage">
					<a style="text-decoration:none" href="javascript:;" class="ml-5 restore" data-cId="<%=customer.getId() %>" title="还原">
						<i class="Hui-iconfont">&#xe66b;</i>
					</a> 
					<a title="删除" href="javascript:;" class="ml-5 delete" data-cId="<%=customer.getId() %>" style="text-decoration:none">
						<i class="Hui-iconfont">&#xe6e2;</i>
					</a>
				</td>
			</tr>
		<% } %>
		</tbody>
	</table>
	</div>
</div>

<div class="customer-info" style="float:left;margin-left:20px;">
	当前位于第  <%=ye %> 页，共  <%=maxPage %> 页
</div>
<div id="pageGro" class="cb">
	<div class="pageBegin"><a class="customer-page-begin" href="customerDelete?ye=1&name=<%=name%>"> 首页</a></div>
	<div class="pageUp"><a class="customer-page-pre" href="customerDelete?ye=<%=ye-1%>&name=<%=name%>"> 上一页</a></div>
    <div class="pageList">
       <ul class="pagination">
			<%
				int begin = ye;
				int end = ye + 4;
				if(end > maxPage) {
					end = maxPage;
					begin = end - 4;
				}
				if(begin < 1){
					begin = 1;
				}
				for(int i = begin; i <= end; i++){
			 %>
			 <li <%if (ye == i) {%>class="on" style="color:#fff;"<%} %> >
				 <a href="customerDelete?ye=<%=i%>&name=<%=name%>" <%if (ye == i) {%>style="color:#fff;"<%} %>>
				 <%=i %>
				 </a>
			 </li>
			<% } %>
		</ul>
    </div>
    <div class="pageDown"><a href="customerDelete?ye=<%=ye+1 %>&name=<%=name%>" > 下一页</a></div>
    <div class="pageEnd"><a href="customerDelete?ye=<%=maxPage %>&name=<%=name%>" > 尾页</a></div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">修改客户信息</h5>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
			</div>
			<div class="modal-body" id="modal-body-table">
				
			</div>
			<div class="modal-footer">
				<button id="submit-customer" type="button" class="btn btn-primary">
					保存
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">
					取消
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
					
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>

<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
	$(".delete").click(function(){
		var cId = $(this).attr("data-cId");
		$.ajax({
			type:"post",
			url: "deletecustomerDelete",
			data:"cId=" + cId,
			dataType:"text",
			success: function(data){
				alert(data);
				if(data == "删除成功"){
					location.href="customerDelete";
				}
			}
		});
	});
	
	$(".restore").click(function(){
		var cId = $(this).attr("data-cId");
		alert(cId);
		$.ajax({
			type:"post",
			url: "restorecustomerDelete",
			data:"cId=" + cId,
			dataType:"text",
			success: function(data){
				alert(data);
				if(data == "还原成功"){
					location.href="customerDelete";
				}
			}
		});
	});
	
	$("#select").click(function(){
		var name = $("#customer-name").val();
		window.location.href="customerDelete?name=" + name;
	});
});
</script> 
</body>

</html>
