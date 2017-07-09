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
			<a href="javascript:;" id="addCustomer" class="btn btn-primary radius" data-toggle="modal" data-target="#myModal">
				<i class="Hui-iconfont">&#xe600;</i> 添加用户
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
					<%=customer.getStatus() %></span>
				</td>
				<td class="td-manage">
					<a style="text-decoration:none" href="javascript:;" title="添加">
						<i class="Hui-iconfont">&#xe631;</i>
					</a>
					<a title="修改" href="javascript:;" class="ml-5 modify" style="text-decoration:none" data-cId="<%=customer.getId() %>" data-toggle="modal" data-target="#myModal">
						<i class="Hui-iconfont">&#xe6df;</i>
					</a> 
					<a style="text-decoration:none" class="ml-5"  href="javascript:;" title="修改信息">
						<i class="Hui-iconfont" >&#xe63f;</i>
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
<!--_footer 作为公共模版分离出去-->
<!-- <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>  -->
<!-- <script type="text/javascript" src="lib/layer/2.4/layer.js"></script> -->
<!-- <script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>  -->
<!-- <script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>  -->
<!--/_footer 作为公共模版分离出去-->
					
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>

<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
	var ages = new Array();
	ages[0] = "25岁以下";
	ages[1] = "26-30岁";
	ages[2] = "31-35岁";
	ages[3] = "36-40岁";
	ages[4] = "41-45岁";
	ages[5] = "46-50岁";
	ages[6] = "51-55岁";
	ages[7] = "55岁以上";
	var incomes = new Array();
	incomes[0] = "3000以下";
	incomes[1] = "3000-5000";
	incomes[2] = "5000-8000";
	incomes[3] = "8000-10000";
	incomes[4] = "10000-15000";
	incomes[5] = "15000以上";
	var models = new Array();
	models[0] = "帕萨特";
	models[1] = "途观";
	models[2] = "途安";
	models[3] = "桑塔纳";
	models[4] = "朗逸";
	models[5] = "POLO";
	var status = new Array();
	status[0] = "有意向（本店）";
	status[1] = "有意向（本品牌）";
	status[2] = "有意向（其他品牌）";
	status[3] = "已购买（本店）";
	status[4] = "已购买（本品牌）";
	status[5] = "已购买（其他品牌）";
	status[6] = "无意向";

$("#addCustomer").click(function(){
	var tab = "<form > ";
	tab += "<table id='modify-table' class='table table-border table-bordered table-hover table-bg table-sort'><thead><tr class='text-c'>";
	tab += "<th width='25'><input type='checkbox'></th><th>序号</th><th>客户姓名</th><th>性别</th><th>年龄</th><th>职业</th>";
	tab += "<th>收入（元/月）</th><th>联系方式</th><th>意向车型</th><th>日期</th><th>状态</th></tr></thead><tbody>";
	tab += "<tr class='text-c'>";
	tab += " <td><input type='checkbox' value='1'></td>";
	tab += "<td><input type='text' style='width:50px;' name='id' value='-1'></td>";
	tab += "<td class='input-info'><input type='text' style='width:50px;' name='name'></td>";
	tab += "<td><select name='sex'><option>男</option><option>女</option><select></td>";
	tab += "<td><select name='age'>";
	for(var i = 0; i < ages.length; i++){
		tab += "<option>" + ages[i] + "</option>";
	}
	tab += "</select></td>";
	tab += "<td class='input-info'><input type='text' style='width:50px;' name='work'></td>";
	tab += "<td><select name='income'>";
	for(var i = 0; i < incomes.length; i++){
		tab += "<option>" + incomes[i] + "</option>";
	}
	tab += "</select></td>";
	tab += "<td class='input-info'><input type='text' style='width:100px;' name='phone'></td>";
	tab += "<td><select name='models'>";
	for(var i = 0; i < models.length; i++){
		tab += "<option>" + models[i] + "</option>";
	}
	tab += "</select></td>";
	tab += "<td class='input-info'><input type='text' style='width:90px;' name='dates'>'</td>";
	tab += "<td class='td-status'><select name='status'>";
	for(var i = 0; i < status.length; i++){
		tab += "<option>" + status[i] + "</option>";
	}
	tab += "</select></td></tr>";
	tab += "</tr></tbody></table>";
	tab += "</form>";
	$("#modal-body-table").html(tab);
});

$(".modify").click(function(){
	var cId = $(this).attr("data-cId");
	$.ajax({
		type:"post",
		url:"showModifyCustomer",
		data:"cId=" + cId,
		dataType:"json",
		success:function(data){
			var tab = "<form > ";
			tab += "<table id='modify-table' class='table table-border table-bordered table-hover table-bg table-sort'><thead><tr class='text-c'>";
			tab += "<th width='25'><input type='checkbox'></th><th>序号</th><th>客户姓名</th><th>性别</th><th>年龄</th><th>职业</th>";
			tab += "<th>收入（元/月）</th><th>联系方式</th><th>意向车型</th><th>日期</th><th>状态</th></tr></thead><tbody>";
			$.each(data,function(index, element){
				tab += "<tr class='text-c'>";
				tab += " <td><input type='checkbox' value='1'></td>";
				tab += "<td><input type='text' style='width:50px;' name='id' value='" + element.id + "'></td>";
				tab += "<td class='input-info'><input type='text' style='width:50px;' name='name' value='" + element.name + "'></td>";
				tab += "<td><select name='sex'><option>男</option><option";
				if(element.sex == "女"){
					tab += " selected='selected' ";
				};
				tab += " >女</option><select></td>";
				tab += "<td><select name='age'>";
				for(var i = 0; i < ages.length; i++){
					tab += "<option";
					if(element.age == ages[i]){
						tab += " selected='selected' ";
					}
					tab += " >" + ages[i] + "</option>";
				}
				tab += "</select></td>";
				tab += "<td class='input-info'><input type='text' style='width:50px;' name='work' value='" + element.work + "'></td>";
				tab += "<td><select name='income'>";
				for(var i = 0; i < incomes.length; i++){
					tab += "<option";
					if(element.income == incomes[i]){
						tab += " selected='selected' ";
					}
					tab += " >" + incomes[i] + "</option>";
				}
				tab += "</select></td>";
				tab += "<td class='input-info'><input type='text' style='width:100px;' name='phone' value='" + element.phone + "'></td>";
				tab += "<td><select name='models'>";
				for(var i = 0; i < models.length; i++){
					tab += "<option";
					if(element.models == models[i]){
						tab += " selected='selected' ";
					}
					tab += " >" + models[i] + "</option>";
				}
				tab += "</select></td>";
				tab += "<td class='input-info'><input type='text' style='width:90px;' name='dates' value='" + element.dates + "'>'</td>";
				tab += "<td class='td-status'><select name='status'>";
				for(var i = 0; i < status.length; i++){
					tab += "<option";
					if(element.status == status[i]){
						tab += " selected='selected' ";
					}
					tab += " >" + status[i] + "</option>";
				}
				tab += "</select></td>";
				tab += "</tr>";
			});
			tab += "</tbody></table>";
			tab += "</form>";
			$("#modal-body-table").html(tab);
// 			var tds =$("#modify-table .input-info");
// 			tds.click(tdclick);
		}
	});
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

$("#submit-customer").click(function(){
	var id = $("[name=id]").val();
	var obj;
	if(id > 0){
		obj = "modify";
	}else{
		obj = "add";
	}
	$.ajax({
		type:"post",
		url: obj + "Customer",
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
	var cId = $(this).attr("data-cId");
	alert(cId);
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
});

$("#select").click(function(){
	var name = $("#customer-name").val();
	window.location.href="customer?name=" + name;
});

$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		]
	});
});
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
				$(obj).remove();
				layer.msg('已停用!',{icon: 5,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
				$(obj).remove();
				layer.msg('已启用!',{icon: 6,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});
	});
}
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
</script> 
</body>

</html>
