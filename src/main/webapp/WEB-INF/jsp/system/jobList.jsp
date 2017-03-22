<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() { 
		loadJobShow();
	});

	function loadJobShow() {
		//先销毁表格  
		$("#table tbody").html("");
        $.ajax({
			url : "<%=request.getContextPath()%>/system/jobShow",
					type : 'GET',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					success : function(data) {
						var res = eval(data)
						if (res.length > 0) {
							for (var i = 0; i < res.length; i++) {
								var tbody = "<tr>";
								tbody += '<td>' + res[i].jobName + '</td>';
								tbody += '<td>' + res[i].jobGroup + '</td>';
								tbody += '<td>' + res[i].cronExpression + '</td>';
								tbody += '<td>' + res[i].nextFireTime + '</td>';
								tbody += '<td>' + res[i].state + '</td>';
								tbody += '<td><a href="#" onclick="pauseJob(\''+ res[i].jobName +'\')" data-toggle="modal">暂停</a>|<a href="#" onclick="resumeJob(\''+ res[i].jobName +'\')" data-toggle="modal">恢复运行</a>|<a href="#" onclick="triggerJob(\''+ res[i].jobName +'\')" data-toggle="modal">手动触发</a>|<a href="#" onclick="deleteJob(\''+ res[i].jobName +'\')" data-toggle="modal">删除</a>|<a href="#" onclick="showScheduleForm(\''+ res[i].triggerKey +'\')" data-toggle="modal">重设触发周期</a></td>';								
								tbody += '</tr>';
								$("#table>tbody").append(tbody);
							}
						} else {
							bootbox.alert("查询失败");
						}
					}
				});
	}
	
	function pauseJob(jobKey){
		bootbox.confirm({  
	        buttons: {  
	            cancel: {  
	                label: '取消',  
	                className: 'btn-default'  
	            },
	            confirm: {  
	                label: '确认',  
	                className: 'btn-primary'  
	            } 
	        },
	        message:"请确认停止该任务！",
	        callback: function(result) {
				if(result) {
					var params = {};
					params['jobKey'] = jobKey;
					$.get("<%=request.getContextPath()%>/system/pauseJob", params,
					  function(data){
						if(data){
							bootbox.alert("停止任务成功");
						}else{
							bootbox.alert("停止任务失败");
						}
						loadJobShow();
					});
				}
	        },
		});
	}
	
	function resumeJob(jobKey){
		bootbox.confirm({  
	        buttons: {  
	            cancel: {  
	                label: '取消',  
	                className: 'btn-default'  
	            },
	            confirm: {  
	                label: '确认',  
	                className: 'btn-primary'  
	            } 
	        },
	        message:"请确认恢复运行该任务！",
	        callback: function(result) {
	        	if(result) {
					var params = {};
					params['jobKey'] = jobKey;
					$.get("<%=request.getContextPath()%>/system/resumeJob", params,
					  function(data){
						if(data){
							bootbox.alert("恢复任务成功");
						}else{
							bootbox.alert("恢复任务失败");
						}
						loadJobShow();
					});
				}
	        },
		});
	}
	
	function triggerJob(jobKey){
		bootbox.confirm({  
	        buttons: {  
	            cancel: {  
	                label: '取消',  
	                className: 'btn-default'  
	            },
	            confirm: {  
	                label: '确认',  
	                className: 'btn-primary'  
	            } 
	        },
	        message:"请确认触发该任务！",
	        callback: function(result) {
	        	if(result) {
					var params = {};
					params['jobKey'] = jobKey;
					$.get("<%=request.getContextPath()%>/system/triggerJob", params,
					  function(data){
					   if(data){
							bootbox.alert("触发任务成功");
						}else{
							bootbox.alert("触发任务失败");
						}
						loadJobShow();
					});
				}
	        },
		});
	}
	
	function deleteJob(jobKey){
		bootbox.confirm({  
	        buttons: {  
	            cancel: {  
	                label: '取消',  
	                className: 'btn-default'  
	            },
	            confirm: {  
	                label: '确认',  
	                className: 'btn-primary'  
	            } 
	        },
	        message:"请确认删除该任务！",
	        callback: function(result) {
	        	if(result) {
					var params = {};
					params['jobKey'] = jobKey;
					$.get("<%=request.getContextPath()%>/system/deleteJob", params,
					  function(data){
						if(data){
							bootbox.alert("删除任务成功");
						}else{
							bootbox.alert("删除任务失败");
						}
						loadJobShow();
					});
				}
	        },
		});
	}
	
	function showScheduleForm(triggerKey){
		$("#errorMsg").empty();
		$("#cronExpression").val("")
		$("#triggerKey").val(triggerKey);
		$("#smodal-reschedule").modal("show");
	}
	
	function rescheduleJob(){
		var triggerKey = $("#triggerKey").val();
		var cronExpression = $("#cronExpression").val();
		var params = {};
		params['triggerKey'] = triggerKey;
		params['cronExpression'] = cronExpression;
		$.get("<%=request.getContextPath()%>/system/rescheduleJob", params,
				function(data) {
					if(data){
						bootbox.alert("更新周期成功");
					}else{
						$("#errorMsg").html("更新周期失败");
					}
					loadJobShow();
				});
	}
</script>

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">定时任务列表</li>
	</ol>
</div>
<!--/.row-->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">定时任务列表</h1>
	</div>
</div>
<!--/.row-->


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!-- 	<div class="panel-heading">Advanced Table</div> -->
			<div class="panel-body">
				<div id="toolbar1" class="btn-group"></div>
				<br /> <br />
				<shiro:hasPermission name="system.job.query">
					<table id="table"
						class="table table-hover table-nomargin table-bordered">
						<thead>
							<tr>
								<th>名称</th>
								<th>组别</th>
								<th>Cron表达式</th>
								<th>下次运行时间</th>
								<th>状态</th>
								<th>操作</th>
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
<!--/.row-->
<div id="smodal-reschedule" class="modal fade" role="dialog"
	data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">重新设置触发周期</h4>
			</div>
			<!-- /.modal-header -->
			<div class="modal-body">
				<div class='form-horizontal'>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">设置cron表达式
							:</label>
						<div class="col-sm-8">
							<input class="form-control" type="text" id="cronExpression">
							<p id="errorMsg" class="form-control-static kcolor-red"></p>

						</div>
					</div>
				</div>
			</div>
			<!-- /.modal-body -->
			<div class="modal-footer">
				<input type="hidden" id="triggerKey" />
				<button type="button" class="btn btn-default" data-dismiss="modal">取
					消</button>
				<button type="button" class="btn btn-primary"
					onclick="rescheduleJob();">保 存</button>
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>