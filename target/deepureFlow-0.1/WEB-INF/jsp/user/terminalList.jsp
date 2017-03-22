<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="<%=request.getContextPath()%>/js/common/address.js"></script>
<script type="text/javascript">
	$(document).ready(function() { 
		loadTerminalPage(1, 10);
	});

	function loadTerminalPage(currentPage, limit) {
		//先销毁表格  
        $('#table').bootstrapTable('destroy');
		
		var queryTerminalCode=$('#queryTerminalCode').val();
		var queryTerminalName=$('#queryTerminalName').val();
		var queryAgent=$('#queryAgent').val();
		var queryTerminalStatus=$('#queryTerminalStatus').val();
		
        $("#table").bootstrapTable({
        	method: "post",  //使用get请求到服务器获取数据  
        	contentType: "application/x-www-form-urlencoded",
        	dataType: "json",
            url: '<%=request.getContextPath()%>/terminal/terminalPage', //获取数据的Servlet地址  
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
                  queryTerminalCode:queryTerminalCode,
                  queryTerminalName:queryTerminalName,
                  queryAgent:queryAgent,
                  queryTerminalStatus:queryTerminalStatus
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
                field: 'terminalId',
                align: 'center',
                title: '终端编号'
            }, {
                field: 'terminalName',
                align: 'center',
                title: '终端名称'
            }, {
                field: 'terminalType',
                class:"hidden",
                title: '终端类型'
            },{
                field: 'terminalType',
                align: 'center',
                width: '50',
                title: '是否个人客户',
                formatter: function (value, row, index) {
                	var result="";
                	if(value==0){
                		result="个人";
                	}else if(value==1){
                		result="非个人";
                	}
                	return result;
                }
            }, {
                field: 'erpCode',
                align: 'center',
                title: 'ERP编号',
            }, {
                field: 'station',
                title: '岗位编号',
               /*  visible: true, */
                class:"hidden",
                formatter: function (value, row, index) {
                	return value.stationCode;
                }
            },{
                field: 'station',
                align: 'center',
                title: '所属岗位',
                formatter: function (value, row, index) {
                	return value.stationName;
                }
            },{
                field: 'user',
                title: '业务员编号',
               /*  visible: true, */
                class:"hidden",
                formatter: function (value, row, index) {
                	return value.id;
                }
            },{
                field: 'user',
                align: 'center',
                title: '所属业务员',
                formatter: function (value, row, index) {
                	return value.username;
                }
            },{
                field: 'channel',
                title: '渠道编号',
               /*  visible: true, */
                class:"hidden",
                formatter: function (value, row, index) {
                	return value.channelId;
                }
            },{
                field: 'channel',
                align: 'center',
                title: '所属渠道',
                formatter: function (value, row, index) {
                	return value.channelName;
                }
            },{
                field: 'hierarchy',
                title: '体系编号',
               /*  visible: true, */
                class:"hidden",
                formatter: function (value, row, index) {
                	return value.hierarchyId;
                }
            },{
                field: 'hierarchy',
                align: 'center',
                title: '所属体系',
                formatter: function (value, row, index) {
                	return value.hierarchyName;
                }
            }, {
                field: 'agent',
                title: '经销商编号',
               /*  visible: true, */
                class:"hidden",
                formatter: function (value, row, index) {
                	return value.agentId;
                }
            },{
                field: 'agent',
                align: 'center',
                title: '所属经销商',
                formatter: function (value, row, index) {
                	return value.agentName;
                }
            },{
                field: 'province',
                title: '省编号',
               /*  visible: true, */
                class:"hidden",
                formatter: function (value, row, index) {
                	return value.areacode;
                }
            },{
                field: 'province',
                align: 'center',
                title: '所属省',
                formatter: function (value, row, index) {
                	return value.areaname;
                }
            },{
                field: 'city',
                title: '市编号',
               /*  visible: true, */
                class:"hidden",
                formatter: function (value, row, index) {
                	return value.areacode;
                }
            },{
                field: 'city',
                align: 'center',
                title: '所属市',
                formatter: function (value, row, index) {
                	return value.areaname;
                }
            },{
                field: 'district',
                title: '区编号',
               /*  visible: true, */
                class:"hidden",
                formatter: function (value, row, index) {
                	return value.areacode;
                }
            },{
                field: 'district',
                align: 'center',
                title: '所属区',
                formatter: function (value, row, index) {
                	return value.areaname;
                }
            },{
                field: 'terminalAddress',
                align: 'center',
                title: '详细地址'
            },  {
                field: 'terminalStatus',
                class:"hidden",
                title: '终端类型ID'
            },{
                field: 'terminalStatus',
                align: 'center',
                title: '终端类型',
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
                align: 'center',
                title: '计划开发时间',
                formatter: function (value, row, index) {
                	/* alert(new Date(parseInt(value))); */
                	return  new Date(parseInt(value)).Format('yyyy-MM-dd hh:mm:ss');
                }
            },{
                field: 'productCategoryIds',
                title: '主营产品组',
                /*  visible: true, */
                class:"hidden"
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
	
	function showAddTerminal() {
		
		$('#terminalId').text(generateId(1));
		$('#terminalName').val('');
		$('#terminalType').val('');
		$('#erpCode').val('');
		$('#stationId').val('');
		$('#terminalAddress').val('');
		$('#channelId').val('');
		$('#hierarchyId').val('');
		$('#agentId').val('');
		$('#terminalStatus').val('');
		$('#planDate').val('');
		$("input[name='productCategoryId']").removeAttr("checked");
		
		$('#addBtn').show();
		$('#editBtn').hide();
		
		$('#modalTitle').text('新增终端');
		$("#modal-terminalComment").modal("show");
	}
	
	function validateParam(){
		var terminalName=$('#terminalName').val();
		var terminalType=$('#terminalType').val();
		var stationId=$('#stationId').val();
		var channelId=$('#channelId').val();
		var hierarchyId=$('#hierarchyId').val();
		var agentId=$('#agentId').val();
		var terminalStatus=$('#terminalStatus').val();
		
		if(terminalName==null||terminalName==''){
			alert("终端名称不能为空");
			$('#terminalName').focus();
			return false;
		}
		
		if(stationId==null||stationId==''){
			alert("岗位不能为空");
			$('#stationId').focus();
			return false;
		}
		
		if(agentId==null||agentId==''){
			alert("经销商不能为空");
			$('#agentId').focus();
			return false;
		}
		
		if(channelId==null||channelId==''){
			alert("渠道不能为空");
			$('#channelId').focus();
			return false;
		}
		
		if(terminalStatus==null||terminalStatus==''){
			alert("请选择终端是否正式终端");
			$('#terminalStatus').focus();
			return false;
		}
		
		if(hierarchyId==null||hierarchyId==''){
			alert("体系不能为空");
			$('#hierarchyId').focus();
			return false;
		}
		
		return true;
	}
	
	function addTerminal(){
		var terminalId=$('#terminalId').html();
		var terminalName=$('#terminalName').val();
		var terminalType=$('#terminalType').val();
		var erpCode=$('#erpCode').val();
		var stationId=$('#stationId').val();
		var channelId=$('#channelId').val();
		var hierarchyId=$('#hierarchyId').val();
		var agentId=$('#agentId').val();
		var planDate=$('#planDate').val();
		var terminalStatus=$('#terminalStatus').val();
		
		var province=$('#province').val();
		var city=$('#city').val();
		var district=$('#district').val();
		var terminalAddress=$('#terminalAddress').val();
		
		var productCategoryIds = [];
		$("input[name='productCategoryId']").each(function() {
			if ($(this).is(":checked")) {

				var id = $(this).val();
				productCategoryIds.push(id);
			}
		});
		var isAdd=validateParam();
		if(isAdd){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : '<%=request.getContextPath()%>/terminal/addTerminal',
				data : {
					'terminalId':terminalId,
					'terminalName':terminalName,
					'terminalType':terminalType,
					'erpCode':erpCode,
					'stationId':stationId,
					'channelId':channelId,
					'hierarchyId':hierarchyId,
					'agentId':agentId,
					'terminalStatus':terminalStatus,
					'planDate':planDate,
					'province':province,
					'city':city,
					'district':district,
					'terminalAddress':terminalAddress,
					'productCategoryIds':productCategoryIds
				},
				traditional : true,
				dataType : 'JSON',

				success : function(data) {

					if (data) {
						bootbox.alert("新增成功");
					} else {
						bootbox.alert("新增失败");
					}
					loadTerminalPage($('#currentPage').val(), $('#limit').val());
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					bootbox.alert("新增失败");;
				}
			});
		}
		
	}
	
	function delTerminal() {
		var terminalIds = [];
		$("input[name='subBox']").each(function() {
			if ($(this).is(":checked")) {

				var tr = $(this).parent().parent();
				var a = tr.children();

				terminalIds.push(a.eq(1).text());
			}
		});

		if (terminalIds.length > 0) {
			bootbox.confirm("你确定要删除终端吗!",function(result){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : '<%=request.getContextPath()%>/terminal/delTerminal',
				data : {
					'terminalIds' : terminalIds
				},
				traditional : true,
				dataType : 'JSON',

				success : function(data) {

					if (data) {
						bootbox.alert("删除成功");
					} else {
						bootbox.alert("删除失败");
					}
					loadTerminalPage($('#currentPage').val(), $('#limit').val());
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					bootbox.alert("删除失败");
				}
			});
			})
		} else {
			bootbox.alert('请选择具体终端后删除');
		}

	}
	
	function showEditTerminal(){	
		$("input[name='productCategoryId']").removeAttr("checked");
		if($("input[name='subBox']:checked").length==1){
			$("input[name='subBox']").each(function() {
				if ($(this).is(":checked")) {
					
					var tr = $(this).parent().parent();
					var a = tr.children();	
					
					$('#terminalId').text(a.eq(1).text());
					$('#terminalName').val(a.eq(2).text());
					$('#terminalType').val(a.eq(3).text());
					$('#erpCode').val(a.eq(5).text());
					$('#stationId').val(a.eq(6).text());
					$('#agentId').val(a.eq(14).text());
					$('#channelId').val(a.eq(10).text());
					$('#hierarchyId').val(a.eq(12).text());
					$('#terminalAddress').val(a.eq(22).text());
					$('#terminalStatus').val(a.eq(23).text());				
					$('#planDate').val(a.eq(25).text());
					
					selectProvince(a.eq(16).text(),a.eq(18).text(),a.eq(20).text());
					
					
					var productCategoryIds=a.eq(26).text().split(",");
					if(productCategoryIds!=null&&productCategoryIds.length>0){
						$("input[name='productCategoryId']").each(function(){
							var id = $(this).val();
							for(var i=0;i<productCategoryIds.length;i++){
								if(id==productCategoryIds[i]){
									$(this).prop("checked",'true');
								}
							}
						});
					}
					
					$('#addBtn').hide();
					$('#editBtn').show();
					$('#modalTitle').text('修改终端');
					$("#modal-terminalComment").modal("show");
				}
			});
		}else if($("input[name='subBox']:checked").length==0){
			bootbox.alert('请至少选择一个终端！');
		}else{
			bootbox.alert('不可以选择多个终端！');
		}
	}
	
	function editTerminal(){
		var terminalId=$('#terminalId').html();
		var terminalName=$('#terminalName').val();
		var terminalType=$('#terminalType').val();
		var erpCode=$('#erpCode').val();
		var stationId=$('#stationId').val();
		var channelId=$('#channelId').val();
		var hierarchyId=$('#hierarchyId').val();
		var agentId=$('#agentId').val();
		var planDate=$('#planDate').val();
		var terminalStatus=$('#terminalStatus').val();
		
		var province=$('#province').val();
		var city=$('#city').val();
		var district=$('#district').val();
		var terminalAddress=$('#terminalAddress').val();
		
		var productCategoryIds = [];
		$("input[name='productCategoryId']").each(function() {
			if ($(this).is(":checked")) {

				var id = $(this).val();
				productCategoryIds.push(id);
			}
		});
		var isAdd=validateParam();
		
		if(isAdd){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : '<%=request.getContextPath()%>/terminal/editTerminal',
				data : {
					'terminalId':terminalId,
					'terminalName':terminalName,
					'terminalType':terminalType,
					'erpCode':erpCode,
					'stationId':stationId,
					'channelId':channelId,
					'hierarchyId':hierarchyId,
					'agentId':agentId,
					'terminalStatus':terminalStatus,
					'planDate':planDate,
					'province':province,
					'city':city,
					'district':district,
					'terminalAddress':terminalAddress,
					'productCategoryIds':productCategoryIds
				},
				traditional : true,
				dataType : 'JSON',

				success : function(data) {

					if (data) {
						bootbox.alert("修改成功");
					} else {
						bootbox.alert("修改失败");
					}
					loadTerminalPage($('#currentPage').val(), $('#limit').val());
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					bootbox.alert("修改失败");
				}
			});
		}
		
	}
	
	function parseShowPlanDate(){
		var terminalStatus=$('#terminalStatus').val();
		if(terminalStatus==1){
			$('#isShowPlanDate').hide();
		}else{
			$('#isShowPlanDate').show();
		}
		$('#planDate').val('');
	}
	
	function turnTerminal(){
		if($("input[name='subBox']:checked").length>0){
			var terminalIds = [];
			$("input[name='subBox']").each(function() {
				if ($(this).is(":checked")) {
					var tr = $(this).parent().parent();
					var a = tr.children();	
					
					if(a.eq(23).text()==0){
						terminalIds.push(a.eq(1).text());
					}else{
						bootbox.alert("不能选择已是正式的终端");
						return;
					}
				}
			});
			
			if (terminalIds.length > 0) {
				bootbox.confirm("你确定要这些终端转正式吗!",function(result){
				$.ajax({
					//提交数据的类型 POST GET
					type : "POST",
					//提交的网址
					url : '<%=request.getContextPath()%>/terminal/turnTerminal',
												data : {
													'terminalIds' : terminalIds
												},
												traditional : true,
												dataType : 'JSON',

												success : function(data) {

													if (data) {
														bootbox.alert("更新成功");
													} else {
														bootbox.alert("更新失败");
													}
													loadTerminalPage($(
															'#currentPage')
															.val(), $('#limit')
															.val());
												},
												error : function(
														XMLHttpRequest,
														textStatus, errorThrown) {
													alert(XMLHttpRequest.status);
													alert(XMLHttpRequest.readyState);
													alert(textStatus);
												}
											});
								})
			}
		} else if ($("input[name='subBox']:checked").length == 0) {
			bootbox.alert('请至少选择一个终端！');
		}
	}
</script>
<input type="hidden" id="currentPage" />
<input type="hidden" id="limit" />

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">终端管理</li>
	</ol>
</div>
<!--/.row-->

<!-- <div class="row">
	<div class="col-lg-12">
		 <h3 class="page-header">终端管理</h3> 
	</div>
</div> -->
<!--/.row-->
<br/>
<fieldset>
	<legend>查询条件</legend>
	<div class="will">

		<div style="text-align: center;">
			<div class="form-group">
				<label for="textfield" class="control-label col-sm-2">终端编号:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="queryTerminalCode">
				</div>
				<label for="textfield" class="control-label col-sm-2">终端名称:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="queryTerminalName">
				</div>

			</div>

			<div class="form-group">
				<label for="textfield" class="control-label col-sm-2">所属业务员:</label>
				<div class="col-sm-4">
					<select id="queryAgent" class="form-control">
						<option></option>
						<c:if test="${not empty userList}">
									<c:forEach var="user" items="${userList}">
										<option value="${user.id}">${user.username}</option>
									</c:forEach>
								</c:if>
					</select>
				</div>
				<label for="textfield" class="control-label col-sm-2">状态:</label>
				<div class="col-sm-4">
					<select id="queryTerminalStatus" class="form-control">
						<option></option>
						<option value="0">待开发</option>
						<option value="1">正式</option>
					</select>
				</div>

			</div>
			<button id="queryButton" class="btn btn-primary"
				style="margin-top: 10px;" onClick="loadTerminalPage(1,10)">查询</button>
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
						<shiro:hasPermission name="master.terminal.add">
							<button id="btn_add" type="button" class="btn btn-default"
								onclick="showAddTerminal()">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
							</button>
						</shiro:hasPermission>
						<shiro:hasPermission name="master.terminal.edit">
							<button id="btn_edit" type="button" class="btn btn-default"
								onclick="showEditTerminal()">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
							</button>
						</shiro:hasPermission>
						<shiro:hasPermission name="master.terminal.delete">
							<button id="btn_delete" type="button" class="btn btn-default"
								onclick="delTerminal()">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
							</button>
						</shiro:hasPermission>
						<shiro:hasPermission name="master.terminal.turnformal">
							<button id="btn_delete" type="button" class="btn btn-default"
								onclick="turnTerminal()">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>转正式
							</button>
						</shiro:hasPermission>
					</div>
					<br /> <br />
					<shiro:hasPermission name="master.terminal.query">
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
<!--/.row-->


<!--------------------------------------------------修改备注对话框------------------------------------------------------->
<div id="modal-terminalComment" class="modal fade" role="dialog"
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
						<label for="textfield" class="control-label col-sm-2">终端编号:</label>
						<div class="col-sm-4">
							<label id="terminalId"></label>
						</div>
						<label for="textfield" class="control-label col-sm-2">终端名称:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="terminalName">
						</div>
					</div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">是否个人客户:</label>
						<div class="col-sm-4">
							<select id="terminalType" class="form-control">
								<option></option>
								<option value="0">个人</option>
								<option value="1">非个人</option>
							</select>
						</div>
						<label for="textfield" class="control-label col-sm-2">ERP编号:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="erpCode">
						</div>
					</div>

					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">所属岗位:</label>
						<div class="col-sm-4">
							<select id="stationId" class="form-control">
								<option></option>
								<c:if test="${not empty stationList}">
									<c:forEach var="station" items="${stationList}">
										<option value="${station.stationCode}">${station.stationName}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<label for="textfield" class="control-label col-sm-2">所属渠道:</label>
						<div class="col-sm-4">
							<select id="channelId" class="form-control">
								<option></option>
								<c:if test="${not empty channelList}">
									<c:forEach var="channel" items="${channelList}">
										<option value="${channel.channelId}">${channel.channelName}</option>
									</c:forEach>
								</c:if>
							</select>

						</div>
					</div>


					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">所属体系:</label>
						<div class="col-sm-4">
							<select id="hierarchyId" class="form-control">
								<option></option>
								<c:if test="${not empty hierarchyList}">
									<c:forEach var="hierarchy" items="${hierarchyList}">
										<option value="${hierarchy.hierarchyId}">${hierarchy.hierarchyName}</option>
									</c:forEach>
								</c:if>
							</select>

						</div>
						<label for="textfield" class="control-label col-sm-2">所属经销商:</label>
						<div class="col-sm-4">
							<select id="agentId" class="form-control">
								<option></option>
								<c:if test="${not empty hierarchyList}">
									<c:forEach var="agent" items="${agentList}">
										<option value="${agent.agentId}">${agent.agentId}-${agent.agentName}</option>
									</c:forEach>
								</c:if>
							</select>

						</div>
					</div>

					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">是否列入开发计划:</label>
						<div class="col-sm-4">
							<select id="terminalStatus" class="form-control"
								onchange="parseShowPlanDate()">
								<option></option>
								<option value="0">待开发</option>
								<option value="1">正式</option>
							</select>
						</div>
						<div id="isShowPlanDate">
							<label for="textfield" class="control-label col-sm-2">计划开发时间:</label>
							<div class="col-md-4">
								<div class="input-group date form_datetime col-md-15"
									data-link-field="dtp_input1">
									<input class="form-control" type="text" value="" readonly
										id="planDate"> <span class="input-group-addon"><span
										class="glyphicon glyphicon-remove"></span></span> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-th"></span></span>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">地区:</label>
						<div class="col-sm-10">
							<jsp:include page="../common/address.jsp" />
						</div>
					</div>

					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">地址:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="terminalAddress">
						</div>
					</div>

					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">主营产品组:</label>
						<div class="col-sm-4">
							<c:if test="${not empty productCategoryList}">
								<c:forEach var="productCategory" items="${productCategoryList}">
									<label class="checkbox"> <input type="checkbox"
										value="${productCategory.id}" name="productCategoryId">${productCategory.name}
									</label>
								</c:forEach>
							</c:if>

						</div>
					</div>
				</div>
			</div>

			<!-- /.modal-body -->
			<div class="modal-footer">
				<button id="addBtn" type="button" class="btn btn-primary"
					onclick='addTerminal()'>新增</button>
				<button id="editBtn" type="button" class="btn btn-primary"
					onclick='return editTerminal()'>修改</button>
				<button id="delBtn" type="button" class="btn btn-primary"
					data-dismiss="modal">取 消</button>
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<script type="text/javascript">
	$('.form_datetime').datetimepicker({
		format : 'yyyy-mm-dd hh:ii:ss',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		forceParse : 0,
		showMeridian : 1
	});
</script>