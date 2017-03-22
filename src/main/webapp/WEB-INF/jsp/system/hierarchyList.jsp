<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() { 
		loadHierarchyPage(1, 10,"");
		
	});
	
	document.onkeydown=function(event){ 
        var e = event || window.event || arguments.callee.caller.arguments[0]; 
         if(e && e.keyCode==13){ // enter 键 
			$("#queryButton").trigger("click");
         };
	}
	
	function findByCondition(){
		
		loadHierarchyPage(1, 10);
	}
	function loadHierarchyPage(currentPage, limit) {
		//先销毁表格
		var hierarchyName = $("input[name='HierarchyName']").val().trim();
		//alert(hierarchyName);
        $('#table').bootstrapTable('destroy'); 
        $("#table").bootstrapTable({
        	method: "post",  //使用get请求到服务器获取数据  
        	contentType: "application/x-www-form-urlencoded",
        	dataType: "json",
            url: '<%=request.getContextPath()%>/hierarchy/hierarchyPage', //获取数据的Servlet地址  
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
                  	hierarchyName:hierarchyName
                  	
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
                field: 'hierarchyId',
                title: '体系编号'
            }, {
                field: 'hierarchyName',
                title: '体系名称'
            }, {
                field: 'hierarchyNick',
                title: '体系简称'
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
	
	function showAddHierarchy() {
		$("#hierarchyNameError").text('');
		$('#hierarchyId').val('');
		$('#hierarchyName').val('');
		$('#hierarchyNick').val('');
		$('#addBtn').show();
		$('#editBtn').hide();
		$('#modalTitle').text('新增体系');
		$("#modal-modifyComment").modal("show");
	}
	
	function addHierarchy(){
		var hierarchyName=$('#hierarchyName').val();
		var hierarchyNick=$('#hierarchyNick').val();
		
		var isAdd=true;
		
		/* if(hierarchyName==null||hierarchyName==''){
			bootbox.alert("大区名称不能为空");
			$('#hierarchyName').focus();
			isAdd=false;
		}
		 */
		if(isAdd&&validateName()){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : '<%=request.getContextPath()%>/hierarchy/addHierarchy',
				data : {
					'hierarchyName' : hierarchyName,
					'hierarchyNick' : hierarchyNick
				},
				traditional : true,
				dataType : 'JSON',

				success : function(data) {
					console.log(data);
					if (data.status) {
						bootbox.alert(data.msg);
						$("#modal-modifyComment").modal("hide");
					} else {
						bootbox.alert("新增失败");
					}
					loadHierarchyPage($('#currentPage').val(), $('#limit').val());
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					bootbox.alert(ERROR_MSG);
				}
			});
		}
		
	}
	
	function validateName(){
		var flag = true;
		var hierarchyName=$('#hierarchyName').val();
		var hierarchyId = $('#hierarchyId').val();
		if(hierarchyName==null||hierarchyName.trim()==''){
			$("#hierarchyNameError").text("体系名称不能为空");
			flag = false;
			return false;
		}else{
			$("#hierarchyNameError").text("");
			flag = true;
		}
		$.ajax({
			type : "POST",
			url : '<%=request.getContextPath()%>/hierarchy/validateName',
			data : {
				'hierarchyName' : hierarchyName,
				'hierarchyId':hierarchyId
			},
			async:false,
			success : function(data) {
				if (!data) { 
					$("#hierarchyNameError").text("体系名称已存在");
					flag = false;
				}else{
					flag = true;
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				bootbox.alert(ERROR_MSG);
			}
		});
		return flag;
	}

	function delHierarchy() {
		var hierarchyList = [];
		$("input[name='subBox']").each(function() {
			if ($(this).is(":checked")) {

				var tr = $(this).parent().parent();
				var a = tr.children();

				hierarchyList.push(a.eq(1).text());
			}
		});

		if (hierarchyList.length > 0) {
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
		        message: '你确定要删除体系吗?!',  
		        callback: function(result) {  
		            if(result) {  
		            	$.ajax({
		    				//提交数据的类型 POST GET
		    				type : "POST",
		    				//提交的网址
		    				url : '<%=request.getContextPath()%>/hierarchy/delHierarchy',
		    				data : {
		    					'hierarchyList' : hierarchyList
		    				},
		    				traditional : true,
		    				dataType : 'JSON',

		    				success : function(data) {

		    					if (data.status) {
		    						bootbox.alert(data.msg);
		    					} else {
		    						bootbox.alert(data.msg);
		    					}
		    					loadHierarchyPage($('#currentPage').val(), $('#limit').val());
		    				},
		    				error : function(XMLHttpRequest, textStatus, errorThrown) {
		    					bootbox.alert(ERROR_MSG);
		    				}
		    			});
		            }  
		        },  
		        });
		
		} else {
			bootbox.alert('请选择具体大区后删除');
		}

	}
	
	function showEditHierarchy(){
		$("#hierarchyNameError").text('');
		if($("input[name='subBox']:checked").length==1){
			$("input[name='subBox']").each(function() {
				if ($(this).is(":checked")) {
					
					var tr = $(this).parent().parent();
					var a = tr.children();	
					
					$('#hierarchyId').val(a.eq(1).text());
					$('#hierarchyName').val(a.eq(2).text());
					$('#hierarchyNick').val(a.eq(3).text());
					$('#modalTitle').text('编辑体系');
					$('#addBtn').hide();
					$('#editBtn').show();
					$("#modal-modifyComment").modal("show");
				}
			});
		}else if($("input[name='subBox']:checked").length==0){
			bootbox.alert('请至少选择一条体系！');
		}else{
			bootbox.alert('不可以选择多条体系！');
		}
	}
	
	function editHierarchy(){
		var hierarchyId=$('#hierarchyId').val();
		var hierarchyName=$('#hierarchyName').val();
		var hierarchyNick=$('#hierarchyNick').val();
		
		
		if(validateName()){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : '<%=request.getContextPath()%>/hierarchy/editHierarchy',
				data : {
					'hierarchyId' : hierarchyId,
					'hierarchyName' : hierarchyName,
					'hierarchyNick' : hierarchyNick
				},
				traditional : true,
				dataType : 'JSON',

				success : function(data) {
					
					if (data.status) {
						bootbox.alert(data.msg);
						$("#modal-modifyComment").modal("hide");
					} else {
						bootbox.alert(data.msg);
					}
					loadHierarchyPage($('#currentPage').val(), $('#limit').val());
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					bootbox.alert(ERROR_MSG);
				}
			});
		}
		
	}
</script>
<input type="hidden" id="currentPage" />
<input type="hidden" id="limit" />

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">体系列表</li>
	</ol>
</div>
<!--/.row-->
<!-- 
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">体系列表</h1>
	</div>
</div> -->
<!--/.row-->
<br/>
<fieldset >
	<legend>查询条件</legend>
	<div class="will">
           <div>
			<div class="form-group col-sm-offset-2" >
				<label for="textfield" class="control-label col-sm-2">体系名称:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="HierarchyName" value=""/>
				</div>
            </div>
			<button id="queryButton" class="btn btn-primary col-sm-2" onClick="findByCondition()">查询</button>
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
					<shiro:hasPermission name="system.hierarchy.add">
					<button id="btn_add" type="button" class="btn btn-default"
						onclick='showAddHierarchy()'>
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
					</button>
					</shiro:hasPermission>
					<shiro:hasPermission name="system.hierarchy.edit">
					<button id="btn_edit" type="button" class="btn btn-default" onclick='showEditHierarchy()'>
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
					</button>
					</shiro:hasPermission>
					<shiro:hasPermission name="system.hierarchy.delete">
					<button id="btn_delete" type="button" class="btn btn-default"
						onclick='delHierarchy()'>
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
					</button>
					</shiro:hasPermission>
				</div>
				<br /> <br />
				<shiro:hasPermission name="system.hierarchy.query">
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
				<h4 class="modal-title" id="modalTitle">新增体系</h4>
			</div>
			<!-- /.modal-header -->
			<div class="modal-body">
				<div class="form-horizontal">
					<input type="hidden" class="form-control" id="hierarchyId">
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">体系名称:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="hierarchyName" onblur="validateName()">
						</div>
						<div class="col-sm-5">
							<div style="color:red; font-size:15px;" id="hierarchyNameError"></div>
						</div>
					</div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">体系简称:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="hierarchyNick">
						</div>
					</div>
				</div>
			</div>

			<!-- /.modal-body -->
			<div class="modal-footer">
				<button id="addBtn" type="button" class="btn btn-primary"
					onclick='addHierarchy()'>确 认</button>
				<button id="editBtn" type="button" class="btn btn-primary"
					onclick='editHierarchy()'>修改</button>
				<button id="delBtn" type="button" class="btn btn-primary" data-dismiss="modal">取
					消</button>
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
