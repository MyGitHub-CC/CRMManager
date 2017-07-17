<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>添加审核</title>
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
	List<Eval> evalList = (List<Eval>) request.getAttribute("evalList");
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
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="showAddSupervision" class="btn btn-primary radius" >
				<i class="Hui-iconfont">&#xe600;</i> 随机抽取结果
			</a>
		</span> 
	</div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>序号</th>
				<th>客户姓名</th>
				<th>交流时间</th>
				<th>交流方式</th>
				<th>状态</th>
				<th>接待销售员</th>
				<th>备注</th>
				<th>审核结果</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(int i = 0; i < talkRecords.size(); i++){
				TalkRecord talkRecord = talkRecords.get(i);
		%>
			<tr class="text-c" data-id="<%=talkRecord.getId() %>" >
				<td><input type="checkbox" value="1" name=""></td>
				<td>
					<%=talkRecord.getId() %>
				</td>
				<td><%=talkRecord.getCustomer().getName() %></td>
				<td><%=talkRecord.getDates() %></td>
				<td><%=talkRecord.getWay().getWay() %></td>
				<td><%=talkRecord.getCustomer().getStatus2().getStatus2() %></td>
				<td><%=talkRecord.getSalesman().getName() %></td>
				<td>33</td>
				<td>
					<select class="modifyeval"  data-eId="<%=talkRecord.getId() %>" >
					<%
						for(int j = 0; j < evalList.size();j++){
					 %>
					 <option value="<%=evalList.get(j).getId() %>" 
					 	<%if(evalList.get(j).getId() == talkRecord.getEval().getId()){%>selected="selected" <%} %> >
					 	<%=evalList.get(j).getEval() %>
					 </option>
					 <%	} %>
					 </select>
				 </td>
			</tr>
		<% } %>
		</tbody>
	</table>
	</div>
	<div style="margin:30px;float:right;">
		<button id="baochu" type="button" class="btn btn-primary">
			提交
		</button>
	</div>
</div>
					
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>

<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("tr").click(function(){
		$("tr").removeClass("info");
		$(this).addClass("info");
	});

	$("#baochu").click(function(){
		var ids = new Array();
		var eIds = new Array();
		$(".modifyeval").each(function(index,element){
			//alert($(this).val());
			ids[index] = $(this).attr("data-eId");
			eIds[index] = $(this).val();
		});
		$.ajax({
			type:"post",
			url:"addSupervision",
			data:"ids=" + ids +"&eIds="+eIds,
			dataType:"text",
			success:function(data){
				alert(data);
				if(data == "保存成功"){
					location.href="supervision";
				}
			}
		});
	});
});
</script> 
</body>

</html>
