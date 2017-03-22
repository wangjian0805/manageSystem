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
					<button id="btn_add" type="button" class="btn btn-primary"
						onclick="showAddTerminalSalePlan()">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
					</button>
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
							<th class="col-md-2">总价价</th>
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
			url : '<%=request.getContextPath()%>/terminal/findPlanItemById',
			data : {
				'salePlanId' : $("#salePlanId").val()
			},
			dataType : 'JSON',
			success : function(data) {
				for(var i in data){
					console.log(data[i]);
					var trTemplate = "<tr class='trTemplate'>"+
					"<td>"+
						"<input type='hidden'  class='productName' value='"+data[i].skuName+"'/>"+
						"<input type='hidden'  class='baseUnit' value='"+data[i].baseUnit+"'/>"+
						"<input type='hidden' class='miniUnit' value='"+data[i].minUnit+"'/>"+
						"<input type='hidden' class='count' value='"+data[i].count+"'/>"+
					"<select class='form-control skuId'  onChange='productChange(this)'>"+
					"<option value='-1'>请选择</option>"+
					"<c:if test='${not empty productList}'>"+
						"<c:forEach var='product' items='${productList}'>"+
							"<option value='${product.code}'  base_unit='${product.erpUnit}' unit_price='${product.unitPrice}' mini_unit='${product.erpMinUnit}' unit_quantity='${product.unitQuantity}'>${product.name}</option>"+
						"</c:forEach>"+
					"</c:if>"+
					"</select></td>"+
					"<td><input type='text' class='form-control quantity' style='width:100px;' onChange='quantityChange(this)' value='"+data[i].baseQuantity+"'/><span class='label label-info base_unit'>单位</span>"+
					"</td>"+
					"<td><span class='unitPrice label label-default'>"+data[i].basePrice+"</span>&nbsp;&nbsp;&nbsp;<span class='label label-info'>元</span>"+
					"</td>"+
					"<td><span class='unitQuantity label label-default'>"+data[i].count+"</span>&nbsp;&nbsp;&nbsp;<span class='label label-info mini_unit'>"+data[i].minUnit+"</span>"+
					"</td>"+
					"<td><span class='totalPrice label label-default'>"+data[i].totalPrice+"</span>&nbsp;&nbsp;&nbsp;<span class='label label-info'>元</span>"+
					"</td>"+
					"<td><button type='button' class='btn btn-danger'onClick='delSaleItem(this)'>删除</button></td>"+
					"</tr>";
					$(".tbody1").append(trTemplate);
					var temp = parseInt(i)+parseInt(1);
					console.log("temp:"+temp);
					$("tr:eq("+temp+")").find(".skuId").val(data[i].skuId);
					
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				bootbox.alert("数据加载失败");
			}
		});
	}
	function productChange(temp){
		
		var mini_unit = $(temp).find("option:selected").attr("mini_unit");
		var base_unit = $(temp).find("option:selected").attr("base_unit");
		var productName = $(temp).find("option:selected").text();
		var mini_quantity = $(temp).find("option:selected").attr("unit_quantity");
		var base_quantity = $(temp).parents("tr").eq(0).find(".quantity").val();
		
		var unitPrice = $(temp).find("option:selected").attr("unit_price");
		$(temp).parents("tr").eq(0).find(".quantity").attr("disabled",false);
		$(temp).parents("tr").eq(0).find(".mini_unit").text(mini_unit);
		$(temp).parents("tr").eq(0).find(".base_unit").text(base_unit);
		$(temp).parents("tr").eq(0).find(".unitQuantity").text(mini_quantity);
		$(temp).parents("tr").eq(0).find(".baseUnit").val(base_unit);
		$(temp).parents("tr").eq(0).find(".miniUnit").val(mini_unit);
		$(temp).parents("tr").eq(0).find(".productName").val(productName);
		$(temp).parents("tr").eq(0).find(".unitPrice").text(unitPrice);
		var count = parseInt(mini_quantity)*parseInt(base_quantity);
		
		var totalPrice = parseFloat(unitPrice)*parseInt(base_quantity)+'';
		//alert(totalPrice);
		var aNew;
	    var re = /([0-9]+\.[0-9]{2})[0-9]*/;
	    aNew = totalPrice.replace(re,"$1");
		$(temp).parents("tr").eq(0).find(".totalPrice").text(aNew);
		$(temp).parents("tr").eq(0).find(".count").val(count);
	}
	function quantityChange(temp){
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
	}
	function addTemplate(){
		var trTemplate = "<tr class='trTemplate'>"+
		"<td>"+
			"<input type='hidden'  class='productName' value=''/>"+
			"<input type='hidden'  class='baseUnit' value=''/>"+
			"<input type='hidden' class='miniUnit' value=''/>"+
			"<input type='hidden' class='count' value='0'/>"+
		"<select class='form-control skuId'  onChange='productChange(this)'>"+
		"<option value='-1'>请选择</option>"+
		"<c:if test='${not empty productList}'>"+
			"<c:forEach var='product' items='${productList}'>"+
				"<option value='${product.id}'  base_unit='${product.erpUnit}' unit_price='${product.unitPrice}' mini_unit='${product.erpMinUnit}' unit_quantity='${product.unitQuantity}'>${product.code}-${product.name}</option>"+
			"</c:forEach>"+
		"</c:if>"+
		"</select></td>"+
		"<td><input type='text' class='form-control quantity' style='width:100px;' disabled='true' onChange='quantityChange(this)' value='1'/><span class='label label-info base_unit'>单位</span>"+
		"</td>"+
		"<td><span class='unitPrice label label-default'>单价</span>&nbsp;&nbsp;&nbsp;<span class='label label-info'>元</span>"+
		"</td>"+
		"<td><span class='unitQuantity label label-default'>单位数量</span>&nbsp;&nbsp;&nbsp;<span class='label label-info mini_unit'>单位</span>"+
		"</td>"+
		"<td><span class='totalPrice label label-default'>总价</span>&nbsp;&nbsp;&nbsp;<span class='label label-info'>元</span>"+
		"</td>"+
		"<td><button type='button' class='btn btn-danger'onClick='delSaleItem(this)'>删除</button></td>"+
		"</tr>";
		$(".tbody1").append(trTemplate);
		i++;
		
	}
	function iterateTable(){
		var planItemList = new Array();
		$.each($("#sku_tb").find("tr"),function(i,mtr){
			if(i!=0){
				//alert($(mtr).eq(0).find(".skuId").val());
				i=i-1;
					var planItem = {
						skuName:$(mtr).eq(0).find(".productName").val(),
						baseUnit:$(mtr).eq(0).find(".baseUnit").val(),
						minUnit:$(mtr).eq(0).find(".miniUnit").val(),
						count:$(mtr).eq(0).find(".count").val(),
						skuId:$(mtr).eq(0).find(".skuId").val(),
						baseQuantity:$(mtr).eq(0).find(".quantity").val(),
						basePrice:$(mtr).eq(0).find(".unitPrice").text(),
						totalPrice:$(mtr).eq(0).find(".totalPrice").text()
					}
						planItemList[i]=planItem;
					
			}
		});
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
				if (data) {
					//bootbox.alert("添加成功");
					bootbox.confirm("修改销售计划成功！",function(result){
						window.location.href='<%=request.getContextPath()%>/terminal/planList';
					});
				} else {
					bootbox.alert("修改失败");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				bootbox.alert("服务器错误，请联系系统管理员");
			}
		});
	}
	
	function delSaleItem(temp){
		$(temp).parents("tr").eq(0).remove();
	}
</script>

