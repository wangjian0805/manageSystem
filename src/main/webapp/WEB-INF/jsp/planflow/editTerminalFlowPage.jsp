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
		<li class="active">终端产品流向变更</li>
	</ol>
</div>
<!--/.row-->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default" style="padding-bottom: 5px;">
			<div class="panel-body">
				<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>终端产品流向变更
				&nbsp;&nbsp;&nbsp;<span>${terminalId}-${terminalName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${planMonth}</span>&nbsp;&nbsp;&nbsp;
				<div id="toolbar1" class="btn-group">
					<shiro:hasPermission name="planflow.terminalproduct.add">
						<button id="btn_add" type="button" class="btn btn-primary">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
						</button>
					</shiro:hasPermission>
				</div>

				<br /> <br />
					<%-- <form id="productItemTb"  method="post" action="<%=request.getContextPath()%>/terminal/addSalePlanItem"> --%>
					<input type='hidden' name='terminalId' id="terminalId"
						value='${terminalId}' />
					<input type='hidden' name='terminalFlowId' id="terminalFlowId"
						value='${terminalFlowId}' />
					<input type='hidden' name='salePlanDate' id="salePlanDate"
						value='${planMonth}' />
					<table class="table table-bordered col-lg-12" id="sku_tb">
						<thead>
							<tr>
								<th class="col-md-3">产品</th>
								<th class="col-md-2">剩余库存</th>
								<th class="col-md-2">剩余库存(最小单位)</th>
								<th class="col-md-1">操作</th>
							</tr>
						</thead>
						<tbody class="tbody1">

						</tbody>
					</table>
					<!-- </form> -->
			</div>
			<div style="text-align: center;">
				<button class="btn btn-primary" id="saveBtn">保存</button>
				<button class="btn btn-default" id="cancelBtn"
					onclick="history.go(-1)">取消</button>
			</div>
		</div>

	</div>
</div>
<!--/.row-->
<script type="text/javascript">
	var i = 0;
	$(function(){
		loadInitialData();
		//addTemplate()
		$("#btn_add").click(function(){
			addTemplate();
		});
		$("#saveBtn").click(function(){
			//$("#productItemTb").submit()
			iterateTable();
		});
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
				for(var j in data){
						var product = new Object();
						product.productName=data[j].skuName;
						product.baseUnit=data[j].baseUnit;
						product.minUnit=data[j].minUnit;
						product.baseUnitCode=data[j].baseUnitCode;
						product.minUnitCode=data[j].minUnitCode;
						product.count=data[j].stockMinQuantity;
						product.minQuantity="";
						var trTemplate = "<tr class='trTemplate'><td>"
							+hiddenStr(product)
							+productStr(j)
							+"</td><td>"
							+baseStr(data[j].stockQuantity,data[j].baseUnit)
							+"</td><td>"
							+minStr(data[j].stockMinQuantity,data[j].minUnit)
							+"</td><td>"
							+buttonStr("delItem")
							+"</td></tr>"; 
					$(".tbody1").append(trTemplate);
					var temp = parseInt(j)+parseInt(1);
					$("tr:eq("+temp+")").find(".skuId").val(data[j].skuId);
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
		var isAdd=validateTable('sku_tb',$(temp).find("option:selected").val(),$(temp).parents("tr").index());
		if(isAdd){
			setProductParameters(temp);
		}else{
			bootbox.alert("同一产品不可反复添加！");
		}	
	}
	function quantityChange(temp){
		var r = /^(0|[1-9]\d*)$/;
		if(!r.test($(temp).val())||$(temp).val()==""){
			bootbox.alert("数量填写必须为非负整数，请重新填写！");
			$(temp).val("");
			$(temp).focus();
		}else{
			var unitquantity = parseInt($(temp).parents("tr").eq(0).find("option:selected").attr("unit_quantity"));
			var basequantity = parseInt($(temp).val());
			var unitPrice = parseFloat($(temp).parents("tr").eq(0).find("option:selected").attr("unit_price"));
			var totalPrice =0;
			if(isNaN(unitPrice)){
				$(temp).parents("tr").eq(0).find(".totalPrice").text(0);
			}else{
				totalPrice= unitPrice*basequantity+'';
				var aNew;
			    var re = /([0-9]+\.[0-9]{2})[0-9]*/;
			    aNew = totalPrice.replace(re,"$1");
				$(temp).parents("tr").eq(0).find(".totalPrice").text(aNew);
			}
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
			+hiddenStr(product)
			+productStr(i)
			+"</td><td>"
			+baseStr("0","单位")
			+"</td><td>"
			+minStr("0","单位")
			+"</td><td>"
			+buttonStr("delItem")
			+"</td></tr>";
		$(".tbody1").append(trTemplate);
		$('.combobox_'+i).combobox();
		i++;
	}
	function iterateTable(){
		var terminalFlowItemList = new Array();
		var flag = true;
		$.each($("#sku_tb").find("tr"),function(i,mtr){
			if(i!=0){
				var skuIdVal = $(mtr).eq(0).find(".skuId").find("option:selected").val();
				var stockQuantity=$(mtr).eq(0).find(".quantity").val();
				if(skuIdVal=="-1"||skuIdVal==""||skuIdVal==undefined||stockQuantity==""||isNaN(stockQuantity)){
					flag = false;
				}
					i=i-1;
					var terminalFlowItem = {
						skuName:$(mtr).eq(0).find(".productName").val(),
						baseUnit : $(mtr).eq(0).find(".baseUnit").val(),
						baseUnitCode : $(mtr).eq(0).find(".baseUnitCode").val(),
						minUnit : $(mtr).eq(0).find(".minUnit").val(),
						minUnitCode : $(mtr).eq(0).find(".minUnitCode").val(),
						stockMinQuantity:$(mtr).eq(0).find(".count").val(),
						skuId:$(mtr).eq(0).find(".skuId").find("option:selected").val(),
						stockQuantity:$(mtr).eq(0).find(".quantity").val()
					}
					terminalFlowItemList[i]=terminalFlowItem;
				}
		});
		if(flag){
			var terminalFlowParams=new Object();
			terminalFlowParams.terminalId=$("#terminalId").val();
			terminalFlowParams.terminalFlowId=$("#terminalFlowId").val();
			terminalFlowParams.terminalFlowDate=$("#salePlanDate").val();
			terminalFlowParams.terminalFlowItemList=terminalFlowItemList;
			
			$.ajax({
				url : '<%=request.getContextPath()%>/terminal/editTerminalFlowItem',
				dataType: "json", 
				data : JSON.stringify(terminalFlowParams),
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
						    message: '修改终端产品流向成功！',
						    callback: function() {
						    	window.location.href='<%=request.getContextPath()%>/terminal/terminalFlowList';
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

