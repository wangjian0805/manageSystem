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
	
	document.onkeydown=function(event){ 
        var e = event || window.event || arguments.callee.caller.arguments[0]; 
         if(e && e.keyCode==13){ // enter 键 
			$("#queryBtn").trigger("click");
         };
	}
	
	function importExcel(){
		$('#modalTitle1').text('批量导入');
		$("#modal-importExcel").modal("show");
	}
	
	function loadTerminalFlowPage(currentPage, limit) {
		var planYear=$("#cplanYear").val().trim();
        var planMonth=$("#cplanMonth").val().trim();
        var terminalId=$("#cterminalId").val().trim();
        var terminalName=$("#cterminalName").val().trim();
		//先销毁表格  
        $('#table').bootstrapTable('destroy'); 
        $("#table").bootstrapTable({
        	method: "post",  //使用get请求到服务器获取数据  
        	contentType: "application/x-www-form-urlencoded",
        	dataType: "json",
            url: '<%=request.getContextPath()%>/terminal/terminalFlowPage', //获取数据的Servlet地址  
            striped: true,  //表格显示条纹  
            pagination: true, //启动分页  
            pageSize: limit,  //每页显示的记录数  
            pageNumber:currentPage, //当前第几页  
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
                title: '终端产品流向编号',
            },{
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
		        message: '你确定要删除终端流向吗?!',  
		        callback: function(result) {  
		            if(result) {  
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
		    					if (data.status) {
		    						bootbox.alert(data.msg);
		    						loadTerminalFlowPage($('#currentPage').val(), $('#limit').val());
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
					var planMonth = a.eq(8).text();
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
					bootbox.alert(ERROR_MSG);
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
		<li class="active">终端产品流向管理</li>
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
					<c:if test="${zoneFlowStatus=='1'}">
					<div id="toolbar1" class="btn-group">
						<shiro:hasPermission name="planflow.terminalproduct.add">
							<%-- <form action="<%=request.getContextPath()%>/terminal/toConditionPage" method="POST"> --%>
							<button id="btn_add" type="button" class="btn btn-default"
								onclick="showAddTerminalFlow()">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
							</button>
							<!-- </form> -->
						</shiro:hasPermission>
						<shiro:hasPermission name="planflow.terminalproduct.edit">
							<button id="btn_edit" type="button" class="btn btn-default"
								onclick="showEditTerminalFlow()">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
							</button>
						</shiro:hasPermission>
						<shiro:hasPermission name="planflow.terminalproduct.delete">
							<button id="btn_delete" type="button" class="btn btn-default"
								onclick="delTerminalFlow()">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
							</button>
							<br /> <br />
						</shiro:hasPermission>
						<!-- <button id="btn_delete" type="button" class="btn btn-default" onClick='importExcel()'>
							<span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>导入模板
						</button> -->
					</div>
					
					</c:if>
					<shiro:hasPermission name="planflow.terminalproduct.query">
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


<!--------------------------------------------------新增终端产品流向第一步------------------------------------------------------->
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
		if(planDate.getMonth()<nowDate.getMonth()){
			bootbox.alert("数据月份不能早于当前月份");
			return false;
		}
	}else if(planDate.getFullYear()<nowDate.getFullYear()){
		bootbox.alert("数据月份不能早于当前月份");
	}
	$.ajax({
		type : "POST",
		url : '<%=request.getContextPath()%>/terminal/validateAddTerminalFlow',
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
function goToNext(){
	
	var terminalId = $('#terminal').val();
	var terminalName =  $("#terminal").find("option:selected").attr("val");
	var planMonth = $('#planMonth').val();
	if(validateParam()){
		//$("#modal-terminalSalePlanComment").modal("hide");
		window.location.href='<%=request.getContextPath()%>/terminal/addTerminalFlowPage?terminalId='+terminalId+'&terminalName='+encodeURI(encodeURI(terminalName))+'&planMonth='+planMonth;
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
	format : 'yyyy',
	//todayBtn : 1,
	startView : 4,
	minView : 4,
	autoclose: 1
	
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