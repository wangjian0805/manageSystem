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
		<li class="active">经销商产品流向变更</li>
	</ol>
</div>
<!--/.row-->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default" style="padding-bottom: 5px;">
			<div class="panel-body">
				<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>出货信息
				&nbsp;&nbsp;&nbsp;<span>${agentId}-${agentName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${planMonth}</span>&nbsp;&nbsp;&nbsp;
				<div id="toolbar1" class="btn-group">
						<button id="btn_add" type="button" class="btn btn-primary">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
						</button>
				</div>

				<br /> <br />
				<shiro:hasPermission name="planflow.agentproduct.query">
						<%-- <form id="productItemTb"  method="post" action="<%=request.getContextPath()%>/terminal/addSalePlanItem"> --%>
					<input type='hidden' name='agentId' id="agentId"
						value='${agentId}' />
					<input type='hidden' name='agentFlowId' id="agentFlowId"
						value='${agentFlowId}' />
					<input type='hidden' name='agentFlowDate' id="agentFlowDate"
						value='${agentFlowDate}' />
					<table class="table table-bordered col-lg-12" id="sku_tb">
						<thead>
							<tr>
								<th class="col-md-3">终端</th>
								<th class="col-md-3">产品</th>
								<th class="col-md-2">出货数量</th>
								<th class="col-md-2">出货数量(最小单位)</th>
								<th class="col-md-1">操作</th>
							</tr>
						</thead>
						<tbody class="tbody1">

						</tbody>
					</table>
					<!-- </form> -->
				</shiro:hasPermission>
			</div>
			<div style="text-align: center;">
				<button class="btn btn-primary" id="saveBtn">保存</button>
				<button class="btn btn-default" id="cancelBtn"
					onclick="history.go(-2)">取消</button>
			</div>
		</div>

	</div>
</div>
<!--/.row-->
<script type="text/javascript">
	var i = 0;
	var itemIds = [];
	loadInitialData();
	$(function(){
		i=0;
		$("#btn_add").click(function(){
			addTemplate();
		});
		$("#saveBtn").click(function(){
			iterateTable();
		});
	});
	function loadInitialData(){
		$.ajax({
			type : "get",
			url : '<%=request.getContextPath()%>/agent/findAgentFlowShipmentItemById',
			data : {
				'agentFlowId' : $("#agentFlowId").val()
			},
			dataType : 'JSON',
			success : function(data) {
				for(var j in data){
					var product = new Object();
					product.productName=data[j].skuName;
					product.baseUnit=data[j].baseUnit;
					product.minUnit=data[j].minUnit;
					product.baseUnitCode=data[j].baseUnitCode;
					product.minUnitCode=data[j].minUnitCode;
					product.count=data[j].shipmentMinQuantity;
					product.minQuantity="";
					
					var trTemplate = "<tr class='trTemplate'><td>"
						+"<input type='hidden'  class='itemId' value='"+data[j].agentFlowShipmentItemId+"'/>"
						+hiddenStr(product)
						+terminalStr(j)
						+"</td><td>"
						+productStr(j)
						+"</td><td>"
						+baseStr(data[j].shipmentQuantity,data[j].baseUnit)
						+"</td><td>"
						+minStr(data[j].shipmentMinQuantity,data[j].minUnit)
						+"</td><td>"
						+buttonStr("delShipmentItem")
						+"</td></tr>";
					
					$(".tbody1").append(trTemplate);
					var temp = parseInt(j)+parseInt(1);
					$("tr:eq("+temp+")").find(".skuId").val(data[j].skuId);
					$("tr:eq("+temp+")").find(".terminalId").val(data[j].terminalId);
					$('.combobox_'+j).combobox();
					i++;
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				bootbox.alert(ERROR_MSG);
			}
		});
	}
	function productChange(temp){
		var terminalId = $(temp).parents("tr").eq(0).find(".terminalId").find("option:selected").val();
		var isAdd=validateShipmentTable('sku_tb',$(temp).find("option:selected").val(),terminalId,$(temp).parents("tr").index());
		if(isAdd){
			setProductParameters(temp);
		}else{
			bootbox.alert("同一产品不可反复添加！");
		}	
	}
	function quantityChange(temp){
		var r = /^-?\d+$/;
		if(!r.test($(temp).val())||$(temp).val()==""){
			bootbox.alert("数量填写必须为整数，请重新填写！");
			$(temp).val("");
			$(temp).focus();
		}else{
			console.log($(temp).parents("tr").eq(0).find(".skuId").find("option:selected").attr("unit_quantity"));
			var unitquantity = parseInt($(temp).parents("tr").eq(0).find(".skuId").find("option:selected").attr("unit_quantity"));
			var basequantity = parseInt($(temp).val());
			$(temp).parents("tr").eq(0).find(".unitQuantity").text(unitquantity*basequantity);
			$(temp).parents("tr").eq(0).find(".count").val(unitquantity*basequantity);
		}
	}
	function addTemplate(){
		var product = new Object();
		product.productName="";
		product.baseUnit="";
		product.minUnit="";
		product.baseUnitCode="";
		product.minUnitCode="";
		product.count="0";
		product.minQuantity="";
		
		var trTemplate = "<tr class='trTemplate'><td>"
			+"<input type='hidden'  class='itemId' value=''/>"
			+hiddenStr(product)
			+terminalStr(i)
			+"</td><td>"
			+productStr(i)
			+"</td><td>"
			+baseStr("0","单位")
			+"</td><td>"
			+minStr("0","单位")
			+"</td><td>"
			+buttonStr("delShipmentItem")
			+"</td></tr>";
		
		$(".tbody1").append(trTemplate);
		$('.combobox_'+i).combobox();
		i++;
		
	}
	
	function delShipmentItem(temp){
		var itemId = $(temp).parents("tr").eq(0).find(".itemId").val();
		console.log("delItemId:"+itemId);
		if(itemId!=""){
			itemIds.push(itemId);
		}
		$(temp).parents("tr").eq(0).remove();
	}
	
	function iterateTable(){
		var agentFlowShipmentItemList = new Array();
		var flag = true;
		
		$.each($("#sku_tb").find("tr"), function(i, mtr) {
			if (i != 0) {
				i = i - 1;
				var skuIdVal = $(mtr).eq(0).find(".skuId").find(
						"option:selected").val();
				var terminalIdVal = $(mtr).eq(0).find(".terminalId").find("option:selected").val();
				var shipmentQuantity=$(mtr).eq(0).find(".quantity").val();
				if (skuIdVal == "-1" || skuIdVal == ""||skuIdVal==undefined || terminalIdVal == "-1"||terminalIdVal == undefined
						|| terminalIdVal == ""||shipmentQuantity==""||isNaN(shipmentQuantity)) {
					flag = false;
				}
				var agentFlowShipmentItem = {
					skuName : $(mtr).eq(0).find(".productName").val(),
					skuId:$(mtr).eq(0).find(".skuId").find("option:selected").val(),
					baseUnit : $(mtr).eq(0).find(".baseUnit").val(),
					baseUnitCode : $(mtr).eq(0).find(".baseUnitCode").val(),
					minUnit : $(mtr).eq(0).find(".minUnit").val(),
					minUnitCode : $(mtr).eq(0).find(".minUnitCode").val(),
					shipmentMinQuantity : $(mtr).eq(0).find(".count").val(),
					shipmentQuantity : $(mtr).eq(0).find(".quantity").val(),
					terminalId : $(mtr).eq(0).find(".terminalId").find("option:selected").val(),
					agentFlowShipmentItemId : $(mtr).eq(0).find(".itemId").val()
				}
				agentFlowShipmentItemList[i] = agentFlowShipmentItem;
			}
		});
		if(flag){
			var agentFlowShipmentParams = new Object();
			agentFlowShipmentParams.agentId = $("#agentId").val();
			agentFlowShipmentParams.agentFlowId = $("#agentFlowId").val();
			agentFlowShipmentParams.agentFlowDate = $("#agentFlowDate").val();
			agentFlowShipmentParams.agentFlowShipmentItemList = agentFlowShipmentItemList;
			agentFlowShipmentParams.delAgentFlowItemIds = itemIds;
			$.ajax({
				url : '<%=request.getContextPath()%>/agent/editAgentFlowItem',
				dataType: "json", 
				data : JSON.stringify(agentFlowShipmentParams),
				type : "POST",
				contentType : 'application/json;charset=utf-8', //设置请求头信息
				success : function(data) {
					if (data.status) {
						bootbox.alert({
						    buttons: {
							   ok: {
								    label: '确认',
								    className: 'btn-primary'
							    }
						    },
						    message: '修改经销商产品流向成功！',
						    callback: function() {
						    	window.location.href='<%=request.getContextPath()%>/agent/agentFlowList';
						    }
					    });
					} else {
						bootbox.alert(data.msg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					bootbox.alert(ERROR_MSG);
				}
			});
		}else{
			bootbox.alert("表格信息不完整或存在错误，请修正后再保存！");
		}
	}
</script>

