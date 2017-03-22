<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() { 
		loadUserPage(1,10);
	});

	function loadUserPage(currentPage, limit) {
		//先销毁表格  
        $('#table').bootstrapTable('destroy');
		
        var queryUserId=$('#queryUserId').val();
		var queryUserName=$('#queryUserName').val();
		
		
        $("#table").bootstrapTable({
        	method: "get",  //使用get请求到服务器获取数据  
        	contentType: "application/x-www-form-urlencoded",
        	dataType: "json",
            url: '<%=request.getContextPath()%>/user/listUser', //获取数据的Servlet地址  
            striped: true,  //表格显示条纹  
            pagination: true, //启动分页  
            pageSize: limit,  //每页显示的记录数  
            pageNumber:currentPage, //当前第几页  
            pageList: [5, 10, 15, 20, 25],  //记录数可选列表  
            search: false,  //是否启用查询  
            sidePagination: "server", //表示服务端请求  
            //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder  
            //设置为limit可以获取limit, offset, search, sort, order  
            queryParamsType : "undefined",   
            queryParams: function queryParams(params) {   //设置查询参数  
              var param = {    
                  pageSize: params.pageNumber,
                  pageNumber:params.pageSize,
                  queryUserId:queryUserId,
                  queryUserName:queryUserName
              };    
              return param;                   
            },  
            onLoadSuccess: function(data){  //加载成功时执行  
            },  
            onLoadError: function(){  //加载失败时执行  
            	bootbox.alert("加载数据失败");  
            },
            columns: [{
                checkbox: true
            }, {
                field: 'id',
                title: '用户编号'
            }, {
                field: 'username',
                title: '用户名称'
            }, {
                field: 'isactive',
                title: '用户状态',
                formatter: function (value, row, index) {
                	var result="";
            		if(value==true){
            			result="激活";
            		}else{
            			result="未激活";
            		}
            		return result;
                }
            }, {
                field: 'role',
                title: '对应角色ID',
                class:"hidden",
                formatter: function (value, row, index) {
                	return value.id;
                }
            },{
                field: 'role',
                title: '对应角色',
                formatter: function (value, row, index) {
                	return value.name;
                }
            },{
                field: 'station',
                title: '岗位ID',
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.stationCode;
                	}
                }
            },{
                field: 'station',
                title: '对应岗位',
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.stationName;
                	}
                	return "无";
                }
            },{
                field: 'office',
                title: '办事处ID',
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.officeCode;
                	}
                	
                }
            },{
                field: 'office',
                title: '对应办事处',
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.officeName;
                	}
                	return "无";
                }
            },{
                field: 'zone',
                title: '大区ID',
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.zoneCode;
                	}
                	
                }
            },{
                field: 'zone',
                title: '对应大区',
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.zoneName;
                	}
                	return "无";	
                }
            },{
                field: 'id',
                title: '操作',
                formatter: function (value, row, index) {
                	var operation="";
            		var status="";
            		if(row.isactive){
            			status="停用";
            		}else{
            			status="启用";
            		}
            		/* operation+="<a class='edit ml10' data-toggle=\"modal\"  title=\"Edit\" href='#' onclick=\"showEditRole('"+row.id+"','"+row.username+"');\"><i class='glyphicon glyphicon-edit'>角色修改</i></a>|"; */
            		operation+="<a class='edit ml10' data-toggle=\"modal\"  title=\"Edit\" href='#' onclick=\"resetPassword('"+row.id+"');\"><i class='glyphicon glyphicon-edit'>重置密码</i></a>|";
            		operation+="<a class='edit ml10' data-toggle=\"modal\"  title=\"Edit\" href='#' onclick=\"updateActive('"+value+"');\"><i class='glyphicon glyphicon-remove'>"+status+"</i></a>";

            		return operation;
                }
            },],
            responseHandler : function(res) { 
            	$('#currentPage').val(currentPage);
    			$('#limit').val(limit);
    			if(res.total > 0) {
    				 return {
    				    "rows": res.rows,
    				    "total": res.total
    				 }
    			    } else {
    				 return {
    				    "rows": [],
    				    "total": 0
    				 }
    			    }
            },  
          });  
	}

	function delUser() {
		var userList = [];
		$("input[name='subBox']").each(function() {
			if ($(this).is(":checked")) {

				var tr = $(this).parent().parent();
				var a = tr.children();

				userList.push(a.eq(1).text());
			}
		});

		if (userList.length > 0) {
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : '<%=request.getContextPath()%>/user/delUser',
				data : {
					'userList' : userList
				},
				traditional : true,
				dataType : 'JSON',

				success : function(data) {

					if (data) {
						bootbox.alert("删除成功");
					} else {
						bootbox.alert("删除失败");
					}
					loadUserPage($('#currentPage').val(), $('#limit').val());
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
		} else {
			bootbox.alert('请选择具体用户后删除');
		}

	}

	function showAddUser() {
		$('#userName').val('');
		$('#userPass').val('');
		$('#userId').val('');
		$('#roleId').val('');
		$('#stationId').val('');
		$("#modal-addUser").modal("show");
	}
	
	function showEditUser(){
		if($("input[name='subBox']:checked").length==1){
			$("input[name='subBox']").each(function() {
				if ($(this).is(":checked")) {
					
					var tr = $(this).parent().parent();
					var a = tr.children();	
					
					$('#modalTitle').text('修改用户');
					$('#userId').val(a.eq(1).text());
					$('#userName').val(a.eq(2).text());
					$('#userPass').val('');
					$('#editPass').hide();
					$('#roleId').val(a.eq(4).text());
					$('#stationId').val(a.eq(6).text());
					$("#modal-addUser").modal("show");
				}
			});
		}else if($("input[name='subBox']:checked").length==0){
			bootbox.alert('请至少选择一条信息！');
		}else{
			bootbox.alert('不可以选择多条信息');
		}

	}
/* 	
	function showEditRole(userId,userName){
		$('#userId').val(userId);
		$('#userName').val(userName);
		$('#editPass').hide()
		$('#userPass').val('');
		$("#modal-addUser").modal("show");
	}
	 */
	function resetPassword(userId){
		$.ajax({
			//提交数据的类型 POST GET
			type : "POST",
			//提交的网址
			url : '<%=request.getContextPath()%>/user/resetPassword',
			data : {
				'userId' : userId
			},
			traditional : true,
			dataType : 'JSON',

			success : function(data) {

				if (data) {
					bootbox.alert("重置密码成功");
				} else {
					bootbox.alert("重置密码失败");
				}
				loadUserPage($('#currentPage').val(), $('#limit').val());
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
	
	function updateActive(userId){
		$.ajax({
			//提交数据的类型 POST GET
			type : "POST",
			//提交的网址
			url : '<%=request.getContextPath()%>/user/updateActive',
			data : {
				'userId' : userId
			},
			traditional : true,
			dataType : 'JSON',

			success : function(data) {

				if (data) {
					bootbox.alert("更新激活状态成功");
				} else {
					bootbox.alert("更新激活状态失败");
				}
				loadUserPage($('#currentPage').val(), $('#limit').val());
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
	
	function addOrUpdateUser(){
		var userId=$('#userId').val();
		var userName=$('#userName').val();
		var userPass=$('#userPass').val();
		var roleId=$('#roleId').val();
		var stationId=$('#stationId').val();
		
		if(userName==null||userName==''){
			alert("用户名不能为空");
			$('#userName').focus();
			return;
		}
		
		if((userId==''||userId==null)&&(userPass==null||userPass=='')){
			alert("用户密码不能为空");
			$('#userPass').focus();
			return;
		}
		
		$.ajax({
			//提交数据的类型 POST GET
			type : "POST",
			//提交的网址
			url : '<%=request.getContextPath()%>/user/addOrUpdateUser',
			data : {
				'userId' : userId,
				'userName' : userName,
				'userPass' : userPass,
				'roleId' :roleId,
				'stationId':stationId
			},
			traditional : true,
			dataType : 'JSON',

			success : function(data) {

				if (data) {
					bootbox.alert("保存成功");
				} else {
					bootbox.alert("保存失败");
				}
				loadUserPage($('#currentPage').val(), $('#limit').val());
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
	
	/* function roleFormatter(value, row, index) {
        return [
			value.name
        ]
    }
	
	function activeFormatter(value, row, index){
		var result="";
		if(value==true){
			result="激活";
		}else{
			result="未激活";
		}
		return [
			result
	    ]
	}
	
	function operationFormatter(value, row, index){
		var operation="";
		var status="";
		if(row.isactive){
			status="停用";
		}else{
			status="启用";
		}
		operation+="<a class='edit ml10' data-toggle=\"modal\"  title=\"Edit\" href='#' onclick=\"showEditRole('"+row.id+"','"+row.username+"');\"><i class='glyphicon glyphicon-edit'>角色修改</i></a>|";
		operation+="<a class='edit ml10' data-toggle=\"modal\"  title=\"Edit\" href='#' onclick=\"resetPassword('"+row.id+"');\"><i class='glyphicon glyphicon-edit'>重置密码</i></a>|";
		operation+="<a class='edit ml10' data-toggle=\"modal\"  title=\"Edit\" href='#' onclick=\"updateActive('"+value+"');\"><i class='glyphicon glyphicon-remove'>"+status+"</i></a>";

		return [
			operation
	    ]
	} */
	
</script>
<input type="hidden" id="currentPage" />
<input type="hidden" id="limit" />

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">用户列表</li>
	</ol>
</div>
<!--/.row-->

<!-- <div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">用户列表</h1>
	</div>
</div> -->
<!--/.row-->

<br/>
<fieldset>
	<legend>查询条件</legend>
	<div class="will">

		<div style="text-align: center;">
			<div class="form-group" style="text-align: center;">
				<label for="textfield" class="control-label col-sm-2">员工编号:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="queryUserId" value=""/>
				</div>
				<label for="textfield" class="control-label col-sm-2">员工姓名:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="queryUserName" value=""/>
				</div>

			</div>

			<button id="queryButton" class="btn btn-primary"
				style="margin-top: 10px;" onClick="loadUserPage(1,10)">查询</button>
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
				<div id="toolbar1" class="btn-group">
					<button id="btn_add" type="button" class="btn btn-default"
						onclick='showAddUser()'>
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
					</button>
					<button id="btn_edit" type="button" class="btn btn-default" onclick='showEditUser()'>
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
					</button>
					<button id="btn_delete" type="button" class="btn btn-default"
						onclick='delUser()'>
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
					</button>
				</div>
				<br /> <br />
				<%-- <jsp:include  page="../common/address.jsp"/>  --%>
				<table data-show-refresh="false" data-show-toggle="false"
					data-show-columns="false" data-switchable="true"
					data-select-item-name="subBox" data-pagination="true"
					data-sort-order="desc" id="table" class="table table-hover">
				</table>

			</div>
		</div>
	</div>
</div>
</fieldset>
<!--/.row-->

<!--------------------------------------------------新增用户对话框------------------------------------------------------->
<div id="modal-addUser" class="modal fade" role="dialog"
	data-backdrop="static">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">新增用户</h4>
			</div>
			<!-- /.modal-header -->
			<div class="modal-body">
				<div class="form-horizontal">
					<input type="hidden" id="userId" />
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">用户姓名:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="userName">
						</div>
					</div>
					<div class="form-group" id="editPass">
						<label for="textfield" class="control-label col-sm-3">用户密码:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="userPass">
						</div>
					</div>
					
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">角色列表:</label>
						<div class="col-sm-7">
						<select id="roleId" class="form-control">
							<option></option>
                            <c:if test="${not empty roleList}">
								<c:forEach var="role" items="${roleList}">
									 <option value="${role.id}">${role.name}</option>
								</c:forEach>
							</c:if>
                         </select>
                         </div>
					</div>
					
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">对应岗位:</label>
						<div class="col-sm-7">
						<select id="stationId" class="form-control">
							<option></option>
							<c:if test="${not empty stationList}">
								<c:forEach var="station" items="${stationList}">
									 <option value="${station.stationCode}">${station.stationName}</option>
								</c:forEach>
							</c:if>
							</select>
                         </div>
					</div>
				</div>
			</div>

			<!-- /.modal-body -->
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal"
					onclick='addOrUpdateUser()'>确 认</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">取
					消</button>
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
