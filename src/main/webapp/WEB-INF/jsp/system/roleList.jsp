<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() { 
		loadRoleShow();
	});

	document.onkeydown=function(event){ 
        var e = event || window.event || arguments.callee.caller.arguments[0]; 
         if(e && e.keyCode==13){ // enter 键 
			$("#queryButton").trigger("click");
         };
	}
	
	function loadRoleShow(){
		//先销毁表格  
		$("#table tbody").html("");
		var queryRoleName = $('#queryRoleName').val().trim();
        $.ajax({
			url : "<%=request.getContextPath()%>/system/roleShow",
			type : 'POST',
			contentType : 'application/x-www-form-urlencoded',
			data: {queryRoleName:queryRoleName},
			dataType : 'json',
			success : function(data) {
				var res = eval(data);
				/* alert(res); */
				if(res.length>0){
					for(var i=0;i<res.length;i++){
						var tbody ="<tr>";
						tbody += '<td>'+ res[i].code +'</td>';
						tbody += '<td>'+ res[i].name +'</td>';
						tbody += "<td><a href='#' onclick='getMenu("+res[i].id+");' data-toggle='modal'>分配菜单</a> | <a href='#' onclick='getPermission("+res[i].id+");' data-toggle='modal'>分配权限</a>| <a href='#' onclick='getDataPermission("+res[i].id+");' data-toggle='modal'>数据权限</a> | <a href='#' onclick='getRole("+res[i].id+");' data-toggle='modal'>修改</a></td>";
						
						tbody += '</tr>';
						$("#table>tbody").append(tbody);
					}
				}else{
					bootbox.alert("查询失败");
				}
			}
		});
		}
	function getRole(roleId){
		$("#updateRoleId").val(roleId);
		$("#smodal-update").modal("show");
	}
		
	function updateRole(){
 		var roleId = $("#updateRoleId").val();
 		var name = $("#roleName").val();
		$.ajax({
			url : "<%=request.getContextPath()%>/system/addOrUpdateRole",
			type : 'POST',
			data : JSON.stringify({'id': roleId, 'name': name}),
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			success : function(data) {
				if(data.status){
					bootbox.alert(data.msg);
					$("#smodal-update").modal("hide");
					loadRoleShow();
				}else{
					bootbox.alert(data.msg);
				}
				
			}
		});
 		
	}
	
	function getMenu(roleId){
 		$("#smodal-menu").find('input:checkbox').each(function () {
 			$(this).prop('checked',false);
 		})
 		$.getJSON("<%=request.getContextPath()%>/system/getMenuIds", {'roleId': roleId},
			function(data){
				var result = eval(data);
				if(result.length>0){
					var array = result;
					$("#smodal-menu").find('input:checkbox').each(function () {
						var id = $(this).attr("id");
						for (i = 0; i < array.length; i++)
					    {
							if(array[i] == id){
								$(this).prop('checked',true);
							}
					    }
					})
				}
		});
		$("#menuRoleId").val(roleId);
		$("#smodal-menu").modal("show");
	}
	
	function allocateMenu(){
		var menuIds = new Array();
		$("#smodal-menu").find('input:checkbox:checked').each(function () {
 			var id = $(this).attr("id");
 			menuIds.push(id);
 		})
 		var roleId = $("#menuRoleId").val();
		$.ajax({
			url : "<%=request.getContextPath()%>/system/allocateMenu",
			type : 'POST',
			data : JSON.stringify({'roleId': roleId, 'menuIds': menuIds}),
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			async : true,
			success : function(data) {
				if(data.status){
					bootbox.alert("更新菜单成功");
					$("#smodal-menu").modal("hide");
				}else{
					bootbox.alert("更新菜单失败");
				}
			}
		});
 		
	}
	
	function getPermission(roleId){
		$("#smodal-permission").find('input:checkbox').each(function () {
 			$(this).prop('checked',false);
 		})
 		$.getJSON("<%=request.getContextPath()%>/system/getResourceIds", {'roleId': roleId},
			function(data){				
				var result = eval(data);
				if(result.length > 0){
					var array = result;
					
					 $("#smodal-permission").find('input:checkbox').each(function() {
						var id = $(this).attr("id");
						for (i = 0; i < array.length; i++)
					    {
							if(array[i] == id){
								$(this).prop('checked',true);
							}
					    }
					})
				}
		});
		$("#resourceRoleId").val(roleId);
		$("#smodal-permission").modal("show");
	}
	
	function allocateResource(){
		var resourceIds = new Array();
		$("#smodal-permission").find('input:checkbox:checked').each(function () {
 			var id = $(this).attr("id");
 			resourceIds.push(id);
 		})
 		var roleId = $("#resourceRoleId").val();
		$.ajax({
			url : "<%=request.getContextPath()%>/system/allocateResource",
			type : 'POST',
			data : JSON.stringify({
				'roleId' : roleId,
				'resourceIds' : resourceIds
			}),
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			async : true,
			success : function(data) {
				if (data.status) {
					bootbox.alert("更新权限成功");
					$("#smodal-permission").modal("hide");
				} else {
					bootbox.alert("更新权限失败");
				}
			}
		});
	}

	function getDataPermission(roleId){
		$("#smodal-dataResource").find('select').each(function () {
 			$(this).val("");
 		})
 		$.getJSON("<%=request.getContextPath()%>/system/getDataResourceIds", {'roleId': roleId},
			function(data){				
				var result = eval(data);
				if(result.length>0){
					var array = result;
					for (i = 0; i < array.length; i++)
					{
						$('#smodal-dataResource select option[value="' + array[i] + '"]').parent().val(array[i]);
						
					}
				}
		});
		$("#dataResourceRoleId").val(roleId);
		$("#smodal-dataResource").modal("show");
	}
	
	function allocateDataResource(){
		var dataResourceIds = new Array();
		$("#smodal-dataResource").find('option:selected').each(function () {
 			var id = $(this).val();
 			if(id != "")
 			dataResourceIds.push(id);
 		})
 		var roleId = $("#dataResourceRoleId").val();
		$.ajax({
			url : "<%=request.getContextPath()%>/system/allocateDataResource",
			type : 'POST',
			data : JSON.stringify({'roleId': roleId, 'dataResourceIds': dataResourceIds}),
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			async : true,
			success : function(data) {
				if(data.status){
					bootbox.alert("更新数据权限成功");
					$("#smodal-dataResource").modal("hide");
				}else{
					bootbox.alert("更新数据权限失败");
				}
			}
		});
 		
	}
	
	function addRole(){
 		var name = $("#newRoleName").val();
 		var code = $("#newRoleCode").val();
 		var roleType = $("#newRoleType").val();
		$.ajax({
			url : "<%=request.getContextPath()%>/system/addOrUpdateRole",
			type : 'POST',
			data : JSON.stringify({'name': name, 'code': code, 'type':roleType}),
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			async : true,
			success : function(data) {
				if(data.status){
					bootbox.alert(data.msg);
					$("#smodal-add").modal("hide");
					loadRoleShow();
				}else{
					bootbox.alert(data.msg);
				}
			}
		});
 		
	}
</script>

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">角色权限管理</li>
	</ol>
</div>
<!--/.row-->

<!-- <div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">角色权限列表</h1>
	</div>
</div> -->
<!--/.row-->
<!-- <div class="will">
	<span class="glyphicon glyphicon-search">查询条件</span>
	<div style="text-align: center;">
		<span>角色名称：</span><input type="text" name="roleName" id=""/><br />
		<button id="queryButton" class="btn btn-primary" style="margin-top: 10px;" onClick="findByCondition()" >查询</button>
	</div>
</div> -->
<br/>
<fieldset >
	<legend>查询条件</legend>
	<div class="will">
           <div style="text-align: center;">
			<div class="form-group col-sm-offset-2" >
				<label for="textfield" class="control-label col-sm-2">角色名称:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="queryRoleName" value=""/>
				</div>
            </div>
			<button id="queryButton" class="btn btn-primary col-sm-2" onClick="loadRoleShow()">查询</button>
		</div>
	</div>
</fieldset>
<fieldset>
<legend>查询内容</legend>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!-- 	<div class="panel-heading">Advanced Table</div> -->
			<div class="panel-body">
				<%-- <div id="toolbar1" class="btn-group">
					<shiro:hasPermission name="system.roleauthority.add">
						<a href="#smodal-add" role="button" class="btn btn-primary"
                                                           data-toggle="modal">添 加</a>
						</button>
					</shiro:hasPermission>
				</div>
				<br /> <br /> --%>
				<shiro:hasPermission name="system.roleauthority.query">
					<table id="table"
						class="table table-hover table-nomargin table-bordered">
						<thead>
							<tr>
								<th width="20%" class="text-center">角色编号</th>
								<th width="20%" class="text-center">角色名称</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<tbody id='tbody'>
						</tbody>
					</table>
				</shiro:hasPermission>
			</div>
		</div>
	</div>
</div>
</fieldset>
<!--/.row-->

<!--------------------------------------------------修改对话框------------------------------------------------------->
<div id="smodal-add" class="modal fade" role="dialog" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添 加</h4>
            </div>
            <!-- /.modal-header -->
            <div class="modal-body">
                <div class='form-horizontal'>
                    <div class="form-group">
                        <label for="textfield" class="control-label col-sm-3">角色编号 :</label>
                        <div class="col-sm-8">
                            <input class="form-control" type="text" id="newRoleCode">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="textfield" class="control-label col-sm-3">角色名称 :</label>
                        <div class="col-sm-8">
                            <input class="form-control" type="text" id="newRoleName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="textfield" class="control-label col-sm-3">角色类型 :</label>
                        <div class="col-sm-8">
                            <select id="newRoleType" class="form-control">
                            	<option value="0">经销商</option>
                            	<option value="1">终端</option>
                            	<option value="2" selected>内部员工</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-body -->
            <div class="modal-footer">
            	<button type="button" class="btn btn-primary" onclick="addRole();">保 存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取 消</button>
            </div>
            <!-- /.modal-footer -->
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div id="smodal-update" class="modal fade" role="dialog"
	data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">修 改</h4>
			</div>
			<!-- /.modal-header -->
			<input type="hidden" id="updateRoleId" />
			<div class="modal-body">
				<div class='form-horizontal'>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">角色名称
							:</label>
						<div class="col-sm-8">
							<input class="form-control" type="text" id="roleName">
						</div>
					</div>
				</div>
			</div>
			<!-- /.modal-body -->
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"
					onclick="updateRole();">保 存</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取
					消</button>
				
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<div id="smodal-dataResource" class="modal fade kmodal" role="dialog" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">数据显示</h4>
            </div>
            <!-- /.modal-header -->
            <input type="hidden" id="dataResourceRoleId">
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="form-horizontal">
                        <div class="col-sm-12">
                        <c:if test="${not empty dataPermissions}">
							<c:forEach var="dataPermissionMap" items="${dataPermissions}"
								varStatus="status">
								<div class="form-group">
	                                <label class="control-label col-sm-4">
									<c:choose>
										<c:when test="${dataPermissionMap.key=='1'}">
											经销商管理:
										</c:when>
										<c:when test="${dataPermissionMap.key=='2'}">
											终端管理:
										</c:when>
										<c:when test="${dataPermissionMap.key=='3'}">
											终端销售计划:
										</c:when>
										<c:when test="${dataPermissionMap.key=='4'}">
											经销商产品流向:
										</c:when>
										<c:when test="${dataPermissionMap.key=='5'}">
											终端产品流向:
										</c:when>
										<%-- <c:when test="${dataPermissionMap.key=='6'}">
											内部员工:
										</c:when>
										<c:when test="${dataPermissionMap.key=='7'}">
											大区管理:
										</c:when>
										<c:when test="${dataPermissionMap.key=='8'}">
											体系管理:
										</c:when>
										<c:when test="${dataPermissionMap.key=='9'}">
											渠道管理:
										</c:when> --%>
									</c:choose>
									</label>
									<div class="col-sm-8">
				 						<select class="form-control">
	                                    	<option value="">无</option>
	                                    	<c:forEach var="item" items="${dataPermissionMap.value}">
		                                    	<option value="${item.id}">${item.name}</option>
		                                    </c:forEach>
	                                    </select>
									</div>
								</div>
							</c:forEach>
						</c:if>
                        </div>

                    </div>
                </div>
            </div>
            <!-- /.modal-body -->
            <div class="modal-footer">
            	<button type="button" class="btn btn-primary" onclick="allocateDataResource();">保 存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取 消</button>
            </div>
            <!-- /.modal-footer -->
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div id="smodal-permission" class="modal fade kmodal-tabs" role="dialog"
	data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">分配权限</h4>
			</div>
			<!-- /.modal-header-->
			<input type="hidden" id="resourceRoleId">
			<div class="modal-body nopadding">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<c:if test="${not empty permissions}">
							<c:forEach var="permissionMap" items="${permissions}"
								varStatus="status">
								<c:choose>
									<c:when test="${status.index==0}">
										<li class='active'><a href="#q${permissionMap.key}"
											data-toggle='tab'>主数据</a></li>
									</c:when>
									<c:when test="${status.index==1}">
										<li><a href="#q${permissionMap.key}" data-toggle='tab'>计划流向</a></li>
									</c:when>
									<c:when test="${status.index==2}">
										<li><a href="#q${permissionMap.key}" data-toggle='tab'>系统</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
						</c:if>
					</ul>
				</div>
				<div class="tab-content padding tab-content-inline">
					<c:if test="${not empty permissions}">
						<c:forEach var="permissionMap" items="${permissions}"
							varStatus="status">
							<c:choose>
								<c:when test="${status.index==0}">
									<div class="tab-pane active" id="q${permissionMap.key}">
								</c:when>
								<c:when test="${status.index==1}">
									<div class="tab-pane" id="q${permissionMap.key}">
								</c:when>
								<c:when test="${status.index==2}">
									<div class="tab-pane" id="q${permissionMap.key}">
								</c:when>
							</c:choose>
							<c:forEach var="child" items="${permissionMap.value}">
								<li role="presentation" class="kwidth40percent"><input
									id="${child.id}" type="checkbox" /><span>${child.name}</span></li>
							</c:forEach>
				</div>
				</c:forEach>
				</c:if>
			</div>
			<!-- /.modal-body -->
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"
					onclick="allocateResource();">确 定</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取
					消</button>
				
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
</div>


<div id="smodal-menu" class="modal fade kmodal-tabs" role="dialog"
	data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">分配菜单</h4>
			</div>
			<!-- /.modal-header -->
			<input type="hidden" id="menuRoleId">
			<div class="modal-body nopadding">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<c:forEach var="menu" items="${menuTree}" varStatus="status">
							<c:choose>
								<c:when test="${status.index==0}">
									<li class='active'><a href="#p${status.index}"
										data-toggle='tab'>${menu.name}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="#p${status.index}" data-toggle='tab'>${menu.name}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
				<div class="tab-content padding tab-content-inline">
					<c:forEach var="menu" items="${menuTree}" varStatus="status">
						<c:choose>
							<c:when test="${status.index==0}">
								<div class="tab-pane active" id="p${status.index}">
							</c:when>
							<c:otherwise>
								<div class="tab-pane" id="p${status.index}">
							</c:otherwise>
						</c:choose>

						<div class="box">
							<div class="box-title">
								<input id="${menu.id}" type="checkbox" />${menu.name}
							</div>
						</div>
						<c:forEach var="child" items="${menu.children}" varStatus="status">
							<li role="presentation" class="kwidth40percent"><input
								id="${child.id}" type="checkbox" /><span>${child.name}</span></li>
						</c:forEach>
				</div>
				</c:forEach>
			</div>
			<!-- /.modal-body -->
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"
					onclick="allocateMenu();">确 定</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取
					消</button>
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>