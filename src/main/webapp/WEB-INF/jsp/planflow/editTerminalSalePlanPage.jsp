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
		<li class="active">终端销售计划变更</li>
	</ol>
</div>
<!--/.row-->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default" style="padding-bottom: 5px;">
			<div class="panel-body">
				<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>销售计划变更
				&nbsp;&nbsp;&nbsp;<span>${terminalId}-${terminalName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${planMonth}</span>&nbsp;&nbsp;&nbsp;
				<div id="toolbar1" class="btn-group">
					<button id="btn_add" type="button" class="btn btn-primary">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
					</button>
				</div>
				<br /> <br />
				<%-- <form id="productItemTb"  method="post" action="<%=request.getContextPath()%>/terminal/addSalePlanItem"> --%>
				<input type='hidden' name='terminalId' id="terminalId"
					value='${terminalId}' /> <input type='hidden' name='salePlanId'
					id="salePlanId" value='${salePlanId}' /> <input type='hidden'
					name='salePlanDate' id="salePlanDate" value='${planMonth}' />
				<table class="table table-bordered col-lg-12" id="sku_tb">
					<thead>
						<tr>
							<th class="col-md-3">产品</th>
							<th class="col-md-2">计划销售数量</th>
							<th class="col-md-2">产品单价</th>
							<th class="col-md-2">计划销售数量(最小单位)</th>
							<th class="col-md-2">总价</th>
							<th class="col-md-1">操作</th>
						</tr>
					</thead>
					<tbody class="tbody1">
					</tbody>
				</table>
				<!-- </form> -->
			</div>
			<div>
				<button class="btn btn-primary col-sm-offset-6" id="saveBtn">保存</button>
				<button class="btn btn-default" id="cancelBtn"
					onclick="history.go(-1)">取消</button>
				<span class="col-md-offset-3">总计：<font id="countTotal" size="3" color="red">0</font>元</span>
			</div>
		</div>

	</div>
</div>
<!--/.row-->
<script type="text/javascript">
	var i = 0;
	$(function(){
		loadInitialData();
		
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
			url : '<%=request.getContextPath()%>/terminal/findPlanItemById',
			data : {
				'salePlanId' : $("#salePlanId").val()
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
					product.count=data[j].count;
					product.minQuantity="";
					var trTemplate = "<tr class='trTemplate'><td>"
						+hiddenStr(product)
						+productStr(j)
						+"</td><td>"
						+baseStr(data[j].baseQuantity,data[j].baseUnit)
						+"</td><td>"
						+unitPriceStr(data[j].basePrice)
						+"</td><td>"
						+minStr(data[j].count,data[j].minUnit)
						+"</td><td>"
						+totalPriceStr(data[j].totalPrice)
						+"</td><td>"
						+buttonStr("delSaleItem")
						+"</td></tr>"; 
					$(".tbody1").append(trTemplate);
					var temp = parseInt(j)+parseInt(1);
					$("tr:eq("+temp+")").find(".skuId").val(data[j].skuId);
					$('.combobox_'+j).combobox();
					i++;
					
				}
				$("#countTotal").text(countPrice());
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
			
			var unitPrice = $(temp).find("option:selected").attr("unit_price");
			$(temp).parents("tr").eq(0).find(".unitPrice").text(unitPrice);
			if(unitPrice==null||unitPrice==''){
				unitPrice=0;
			}
			var base_quantity=1;
			var totalPrice = parseFloat(unitPrice)*parseInt(base_quantity)+'';
			var aNew;
		    var re = /([0-9]+\.[0-9]{2})[0-9]*/;
		    aNew = totalPrice.replace(re,"$1");
			$(temp).parents("tr").eq(0).find(".totalPrice").text(aNew);
			$("#countTotal").text(countPrice());
		}else{
			bootbox.alert("同一产品不可反复添加！");
		}	
	}
	function countPrice(){
		var countPrice = 0;
		$.each($("#sku_tb").find("tr"),function(i,mtr){
			if(i!=0){
				countPrice=parseFloat(countPrice)+parseFloat($(mtr).eq(0).find(".totalPrice").text());
				console.log("countPrice:"+countPrice);
			}
		});
		return Math.round(countPrice*100)/100;
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
			//alert(unitquantity+'-----'+basequantity);
			$(temp).parents("tr").eq(0).find(".unitQuantity").text(unitquantity*basequantity);
			$(temp).parents("tr").eq(0).find(".count").val(unitquantity*basequantity);
			$("#countTotal").text(countPrice());
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
			+unitPriceStr("0.00")
			+"</td><td>"
			+minStr("0","单位")
			+"</td><td>"
			+totalPriceStr("0.00")
			+"</td><td>"
			+buttonStr("delSaleItem")
			+"</td></tr>";
		
		$(".tbody1").append(trTemplate);
		
		$('.combobox_'+i).combobox();
		i++;
		
	}
	function iterateTable(){
		var planItemList = new Array();
		var flag = true;
		$.each($("#sku_tb").find("tr"),function(i,mtr){
			if(i!=0){
				var skuIdVal = $(mtr).eq(0).find(".skuId").find("option:selected").val();
				var baseQuantity=$(mtr).eq(0).find(".quantity").val();
				var r = /^[0-9]*[1-9][0-9]*$/;
				if(skuIdVal=="-1"||skuIdVal==""||skuIdVal==undefined||baseQuantity==""||!r.test(baseQuantity)){
					flag = false;
				}
				i=i-1;
					var planItem = {
						skuName:$(mtr).eq(0).find(".productName").val(),
						baseUnit : $(mtr).eq(0).find(".baseUnit").val(),
						baseUnitCode : $(mtr).eq(0).find(".baseUnitCode").val(),
						minUnit : $(mtr).eq(0).find(".minUnit").val(),
						minUnitCode : $(mtr).eq(0).find(".minUnitCode").val(),
						count:$(mtr).eq(0).find(".count").val(),
						skuId:$(mtr).eq(0).find(".skuId").find("option:selected").val(),
						baseQuantity:$(mtr).eq(0).find(".quantity").val(),
						basePrice:$(mtr).eq(0).find(".unitPrice").text(),
						totalPrice:$(mtr).eq(0).find(".totalPrice").text()
					}
						planItemList[i]=planItem;
					
			}
		});
		if(flag){
			var salePlanParams=new Object();
			salePlanParams.planItemList=planItemList;
			salePlanParams.terminalId=$("#terminalId").val();
			salePlanParams.salePlanId=$("#salePlanId").val();
			salePlanParams.salePlanDate=$("#salePlanDate").val();
			
			$.ajax({
				url : '<%=request.getContextPath()%>/terminal/editSalePlanItem',
				dataType: "json", 
				data : JSON.stringify(salePlanParams),
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
						    message: '修改销售计划成功！',
						    callback: function() {
						    	window.location.href='<%=request.getContextPath()%>/terminal/planList';
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

