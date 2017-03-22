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
		loadTerminalFlowPage(1, 10);
		$("#queryBtn").click(function(){
			loadTerminalFlowPage(1, 10);
		});
	});
	
	function importExcel(){
		$('#modalTitle1').text('批量导入');
		$("#modal-importExcel").modal("show");
	}
	
	function loadTerminalFlowPage(currentPage, limit) {
		var planYear=$("#cplanYear").val();
        var planMonth=$("#cplanMonth").val();
        var terminalId=$("#cterminalId").val();
        var terminalName=$("#cterminalName").val();
		//先销毁表格  
        $('#table').bootstrapTable('destroy'); 
        $("#table").bootstrapTable({
        	method: "get",  //使用get请求到服务器获取数据  
        	contentType: "application/x-www-form-urlencoded",
        	dataType: "json",
            url: '<%=request.getContextPath()%>/terminal/terminalFlowPage', //获取数据的Servlet地址  
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
                  terminalId:terminalId,
                  terminalName:terminalName
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
                field: 'terminalFlowId',
                align: 'center',
                title: '终端流向计划编号',
            },{
                field: 'terminal',
                align: 'center',
                title: '终端编号',
                formatter: function (value, row, index) {
                	return value.terminalId;
                }
            }, {
                field: 'terminal',
                align: 'center',
                title: '终端名称',
                formatter: function (value, row, index) {
                	return value.terminalName;
                }
            }, {
                field: 'agent',
                title: '经销商编号',
                class:"hidden",
                formatter: function (value, row, index) {
                	return value.agentId;
                }
            }, {
                field: 'agent',
                align: 'center',
                title: '所属经销商',
                formatter: function (value, row, index) {
                	return value.agentName;
                }
            }, {
                field: 'terminalFlowDate',
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
	        	var terminalFlowDate = new Date(parseInt(row.terminalFlowDate)).Format('yyyy-MM');
	        	window.location.href='<%=request.getContextPath()%>/terminal/goToTerFlowItemPage?terminalId='+row.terminal.terminalId+'&terminalName='+encodeURI(encodeURI(row.terminal.terminalName))+'&terminalFlowId='+row.terminalFlowId+'&terminalFlowDate='+terminalFlowDate; 
	            console.log('You click like action, row: ' + JSON.stringify(row));
	        }
	    };
	
	function delTerminalFlow() {
		var terminalFlowIds = [];
		$("input[name='subBox']").each(function() {
			if ($(this).is(":checked")) {

				var tr = $(this).parent().parent();
				var a = tr.children();

				terminalFlowIds.push(a.eq(1).text());
			}
		});

		if (terminalFlowIds.length > 0) {
			bootbox.confirm("你确定要删除终端流向吗!",function(result){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : '<%=request.getContextPath()%>/terminal/delTerminalFlow',
				data : {
					'terminalFlowIds' : terminalFlowIds
				},
				traditional : true,
				dataType : 'JSON',
				success : function(data) {
					if (data) {
						bootbox.alert("删除成功");
					} else {
						bootbox.alert("删除失败");
					}
					loadTerminalFlowPage($('#currentPage').val(), $('#limit').val());
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					bootbox.alert("删除失败");
				}
			});
			});
		} else {
			bootbox.alert('请选择具体终端流向后删除');
		}

	}
	
	function showAddTerminalFlow() {
		
		//window.location.href="/deepureFlow/jsp/login.jsp"
		$('#terminalName').val('');
		$('#terminalType').val('');
		
		$('#addBtn').show();
		$('#editBtn').hide();
		
		$('#modalTitle').text('新增终端产品流向');
		$("#modal-terminalFlowComment").modal("show");
	}
	
	function showEditTerminalFlow(){	
		if($("input[name='subBox']:checked").length==1){
			$("input[name='subBox']").each(function() {
				if ($(this).is(":checked")) {
					
					var tr = $(this).parent().parent();
					var a = tr.children();	
					
					var terminalFlowId = a.eq(1).text();
					var terminalId = a.eq(2).text();
					var terminalName = a.eq(3).text();
					var planMonth = a.eq(6).text();
					
					window.location.href='<%=request.getContextPath()%>/terminal/editTerminalFlowPage?terminalId='+terminalId+'&terminalName='+encodeURI(encodeURI(terminalName))+'&planMonth='+planMonth+'&terminalFlowId='+terminalFlowId;
					
				}
			});
		}else if($("input[name='subBox']:checked").length==0){
			bootbox.alert('请至少选择一个终端产品流向！');
		}else{
			bootbox.alert('不可以选择多个终端产品流向！');
		}
	}
	
	<%-- //新增终端销售计划

	
	
	
	function editTerminalSalePlan(){
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
	/**
     * 显示上传文件名称
     * @param fileObj
     */
    function selectUploadFile(fileObj){
        var fullPath = $(fileObj).val();
        alert(fullPath);
        var index = fullPath.lastIndexOf('\\') + 1;
        var fileName = fullPath.substring(index);
        $('input[name="upload_filename"]').val(fileName);
    }


	/**
	 * 上传文件
	 */

  $('#btn_upSubmit').click(function(){
     var valid = uploadValidator.checkForm(); //检测传单内容输入是否有问题
        if(!valid){ 
            uploadValidator.showErrors();
        } else{ //检测成功
           // $('#uploadTxt').text('');  
            //$('#loadingImg').show();  //按钮换成动画效果图片
			/** 准备参数： */
            var password = hex_md5('123456');//  默认密码 进行加密 
            //var param = {password: password};  //ajax传输 携带json详细信息
            var url = '<%=request.getContextPath()%>/terminal/importExcel';  //   /** 使用ajaxFileUpload */
		    $.ajaxFileUpload({
		        url: url, //用于文件上传的服务器端请求地址
		        secureuri: false, //是否需要安全协议，一般设置为false
		        fileElementId: 'upload_file', //文件上传域的ID  就是选定文件的 type=file的input框的id  ajaxFileUpload 会帮我们把他分装到ajax请求的 携带对象域中去
		        dataType: 'json', //返回值类型 一般设置为json
		        type: 'post',
		        data: param,
		        success:function(){
		        //成功的success 回调方法等业务流程结束后再写
		        //先留已空白
		        	alert("成功！");
		        }
		    })
        }
  });
	 --%>
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
<br/>
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
				<label for="cterminalId" class="control-label col-sm-2">终端名称：</label>
				<div class="col-sm-4">
					<input type="text" name="terminalName" class="form-control"
						id="cterminalName" value="" />
				</div>
			</div>
			<div class="form-group">
				<label for="cplanYear" class="control-label col-sm-2">计划年份：</label>
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
				<label for="cplanMonth" class="control-label col-sm-2">计划月份：</label>
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
				<!-- 	<div class="panel-heading">Advanced Table</div> -->
				<div class="panel-body">
					<div id="toolbar1" class="btn-group">
						<shiro:hasPermission name="master.terminal.add">
							<%-- <form action="<%=request.getContextPath()%>/terminal/toConditionPage" method="POST"> --%>
							<button id="btn_add" type="button" class="btn btn-default"
								onclick="showAddTerminalFlow()">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
							</button>
							<!-- </form> -->
						</shiro:hasPermission>
						<shiro:hasPermission name="master.terminal.edit">
							<button id="btn_edit" type="button" class="btn btn-default"
								onclick="showEditTerminalFlow()">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
							</button>
						</shiro:hasPermission>
						<shiro:hasPermission name="master.terminal.delete">
							<button id="btn_delete" type="button" class="btn btn-default"
								onclick="delTerminalFlow()">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
							</button>
						</shiro:hasPermission>
						<button id="btn_delete" type="button" class="btn btn-default" onClick='importExcel()'>
							<span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>导入模板
						</button>
						<%-- <shiro:hasPermission name="master.terminal.turnformal">
					<button id="btn_delete" type="button" class="btn btn-default" onclick="turnTerminal()">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>转正式
					</button>
					</shiro:hasPermission> --%>
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
<div id="modal-terminalFlowComment" class="modal fade" role="dialog"
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
							<select id="terminal" class="form-control">
							<option value="-1">请选择</option>
							<c:if test="${not empty terminalList}">
								<c:forEach var="terminal" items="${terminalList}">
									 <option value="${terminal.terminalId}">${terminal.erpCode}-${terminal.terminalName}</option>
								</c:forEach>
							</c:if>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-4">计划月份:</label>
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
					<!--  选择上传文件按钮   type类型指定为 file   accept 可以在浏览过程中 进行过滤显示   支持多个用逗号隔开  -->
					<!-- 选择文件后显示文件名称  对更改事件绑定了事件监听器 selectUploadFile(this)   此框按钮id为: upload_file    -->
					<!--  <input type="file" id="upload_file"
						onchange="selectUploadFile(this)" name="uploadFile"
						accept=".xls,.xlsx" class="input-fzliulan">  -->
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
	var terminalId=$('#terminal').val();
	var planMonth=$('#planMonth').val();
	
	if(terminalId==null||terminalId=='-1'){
		bootbox.alert("请选择终端"); 
		$('#terminal').focus();
		return false;
	}
	
	if(planMonth==null||planMonth==''){
		bootbox.alert("请选择计划月份"); 
		$('#planMonth').focus();
		return false;
	}
	
	return true;
}
function goToNext(){
	
	var terminalId = $('#terminal').val();
	var terminalName =  $("#terminal").find("option:selected").text();
	var planMonth = $('#planMonth').val();
	if(validateParam()){
		//$("#modal-terminalSalePlanComment").modal("hide");
		window.location.href='<%=request.getContextPath()%>/terminal/addTerminalFlowPage?terminalId='+terminalId+'&terminalName='+encodeURI(encodeURI(terminalName))+'&planMonth='+planMonth;
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