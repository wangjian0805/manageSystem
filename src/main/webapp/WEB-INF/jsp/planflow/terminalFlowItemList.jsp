<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="<%=request.getContextPath()%>/js/common/address.js"></script>
<style>
td,th {
	text-align:center!important;
	vertical-align:middle!important;
}
.form-control {
	display:inline;
}
</style>
<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">终端产品流向详情</li>
	</ol>
</div>
<!--/.row-->


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default" style="padding-bottom:5px;">
			<div class="panel-body">
				<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>终端产品流向
				<span>${terminalId}-${terminalName}&nbsp;&nbsp;&nbsp;${terminalFlowDate}</span>
				
				<br /> <br />
				<shiro:hasPermission name="planflow.terminalproduct.query">
				<input type='hidden' id='terminalFlowId' value='${terminalFlowId}'/>
				<table class="table table-bordered col-lg-12" id="sku_tb">
					<thead>
						<tr>
							<th class="col-md-2">产品编号</th>
							<th class="col-md-2">产品名称</th>
							<th class="col-md-2">剩余库存</th>
							<th class="col-md-2">剩余库存(最小单位)</th>
						</tr>
					</thead>
						<tbody class="tbody1" v-cloak>
							<tr v-for="item in planItemList">
								<td>{{ item.skuId }}</td>
								<td>{{ item.skuName }}</td>
								<td>{{ item.stockQuantity }}{{ item.baseUnit }}</td>
								<td>{{ item.stockMinQuantity }}{{ item.minUnit }}</td>
							</tr>
						</tbody>
					</table>
					<!-- </form> -->
				</shiro:hasPermission>
			</div>
			<div style="text-align:center;">
			<button class="btn btn-default" id="cancelBtn" onclick="history.go(-1)">返回</button>
		</div>
		</div>
		
	</div>
</div>
<!--/.row-->
<script type="text/javascript">

	var myVue = new Vue({
		el : '.tbody1',
		data : {
			planItemList : [],
		}
	})
	
	$(function(){
		loadInitialData();
	});
	
	function loadInitialData(){
		$.ajax({
			type : "get",
			url : '<%=request.getContextPath()%>/terminal/findTerminalFlowItemById',
			data : {
				'terminalFlowId' : $("#terminalFlowId").val()
			},
			dataType : 'JSON',
			success : function(data) {
				myVue.planItemList = data;
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				bootbox.alert(ERROR_MSG);
			}
		});
	}
	
	
</script>

