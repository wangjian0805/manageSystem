<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(function() { 
		loadAgentPage(1, 10);
	});

	document.onkeydown=function(event){ 
        var e = event || window.event || arguments.callee.caller.arguments[0]; 
         if(e && e.keyCode==13){ // enter 键 
			$("#queryButton").trigger("click");
         };
	}
	function loadAgentPage(currentPage, limit) {
		//先销毁表格  
        $('#table').bootstrapTable('destroy');
		var queryAgentId = $('#queryAgentId').val().trim();
		var queryAgentTime = $('#queryAgentTime').val().trim();
		var queryAgentName=$('#queryAgentName').val().trim();
		var queryAgentType=$('#queryAgentType').val().trim();
		var queryAgentEndTime=$('#queryAgentEndTime').val().trim();
		var queryAgentVirtual=$('#queryAgentVirtual').val().trim();
        $("#table").bootstrapTable({
        	method: "post",  //使用get请求到服务器获取数据  
        	contentType: "application/x-www-form-urlencoded",
        	dataType: "json",
        	toolbar: '#toolbar1', 
            url: '<%=request.getContextPath()%>/agent/agentPage', //获取数据的Servlet地址  
            striped: true,  //表格显示条纹  
            pagination: true, //启动分页  
            pageSize: limit,  //每页显示的记录数  
            pageNumber:currentPage, //当前第几页 
            undefinedText:'',
            pageList: [5, 10, 15, 20, 25],  //记录数可选列表  
            search: false,  //是否启用查询 
            clickToSelect: true,
            sidePagination: "server", //表示服务端请求  
            //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder  
            //设置为limit可以获取limit, offset, search, sort, order  
            queryParamsType : "undefined",   
            queryParams: function queryParams(params) {   //设置查询参数  
              var param = {    
                  pageSize: params.pageNumber,
                  pageNumber: params.pageSize,
                  queryAgentId:queryAgentId,
                  queryAgentTime:queryAgentTime,
                  queryAgentName:queryAgentName,
                  queryAgentType:queryAgentType,
                  queryAgentEndTime:queryAgentEndTime,
                  queryAgentVirtual:queryAgentVirtual
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
                field: 'agentId',
                title: '经销商编号'
            }, {
                field: 'erpCode',
                title: 'ERP编号',
                formatter: function (value, row, index) {
                	if(value!=null){
                    	return value;
                	}
                }
            }, {
                field: 'agentName',
                title: '经销商名称',
            }, {
                field: 'hierarchy',
                title: '体系编号',
               /*  visible: true, */
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value!=null){
                    	return value.hierarchyId;
                	}
                	return '';
                }
            }, {
                field: 'hierarchy',
                title: '体系名称',
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	
                	if(value.isDelete==1){
                		return "<font color='red'>"+value.hierarchyName+"</font>";
                	}
                	return value.hierarchyName;
                }
            }, {
                field: 'isVirtual',
                title: '是否虚拟',
                formatter: function (value, row, index) {
                	var result="";
                	if(value==0){
                		result="否";
                	}else if(value==1){
                		result="是";
                	}
                	return result;
                }
            },  {
                field: 'agentStatus',
                title: '类型',
                formatter: function (value, row, index) {
                	var result="";
                	if(value==0){
                		result="待开发";
                	}else if(value==1){
                		result="正式";
                	}
                	return result;
                }
            },  {
                field: 'planDate',
                title: '计划开发时间',
                formatter: function (value, row, index) {
                	if(value!=null){
                		return  new Date(parseInt(value)).Format('yyyy-MM-dd');	
                	}
                	return "无";
                }
            }, ],
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
	
	function showAddAgent() {
		
		$('#agentId').text(generateId(0));
		$('#agentName').val('');
		$('#hierarchyId').val('');
		$('#planDate').val('');
		$('#isVirtual').val('');
		
		$('#addBtn').show();
		$('#editBtn').hide();
		
		$('#modalTitle').text('新增待开发经销商');
		$("#modal-agentComment").modal("show");
	}
	
	function addAgent(){
		var agentId=$('#agentId').html();
		var agentName=$('#agentName').val();
		var planDate=$('#planDate').val();
		var isVirtual=$('#isVirtual').val();
		var isAdd=true;
		
		if(agentName==null||agentName==''){
			bootbox.alert("经销商名称不能为空");
			$('#agentName').focus();
			return;
		}
		
		if(planDate==null||planDate==''){
			bootbox.alert("计划时间不能为空");
			$('#planDate').focus();
			return;
		}
		
		/* if(hierarchyId==null||hierarchyId==''){
			bootbox.alert("体系不能为空");
			$('#hierarchyId').focus();
			return;
		} */
		
		if(isAdd){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : '<%=request.getContextPath()%>/agent/addAgent',
				data : {
					'agentId' : agentId,
					'agentName' : agentName,
					'planDate' : planDate,
					'isVirtual' : isVirtual
				},
				traditional : true,
				dataType : 'JSON',

				success : function(data) {

					if (data.status) {
						bootbox.alert(data.msg);
						$("#modal-agentComment").modal("hide");
						loadAgentPage($('#currentPage').val(), $('#limit').val());
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
	
	function delAgent() {
		var agentIds = [];
		var isDel=true;
		$("input[name='subBox']").each(function() {
			if ($(this).is(":checked")) {

				var tr = $(this).parent().parent();
				var a = tr.children();

				if(a.eq(7).text()=='正式'){
					isDel=false;
					bootbox.alert('不可以删除正式经销商数据');
					return;
				}
				agentIds.push(a.eq(1).text());
			}
		});
		if(isDel){

		if (agentIds.length > 0) {
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
		        message: '你确定要删除经销商吗?!',  
		        callback: function(result) {  
		            if(result) {  
		            	$.ajax({
		    				//提交数据的类型 POST GET
		    				type : "POST",
		    				//提交的网址
		    				url : '<%=request.getContextPath()%>/agent/delAgent',
		    				data : {
		    					'agentIds' : agentIds
		    				},
		    				traditional : true,
		    				dataType : 'JSON',
			    				success : function(data) {

			    					if (data.status) {
			    						bootbox.alert(data.msg);
			    						loadAgentPage($('#currentPage').val(), $('#limit').val());
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
				bootbox.alert('请选择具体经销商后删除');
			}

		}
	}
	
	function showEditAgent(){
		if($("input[name='subBox']:checked").length==1){
			$("input[name='subBox']").each(function() {
				if ($(this).is(":checked")) {
					
					var tr = $(this).parent().parent();
					var a = tr.children();	

					if(a.eq(7).text()=='正式'){
						bootbox.alert('不可以修改正式经销商数据');
						return;
					}
					
					$('#agentId').text(a.eq(1).text());
					$('#agentName').val(a.eq(3).text());
					$('#hierarchyId').val(a.eq(4).text());
					
					if(a.eq(6).text()=='是'){
						$('#isVirtual').val(1);
					}else if(a.eq(6).text()=='否'){
						$('#isVirtual').val(0);
					}
					$('#planDate').val(a.eq(8).text());
					$('#addBtn').hide();
					$('#editBtn').show();
					$('#modalTitle').text('修改经销商');
					$("#modal-agentComment").modal("show");
				}
			});
		}else if($("input[name='subBox']:checked").length==0){
			bootbox.alert('请至少选择一位经销商！');
		}else{
			bootbox.alert('不可以选择多位经销商！');
		}
	}
	
	function editAgent(){
		var agentId=$('#agentId').html();
		var agentName=$('#agentName').val();
		var planDate=$('#planDate').val();
		var isVirtual=$('#isVirtual').val();
		
		var isAdd=true;
		
		if(agentName==null||agentName==''){
			bootbox.alert("经销商名称不能为空");
			$('#agentName').focus();
			return;
		}
		if(planDate==null||planDate==''){
			bootbox.alert("计划时间不能为空");
			$('#planDate').focus();
			return;
		}
		/* if(hierarchyId==null||hierarchyId==''){
		
		
		if(hierarchyId==null||hierarchyId==''){
			bootbox.alert("体系不能为空");
			$('#hierarchyId').focus();
			return;
		} */
		
		if(isAdd){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : '<%=request.getContextPath()%>/agent/editAgent',
				data : {
					'agentId' : agentId,
					'agentName' : agentName,
					'planDate' : planDate,
					'isVirtual' : isVirtual
				},
				traditional : true,
				dataType : 'JSON',

				success : function(data) {

					if (data.status) {
						bootbox.alert(data.msg);
						$("#modal-agentComment").modal("hide");
						loadAgentPage($('#currentPage').val(), $('#limit').val());
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
	/* 导入功能 */
	function importAgent(){
		 var url = '<%=request.getContextPath()%>/agent/importAgentExcel';  //   /** 使用ajaxFileUpload */
		    $.ajaxFileUpload({
		        url: url, //用于文件上传的服务器端请求地址
		        secureuri: false, //是否需要安全协议，一般设置为false
		        fileElementId: 'upload_file', //文件上传域的ID  就是选定文件的 type=file的input框的id  ajaxFileUpload 会帮我们把他分装到ajax请求的 携带对象域中去
		        dataType: 'json', //返回值类型 一般设置为json
		        type: 'post',
		        success:function(data){
		        //成功的success 回调方法等业务流程结束后再写
		        //先留已空白
		        	if (data.status) {
		        		bootbox.alert(data.msg);	
		        		$("#modal-importExcel").modal("hide");
		        		loadAgentPage($('#currentPage').val(), $('#limit').val());
					} else {
						bootbox.alert(data.msg);
					}
		        },
		        error:function(data, status, e){ //服务器响应失败时的处理函数
		        	bootbox.alert("文件上传失败");
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
	/**
	*导出模板
	*/
	function exportExcel(){
		 window.location.href = '<%=request.getContextPath()%>/agent/exportData';
	}
	
	
</script>
<input type="hidden" id="currentPage" />
<input type="hidden" id="limit" />

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">经销商管理</li>
	</ol>
</div>
<!--/.row-->

<!-- <div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">经销商列表</h1>
	</div>
</div> -->
<!--/.row-->
<br/>
<fieldset>
	<legend>查询条件</legend>
	<div class="will">

		<div style="text-align: center;">
			<div class="form-group">
				<label for="textfield" class="control-label col-sm-2">经销商编号:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="queryAgentId">
				</div>
				<label for="textfield" class="control-label col-sm-2">计划开发时间:</label>
				<div class="col-sm-4" >
					<input type="text" class="form-control" style="width:47%;display:inline;" id="queryAgentTime"/>至
					<input type="text" class="form-control" style="width:47%;display:inline;" id="queryAgentEndTime"/>

				</div>

			</div>

			<div class="form-group">
				<label for="textfield" class="control-label col-sm-2">经销商名称:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="queryAgentName">
				</div>
				<label for="textfield" class="control-label col-sm-2">开发状态:</label>
				<div class="col-sm-4">
					<select id="queryAgentType" class="form-control">
						<option></option>
						<option value="0">待开发</option>
						<option value="1">正式</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="textfield" class="control-label col-sm-2">是否虚拟:</label>
				<div class="col-sm-4">
					<select id="queryAgentVirtual" class="form-control">
						<option></option>
						<option value="0">否</option>
						<option value="1">是</option>
					</select>
				</div>
			</div>
			
			<div class="form-group col-sm-12">
				<button id="queryButton" class="btn btn-primary"
				style="margin-top: 10px;width:100px;" onClick="loadAgentPage(1,10)">查询</button>
			</div>
			
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
					<shiro:hasPermission name="master.agent.add">
					<button id="btn_add" type="button" class="btn btn-default" onclick="showAddAgent()">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
					</button>
					</shiro:hasPermission>
					<shiro:hasPermission name="master.agent.edit">
					<button id="btn_edit" type="button" class="btn btn-default" onclick="showEditAgent()">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
					</button>
					</shiro:hasPermission>
					<shiro:hasPermission name="master.agent.delete">
					<button id="btn_delete" type="button" class="btn btn-default" onclick="delAgent()">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
					</button>
					</shiro:hasPermission>
					<shiro:hasPermission name="master.agent.import">
					<button id="btn_import" type="button" class="btn btn-default" onClick='importExcel()'>
						<span class="glyphicon glyphicon-open" aria-hidden="true"></span>导入
					</button>
					</shiro:hasPermission>
					<shiro:hasPermission name="master.agent.export">
					<button id="btn_export" type="button" class="btn btn-default"
						onclick='exportExcel()'>
						<span class="glyphicon glyphicon-save" aria-hidden="true"></span>导出
					</button>
					<br /> <br />
					</shiro:hasPermission>
				</div>
				
				<shiro:hasPermission name="master.agent.query">
				<table data-show-refresh="false" data-show-toggle="false"
					data-show-columns="false" data-switchable="true"
					data-select-item-name="subBox" data-pagination="true"
					data-sort-order="desc" id="table" class="table table-hover">
				</table>
				</shiro:hasPermission>
			</div>
		</div>
	</div>
</div>
<!--/.row-->
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
					class="btn btn-success pdlr16" onclick="importAgent()">
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
</fieldset>


<!--------------------------------------------------修改备注对话框------------------------------------------------------->

<div id="modal-agentComment" class="modal fade" role="dialog"
	data-backdrop="static">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="modalTitle"></h4>
			</div>
			<!-- /.modal-header -->
			<div class="modal-body">
				<div class="form-horizontal">
					<input type="hidden" class="form-control" id="channelId">
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">经销商编号:</label>
						<div class="col-sm-4">
							<label id="agentId"></label>
						</div>
					</div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">经销商名称:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="agentName">
						</div>
					</div>

					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">是否虚拟:</label>
						<div class="col-sm-4">
							<select id="isVirtual" class="form-control">
							<option></option>
							<option value="0">否</option>
							<option value="1">是</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">计划开发时间:</label>
						<div class="col-md-4">  
						     <div class="input-group date form_datetime col-md-15" data-link-field="dtp_input1">
			                    <input class="form-control" type="text" value="" readonly id="planDate">
			                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			                </div>
						</div> 
					</div>
				</div>
			</div>

			<!-- /.modal-body -->
			<div class="modal-footer">
				<button id="addBtn" type="button" class="btn btn-primary" 
					onclick='addAgent()'>新增</button>
				<button id="editBtn" type="button" class="btn btn-primary"
					onclick='editAgent()'>修改</button>
				<button id="delBtn" type="button" class="btn btn-primary" data-dismiss="modal">取
					消</button>
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<script type="text/javascript">
$('.form_datetime').datetimepicker({
	language:"zh-CN",
	format: 'yyyy-mm-dd',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView : 2,
	minView : 2,
	forceParse: 0,
    showMeridian: 1,
    startDate:new Date()
});
$('#queryAgentTime').datetimepicker({
	language:"zh-CN",
	format: 'yyyy-mm-dd',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 3,
	minView:2,
	forceParse: 0,
    showMeridian: 1
});
$('#queryAgentEndTime').datetimepicker({
	language:"zh-CN",
	format: 'yyyy-mm-dd',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 3,
	minView:2,
	forceParse: 0,
    showMeridian: 1
});
</script>
