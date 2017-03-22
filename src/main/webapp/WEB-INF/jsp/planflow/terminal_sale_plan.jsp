<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
td {
	vertical-align: middle;
	text-align: center;
}
</style>
<script src="<%=request.getContextPath()%>/js/common/address.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		loadTerminalSalePlanPage(1, 10);
		$("#queryBtn").click(function(){
			loadTerminalSalePlanPage(1, 10);
		});
		
		document.onkeydown=function(event){ 
	        var e = event || window.event || arguments.callee.caller.arguments[0]; 
	         if(e && e.keyCode==13){ // enter 键 
				$("#queryBtn").trigger("click");
	         };
		}
		
		/**
		 * 上传文件
		 */
	  $('#btn_upSubmit').click(function(){
	            var url = '<%=request.getContextPath()%>/terminal/importSalePlanExcel';  //   /** 使用ajaxFileUpload */
			    $.ajaxFileUpload({
			        url: url, //用于文件上传的服务器端请求地址
			        secureuri: false, //是否需要安全协议，一般设置为false
			        fileElementId: 'upload_file', //文件上传域的ID  就是选定文件的 type=file的input框的id  ajaxFileUpload 会帮我们把他分装到ajax请求的 携带对象域中去
			        dataType: 'json', //返回值类型 一般设置为json
			        type: 'post',
			        success:function(data){
			        	if (data.status) {
			        		bootbox.alert(data.msg);
			        		$("#modal-importExcel").modal("hide");
			        		loadTerminalSalePlanPage($('#currentPage').val(), $('#limit').val());	
						} else {
							bootbox.alert(data.msg);
						}
			        },
			        error:function(data, status, e){ //服务器响应失败时的处理函数
			        	bootbox.alert(ERROR_MSG);
					}
			    });
	  });
	});
	
	function importExcel(){
		$('#modalTitle1').text('批量导入销售计划');
		$("#modal-importExcel").modal("show");
	}
	
	function loadTerminalSalePlanPage(currentPage, limit) {
		var planYear=$("#cplanYear").val();
        var agentId=$("#cagentId").val();
        var terminalId=$("#cterminalId").val().trim();
        var zoneId=$("#czoneId").val();
        var planMonth=$("#cplanMonth").val();
        var stationId=$("#cstationId").val();
        /* if(zoneId==null){
        	zoneId="-1";
        }
        if(stationId==null){
        	stationId="-1";
        }
        if(agentId==null){
        	agentId="-1";
        } */
		//先销毁表格  
        $('#table').bootstrapTable('destroy'); 
        $("#table").bootstrapTable({
        	method: "post",  //使用get请求到服务器获取数据  
        	contentType: "application/x-www-form-urlencoded",
        	dataType: "json",
            url: '<%=request.getContextPath()%>/terminal/terminalSalePlanPage', //获取数据的Servlet地址  
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
                  agentId:agentId,
                  terminalId:terminalId,
                  zoneCode:zoneId,
                  planMonth:planMonth,
                  stationCode:stationId
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
                field: 'salePlanId',
                align: 'center',
                title: '销售计划编号',
            }, {
                field: 'totalPrice',
                align: 'center',
                title: '计划总额',
                formatter: function (value, row, index) {
                	if(value==null){
                		return "无";
                	}
                	return value+"元";
                }
            }, {
                field: 'terminal',
                align: 'center',
                title: '终端编号',
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	
                	if(value.isDelete==1){
                		return "<font color='red'>"+value.terminalId+"</font>";
                	}
                	return value.terminalId;
                }
            }, {
                field: 'terminal',
                align: 'center',
                title: '终端名称',
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}                	
                	
                	if(value.isDelete==1){
                		return "<font color='red'>"+value.terminalName+"</font>";
                	}
                	return value.terminalName;
                }
            }, {
                field: 'agent',
                title: '经销商编号',
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	return value.agentId;
                }
            }, {
                field: 'agent',
                align: 'center',
                title: '所属经销商',
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
                field: 'station',
                title: '岗位编号',
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	return value.stationId;
                }
            }, {
                field: 'station',
                align: 'center',
                title: '所属岗位',
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	
                	if(value.isDelete==1){
                		return "<font color='red'>"+value.stationName+"</font>";
                	}
                	return value.stationName;
                }
               
            }, {
                field: 'salePlanDate',
                align: 'center',
                title: '计划时间',
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
                	return  new Date(parseInt(value)).Format('yyyy.MM.dd');
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
	        	var salePlanDate = new Date(parseInt(row.salePlanDate)).Format('yyyy-MM');
	        	if(row.terminal==null){
	        		window.location.href='<%=request.getContextPath()%>/terminal/goToSalePlanItemPage?terminalId='+'无'+'&terminalName='+'无'+'&salePlanId='+row.salePlanId+'&salePlanDate='+salePlanDate;
	        	}else{
	        		window.location.href='<%=request.getContextPath()%>/terminal/goToSalePlanItemPage?terminalId='+row.terminal.terminalId+'&terminalName='+encodeURI(encodeURI(row.terminal.terminalName))+'&salePlanId='+row.salePlanId+'&salePlanDate='+salePlanDate;	
	        	}
	        	
	        	 
	            console.log('You click like action, row: ' + JSON.stringify(row));
	        }
	    };
	//新增终端销售计划
	function showAddTerminalSalePlan() {
		
		//window.location.href="/deepureFlow/jsp/login.jsp"
		$('#terminalName').val('');
		$('#terminalType').val('');
		
		$('#addBtn').show();
		$('#editBtn').hide();
		
		$('#modalTitle').text('新增终端销售计划');
		$("#modal-terminalSalePlanComment").modal("show");
	}
	
	function delSalePlan() {
		var salePlanIds = [];
		$("input[name='subBox']").each(function() {
			if ($(this).is(":checked")) {

				var tr = $(this).parent().parent();
				var a = tr.children();

				salePlanIds.push(a.eq(1).text());
			}
		});

		if (salePlanIds.length > 0) {
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
		        message: '你确定要删除销售计划吗?!',  
		        callback: function(result) {  
		            if(result) {  
		            	$.ajax({
		    				//提交数据的类型 POST GET
		    				type : "POST",
		    				//提交的网址
		    				url : '<%=request.getContextPath()%>/terminal/delSalePlan',
		    				data : {
		    					'salePlanIds' : salePlanIds
		    				},
		    				traditional : true,
		    				dataType : 'JSON',
		    				success : function(data) {
		    					if (data.status) {
		    						bootbox.alert(data.msg);
		    						loadTerminalSalePlanPage($('#currentPage').val(), $('#limit').val());
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
			bootbox.alert('请选择具体销售计划后删除');
		}

	}
	
	function showEditSalePlan(){	
		if($("input[name='subBox']:checked").length==1){
			$("input[name='subBox']").each(function() {
				if ($(this).is(":checked")) {
					
					var tr = $(this).parent().parent();
					var a = tr.children();	
					
					var salePlanId = a.eq(1).text();
					var terminalId = a.eq(3).text();
					var terminalName = a.eq(4).text();
					var planMonth = a.eq(9).text();
					
					window.location.href='<%=request.getContextPath()%>/terminal/editTerminalSalePlanPage?terminalId='+terminalId+'&terminalName='+encodeURI(encodeURI(terminalName))+'&planMonth='+planMonth+'&salePlanId='+salePlanId;
					
				}
			});
		}else if($("input[name='subBox']:checked").length==0){
			bootbox.alert('请至少选择一个终端销售计划！');
		}else{
			bootbox.alert('不可以选择多个终端销售计划！');
		}
	}
	
	/**
     * 显示上传文件名称
     * @param fileObj
     */
    function selectUploadFile(fileObj){
        var fullPath = $(fileObj).val();
        //alert(fullPath);
        var index = fullPath.lastIndexOf('\\') + 1;
        var fileName = fullPath.substring(index);
        $('input[name="upload_filename"]').val(fullPath);
    }


	
	
</script>
<input type="hidden" id="currentPage" />
<input type="hidden" id="limit" />

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">终端销售计划管理</li>
	</ol>
</div>
<!--/.row-->

<!-- <div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">终端销售计划管理</h1>
	</div>
</div> -->
<!--/.row-->
<br />
<fieldset>
	<legend>查询条件</legend>
	<div class="will">
		<div style="text-align: center;">
			<div class="form-group">
				<label for="cterminalId" class="control-label col-sm-2">终端编号：</label>
				<div class="col-sm-4">
					<input type="text" name="terminalId" class="form-control"
						id="cterminalId" value="" />
				</div>

				<label for="cagentId" class="control-label col-sm-2">所属经销商：</label>
				<div class="col-sm-4">
					<select class="form-control combobox" name="agentId" id="cagentId">
						<option></option>
						<c:if test="${not empty agentList}">
							<c:forEach var="agent" items="${agentList}">
								<option value="${agent.agentId}">${agent.agentName}</option>
							</c:forEach>
						</c:if>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="cstationId" class="control-label col-sm-2">所属岗位：</label>
				<div class="col-sm-4">
					<select class="form-control combobox" name="stationId" id="cstationId">
						<option></option>
						<c:if test="${not empty stationList}">
							<c:forEach var="station" items="${stationList}">
								<option value="${station.stationCode}">${station.stationName}</option>
							</c:forEach>
						</c:if>
					</select>
				</div>
				<label for="czoneId" class="control-label col-sm-2">所属大区：</label>
				<div class="col-sm-4">
					<select class="form-control combobox" name="zoneId" id="czoneId">
						<option></option>
						<c:if test="${not empty zoneList}">
							<c:forEach var="zone" items="${zoneList}">
								<option value="${zone.zoneCode}">${zone.zoneName}</option>
							</c:forEach>
						</c:if>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="cplanYear" class="control-label col-sm-2">计划年份：</label>
				<div class="col-sm-4">
					<!-- <input class="form-control" type="text" value="" id="cplanYear"
						readonly> -->
					<div class="input-group date form_datetime col-md-15"
						data-link-field="dtp_input1">
						<input class="form-control" type="text" value="" readonly
							id="cplanYear"> <span class="input-group-addon"><span
							class="glyphicon glyphicon-remove"></span></span> <span
							class="input-group-addon"><span
							class="glyphicon glyphicon-calendar"></span></span>
					</div>
				</div>
				<label for="cplanMonth" class="control-label col-sm-2">计划月份：</label>
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
			<button id="queryBtn" class="btn btn-primary"
				style="margin-top: 10px;width:100px;" onClick="loadTerminalSalePlanPage(1,10)" >查询</button>
		</div>
	</div>
</fieldset>
<fieldset>
	<legend>查询内容</legend>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<c:if test="${zonePlanStatus=='1'}">
						<div id="toolbar1" class="btn-group">
							<shiro:hasPermission name="planflow.terminalsale.add">
								<%-- <form action="<%=request.getContextPath()%>/terminal/toConditionPage" method="POST"> --%>
								<button id="btn_add" type="button" class="btn btn-default"
									onclick="showAddTerminalSalePlan()">
									<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
								</button>
								<!-- </form> -->
							</shiro:hasPermission>
							<shiro:hasPermission name="planflow.terminalsale.edit">
								<button id="btn_edit" type="button" class="btn btn-default"
									onclick="showEditSalePlan()">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
								</button>
							</shiro:hasPermission>
							<shiro:hasPermission name="planflow.terminalsale.delete">
								<button id="btn_delete" type="button" class="btn btn-default"
									onclick="delSalePlan()">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
								</button>
							</shiro:hasPermission>
							<shiro:hasPermission name="planflow.terminalsale.import">
							<button id="btn_import" type="button" class="btn btn-default"
								onClick='importExcel()'>
								<span class="glyphicon glyphicon-open" aria-hidden="true"></span>导入
							</button>
							<br /> <br />
							</shiro:hasPermission>
							<%-- <shiro:hasPermission name="planflow.terminalsale.export">
								<button id="btn_export" type="button" class="btn btn-default"
									onClick='exportExcel()'>
									<span class="glyphicon glyphicon-save" aria-hidden="true"></span>导出模板
								</button>
								
							</shiro:hasPermission> --%>
						</div>
					
					</c:if>
					<shiro:hasPermission name="planflow.terminalsale.query">
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


<!--------------------------------------------------新增终端销售计划第一步------------------------------------------------------->
<div id="modal-terminalSalePlanComment" class="modal fade" role="dialog"
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
						<label for="textfield" class="control-label col-sm-4">终端:</label>
						<div class="col-sm-4">
							<select id="terminal" class="form-control combobox">
								<option></option>
								<c:if test="${not empty terminalList}">
									<c:forEach var="terminal" items="${terminalList}">
									<%-- <c:choose> 
										  <c:when test="${empty terminal.erpCode}">   
										   <option value="${terminal.terminalId}">${terminal.terminalName}</option>
										  </c:when> 
										  <c:otherwise>   
										   <option value="${terminal.terminalId}">${terminal.erpCode}-${terminal.terminalName}</option>
										  </c:otherwise> 
										</c:choose> --%>
										<option value="${terminal.terminalId}" val="${terminal.terminalName}">${terminal.terminalId}-${terminal.terminalName}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="planMonth" class="control-label col-sm-4">计划月份:</label>
						<div class="col-md-4">
							<!-- <input class="form-control" type="text" value="" id="planMonth" readonly> -->
							<div class="input-group date form_datetime1 col-md-15"
								data-link-field="dtp_input1">
								<input class="form-control" type="text" value="" readonly
									id="planMonth"> <span class="input-group-addon"><span
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
				<button id="nextBtn" type="button" class="btn btn-primary"
					onclick="goToNext()">下一步</button>
				<button id="delBtn" type="button" class="btn btn-primary"
					data-dismiss="modal">取消</button>
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
				<div class="input-group">
					<input type="file" id="upload_file"
						onchange="selectUploadFile(this)" name="uploadFile"
						accept=".xls,.xlsx" class="input-fzliulan"> <input
						type="hidden" name="upload_filename">
				</div>
				<!--  选择上传文件按钮   type类型指定为 file   accept 可以在浏览过程中 进行过滤显示   支持多个用逗号隔开  -->
				<!-- 选择文件后显示文件名称  对更改事件绑定了事件监听器 selectUploadFile(this)   此框按钮id为: upload_file    -->
				<!--  <input type="file" id="upload_file"
						onchange="selectUploadFile(this)" name="uploadFile"
						accept=".xls,.xlsx" class="input-fzliulan">  -->
			</div>
			<div class="modal-footer">
				<button type="button" id="btn_upSubmit"
					class="btn btn-success pdlr16">
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

<script type="text/javascript">

	function validateParam(){
		var terminalId=$('#terminal').val();
		var planMonth=$('#planMonth').val()+"-01";
		var planDate=new Date(planMonth.replace(/-/g,"/"));
		var nowDate = new Date();
	
		var flag = true;
		
		if(terminalId==null||terminalId=='-1'||terminalId==''){
			bootbox.alert("请选择终端"); 
			$('#terminal').focus();
			return false;
		}
		
		if(planMonth==null||planMonth==''||planMonth=='-01'){
			bootbox.alert("请选择计划月份"); 
			$('#planMonth').focus();
			return false;
		}
		if(planDate.getFullYear()==nowDate.getFullYear()){
			if(planDate.getMonth()<nowDate.getMonth()+1){
				bootbox.alert("计划月份不能早于当前月份");
				return false;
			}
		}else if(planDate.getFullYear()<nowDate.getFullYear()){
			bootbox.alert("计划月份不能早于当前月份");
		}
		$.ajax({
			type : "POST",
			url : '<%=request.getContextPath()%>/terminal/validateAddSalePlan',
			async:false,
			data : {
				'terminalId' : terminalId,
				'planMonth' : planMonth,
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
	function exportExcel(){
		$.ajax({
			type : "POST",
			url : '<%=request.getContextPath()%>/terminal/exportSalePlanExcel',
			async:false,
			success : function(data) {
				if (data.status) {
					bootbox.alert(data.msg);
				}else{
					bootbox.alert(data.msg);
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				bootbox.alert(ERROR_MSG);
			}
		});
	}
	function goToNext(){
		
		var terminalId = $('#terminal').val();
		var terminalName =  $("#terminal").find("option:selected").attr("val");
		var planMonth = $('#planMonth').val();
		if(validateParam()){
			window.location.href='<%=request.getContextPath()%>/terminal/addTerminalSalePlanPage?terminalId='
						+ terminalId
						+ '&terminalName='
						+ encodeURI(encodeURI(terminalName))
						+ '&planMonth='
						+ planMonth;
		}
	}
	$('.form_datetime1').datetimepicker({
		language:"zh-CN",
		format : 'yyyy-mm',
		//todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 3,
		minView : 3,
		startDate:new Date()
		//startDate:DateAdd( "m",3, new Date())
	});
	$('.form_datetime').datetimepicker({
		language:"zh-CN",
		format : 'yyyy年',
		//todayBtn : 1,
		startView : 4,
		minView : 4,
		autoclose: 1
	});
	/* $('#cplanMonth').datetimepicker({
		language:"zh-CN",
		format : 'mm月',
		weekStart : 1,
		//todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 3,
		minView : 3,
		forceParse : 0,
		showMeridian : 1
	}); */
</script>