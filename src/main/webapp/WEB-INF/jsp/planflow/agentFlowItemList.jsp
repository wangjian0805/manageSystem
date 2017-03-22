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
		<li class="active">经销商产品流向详情</li>
	</ol>
</div>
<!--/.row-->


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default" style="padding-bottom:5px;">
			<div class="panel-body">
				<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>库存信息&nbsp;&nbsp;&nbsp;
				<span>${agentId}-${agentName}&nbsp;&nbsp;&nbsp;${agentFlowDate}</span>
				
				<br /> <br />
				<shiro:hasPermission name="planflow.agentproduct.query">
				<input type='hidden' id='agentFlowId' value='${agentFlowId}'/>
				<table class="table table-bordered col-lg-12" id="sku_tb">
					<thead>
						<tr>
							<th class="col-md-2">产品编号</th>
							<th class="col-md-2">产品名称</th>
							<th class="col-md-2">库存数量</th>
							<th class="col-md-2">库存数量(最小单位)</th>
						</tr>
					</thead>
						<tbody class="tbody1" v-cloak>
							<tr v-for="item in agentFlowStockItemList">
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
		</div>
		
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default" style="padding-bottom:5px;">
			<div class="panel-body">
				<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>出货信息
				
				<br /> <br />
				<shiro:hasPermission name="planflow.agentproduct.query">
				<table class="table table-bordered col-lg-12" id="sku_tb">
					<thead>
						<tr>
							<th class="col-md-2">终端编号</th>
							<th class="col-md-2">终端名称</th>
							<th class="col-md-2">产品编号</th>
							<th class="col-md-2">产品名称</th>
							<th class="col-md-2">出货数量</th>
							<th class="col-md-2">出货数量(最小单位)</th>
						</tr>
					</thead>
						<tbody class="tbody2" v-cloak>
							<tr v-for="item in agentFlowShipmentItemList">
								<td>{{ item.terminal.terminalId }}</td>
								<td>{{ item.terminal.terminalName }}</td>
								<td>{{ item.skuId }}</td>
								<td>{{ item.skuName }}</td>
								<td>{{ item.shipmentQuantity }}{{ item.baseUnit }}</td>
								<td>{{ item.shipmentMinQuantity }}{{ item.minUnit }}</td>
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

	var myVue1 = new Vue({
		el : '.tbody1',
		data : {
			agentFlowStockItemList : [],
		}
	})
	
	var myVue2 = new Vue({
		el : '.tbody2',
		data : {
			agentFlowShipmentItemList : [],
		}
	})
	
	$(function(){
		loadInitialData();
	});
	
	function loadInitialData(){
		$.ajax({
			type : "get",
			url : '<%=request.getContextPath()%>/agent/findAgentFlowItemById',
			data : {
				'agentFlowId' : $("#agentFlowId").val()
			},
			dataType : 'JSON',
			success : function(data) {
				myVue1.agentFlowStockItemList = data.agentFlowStockItemList;
				/* $.each(data.agentFlowShipmentItemList,function(i,item){
					item.count = item.shipmentQuantity*item.
				}); */
				myVue2.agentFlowShipmentItemList = data.agentFlowShipmentItemList;
				
				console.log(myVue2.agentFlowShipmentItemList);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				bootbox.alert(ERROR_MSG);
			}
		});
	}
	
	
</script>

