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
	TalkRecord conditionTalk = new TalkRecord();
	if(request.getAttribute("conditionTalk") != null){
		conditionTalk = (TalkRecord) request.getAttribute("conditionTalk");
	}
	String name = "";
	if(conditionTalk.getCustomer().getName() != null){
		name = conditionTalk.getCustomer().getName();
	}
	int cId = 0;
	if(conditionTalk.getCustomer().getId() > 0){
		cId = conditionTalk.getCustomer().getId();
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
	<div class="text-c">
		<input type="text" class="input-text" style="width:250px" id="customer-name" name="name" 
		value="<%if(conditionTalk.getCustomer().getName() != null)
		{out.print(conditionTalk.getCustomer().getName());} %>" />
		<button type="submit" class="btn btn-success radius" id="select">
			<i class="Hui-iconfont">&#xe665;</i> 搜索
		</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="javascript:;" id="deleteTalkRecords" class="btn btn-danger radius">
				<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
			</a> 
			<a href="javascript:;" id="addTalkRecord" class="btn btn-primary radius" data-toggle="modal" data-target="#myModal">
				<i class="Hui-iconfont">&#xe600;</i> 添加交流记录
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
				<th>交流方式</th>
				<th>交流时间</th>
				<th style="width:130px">状态</th>
				<th>备注</th>
				<th>接待销售员</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(int i = 0; i < talkRecords.size(); i++){
				TalkRecord talkRecord = talkRecords.get(i);
		%>
			<tr class="text-c"  data-tId="<%=talkRecord.getId() %>" data-cId="<%=talkRecord.getCustomer().getId() %>" >
				<td><input type="checkbox" value="1" name=""></td>
				<td><%=talkRecord.getId() %></td>
				<td><%=talkRecord.getCustomer().getName() %></td>
				<td><%=talkRecord.getWay().getWay() %></td>
				<td><%=talkRecord.getDates() %></td>
				<td >
					<span class="label label-success radius">
						<%=talkRecord.getCustomer().getStatus2().getStatus2() %>
					</span>
				</td>
				<td>
					33
				</td>
				<td><%=talkRecord.getSalesman().getName() %></td>
				<td class="td-manage">
					<a title="修改" href="javascript:;" class="ml-5 modify" style="text-decoration:none" data-toggle="modal" data-target="#myModal">
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
	<div class="pageBegin">
		<a class="customer-page-begin" 
		href="talkRecord?ye=1&customer.name=<%=name%>&customer.id=<%=cId%>"> 
			首页
		</a>
	</div>
	<div class="pageUp">
		<a class="customer-page-pre" 
		href="talkRecord?ye=<%=ye-1%>&customer.name=<%=name%>&customer.id=<%=cId%>"> 
			上一页
		</a>
	</div>
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
				 <a href="talkRecord?ye=<%=i%>&customer.name=<%=name%>&customer.id=<%=cId%>" 
				 <%if (ye == i) {%>style="color:#fff;"<%} %>>
				 <%=i %>
				 </a>
			 </li>
			<% } %>
		</ul>
    </div>
    <div class="pageDown">
	    <a href="talkRecord?ye=<%=ye+1 %>&customer.name=<%=name%>&customer.id=<%=cId%>" > 
	    	下一页
	    </a>
    </div>
    <div class="pageEnd">
	    <a href="talkRecord?ye=<%=maxPage %>&customer.name=<%=name%>&customer.id=<%=cId%>" > 
	 		  尾页
	    </a>
    </div>
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
	var carMap = {};
	var status2Map = {};
	var salesmanMap = {};
	var wayMap = {};
	<% for (int i=0; i < carList.size(); i++){%>
		var key = <%=carList.get(i).getId() %>;
		var value = "<%=carList.get(i).getBrand()%>";
		carMap[key] = value;
	<% } %>
	<% for (int i=0; i < status2List.size(); i++){%>
		var key = <%=status2List.get(i).getId() %>;
		var value = "<%=status2List.get(i).getStatus2()%>";
		status2Map[key] = value;
	<% } %>
	<% for (int i=0; i < salesmanList.size(); i++){%>
		var key = <%=salesmanList.get(i).getId() %>;
		var value = "<%=salesmanList.get(i).getName() %>";
		salesmanMap[key] = value;
	<% } %>
	<% for (int i=0; i < wayList.size(); i++){%>
		var key = <%=wayList.get(i).getId() %>;
		var value = "<%=wayList.get(i).getWay()%>";
		wayMap[key] = value;
	<% } %>
	var selectId = 0;
	$("tr").click(function(){
		$("tr").removeClass("info");
		$(this).addClass("info");
		selectId = $(this).attr("data-tId");
	});
	
	$("#addTalkRecord").click(function(){
		alert(selectId);
		var cId = <%=cId%>;
		if(selectId == 0){
			alert("请选择要添加的记录！");
		} else{
			$.ajax({
			type:"post",
			url:"showModifyTalkRecord",
			data:"tId=" + selectId,
			dataType:"json",
			success:function(data){
				var tab = "<form> ";
				tab += "<table id='modify-table' class='table table-border table-bordered table-hover table-bg table-sort'><thead><tr class='text-c'>";
				tab += "<th width='25'><input type='checkbox'></th><th>序号</th><th>客户姓名</th><th>交流方式</th><th>状态</th>";
				tab += "<th>接待销售员</th><th>备注</th></tr></thead><tbody>";
				$.each(data,function(index, element){
					tab += "<tr class='text-c'>";
					tab += "<td><input type='checkbox' value='1'></td>";
					tab += "<td><input type='hidden' style='width:50px;' name='id' value='-1'>" + element.id + "</td>";
					tab += "<td><input type='hidden' style='width:80px;' name='customer.id' value='" + element.customer.id + "'>" + element.customer.name + "</td>";
					tab += "<td class='td-status'><select name='way.id'>";
					$.each(wayMap, function(key,values){     
					     tab += "<option "  ;
					     if(element.way.id == key){
					     	tab += " selected='selected' ";
					     }
					     tab += " value='" + key + "'>" + wayMap[key] + "</option>";
					}); 
					tab += "</select></td>";
					tab += "<td class='td-status'><select name='customer.status2.id'>";
					$.each(status2Map, function(key,values){     
					     tab += "<option "  ;
					     if(element.customer.status2.id == key){
					     	tab += " selected='selected' ";
					     }
					     tab += " value='" + key + "'>" + status2Map[key] + "</option>";
					}); 
					tab += "</select></td>";
					tab += "<td><select name='salesman.id'>";
					$.each(salesmanMap,function(key,values){     
					     tab += "<option "  ;
					     if(element.salesman.id == key){
					     	tab += " selected='selected' ";
					     }
					     tab += " value='" + key + "'>" + salesmanMap[key] + "</option>";
					}); 
					tab += "</select></td>";
					tab += "<td><input type='text' /></td>";
					tab += "</tr>";
				});
				tab += "</tbody></table>";
				tab += "</form>";
				$("#modal-body-table").html(tab);
			}
		});
		}
	});

	$(".modify").click(function(){
		var tId = $(this).parents("tr").attr("data-tId");
		$.ajax({
			type:"post",
			url:"showModifyTalkRecord",
			data:"tId=" + tId,
			dataType:"json",
			success:function(data){
				var tab = "<form > ";
				tab += "<table id='modify-table' class='table table-border table-bordered table-hover table-bg table-sort'><thead><tr class='text-c'>";
				tab += "<th width='25'><input type='checkbox'></th><th>序号</th><th>客户姓名</th><th>交流方式</th><th>状态</th>";
				tab += "<th>接待销售员</th><th>备注</th></tr></thead><tbody>";
				$.each(data,function(index, element){
					tab += "<tr class='text-c'>";
					tab += "<td><input type='checkbox' value='1'></td>";
					tab += "<td><input type='hidden' style='width:50px;' name='id' value='" + element.id + "'>" + element.id + "</td>";
					tab += "<td><input type='hidden' style='width:80px;' name='customer.id' value='" + element.customer.id + "'>" + element.customer.name + "</td>";
					tab += "<td class='td-status'><select name='way.id'>";
					$.each(wayMap, function(key,values){     
					     tab += "<option "  ;
					     if(element.way.id == key){
					     	tab += " selected='selected' ";
					     }
					     tab += " value='" + key + "'>" + wayMap[key] + "</option>";
					}); 
					tab += "</select></td>";
					tab += "<td class='td-status'><select name='customer.status2.id'>";
					$.each(status2Map, function(key,values){     
					     tab += "<option "  ;
					     if(element.customer.status2.id == key){
					     	tab += " selected='selected' ";
					     }
					     tab += " value='" + key + "'>" + status2Map[key] + "</option>";
					}); 
					tab += "</select></td>";
					tab += "<td><select name='salesman.id'>";
					$.each(salesmanMap,function(key,values){     
					     tab += "<option "  ;
					     if(element.salesman.id == key){
					     	tab += " selected='selected' ";
					     }
					     tab += " value='" + key + "'>" + salesmanMap[key] + "</option>";
					}); 
					tab += "</select></td>";
					tab += "<td><input type='text' /></td>";
					tab += "</tr>";
				});
				tab += "</tbody></table>";
				tab += "</form>";
				$("#modal-body-table").html(tab);
			}
		});
	});

	$("#submit-customer").click(function(){
		var id = $("[name=id]").val();
		var obj;
		if(id > 0){
			obj = "modify";
		}else{
			obj = "add";
		}
		alert(obj);
		$.ajax({
			type:"post",
			url: obj + "TalkRecord",
			data:$("form").serialize(),
			dataType:"text",
			success: function(data){
				alert(data);
				if(data == "保存成功"){
					location.href="talkRecord";
				}
			}
		});
	});
	
	$(".delete").click(function(){
		var tId = $(this).parents("tr").attr("data-tId");
		var cId = $(this).parents("tr").attr("data-cId");
		//alert(tId);
		$.ajax({
			type:"post",
			url: "deleteTalkRecord",
			data:"id=" + tId + "customer.id=" + cId,
			dataType:"text",
			success: function(data){
				alert(data);
				if(data == "删除成功"){
					location.href="talkRecord";
				}
			}
		});
	});
	$("#select").click(function(){
		var name = $("#customer-name").val();
		window.location.href="talkRecord?customer.name=" + name;
	});
});
</script> 
</body>

</html>
