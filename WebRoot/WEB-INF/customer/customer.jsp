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
/*分页*/
#pageGro {
	height: 25px;
	float: right;
	margin-right: 20px;
}
#pageGro div,#pageGro div ul li {
	font-size: 12px;
	color: #666;
	line-height: 26px;
	float: left;
	margin-left: 5px;
}
#pageGro div ul li {
	width: 22px;
	text-align: center;
	border: 1px solid #ccc;
	cursor: pointer;
}
#pageGro div ul li a {
	padding: 8px;
}
#pageGro div ul li.on {
	color: #fff;
	background: #3c90d9;
	border: 1px solid #3c90d9;
}
#pageGro .pageUp,#pageGro .pageDown {
	width: 63px;
	border: 1px solid #ccc;
	cursor: pointer;
}
#pageGro .pageUp {
	text-indent: 23px;
	background: url(images/pageUp.png) 5px 8px no-repeat;
}
#pageGro .pageDown {
	text-indent: 5px;
	background: url(images/pageDown.png) 46px 8px no-repeat;
}
#pageGro .pageBegin,#pageGro .pageEnd {
	width: 60px;
	border: 1px solid #ccc;
	cursor: pointer;
	text-align: center;
}
</style>
</head>
<%
	List<Customer> customers = (List<Customer>) request.getAttribute("customers");
	List<Car> carList = (List<Car>) request.getAttribute("carList");
	List<Status> status2List = (List<Status>) request.getAttribute("status2List");
	List<Salesman> salesmanList = (List<Salesman>) request.getAttribute("salesmanList");
	List<Way> wayList = (List<Way>) request.getAttribute("wayList");
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
		<input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="customerName" name="customerName" 
		value="<%if(name != null){out.print(name);} %>" />
		<button type="submit" class="btn btn-success radius" id="searchCustomer">
			<i class="Hui-iconfont">&#xe665;</i> 搜索
		</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="javascript:;" id="deleteCustomers" class="btn btn-danger radius">
				<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
			</a> 
			<a href="showAddCustomer" class="btn btn-primary radius" >
				<i class="Hui-iconfont">&#xe600;</i> 添加用户
			</a>
		</span> 
		<span class="r">共有数据：<strong>88</strong> 条</span> 
	</div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox"></th>
				<th>序号</th>
				<th>客户姓名</th>
				<th>性别</th>
				<th>联系方式</th>
				<th>交流方式</th>
				<th style="width:130px">状态</th>
				<th>意向车型</th>
				<th>接待销售员</th>
				<th>最后来访日期</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(int i = 0; i < customers.size(); i++){
				Customer customer = customers.get(i);
		%>
			<tr class="text-c"  data-cId="<%=customer.getId() %>">
				<td><input type="checkbox" value="1" name=""></td>
				<td><%=customer.getId() %></td>
				<td title="年龄：<%=customer.getAge()%>岁,职业：<%=customer.getWorks() %>,收入：<%=customer.getIncome()%>元/月,电话：<%=customer.getPhone()%>">
					<%=customer.getName() %>
				</td>
				<td><%=customer.getSex() %></td>
				<td><%=customer.getPhone() %></td>
				<td><%=customer.getWay().getWay() %></td>
				<td class="td-status">
					<span class="label label-success radius">
					<%=customer.getStatus2().getStatus2() %>
					</span>
				</td>
				<td><%=customer.getCar().getBrand()%></td>
				<td><%=customer.getSalesman().getName() %></td>
				<td><%=customer.getDates() %></td>
				<td class="td-manage">
					<a title="查看" class="ml-5" style="text-decoration:none"
						href="talkRecordByCId?customer.id=<%=customer.getId() %>" >
						<i class="Hui-iconfont">&#xe665;</i>
					</a>
					<a title="修改" href="javascript:;" class="ml-5 modify" style="text-decoration:none" 
						data-toggle="modal" data-target="#myModal">
						<i class="Hui-iconfont">&#xe6df;</i>
					</a> 
					<a title="删除" href="javascript:;" class="ml-5 delete" style="text-decoration:none">
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
	<div class="pageBegin"><a class="customer-page-begin" href="customer?ye=1&name=<%=name%>"> 首页</a></div>
	<div class="pageUp"><a class="customer-page-pre" href="customer?ye=<%=ye-1%>&name=<%=name%>"> 上一页</a></div>
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
				 <a href="customer?ye=<%=i%>&name=<%=name%>" <%if (ye == i) {%>style="color:#fff;"<%} %>>
				 <%=i %>
				 </a>
			 </li>
			<% } %>
		</ul>
    </div>
    <div class="pageDown"><a href="customer?ye=<%=ye+1 %>&name=<%=name%>" > 下一页</a></div>
    <div class="pageEnd"><a href="customer?ye=<%=maxPage %>&name=<%=name%>" > 尾页</a></div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">客户信息</h5>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
			</div>
			<div class="modal-body" id="modal-body-table">
				<article class="page-container" style="padding-top:0;">
					<form method="post" class="form form-horizontal" >
						<input type="hidden" class="input-text" name="id" />
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>客户姓名：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input type="text" class="input-text" name="name" />
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
										<option value="0" >请选择：</option>
										<%
									     	for(int i = 0; i < wayList.size(); i++){
									     	Way way = wayList.get(i);
										 %>
										 <option value="<%=way.getId()%>" class="wayId"  data-wId="<%=way.getId()%>">
										 <%=way.getWay() %></option>
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
										<option value="0">请选择：</option>
										<%
									     	for(int i = 0; i < status2List.size(); i++){
									     	Status status = status2List.get(i);
										 %>
										 <option value="<%=status.getId()%>" class="status2Id"  data-sId="<%=status.getId()%>">
										 <%=status.getStatus2() %></option>
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
										<option value="0">请选择：</option>
										<%
									     	for(int i = 0; i < carList.size(); i++){
									     	Car car = carList.get(i);
										 %>
										 <option value="<%=car.getId()%>" class="carId" data-cId="<%=car.getId()%>">
										 <%=car.getBrand() %></option>
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
										<option value="0" >请选择：</option>
										<%
									      for(int i = 0; i < salesmanList.size(); i++){
									     	Salesman salesman = salesmanList.get(i);
										 %>
										 <option value="<%=salesman.getId()%>" class="salesId"  data-sId="<%=salesman.getId()%>">
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
					</form>
				</article>
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
	$(".modify").click(function(){
		var cId = $(this).parents("tr").attr("data-cId");
		$.ajax({
			type:"post",
			url:"showModifyCustomer",
			data:"cId=" + cId,
			dataType:"json",
			success:function(data){
				var wayId ;
				var statusId ;
				var carId ;
				var salesId ;
				var id ;
				$.each(data,function(index, element){
					$("[name=name]").val(element.name);
					$("[name=sex]").each(function(){
						if(element.sex == $(this).val()){
							$(this).prop("checked","checked");
						}
					});
					$("[name=age]").val(element.age);
					$("[name=works]").val(element.works);
					$("[name=income]").val(element.income);
					$("[name=phone]").val(element.phone);
					id = element.id;
					wayId = element.way.id;
					statusId = element.status2.id;
					carId = element.car.id;
					salesId = element.salesman.id;
				});
				$("[name=id]").val(id);
				$(".wayId").each(function(index,element){
					if($(this).attr("data-wId") == wayId){
						$(this).prop("selected","selected");
					}
				});
				$(".status2Id").each(function(index,element){
					if($(this).attr("data-sId") == statusId){
						$(this).prop("selected","selected");
					}
				});
				$(".carId").each(function(index,element){
					if($(this).attr("data-cId") == carId){
						$(this).prop("selected","selected");
					}
				});
				$(".salesId").each(function(index,element){
					if($(this).attr("data-sId") == salesId){
						$(this).prop("selected","selected");
					}
				});
			}
		});
	});
	
	$("#submit-customer").click(function(){
		$.ajax({
			type:"post",
			url: "modifyCustomer",
			data:$("form").serialize(),
			dataType:"text",
			success: function(data){
				alert(data);
				if(data == "保存成功"){
					location.href="customer";
				}
			}
		});
	});

	$(".delete").click(function(){
		var cId = $(this).parents("tr").attr("data-cId");
		if(confirm("是否确认删除")){
			$.ajax({
				type:"post",
				url: "deleteCustomer",
				data:"cId=" + cId,
				dataType:"text",
				success: function(data){
					alert(data);
					if(data == "删除成功"){
						location.href="customer";
					}
				}
			});
		}
	});
	$("#searchCustomer").click(function(){
		var name = $("#customerName").val();
		window.location.href="customer?name=" + name;
	});
});


// var tds =$("td");
// 给所有的td节点增加点击事件
// tds.click(tdclick);
function tdclick(){
   varclickfunction = this;
  //0,获取当前的td节点
   var td =$(this);
  //1,取出当前td中的文本内容保存起来
   var text =$(this).text();
  //2，清空td里边内同
  td.html("");
  //3,建立一个文本框，也就是建一个input节点
   var input =$("<input style='width:90px;' />");
  //4,设置文本框中值是保存起来的文本内容
  input.attr("value",text);
  //4.5让文本框可以相应键盘按下的事件
  input.keyup(function(event){
     //记牌器当前用户按下的键值
      var myEvent= event || window.event;//获取不同浏览器中的event对象
      var kcode =myEvent.keyCode;
     //判断是否是回车键按下
      if(kcode ==13){
         varinputnode = $(this);
        //获取当前文本框的内容
         var inputext= inputnode.val();
        //清空td里边的内容,然后将内容填充到里边
         var tdNode =inputnode.parent();
        tdNode.html(inputext);
        //让td重新拥有点击事件
        tdNode.click(tdclick);
      }
   });
  //5，把文本框加入到td里边去
  td.append(input);
  //5.5让文本框里边的文章被高亮选中
  //需要将jquery的对象转换成dom对象
   var inputdom= input.get(0);
  inputdom.select();
  //6,需要清楚td上的点击事件
  td.unbind("click");
}

</script> 
</body>
</html>
