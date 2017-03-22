<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() { 
		loadProductCategoryPage(1, 10);
	});

	function loadProductCategoryPage(currentPage, limit) {
		//先销毁表格  
        $('#table').bootstrapTable('destroy'); 
        $("#table").bootstrapTable({
        	method: "get",  //使用get请求到服务器获取数据  
        	contentType: "application/x-www-form-urlencoded",
        	dataType: "json",
            url: '<%=request.getContextPath()%>/product/productCategoryPage', //获取数据的Servlet地址  
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
                  pageNumber: params.pageSize
              };    
              return param;                   
            },  
            onLoadSuccess: function(data){  //加载成功时执行  
            },  
            onLoadError: function(){  //加载失败时执行  
            	bootbox.alert("加载数据失败");  
            },
            columns: [ {
                field: 'code',
                title: '品类编号'
            }, {
                field: 'name',
                title: '品类名称'
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
	
	/**
	 * 导出Excel
	 */
	function exportExcel(){
		window.location.href = '<%=request.getContextPath()%>/product/toExportProductCategory';
	}
	
	
	/* 导入 */
	function importProductCategory(){
		 var url = '<%=request.getContextPath()%>/product/importProductCategoryExcel'; //   /** 使用ajaxFileUpload */
		$.ajaxFileUpload({
			url : url, //用于文件上传的服务器端请求地址
			secureuri : false, //是否需要安全协议，一般设置为false
			fileElementId : 'upload_file', //文件上传域的ID  就是选定文件的 type=file的input框的id  ajaxFileUpload 会帮我们把他分装到ajax请求的 携带对象域中去
			dataType : 'json', //返回值类型 一般设置为json
			type : 'post',
			success : function(data) {
				if (data.status) {
					bootbox.alert(data.msg);
				} else {
					bootbox.alert(data.msg);
				}
				loadProductCategoryPage($('#currentPage').val(), $('#limit')
						.val());
			},
			error : function(data, status, e) { //服务器响应失败时的处理函数
				bootbox.alert(ERROR_MSG);
			}
		})
	}

	function importExcel() {
		$('#modalTitle1').text('批量导入');
		$("#modal-importExcel").modal("show");
	}

	/**
	 * 显示上传文件名称
	 * @param fileObj
	 */
	function selectUploadFile(fileObj) {
		var fullPath = $(fileObj).val();
		var index = fullPath.lastIndexOf('\\') + 1;
		var fileName = fullPath.substring(index);
		$('input[name="upload_filename"]').val(fileName);
	}
</script>
<input type="hidden" id="currentPage" />
<input type="hidden" id="limit" />

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">产品品类列表</li>
	</ol>
</div>
<!--/.row-->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">产品品类列表</h1>
	</div>
</div>
<!--/.row-->


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!-- 	<div class="panel-heading">Advanced Table</div> -->
			<div class="panel-body">
				<div id="toolbar1" class="btn-group"></div>
				<shiro:hasPermission name="system.productCategory.import">
				<button id="btn_delete" type="button" class="btn btn-default"
					onClick='importExcel()'>
					<span class="glyphicon glyphicon-open" aria-hidden="true"></span>导入
				</button>
				</shiro:hasPermission>
				<shiro:hasPermission name="system.productCategory.export">
				<button id="btn_delete" type="button" class="btn btn-default"
					onclick='exportExcel()'>
					<span class="glyphicon glyphicon-save" aria-hidden="true"></span>导出模板
				</button>
				</shiro:hasPermission>
				<br /> <br />
				<shiro:hasPermission name="system.productCategory.query">
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
<!--/.row-->
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
				<button type="button" id="btn_upSubmit"
					class="btn btn-success pdlr16" data-dismiss="modal"
					onclick="importProductCategory()">
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
