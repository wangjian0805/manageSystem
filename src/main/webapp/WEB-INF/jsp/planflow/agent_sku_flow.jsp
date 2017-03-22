<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
td {
	vertical-align:middle;
	text-align:center;
}
</style>
<script src="<%=request.getContextPath()%>/js/common/address.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		loadAgentFlowPage(1, 10);
		$("#queryBtn").click(function(){
			loadAgentFlowPage(1, 10);
		});
	});
	
	document.onkeydown=function(event){ 
        var e = event || window.event || arguments.callee.caller.arguments[0]; 
         if(e && e.keyCode==13){ // enter 键 
			$("#queryBtn").trigger("click");
         };
	}
	
	function importExcel(){
		$('#modalTitle1').text('经销商产品流向批量导入');
		$("#modal-importExcel").modal("show");
	}
	
	function loadAgentFlowPage(currentPage, limit) {
		var planYear=$("#cplanYear").val().trim();
        var planMonth=$("#cplanMonth").val().trim();
        var agentId=$("#cagentId").val().trim();
        var agentName=$("#cagentName").val().trim();
        var createBy=$("#ccreateBy").val().trim();
		//先销毁表格  
        $('#table').bootstrapTable('destroy'); 
        $("#table").bootstrapTable({
        	method: "post",  //使用get请求到服务器获取数据  
        	contentType: "application/x-www-form-urlencoded",
        	dataType: "json",
            url: '<%=request.getContextPath()%>/agent/agentFlowPage', //获取数据的Servlet地址  
            striped: true,  //表格显示条纹  
            pagination: true, //启动分页  
            pageSize: limit,  //每页显示的记录数  
            pageNumber:currentPage, //当前第几页  
            pageList: [5, 10, 15, 20, 25],  //记录数可选列表  
            search: false,  //是否启用查询  
            sidePagination: "server", //表示服务端请求
            clickToSelect: true,
            //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder  
            //设置为limit可以获取limit, offset, search, sort, order  
            queryParamsType : "undefined",   
            queryParams: function queryParams(params) {   //设置查询参数  
              var param = {    
                  pageSize: params.pageNumber,
                  pageNumber: params.pageSize,
                  planYear:planYear,
                  planMonth:planMonth,
                  agentId:agentId,
                  agentName:agentName,
                  createBy:createBy
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
                field: 'agentFlowId',
                align: 'center',
                title: '经销商产品流向编号',
            },{
                field: 'agent',
                align: 'center',
                title: '经销商编号',
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	
                	if(value.isDelete==1){
                		return "<font color='red'>"+value.agentId+"</font>";
                	}
                	return value.agentId;
                }
            }, {
                field: 'agent',
                align: 'center',
                title: '经销商名称',
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	
                	if(value.isDelete==1){
                		return "<font color='red'>"+value.agentName+"</font>";
                	}
                	
                	return value.agentName;
                }
            }, {
                field: 'agentFlowDate',
                align: 'center',
                title: '数据月份',
                formatter: function (value, row, index) {
                	return  new Date(parseInt(value)).Format('yyyy-MM');
                }
            }, {
                field: 'createBy',
                align: 'center',
                title: '创建人'
            }, {
                field: 'createAt',
                align: 'center',
                title: '创建时间',
                formatter: function (value, row, index) {
                	return  new Date(parseInt(value)).Format('yyyy-MM-dd hh:mm:ss');
                }
            },{
                field: 'option',
                align: 'center',
                title: '操作',
                events: operateEvents,
                formatter: operateFormatter
            }],
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
	function operateFormatter(value, row, index) {
        return [
            '<a class="showItem" href="javascript:void(0)" title="展示详情">',
            '<i>详情</i>',
            '</a>  '
            
        ].join('');
    }
	window.operateEvents = {
	        'click .showItem': function (e, value, row, index) {
	        	var agentFlowDate = new Date(parseInt(row.agentFlowDate)).Format('yyyy-MM');
	        	if(row.agent==null){
	        		window.location.href='<%=request.getContextPath()%>/agent/goToAgentFlowItemPage?agentId='+'无'+'&agentName='+'无'+'&agentFlowId='+row.agentFlowId+'&agentFlowDate='+agentFlowDate;
	        	}else{
	        		window.location.href='<%=request.getContextPath()%>/agent/goToAgentFlowItemPage?agentId='+row.agent.agentId+'&agentName='+encodeURI(encodeURI(row.agent.agentName))+'&agentFlowId='+row.agentFlowId+'&agentFlowDate='+agentFlowDate;
	        	}
	        	 
	            console.log('You click like action, row: ' + JSON.stringify(row));
	        }
	    };
	
	function delAgentFlow() {
		var agentFlowIds = [];
		$("input[name='subBox']").each(function() {
			if ($(this).is(":checked")) {

				var tr = $(this).parent().parent();
				var a = tr.children();

				agentFlowIds.push(a.eq(1).text());
			}
		});

		if (agentFlowIds.length > 0) {
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
		        message: '你确定要删除选中的经销商产品流向吗?!',  
		        callback: function(result) {  
		            if(result) {  
		            	$.ajax({
		    				//提交数据的类型 POST GET
		    				type : "POST",
		    				//提交的网址
		    				url : '<%=request.getContextPath()%>/agent/delAgentFlow',
		    				data : {
		    					'agentFlowIds' : agentFlowIds
		    				},
		    				traditional : true,
		    				dataType : 'JSON',
		    				success : function(data) {
		    					if (data.status) {
		    						bootbox.alert(data.msg);
		    						loadAgentFlowPage($('#currentPage').val(), $('#limit').val());
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
			bootbox.alert('请选择具体经销商产品流向后删除');
		}

	}
	
	function showAddAgentFlow() {
		
		//window.location.href="/deepureFlow/jsp/login.jsp"
		$('#agentName').val('');
		$('#agentType').val('');
		
		$('#addBtn').show();
		$('#editBtn').hide();
		
		$('#modalTitle').text('新增经销商产品流向');
		$("#modal-AgentFlowComment").modal("show");
	}
	
	function showEditAgentFlow(){	
		if($("input[name='subBox']:checked").length==1){
			$("input[name='subBox']").each(function() {
				if ($(this).is(":checked")) {
					
					var tr = $(this).parent().parent();
					var a = tr.children();	
					
					var agentFlowId = a.eq(1).text();
					var agentId = a.eq(2).text();
					var agentName = a.eq(3).text();
					var agentFlowDate = a.eq(4).text();
					
					window.location.href='<%=request.getContextPath()%>/agent/editAgentFlowStockItemPage?agentId='+agentId+'&agentName='+encodeURI(encodeURI(agentName))+'&agentFlowDate='+agentFlowDate+'&agentFlowId='+agentFlowId;
					
				}
			});
		}else if($("input[name='subBox']:checked").length==0){
			bootbox.alert('请至少选择一个经销商产品流向！');
		}else{
			bootbox.alert('不可以选择多个经销商产品流向！');
		}
	}
	
	
</script>
<input type="hidden" id="currentPage" />
<input type="hidden" id="limit" />

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">经销商产品流向管理</li>
	</ol>
</div>

<br/>
<fieldset>
	<legend>查询条件</legend>
	<div class="will">
		<div style="text-align: center;">
			<div class="form-group">
				<label for="cagentId" class="control-label col-sm-2">经销商编号：</label>
				<div class="col-sm-4">
					<input type="text" name="agentId" class="form-control"
						id="cagentId" value="" />
				</div>
				<label for="cagentName" class="control-label col-sm-2">经销商名称：</label>
				<div class="col-sm-4">
					<input type="text" name="agentName" class="form-control"
						id="cagentName" value="" />
				</div>
			</div>
			<div class="form-group">
					<label for="ccreateBy" class="control-label col-sm-2">创建人：</label>
					<div class="col-sm-4">
						<input type="text" name="createBy" class="form-control"
							id="ccreateBy" value="" />
					</div>
					<div class="col-sm-6">
					<input type="hidden"/s>
					</div>
				</div>
			<div class="form-group">
				<label for="cplanYear" class="control-label col-sm-2">数据年份：</label>
				<div class="col-sm-4">
					<!-- <input class="form-control" type="text" value="" id="cplanYear" readonly> -->
					<div class="input-group date form_datetime col-md-15"
						data-link-field="dtp_input1">
						<input class="form-control" type="text" value="" readonly
							id="cplanYear"> <span class="input-group-addon"><span
							class="glyphicon glyphicon-remove"></span></span> <span
							class="input-group-addon"><span
							class="glyphicon glyphicon-calendar"></span></span>
					</div>
				</div>
				<label for="cplanMonth" class="control-label col-sm-2">数据月份：</label>
				<div class="col-sm-4">
					<select class="form-control" name="cplanMonth" id="cplanMonth" readonly>
						<option value=""></option>
						<option value="1">一月</option>
						<option value="2">二月</option>
						<option value="3">三月</option>
						<option value="4">四月</option>
						<option value="5">五月</option>
						<option value="6">六月</option>
						<option value="7">七月</option>
						<option value="8">八月</option>
						<option value="9">九月</option>
						<option value="10">十月</option>
						<option value="11">十一月</option>
						<option value="12">十二月</option>
					</select>
					<!-- <input class="form-control" type="text" value="" id="cplanMonth"> -->
				</div>
				
			</div>
			
			<shiro:hasPermission name="planflow.agentproduct.query">
			<div class="form-group col-sm-12">
				<button class="btn btn-primary" id="queryBtn" style="margin-top:10px;width:100px;">查询</button>
			</div>
			</shiro:hasPermission>
			
		</div>
		
	</div>
</fieldset>
<fieldset>
	<legend>查询内容</legend>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
				<c:if test="${zoneFlowStatus=='1'}">
					<div id="toolbar1" class="btn-group">
						<shiro:hasPermission name="planflow.agentproduct.add">
							<%-- <form action="<%=request.getContextPath()%>/agent/toConditionPage" method="POST"> --%>
							<button id="btn_add" type="button" class="btn btn-default"
								onclick="showAddAgentFlow()">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
							</button>
							<!-- </form> -->
						</shiro:hasPermission>
						<shiro:hasPermission name="planflow.agentproduct.edit">
							<button id="btn_edit" type="button" class="btn btn-default"
								onclick="showEditAgentFlow()">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
							</button>
						</shiro:hasPermission>
						<shiro:hasPermission name="planflow.agentproduct.delete">
							<button id="btn_delete" type="button" class="btn btn-default"
								onclick="delAgentFlow()">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
							</button>
							<br /> <br />
						</shiro:hasPermission>
						<!-- <button id="btn_delete" type="button" class="btn btn-default" onClick='importExcel()'>
							<span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>导入模板
						</button> -->
					</div>
					
					</c:if>
					<shiro:hasPermission name="planflow.agentproduct.query">
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
</fieldset>


<!--------------------------------------------------经销商流向新增第一步------------------------------------------------------->
<div id="modal-AgentFlowComment" class="modal fade" role="dialog"
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
				<div class="form-horizontal" role="form">
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-4">经销商:</label>
						<div class="col-sm-4">
							<select id="agent" class="form-control combobox">
								<option></option>
								<c:if test="${not empty agentList}">
									<c:forEach var="agent" items="${agentList}">
										 <option value="${agent.agentId}" age_name="${agent.agentName}">${agent.agentId}-${agent.agentName}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="agentFlowDate" class="control-label col-sm-4">数据月份:</label>
						<div class="col-md-4">
							<!-- <input class="form-control" type="text" value="" id="agentFlowDate" readonly> -->
							<div class="input-group date form_datetime1 col-md-15"
						data-link-field="dtp_input1">
						<input class="form-control" type="text" value="" readonly
							id="agentFlowDate"> <span class="input-group-addon"><span
							class="glyphicon glyphicon-remove"></span></span> <span
							class="input-group-addon"><span
							class="glyphicon glyphicon-calendar"></span></span>
					</div>
						</div>
					</div>
				</div>
			</div>

			<!-- /.modal-body -->
			<div class="modal-footer">
				<button id="nextBtn" type="button" class="btn btn-primary" onclick="goToNext()">下一步</button>
				<button id="delBtn" type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
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
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="btn_upCancel" class="btn btn-white"
					data-dismiss="modal">关闭</button>
				<button type="button" id="btn_upSubmit"
					class="btn btn-success pdlr16">
					<span id="uploadTxt">导入</span>
				</button>
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<script type="text/javascript">

function validateParam(){
	var agentId=$('#agent').val();
	var agentFlowDate=$('#agentFlowDate').val()+"-01";
	var planDate=new Date(agentFlowDate.replace(/-/g,"/"));
	var nowDate = new Date();
	var flag = true;
	
	if(agentId==null||agentId=='-1'||agentId==''){
		bootbox.alert("请选择经销商"); 
		$('#agent').focus();
		return false;
	}
	
	if(agentFlowDate==null||agentFlowDate.trim()==''||agentFlowDate.trim()=='-01'){
		bootbox.alert("请选择数据月份"); 
		$('#agentFlowDate').focus();
		return false;
	}
	if(planDate.getFullYear()==nowDate.getFullYear()){
		if(planDate.getMonth()<nowDate.getMonth()){
			bootbox.alert("数据月份不能早于当前月份");
			return false;
		}
	}else if(planDate.getFullYear()<nowDate.getFullYear()){
		bootbox.alert("数据月份不能早于当前月份");
	}
	$.ajax({
		type : "POST",
		url : '<%=request.getContextPath()%>/agent/validateAddAgentFlow',
		async:false,
		data : {
			'agentId' : agentId,
			'agentFlowDate' : agentFlowDate,
		},
		success : function(data) {
			if (data.status) {
				flag = true;
			}else{
				bootbox.alert(data.msg);
				flag = false;
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			bootbox.alert(ERROR_MSG);
		}
	});
	return flag;
}
function goToNext(){
	
	var agentId = $('#agent').val();
	var agentName =  $("#agent").find("option:selected").attr("age_name");
	var agentFlowDate = $('#agentFlowDate').val();
	if(validateParam()){
		window.location.href='<%=request.getContextPath()%>/agent/addAgentFlowStockPage?agentId='+agentId+'&agentName='+encodeURI(encodeURI(agentName))+'&agentFlowDate='+agentFlowDate;
	}
}
    
$('.form_datetime1').datetimepicker({
	language:"zh-CN",
	format: 'yyyy-mm',
    weekStart: 1,
    //todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 3,
	minView: 3, 
    showMeridian: 1,
    startDate:new Date()
});
$('.form_datetime').datetimepicker({
	language:"zh-CN",
	format: 'yyyy',
    weekStart: 1,
    //todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 4,
	minView: 4, 
    showMeridian: 1
});
/* $('#cplanMonth').datetimepicker({
	language:"zh-CN",
	format: 'mm',
    weekStart: 1,
    //todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 3,
	minView: 3, 
	forceParse: 0,
    showMeridian: 1
}); */
</script>