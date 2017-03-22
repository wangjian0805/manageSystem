<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<script type="text/javascript">
	$(document).ready(function() { 
		loadZonePlanPage();
		$('.sel-all').on('click', function() {
			var isChecked = $(this).prop('checked');
			$('#table').find('.selectable').prop('checked', isChecked);
		});
	});

	function loadZonePlanPage() {
		$("#table>tbody").html("");
		var zoneId=$('#zoneId').val().trim();
		$.ajax({
			url : "<%=request.getContextPath()%>/zone/queryZonePlan",
			type : 'GET',
			contentType : 'application/json;charset=utf-8',
			data:{'zoneId':zoneId},
			dataType : 'json',
			success : function(data) {
				var res = eval(data)
				if(res.length>0){
					for(var i=0;i<res.length;i++){
						var tbody ="<tr>";
						
						tbody += '<td><input type="checkbox" class="selectable" id="1"></td>';
							
						var planTypeText="";
						if(res[i].planType==0){
							planTypeText="计划";
						}else if(res[i].planType==1){
							planTypeText="流向";
						}
						
						tbody += '<td>'+ planTypeText+'</td>';
						tbody += '<td style="display:none">'+ res[i].planType+'</td>';
						tbody += '<td>'+ res[i].planStartDay +'</td>';
						tbody += '<td>'+ res[i].planEndDay +'</td>';
						
/* 						var planStatusText="";
						if(res[i].planStatus==0){
							planStatusText="未启用";
						}else if(res[i].planStatus==1){
							planStatusText="启用";
						}
						
						tbody += '<td>'+ planStatusText +'</td>'; */
						
						tbody += '</tr>';
						$("#table>tbody").append(tbody);
					}
				}
			}
		});   
	}
	
	function showAddZonePlan(){
		$('#title').html("新增任务");
		$('#zonePlanStartDay').val('');
		$('#zonePlanEndDay').val('');
		$('#operation').val(0);
		$('#zonePlanType').val('');
		$('#modal-zonePlan').modal("show");
	}
	
	function showEditZonePlan(){
		if($(".selectable:checked").length==1){
			$(".selectable").each(function() {
				if ($(this).is(":checked")) {
					
					var tr = $(this).parent().parent();
					var a = tr.children();	
					
					$('#title').html("修改任务");
					$('#operation').val(1);
					$('#zonePlanStartDay').val(a.eq(3).text());
					$('#zonePlanEndDay').val(a.eq(4).text());
					$("#zonePlanType").val(a.eq(2).text())
					$('#modal-zonePlan').modal('show');
				}
			});
		}else if($(".selectable:checked").length==0){
			bootbox.alert('请至少选择一条任务！');
		}else{
			bootbox.alert('不可以选择多条任务！');
		}
	}
	
	function addOrUpdateZonePlan(){
		var zonePlanType=$('#zonePlanType').val();
		var zonePlanStartDay=$('#zonePlanStartDay').val();
		var zonePlanEndDay=$('#zonePlanEndDay').val();
		var zoneId=$('#zoneId').val();
		var operation=$('#operation').val();
		
		if(zonePlanType==null||zonePlanType==''){
			bootbox.alert("任务类型不能为空");
			$('#zonePlanType').focus();
			return;
		}
		
		if(zonePlanStartDay==null||zonePlanStartDay==''){
			bootbox.alert("任务开始时间不能为空");
			$('#zonePlanStartDay').focus();
			return;
		}
		
		if(zonePlanEndDay==null||zonePlanEndDay==''){
			bootbox.alert("任务结束时间不能为空");
			$('#zonePlanEndDay').focus();
			return;
		}
		
		if(parseInt(zonePlanStartDay)>=parseInt(zonePlanEndDay)){
			bootbox.alert("起始日期不能大于等于结束日期，请重新填写，谢谢！");
			return;
		}
		
		$.ajax({
			//提交数据的类型 POST GET
			type : "POST",
			//提交的网址
			url : '<%=request.getContextPath()%>/zone/addOrUpdateZonePlan',
			data : {
				'operation':operation,
				'zoneId':zoneId,
				'zonePlanType' : zonePlanType,
				'zonePlanStartDay' : zonePlanStartDay,
				'zonePlanEndDay' : zonePlanEndDay
			},
			traditional : true,
			dataType : 'JSON',

			success : function(data) {

				if (data.status) {
					bootbox.alert(data.msg);
					$('#modal-zonePlan').modal("hide");
					loadZonePlanPage();
				} else {
					bootbox.alert(data.msg);
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				bootbox.alert(ERROR_MSG);	
			}
		});
	}
	
	function delZonePlan(){
		var zonePlanList = [];
		var zoneId=$('#zoneId').val();
		$(".selectable").each(function() {
			if ($(this).is(":checked")) {

				var tr = $(this).parent().parent();
				var a = tr.children();

				zonePlanList.push(a.eq(2).text());
			}
		});

		if (zonePlanList.length > 0) {
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
		        message: '你确定要删除任务吗?!',  
		        callback: function(result) {  
		            if(result) {  
		            	$.ajax({
		    				//提交数据的类型 POST GET
		    				type : "POST",
		    				//提交的网址
		    				url : '<%=request.getContextPath()%>/zone/delZonePlan',
		    				data : {
		    					'zoneId':zoneId,
		    					'zonePlanList' : zonePlanList
		    				},
		    				traditional : true,
		    				dataType : 'JSON',

		    				success : function(data) {

		    					if (data.status) {
		    						bootbox.alert(data.msg);
		    					} else {
		    						bootbox.alert(data.msg);
		    					}
		    					loadZonePlanPage();
		    				},
		    				error : function(XMLHttpRequest, textStatus, errorThrown) {
		    					bootbox.alert(ERROR_MSG);
		    				}
		    			});
		            }  
		        },  
		        });
		} else {
			bootbox.alert('请选择具体任务后删除');
		}

	}
	
	function validateNum(temp){		
		var r = /[1-9]\d*/;
		if(!r.test($(temp).val())||$(temp).val()==""){
			bootbox.alert("数量填写必须为正整数，请重新填写！");
			$(temp).val("");
			$(temp).focus();
			return;
		}else{
			var currentInt=parseInt($(temp).val());
			if(currentInt>28){
				bootbox.alert("数量填写1至28之间的数字，保证每月的计划可以定时执行");
				$(temp).val("");
				$(temp).focus();
				return;
			}
		}
	}
</script>
<input type="hidden" id="currentPage" />
<input type="hidden" id="limit" />
<input type="hidden" id="zoneId" value="${zone.zoneId}"/>

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">${zone.zoneName} 任务列表</li>
	</ol>
</div>
<!--/.row-->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">${zone.zoneName} 任务列表</h1>
	</div>
</div>
<!--/.row-->


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!-- 	<div class="panel-heading">Advanced Table</div> -->
			<div class="panel-body">
				<div id="toolbar1" class="btn-group">
					<shiro:hasPermission name="system.zoneplan.add">
					<button id="btn_add" type="button" class="btn btn-default"
						onclick='showAddZonePlan()'>
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
					</button>
					</shiro:hasPermission>
					<shiro:hasPermission name="system.zoneplan.edit">
					<button id="btn_edit" type="button" class="btn btn-default" onclick='showEditZonePlan()'>
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
					</button>
					</shiro:hasPermission>
					<shiro:hasPermission name="system.zoneplan.delete">
					<button id="btn_delete" type="button" class="btn btn-default"
						onclick='delZonePlan()'>
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
					</button>
					</shiro:hasPermission>
				</div>
				<br /> <br />
				<shiro:hasPermission name="system.zone.query">
				<table id="table" class="table table-condensed">
					<thead>
						<tr class="success">
							<th class="table-checkbox">&nbsp; <input type="checkbox" class="sel-all" /></th>
							<th>任务类型</th>
							<th style="display:none">任务类型Type</th>
							<th>任务开始日期</th>
							<th>任务结束日期</th>
							<!-- <th>任务状态</th> -->
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				</shiro:hasPermission>
			</div>
		</div>
	</div>
</div>
                <div class="order_submit col-sm-12">
                    <div class="form-actions kclear-float">
                        <button type="button" class="btn btn-primary" onclick="javascript:history.go(-1);">返 回</button>
                    </div>
                </div>
<!--/.row-->
<!--------------------------------------------------修改备注对话框------------------------------------------------------->
<div class="modal fade" id="modal-zonePlan" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="title">新增任务</h4>
			</div>
			<!-- /.modal-header -->
			<div class="modal-body">
				<div class="form-horizontal">
					<input type="hidden" id="operation">
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">任务类型:</label>
						<div class="col-sm-7">
						<select id="zonePlanType" class="form-control">
							<option></option>
                            <option value="0">计划</option>
                            <option value="1">流向</option>
                         </select>
                         </div>
					</div>
					
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">任务开始日期:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="zonePlanStartDay" onchange="validateNum(this)">
						</div>
					</div>
					
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">任务结束日期:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="zonePlanEndDay" onchange="validateNum(this)">
						</div>
					</div>
				</div>
			</div>

			<!-- /.modal-body -->
			<div class="modal-footer">
				<button id="addBtn" type="button" class="btn btn-primary"
					onclick='addOrUpdateZonePlan()'>确 认</button>
				<button id="delBtn" type="button" class="btn btn-primary" data-dismiss="modal">取
					消</button>
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>