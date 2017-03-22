<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() { 
		loadProductPage(1, 10);
	});

	function loadProductPage(currentPage, limit) {
		//先销毁表格  
        $('#table').bootstrapTable('destroy'); 
        $("#table").bootstrapTable({
        	method: "get",  //使用get请求到服务器获取数据  
        	contentType: "application/x-www-form-urlencoded",
        	dataType: "json",
            url: '<%=request.getContextPath()%>/product/productPage', //获取数据的Servlet地址  
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
                title: 'SKU编号'
            }, {
                field: 'name',
                title: 'SKU名称'
            }, {
                field: 'erpUnit',
                title: 'ERP标准单位',
                formatter: function (value, row, index) {
                	return "1/"+value;
                }
            }, {
                field: 'erpMinUnit',
                title: 'ERP最小单位',
                formatter: function (value, row, index) {
                	if(row.unitQuantity!=null){
                		return row.unitQuantity+"/"+value;
                	}
                	
                	if(value!=null){
                		return value;
                	}
                	return "无";
                }
            }, {
                field: 'productCategory',
                title: '所属产品品类',
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.name;
                	}
                	return "无";
                }
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
		window.location.href = '<%=request.getContextPath()%>/product/toExportProduct';
	}
</script>
<input type="hidden" id="currentPage" />
<input type="hidden" id="limit" />

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">产品列表</li>
	</ol>
</div>
<!--/.row-->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">产品列表</h1>
	</div>
</div>
<!--/.row-->


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!-- 	<div class="panel-heading">Advanced Table</div> -->
			<div class="panel-body">
				<div id="toolbar1" class="btn-group">
				</div>
				<button id="btn_delete" type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>导入模板
					</button>
					<button id="btn_delete" type="button" class="btn btn-default"
						onclick='exportExcel()'>
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>导出模板
					</button>
				<br /> <br />
				<table data-show-refresh="false" data-show-toggle="false"
					data-show-columns="false" data-switchable="true"
					data-select-item-name="subBox" data-pagination="true"
					data-sort-order="desc" id="table" class="table table-hover">
				</table>
			</div>
		</div>
	</div>
</div>
<!--/.row-->