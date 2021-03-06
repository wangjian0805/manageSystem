<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() { 
		loadChannelPage(1, 10);
	});
	
	document.onkeydown=function(event){ 
        var e = event || window.event || arguments.callee.caller.arguments[0]; 
         if(e && e.keyCode==13){ // enter 键 
			$("#queryButton").trigger("click");
         };
	}
	
	function loadChannelPage(currentPage, limit) {
		var channelName = $("input[name='channelName']").val().trim();
		//先销毁表格  
        $('#table').bootstrapTable('destroy'); 
        $("#table").bootstrapTable({
        	method: "get",  //使用get请求到服务器获取数据  
        	contentType: "application/x-www-form-urlencoded",
        	dataType: "json",
            url: '<%=request.getContextPath()%>/channel/queryChannelByName', //获取数据的Servlet地址  
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
                  channelName:channelName
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
                field: 'channelId',
                title: '渠道编号'
            }, {
                field: 'channelName',
                title: '渠道名称'
            }, {
                field: 'hierarchy',
                title: '体系编号',
               /*  visible: true, */
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value==null){
                		return 'null';
                	}
                	return value.hierarchyId;
                }
            }, {
                field: 'hierarchy',
                title: '体系名称',
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	return value.hierarchyName;
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
	
	function showAddChannel() {
		$("#channelName").attr("disabled",true);
		$("#channelNameError").text('');
		$('#channelName').val('');
		$('#hierarchyId').val('');
		$('#addBtn').show();
		$('#editBtn').hide();
		$('#modalTitle').text('新增渠道');
		$("#modal-modifyComment").modal("show");
	}
	
	function addChannel(){
		var channelName=$('#channelName').val();
		var hierarchyId=$('#hierarchyId').val();
		
		var isAdd=true;
		
		if(channelName==null||channelName==''){
			bootbox.alert("渠道名称不能为空");
			$('#channelName').focus();
			isAdd=false;
		}
		if(hierarchyId==null||hierarchyId==''){
			bootbox.alert("体系不能为空");
			$('#hierarchyId').focus();
			isAdd=false;
		}
		
		if(isAdd&&validateName()){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : '<%=request.getContextPath()%>/channel/addChannel',
				data : {
					'channelName' : channelName,
					'hierarchyId' : hierarchyId
				},
				traditional : true,
				dataType : 'JSON',

				success : function(data) {

					if (data.status) {
						bootbox.alert(data.msg);
					} else {
						bootbox.alert(data.msg);
					}
					loadChannelPage($('#currentPage').val(), $('#limit').val());
					$("#modal-modifyComment").modal("hide");
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					bootbox.alert(ERROR_MSG)
				}
			});
		}
		
	}
	
	function validateName(){
		var flag = true;
		var channelName=$('#channelName').val();
		var channelId=$('#channelId').val();
		var hierarchyId=$('#hierarchyId').val();
		if(channelName.trim()==null||channelName.trim()==''){
			$("#channelNameError").text("渠道名称不能为空");
			flag = false;
			return false;
		}else{
			$("#channelNameError").text("");
			flag = true;
		}
		 if(hierarchyId==null||hierarchyId.trim()==''){
			$("#hierarchyNameError").text("请先选择体系");
			flag = false;
			return false;
		}else{
			$("#hierarchyNameError").text("");
			flag = true;
		}
		$.ajax({
			type : "POST",
			url : '<%=request.getContextPath()%>/channel/validateName',
			data : {
				'channelName' : channelName,
				'channelId':channelId,
				'hierarchyId':hierarchyId
			},
			async:false,
			success : function(data) {
				if (data.status) { 
					flag = true;
				}else{
					$("#channelNameError").text(data.msg);
					flag = false;
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				bootbox.alert(ERROR_MSG)
			}
		});
		return flag;
	}

	function delChannel() {
		var channelList = [];
		$("input[name='subBox']").each(function() {
			if ($(this).is(":checked")) {

				var tr = $(this).parent().parent();
				var a = tr.children();

				channelList.push(a.eq(1).text());
			}
		});
		console.log(channelList);
		if (channelList.length > 0) {
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
		        message: '你确定要删除渠道吗?!',  
		        callback: function(result) {  
		            if(result) {  
		            	$.ajax({
		    				//提交数据的类型 POST GET
		    				type : "POST",
		    				//提交的网址
		    				url : '<%=request.getContextPath()%>/channel/delChannel',
		    				data : {
		    					'channelList' : channelList
		    				},
		    				traditional : true,
		    				dataType : 'JSON',

		    				success : function(data) {

		    					if (data.status) {
		    						bootbox.alert(data.msg);
		    					} else {
		    						bootbox.alert(data.msg);
		    					}
		    					loadChannelPage($('#currentPage').val(), $('#limit').val());
		    				},
		    				error : function(XMLHttpRequest, textStatus, errorThrown) {
		    					bootbox.alert(ERROR_MSG);
		    				}
		    			});
		            }  
		        },  
		        });
		} else {
			bootbox.alert('请选择具体渠道后删除');
		}

	}
	
	function showEditChannel(){
		$("#channelNameError").text('');
		$("#channelName").attr("disabled",false);
		if($("input[name='subBox']:checked").length==1){
			$("input[name='subBox']").each(function() {
				if ($(this).is(":checked")) {
					
					var tr = $(this).parent().parent();
					var a = tr.children();	
					
					$('#channelId').val(a.eq(1).text());
					$('#channelName').val(a.eq(2).text());
					$('#hierarchyId').val(a.eq(3).text());
					$('#addBtn').hide();
					$('#editBtn').show();
					$('#modalTitle').text('修改渠道');
					$("#modal-modifyComment").modal("show");
				}
			});
		}else if($("input[name='subBox']:checked").length==0){
			bootbox.alert('请至少选择一条渠道！');
		}else{
			bootbox.alert('不可以选择多条渠道！');
		}
	}
	
	function editChannel(){
		var channelId=$('#channelId').val();
		var channelName=$('#channelName').val();
		var hierarchyId=$('#hierarchyId').val();
		
		var isEdit=true;
		
		if(isEdit&&validateName()){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : '<%=request.getContextPath()%>/channel/editChannel',
						data : {
							'channelId' : channelId,
							'channelName' : channelName,
							'hierarchyId' : hierarchyId
						},
						traditional : true,
						dataType : 'JSON',

						success : function(data) {

							if (data.status) {
								bootbox.alert(data.msg);
								$("#modal-modifyComment").modal("hide");
								loadChannelPage($('#currentPage').val(),$('#limit').val());
							} else {
								bootbox.alert(data.msg);
							}
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							bootbox.alert(ERROR_MSG);
						}
					});
		}

	}
	$(function() {
		$("#hierarchyId").change(function() {
			$("#channelNameError").text('');
			$("#channelName").attr("disabled", false);
		});
	});
</script>
<input type="hidden" id="currentPage" />
<input type="hidden" id="limit" />

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">渠道列表</li>
	</ol>
</div>
<!--/.row-->
<!-- 
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">渠道列表</h1>
	</div>
</div> -->
<!--/.row-->
<br />
<fieldset>
	<legend>查询条件</legend>
	<div class="will">
           <div>
			<div class="form-group col-sm-offset-2" >
				<label for="textfield" class="control-label col-sm-2">渠道名称:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="channelName" value=""/>
				</div>
            </div>
			<button id="queryButton" class="btn btn-primary col-sm-2" onClick="loadChannelPage(1, 10)">查询</button>
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
						<shiro:hasPermission name="system.channel.add">
							<button id="btn_add" type="button" class="btn btn-default"
								onclick='showAddChannel()'>
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
							</button>
						</shiro:hasPermission>
						<shiro:hasPermission name="system.channel.edit">
							<button id="btn_edit" type="button" class="btn btn-default"
								onclick='showEditChannel()'>
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
							</button>
						</shiro:hasPermission>
						<shiro:hasPermission name="system.channel.delete">
							<button id="btn_delete" type="button" class="btn btn-default"
								onclick='delChannel()'>
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
							</button>
						</shiro:hasPermission>
					</div>
					<br /> <br />
					<shiro:hasPermission name="system.channel.query">
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
<div id="modal-modifyComment" class="modal fade" role="dialog"
	data-backdrop="static">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="modalTitle">新增渠道</h4>
			</div>
			<!-- /.modal-header -->
			<div class="modal-body">
				<div class="form-horizontal">
					<input type="hidden" class="form-control" id="channelId">
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">体系:</label>
						<div class="col-sm-4">
							<select id="hierarchyId" class="form-control">
								<c:if test="${not empty hierarchyList}">
									<c:forEach var="hierarchy" items="${hierarchyList}">
										<option value="${hierarchy.hierarchyId}">${hierarchy.hierarchyName}</option>
									</c:forEach>
								</c:if>
							</select>

						</div>
						<div class="col-sm-5">
							<div style="color: red; font-size: 15px;" id="hierarchyNameError"></div>
						</div>
						
					</div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">渠道名称:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="channelName"
								disabled="true" onblur="validateName()">
						</div>
						<div class="col-sm-5">
							<div style="color: red; font-size: 15px;" id="channelNameError"></div>
						</div>
					</div>

				</div>
			</div>

			<!-- /.modal-body -->
			<div class="modal-footer">
				<button id="addBtn" type="button" class="btn btn-primary"
					onclick='addChannel()'>确 认</button>
				<button id="editBtn" type="button" class="btn btn-primary"
					onclick='editChannel()'>修改</button>
				<button id="delBtn" type="button" class="btn btn-primary"
					data-dismiss="modal">取 消</button>
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
