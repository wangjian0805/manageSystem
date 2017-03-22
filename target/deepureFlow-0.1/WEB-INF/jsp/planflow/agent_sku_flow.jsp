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
	
	function importExcel(){
		$('#modalTitle1').text('批量导入');
		$("#modal-importExcel").modal("show");
	}
	
	function loadAgentFlowPage(currentPage, limit) {
		var planYear=$("#cplanYear").val();
        var planMonth=$("#cplanMonth").val();
        var agentId=$("#cagentId").val();
        var createBy=$("#ccreateBy").val();
		//先销毁表格  
        $('#table').bootstrapTable('destroy'); 
        $("#table").bootstrapTable({
        	method: "get",  //使用get请求到服务器获取数据  
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
                	return value.agentId;
                }
            }, {
                field: 'agent',
                align: 'center',
                title: '经销商名称',
                formatter: function (value, row, index) {
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
	        	var AgentFlowDate = new Date(parseInt(row.AgentFlowDate)).Format('yyyy-MM');
	        	window.location.href='<%=request.getContextPath()%>/agent/goToAgentFlowItemPage?agentId='+row.agent.agentId+'&agentName='+encodeURI(encodeURI(row.agent.agentName))+'&agentFlowId='+row.agentFlowId+'&agentFlowDate='+agentFlowDate; 
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
			bootbox.confirm("你确定要删除选中的经销商产品流向吗!",function(result){
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
					if (data) {
						bootbox.alert("删除成功");
					} else {
						bootbox.alert("删除失败");
					}
					loadAgentFlowPage($('#currentPage').val(), $('#limit').val());
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					bootbox.alert("删除失败");
				}
			});
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
					
					var AgentFlowId = a.eq(1).text();
					var agentId = a.eq(2).text();
					var agentName = a.eq(3).text();
					var planMonth = a.eq(6).text();
					
					window.location.href='<%=request.getContextPath()%>/agent/editAgentFlowPage?agentId='+agentId+'&agentName='+encodeURI(encodeURI(agentName))+'&planMonth='+planMonth+'&AgentFlowId='+AgentFlowId;
					
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
				<label for="cagentId" class="control-label col-sm-2">创建人：</label>
				<div class="col-sm-4">
					<input type="text" name="agentName" class="form-control"
						id="ccreateBy" value="" />
				</div>
			</div>
			<div class="form-group">
				<label for="cplanYear" class="control-label col-sm-2">数据年份：</label>
				<div class="col-sm-4">
					<div class="input-group date form_datetime"
						data-link-field="dtp_input1" id="selectYear">
						<input class="form-control" type="text" value="" readonly
							id="cplanYear"> <span class="input-group-addon"><span
							class="glyphicon glyphicon-remove"></span></span> <span
							class="input-group-addon"><span
							class="glyphicon glyphicon-th"></span></span>
					</div>
				</div>
				<label for="cplanMonth" class="control-label col-sm-2">数据月份：</label>
				<div class="col-sm-4">
					<div class="input-group date form_datetime"
						data-link-field="dtp_input1" id="selectMonth">
						<input class="form-control" type="text" value="" readonly
							id="cplanMonth"> <span class="input-group-addon"><span
							class="glyphicon glyphicon-remove"></span></span> <span
							class="input-group-addon"><span
							class="glyphicon glyphicon-th"></span></span>
					</div>
				</div>
			</div>
			<button class="btn btn-primary" id="queryBtn" style="margin-top:10px;width:100px;">查询</button>
		</div>
		
	</div>
</fieldset>
<fieldset>
	<legend>查询内容</legend>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<div id="toolbar1" class="btn-group">
						<shiro:hasPermission name="master.agent.add">
							<%-- <form action="<%=request.getContextPath()%>/agent/toConditionPage" method="POST"> --%>
							<button id="btn_add" type="button" class="btn btn-default"
								onclick="showAddAgentFlow()">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
							</button>
							<!-- </form> -->
						</shiro:hasPermission>
						<shiro:hasPermission name="master.agent.edit">
							<button id="btn_edit" type="button" class="btn btn-default"
								onclick="showEditAgentFlow()">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
							</button>
						</shiro:hasPermission>
						<shiro:hasPermission name="master.agent.delete">
							<button id="btn_delete" type="button" class="btn btn-default"
								onclick="delAgentFlow()">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
							</button>
						</shiro:hasPermission>
						<button id="btn_delete" type="button" class="btn btn-default" onClick='importExcel()'>
							<span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>导入模板
						</button>
						<%-- <shiro:hasPermission name="master.agent.turnformal">
					<button id="btn_delete" type="button" class="btn btn-default" onclick="turnagent()">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>转正式
					</button>
					</shiro:hasPermission> --%>
					</div>
					<br /> <br />
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
</fieldset>


<!--------------------------------------------------修改备注对话框------------------------------------------------------->
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
							<select id="agent" class="form-control">
							<option value="-1">请选择</option>
							<c:if test="${not empty agentList}">
								<c:forEach var="agent" items="${agentList}">
									 <option value="${agent.agentId}">${agent.agentName}</option>
								</c:forEach>
							</c:if>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-4">数据月份:</label>
						<div class="col-md-4">
							<div class="input-group date form_datetime col-md-15"
								data-link-field="dtp_input1" id="addMonth">
								<input class="form-control" type="text" value="" readonly
									id="planMonth"> <span class="input-group-addon"><span
									class="glyphicon glyphicon-remove"></span></span> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-th"></span></span>
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
	var planMonth=$('#planMonth').val();
	
	if(agentId==null||agentId=='-1'){
		bootbox.alert("请选择经销商"); 
		$('#agent').focus();
		return false;
	}
	
	if(planMonth==null||planMonth==''){
		bootbox.alert("请选择数据月份"); 
		$('#planMonth').focus();
		return false;
	}
	
	return true;
}
function goToNext(){
	
	var agentId = $('#agent').val();
	var agentName =  $("#agent").find("option:selected").text();
	var planMonth = $('#planMonth').val();
	if(validateParam()){
		//$("#modal-agentSalePlanComment").modal("hide");
		window.location.href='<%=request.getContextPath()%>/agent/addAgentFlowPage?agentId='+agentId+'&agentName='+encodeURI(encodeURI(agentName))+'&planMonth='+planMonth;
	}
}
    
$('#addMonth').datetimepicker({
	format: 'yyyy-mm',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 3,
	minView: 3, 
	forceParse: 0,
    showMeridian: 1
});
$('#selectYear').datetimepicker({
	format: 'yyyy',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 4,
	minView: 4, 
	forceParse: 0,
    showMeridian: 1
});
$('#selectMonth').datetimepicker({
	format: 'mm',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 3,
	minView: 3, 
	forceParse: 0,
    showMeridian: 1
});
</script>