<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="<%=request.getContextPath()%>/js/common/address.js"></script>
<style>
td, th {
	text-align: center !important;
	vertical-align: middle !important;
}

.form-control {
	display: inline;
}
</style>
<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">终端销售计划详情</li>
	</ol>
</div>
<!--/.row-->


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default" style="padding-bottom: 5px;">
			<div class="panel-body">
				<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>销售计划&nbsp;&nbsp;&nbsp;
				<span>${terminalId}-${terminalName}&nbsp;&nbsp;&nbsp;${planMonth}</span>
				<br /> <br /> <input type='hidden' id='salePlanId'
					value='${salePlanId}' />
				<table class="table table-bordered col-lg-12" id="sku_tb">
					<thead>
						<tr>
							<th class="col-md-2">产品编号</th>
							<th class="col-md-2">产品名称</th>
							<th class="col-md-2">计划销售数量</th>
							<th class="col-md-2">单价</th>
							<th class="col-md-2">计划销售数量(最小单位)</th>
							<th class="col-md-2">总价</th>
						</tr>
					</thead>
					<tbody class="tbody1" v-cloak>
						<tr v-for="item in planItemList">
							<td>{{ item.skuId }}</td>
							<td>{{ item.skuName }}</td>
							<td>{{ item.baseQuantity }}{{ item.baseUnit }}</td>
							<td>{{ item.basePrice }}元</td>
							<td>{{ item.count }}{{ item.minUnit }}</td>
							<td>{{ item.totalPrice }}元</td>
						</tr>
					</tbody>
				</table>
				<!-- </form> -->
			</div>
			<div style="text-align: center;">
				<button class="btn btn-default" id="cancelBtn"
					onclick="history.go(-1)">取消</button>
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
			url : '<%=request.getContextPath()%>/terminal/findPlanItemById',
			data : {
				'salePlanId' : $("#salePlanId").val()
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

