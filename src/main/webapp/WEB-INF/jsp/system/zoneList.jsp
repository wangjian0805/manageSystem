<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() { 
		loadZonePage(1, 10);
	});

	function loadZonePage(currentPage, limit) {
		var zoneFunction=$('#czoneFunction').val().trim();
		var zoneId=$('#czoneId').val().trim();
		//先销毁表格  
        $('#table').bootstrapTable('destroy'); 
        var queryZoneFunction=$('#queryZoneFunction').val();
        var queryZoneName=$('#queryZoneName').val();
        $("#table").bootstrapTable({
        	method: "POST",  //使用get请求到服务器获取数据  
        	contentType: "application/x-www-form-urlencoded",
        	dataType: "json",
            url: '<%=request.getContextPath()%>/zone/zonePage', //获取数据的Servlet地址  
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
                  pageNumber: params.pageSize,
                  zoneFunction: zoneFunction,
                  zoneId: zoneId
              };    
              return param;                   
            },  
            onLoadSuccess: function(data){  //加载成功时执行  
            },  
            onLoadError: function(){  //加载失败时执行  
            	bootbox.alert("加载数据失败");  
            },
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
	
	function addOrUpdateZone(){
		var zoneId=$('#zoneId').val();
		if(zoneId==null||zoneId==""){
			addzone();
		}else{
			editzone();
		}
	}
	
	function addzone(){
		var zoneCode=$('#zoneCode').val();
		var zoneName=$('#zoneName').val();
		var zonePlanStatus=$('#zonePlanStatus').val();
		var zoneFlowStatus=$('#zoneFlowStatus').val();
		
		var isAdd=true;
		
		if(zoneName==null||zoneName==''){
			bootbox.alert("大区名称不能为空");
			$('#zoneName').focus();
			isAdd=false;
		}
		
		if(isAdd){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : '<%=request.getContextPath()%>/zone/addZone',
				data : {
					'zoneCode':zoneCode,
					'zoneName' : zoneName,
					'zonePlanStatus':zonePlanStatus,
					'zoneFlowStatus':zoneFlowStatus
				},
				traditional : true,
				dataType : 'JSON',

				success : function(data) {

					if (data.status) {
						bootbox.alert(data.msg);
						loadZonePage($('#currentPage').val(), $('#limit').val());
					} else {
						bootbox.alert(data.msg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					bootbox.alert(ERROR_MSG);
				}
			});
		}
		
	}
	
	function validateName(){
		var zoneName=$('#zoneName').val();
		if(zoneName.trim()==null||zoneName.trim()==''){
			$("#zoneNameError").text("大区名称不能为空");
		}else{
			$("#zoneNameError").text("");
		}
	}

	function delzone() {
		var zoneList = [];
		$("input[name='subBox']").each(function() {
			if ($(this).is(":checked")) {

				var tr = $(this).parent().parent();
				var a = tr.children();

				zoneList.push(a.eq(1).text());
			}
		});

		if (zoneList.length > 0) {
			bootbox.confirm({  
		        buttons: {  
		            confirm: {  
		                label: '确认',  
		                className: 'btn-primary'  
		            },  
		            cancel: {  
		                label: '取消',  
		                className: 'btn-default'  
		            }  
		        },  
		        message: '你确定要删除大区吗?!',  
		        callback: function(result) {  
		            if(result) {  
		            	$.ajax({
		    				//提交数据的类型 POST GET
		    				type : "POST",
		    				//提交的网址
		    				url : '<%=request.getContextPath()%>/zone/delZone',
		    				data : {
		    					'zoneList' : zoneList
		    				},
		    				traditional : true,
		    				dataType : 'JSON',

		    				success : function(data) {

		    					if (data.status) {
		    						bootbox.alert(data.msg);
		    						loadZonePage($('#currentPage').val(), $('#limit').val());
		    					} else {
		    						bootbox.alert(data.msg);
		    					}
		    				},
		    				error : function(XMLHttpRequest, textStatus, errorThrown) {
		    					bootbox.alert(ERROR_MSG);
		    				}
		    			});
		            }  
		        },  
		        });
		} else {
			bootbox.alert('请选择具体大区后删除');
		}

	}
	
	function showAddzone(){
		$('#zoneId').val('');
		$('#zoneCode').val('');
		$('#zoneName').val('');
		$('#zonePlanStatus').val('');
		$('#zoneFlowStatus').val('');
		$('#modalTitle').text('新增大区');
		$("#modal-zoneInfo").modal("show");
	}
	
	function showEditzone(){
		if($("input[name='subBox']:checked").length==1){
			$("input[name='subBox']").each(function() {
				if ($(this).is(":checked")) {
					
					var tr = $(this).parent().parent();
					var a = tr.children();	
					
					$('#zoneId').val(a.eq(1).text());
					$('#zoneCode').val(a.eq(1).text());
					$('#zoneName').val(a.eq(2).text());
					if(a.eq(3).text()=="未启用"){
						$("#zonePlanStatus").val(0);
					}else{
						$("#zonePlanStatus").val(1);
					}
					
					if(a.eq(4).text()=="未启用"){
						$("#zoneFlowStatus").val(0);
					}else{
						$("#zoneFlowStatus").val(1);
					}
					
					$('#modalTitle').text('编辑大区');
					$("#modal-zoneInfo").modal("show");
				}
			});
		}else if($("input[name='subBox']:checked").length==0){
			bootbox.alert('请至少选择一条大区！');
		}else{
			bootbox.alert('不可以选择多条大区！');
		}
	}
	
	function editzone(){
		var zoneId=$('#zoneId').val();
		var zoneName=$('#zoneName').val();
		var zonePlanStatus=$('#zonePlanStatus').val();
		var zoneFlowStatus=$('#zoneFlowStatus').val();
		
		var isEdit=true;
		
		if(zoneName==null||zoneName==''){
			bootbox.alert("大区名称不能为空");
			$('#zoneName').focus();
			isEdit=false;
		}
		
		if(isEdit){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : '<%=request.getContextPath()%>/zone/editZone',
				data : {
					'zoneId' : zoneId,
					'zoneName' : zoneName,
					'zonePlanStatus':zonePlanStatus,
					'zoneFlowStatus':zoneFlowStatus
				},
				traditional : true,
				dataType : 'JSON',

				success : function(data) {
					
					if (data.status) {
						bootbox.alert(data.msg);					
					} else {
						bootbox.alert(data.msg);
					}
					loadZonePage($('#currentPage').val(), $('#limit').val());
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					bootbox.alert(ERROR_MSG);
				}
			});
		}
		
	}
	
	function statusFormatter(value, row, index){
		var result="";
		if(value==0){
			result="未启用";
		}else{
			result="启用";
		}
		return [
			result
	    ]
	}
	
	function operationFormatter(value, row, index){
		var operation="";
		var planText="";
		if(row.zonePlanStatus==1){
			planText="关闭计划管理";
		}else{
			planText="启用计划管理";
		}
		
		var flowText="";
		if(row.zoneFlowStatus==1){
			flowText="关闭流向管理";
		}else{
			flowText="启用流向管理";
		}
		
		operation+="<a class='edit ml10' data-toggle=\"modal\"  title=\"Edit\" href='#' onclick=\"showZonePlan('"+row.zoneId+"');\"><i class='glyphicon glyphicon-pencil'>任务管理</i></a>|";
		operation+="<a class='edit ml10' data-toggle=\"modal\"  title=\"Edit\" href='#' onclick=\"updateZoneStatus('"+row.zoneId+"',0);\"><i class='glyphicon glyphicon-remove'>"+planText+"</i></a>|";
		operation+="<a class='edit ml10' data-toggle=\"modal\"  title=\"Edit\" href='#' onclick=\"updateZoneStatus('"+row.zoneId+"',1);\"><i class='glyphicon glyphicon-remove'>"+flowText+"</i></a>";
		/* operation = '<a class="edit ml10" href="#" onclick="showEditRole('+ row.id +',"'+row.username+'")" title="Edit">&nbsp;<i class="glyphicon glyphicon-edit">角色修改</i></a>|'
					  +'<a class="edit ml10" href="#" onclick="updateActive('+ value+')" title="Edit">&nbsp;<i class="glyphicon glyphicon-remove">'+status+'</i></a>'; */
		return [
			operation
	    ]
	}
	
	function updateZoneStatus(zoneId,planType){
		$.ajax({
			//提交数据的类型 POST GET
			type : "POST",
			//提交的网址
			url : '<%=request.getContextPath()%>/zone/updateZoneStatus',
			data : {
				'zoneId' : zoneId,
				'planType' : planType
			},
			traditional : true,
			dataType : 'JSON',

			success : function(data) {
				
				if (data.status) {
					bootbox.alert(data.msg);					
				} else {
					bootbox.alert(data.msg);
				}
				loadZonePage($('#currentPage').val(), $('#limit').val());
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				bootbox.alert(ERROR_MSG);
			}
		});
	}
	

	function showZonePlan(zoneId){
		location.href="<%=request.getContextPath()%>/zone/showZonePlan?zoneId="+zoneId;
	}
	
	/**
	 * 导出Excel
	 */
	function exportExcel(){
		window.location.href = '<%=request.getContextPath()%>/zone/toExportZone';
	}
	
	function importZone(){
		 var url = '<%=request.getContextPath()%>/zone/importZoneExcel';  //   /** 使用ajaxFileUpload */
		    $.ajaxFileUpload({
		        url: url, //用于文件上传的服务器端请求地址
		        secureuri: false, //是否需要安全协议，一般设置为false
		        fileElementId: 'upload_file', //文件上传域的ID  就是选定文件的 type=file的input框的id  ajaxFileUpload 会帮我们把他分装到ajax请求的 携带对象域中去
		        dataType: 'json', //返回值类型 一般设置为json
		        type: 'post',
		        success:function(data){
		        	if (data.status) {
						bootbox.alert(data.msg);					
					} else {
						bootbox.alert(data.msg);
					}
					loadZonePage($('#currentPage').val(), $('#limit').val());
		        },
		        error:function(data, status, e){
		        	bootbox.alert(ERROR_MSG);
				}
		    })
	}

	function importExcel(){
		$('#modalTitle1').text('批量导入');
		$("#modal-importExcel").modal("show");
	}
	
	/**
     * 显示上传文件名称
     * @param fileObj
     */
    function selectUploadFile(fileObj){
        var fullPath = $(fileObj).val();
        var index = fullPath.lastIndexOf('\\') + 1;
        var fileName = fullPath.substring(index);
        $('input[name="upload_filename"]').val(fileName);
    }

</script>
<input type="hidden" id="currentPage" />
<input type="hidden" id="limit" />

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">大区列表</li>
	</ol>
</div>
<!--/.row-->

<!-- <div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">大区列表</h1>
	</div>
</div> -->
<!--/.row-->
<br/>
<fieldset >
	<legend>查询条件</legend>
	<div class="will">

        <%--  <div style="text-align: center;">
         <div class="form-group">
				
				<label for="textfield" class="control-label col-sm-2">功能:</label>
				<div class="col-sm-4">
					<select id="queryZoneFunction" class="form-control">
						<option></option>
						<option value="0">大区操作流向状态启用</option>
						<option value="1">大区操作计划状态启用</option>
						<option value="2">全部启用</option>
					</select>
				</div>
				<label for="textfield" class="control-label col-sm-2">大区:</label>
				<div class="col-sm-4">
					<select id="queryZoneName" class="form-control">
						<option></option>
					<c:if test="${not empty rows}">
									<c:forEach var="zone" items="${zoneList1}">
										<option value="${zone.zoneId}">${zone.zoneName}</option>
									</c:forEach>
								 </c:if>
					</select>
				</div> --%>

		<div style="text-align: center;">
			<div class="form-group">
				<label for="textfield" class="control-label col-sm-2">功能:</label>
				<div class="col-sm-4">
					<select class="form-control" name="zoneFunction" id="czoneFunction">
						<option value=""></option>
						<c:if test="${not empty zoneFunctionList}">
							<c:forEach var="zoneFunction" items="${zoneFunctionList}">
								<option value="${zoneFunction.value}">${zoneFunction.name}</option>
							</c:forEach>
						</c:if>
					</select>
				</div>
				<label for="textfield" class="control-label col-sm-2">大区:</label>
				<div class="col-sm-4">
					<select class="form-control" name="zoneId" id="czoneId">
						<option value=""></option>
						<c:if test="${not empty zoneList}">
							<c:forEach var="zone" items="${zoneList}">
								<option value="${zone.zoneId}">${zone.zoneName}</option>
							</c:forEach>
						</c:if>
					</select>
				</div>

			</div>
			<button id="queryButton" class="btn btn-primary"
				style="margin-top: 10px;width:100px;" onClick="loadZonePage(1,10)">查询</button>
		</div>

	</div>
</fieldset>

<fieldset >
	<legend>查询内容</legend>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!-- 	<div class="panel-heading">Advanced Table</div> -->
			<div class="panel-body">
				<div id="toolbar1" class="btn-group">
<%-- 					<shiro:hasPermission name="system.zone.add">
					<button id="btn_add" type="button" class="btn btn-default"
						onclick='showAddzone()'>
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
					</button>
					</shiro:hasPermission>
					<shiro:hasPermission name="system.zone.edit">
					<button id="btn_edit" type="button" class="btn btn-default" onclick='showEditzone()'>
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
					</button>
					</shiro:hasPermission>
					<shiro:hasPermission name="system.zone.delete">
					<button id="btn_delete" type="button" class="btn btn-default"
						onclick='delzone()'>
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
					</button>
					</shiro:hasPermission> --%>
					<shiro:hasPermission name="system.zone.import">
					<button id="btn_import" type="button" class="btn btn-default" onClick='importExcel()'>
						<span class="glyphicon glyphicon-open" aria-hidden="true"></span>导入
					</button>
					</shiro:hasPermission>
					<!-- <button id="btn_export" type="button" class="btn btn-default"
						onclick='exportExcel()'>
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>导出模板
					</button> -->
				</div>
				<br /> <br />
				<shiro:hasPermission name="system.zone.query">
				<table data-show-refresh="false" data-show-toggle="false"
					data-show-columns="false" data-search="true"
					data-select-item-name="subBox" data-pagination="true"
					data-sort-order="desc" id="table" class="table table-hover">
					<thead>
						<tr>
							<!-- <th data-checkbox="true">大区编号</th> -->
							<th data-field="zoneCode" data-sortable="false">大区编号</th>
							<th data-field="zoneName">大区名称</th>
							<th data-field="zonePlanStatus" data-formatter="statusFormatter">大区操作计划状态</th>
							<th data-field="zoneFlowStatus" data-formatter="statusFormatter">大区操作流向状态</th>
							<th data-field="id" data-formatter="operationFormatter">操作</th>
						</tr>
					</thead>
				</table>
				</shiro:hasPermission>
			</div>
		</div>
	</div>
</div>
</fieldset>
<!--/.row-->

<!--------------------------------------------------修改备注对话框------------------------------------------------------->
<div id="modal-zoneInfo" class="modal fade" role="dialog"
	data-backdrop="static">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="modalTitle">新增大区</h4>
			</div>
			<!-- /.modal-header -->
			<div class="modal-body">
				<div class="form-horizontal">
					<input type="hidden" class="form-control" id="zoneId">
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-5">大区编号(ERP编号):</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="zoneCode">
						</div>
						<div class="col-sm-5">
							<div style="color:red; font-size:15px;" id="zoneNameError"></div>
						</div>
					</div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-5">大区名称:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="zoneName" onblur="validateName()">
						</div>
						<div class="col-sm-5">
							<div style="color:red; font-size:15px;" id="zoneNameError"></div>
						</div>
					</div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-5">大区操作计划状态:</label>
						<div class="col-sm-4">
						<select id="zonePlanStatus" class="form-control">
							<option></option>
                            <option value="0">未启用</option>
                            <option value="1">启用</option>
                         </select>
                         </div>
                     </div>
                     <div class="form-group">   
                         <label for="textfield" class="control-label col-sm-5">大区操作流向状态:</label>
						<div class="col-sm-4">
						<select id="zoneFlowStatus" class="form-control">
							<option></option>
                            <option value="0">未启用</option>
                            <option value="1">启用</option>
                         </select>
                         </div>
					</div>
				</div>
			</div>

			<!-- /.modal-body -->
			<div class="modal-footer">
				<button id="addBtn" type="button" class="btn btn-primary" data-dismiss="modal"
					onclick='addOrUpdateZone()'>确 认</button>
				<button id="delBtn" type="button" class="btn btn-primary" data-dismiss="modal">取
					消</button>
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<div id="modal-importExcel" class="modal fade" role="dialog"
	data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title1" id="modalTitle1"></h4>
			</div>
			<!-- /.modal-header -->
			<div class="modal-body" style="position: relative;">
				<form class="" role="form" id="upload_form">
					<div class="input-group">
						 <input type="file" id="upload_file"
						onchange="selectUploadFile(this)" name="uploadFile"
						accept=".xls,.xlsx" class="input-fzliulan">
					</div>
					<!--  选择上传文件按钮   type类型指定为 file   accept 可以在浏览过程中 进行过滤显示   支持多个用逗号隔开  -->
					<!-- 选择文件后显示文件名称  对更改事件绑定了事件监听器 selectUploadFile(this)   此框按钮id为: upload_file    -->
					<!--  <input type="file" id="upload_file"
						onchange="selectUploadFile(this)" name="uploadFile"
						accept=".xls,.xlsx" class="input-fzliulan">  -->
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="btn_upSubmit"
					class="btn btn-success pdlr16" data-dismiss="modal" onclick="importZone()">
					<span id="uploadTxt">导入</span>
				</button>
				<button type="button" id="btn_upCancel" class="btn btn-white"
					data-dismiss="modal">关闭</button>
				
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
