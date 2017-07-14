<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>监督管理</title>
	<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
	<style type="text/css" media="screen">
	/* CSS Document */
	/*分页*/
	#pageGro{ height:25px; float:right;margin-right:20px;}
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
	List<TalkRecord> talkRecords = (List<TalkRecord>) request.getAttribute("talkRecords");
	List<Car> carList = (List<Car>) request.getAttribute("carList");
	List<Status> status2List = (List<Status>) request.getAttribute("status2List");
	List<Salesman> salesmanList = (List<Salesman>) request.getAttribute("salesmanList");
	List<Way> wayList = (List<Way>) request.getAttribute("wayList");
	List<Eval> evalList = (List<Eval>) request.getAttribute("evalList");
	TalkRecord conditonTalk = new TalkRecord();
	if(request.getAttribute("conditonTalk") != null){
		conditonTalk = (TalkRecord) request.getAttribute("conditonTalk");
	}
	String name = "";
	if(conditonTalk.getCustomer().getName() != null){
		name = conditonTalk.getCustomer().getName();
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
			<input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="customer-name" name="name" 
			value="<%if(conditonTalk.getCustomer().getName() != null){out.print(conditonTalk.getCustomer().getName());} %>" />
			<button type="submit" class="btn btn-success radius" id="select">
				<i class="Hui-iconfont">&#xe665;</i> 搜用户
			</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20"> 
			<span class="l">
				<a href="javascript:;" id="deleteTalkRecords" class="btn btn-danger radius">
					<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
				</a> 
				<a href="showAddSupervision" class="btn btn-primary radius" >
					<i class="Hui-iconfont">&#xe600;</i> 随机审核
				</a>
			</span> 
			<span class="r">共有数据：<strong>88</strong> 条</span> 
		</div>
		<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" ></th>
					<th>序号</th>
					<th>客户姓名</th>
					<th>交流方式</th>
					<th>状态</th>
					<th>意向车型</th>
					<th>交流时间</th>
					<th>接待销售员</th>
					<th>备注</th>
					<th>审核结果</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<%
				for(int i = 0; i < talkRecords.size(); i++){
					TalkRecord talkRecord = talkRecords.get(i);
			%>
				<tr class="text-c" data-tid="<%=talkRecord.getId() %>" >
					<td><input type="checkbox" value="1" name=""></td>
					<td><%=talkRecord.getId() %></td>
					<td><%=talkRecord.getCustomer().getName() %></td>
					<td><%=talkRecord.getCustomer().getWay().getWay() %></td>
					<td><%=talkRecord.getCustomer().getStatus2().getStatus2() %></td>
					<td><%=talkRecord.getCustomer().getCar().getBrand() %></td>
					<td><%=talkRecord.getDate() %></td>
					<td><%=talkRecord.getCustomer().getSalesman().getName() %></td>
					<td>33</td>
					<td class="evalId">
						<select size="1">
						<%
							for(int j= 0;j < evalList.size();j++){
								Eval eval = evalList.get(j);
						 %>
						<option value="<%=eval.getId() %>" 
						<%if(talkRecord.getEval().getId() == eval.getId()){%>selected="selected"<%} %>>
						<%=eval.getEval() %></option>
						<%} %>
						</select>
					</td>
					<td class="td-manage">
						<a title="修改保存" href="javascript:;"  class="ml-5 modify" style="text-decoration:none" data-tId="<%=talkRecord.getId() %>" data-toggle="modal" data-target="#myModal">
							<button class="btn btn-primary radius">保存</button>
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
		<div class="pageBegin"><a class="customer-page-begin" href="supervision?ye=1"> 首页</a></div>
		<div class="pageUp"><a class="customer-page-pre" href="supervision?ye=<%=ye-1%>"> 上一页</a></div>
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
					 <a href="supervision?ye=<%=i%>" <%if (ye == i) {%>style="color:#fff;"<%} %>>
					 <%=i %>
					 </a>
				 </li>
				<% } %>
			</ul>
	    </div>
	    <div class="pageDown"><a href="supervision?ye=<%=ye+1 %>" > 下一页</a></div>
	    <div class="pageEnd"><a href="supervision?ye=<%=maxPage %>" > 尾页</a></div>
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
		var ids =  $(this).parents("tr").attr("data-tid");
		var eIds = $(this).parents("tr").children(".evalId").children("select").val();
		eIds[0] = 
		$.ajax({
			type:"post",
			url:"addSupervision",
			data:"ids=" + ids +"&eIds="+eIds,
			dataType:"text",
			success:function(data){
				alert(data);
			}
		});
	});

	$("#select").click(function(){
		var name = $("#customer-name").val();
		window.location.href="customerTalk?customer.name=" + name;
	});

});
</script> 
</body>

</html>
