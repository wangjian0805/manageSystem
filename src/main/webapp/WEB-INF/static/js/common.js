var jschars = ['0','1','2','3','4','5','6','7','8','9'];

function generateMixed(n) {
	var res = "";
	for(var i = 0; i < n ; i ++) {
		var id = Math.ceil(Math.random()*9);
		console.log(id);
		res += jschars[id];
	}
	return res;
}
function generateId(type){
	var agentId="";
	if(type==0){
		agentId="AGE";
	}else if(type==1){
		agentId="TER";
	}

	var curDate=new Date().Format('yyyyMMddhhmmss');

	//agentId+=curDate+Math.floor(Math.random()*999+1);
	agentId+=curDate+generateMixed(3);
	return agentId;
}

function DateAdd(interval, number, date) {
	switch (interval) {
	case "y": {
		date.setFullYear(date.getFullYear() + number);
		return date;
		break;
	}
	case "q": {
		date.setMonth(date.getMonth() + number * 3);
		return date;
		break;
	}
	case "m": {
		date.setMonth(date.getMonth() + number);
		return date;
		break;
	}
	case "w": {
		date.setDate(date.getDate() + number * 7);
		return date;
		break;
	}
	case "d": {
		date.setDate(date.getDate() + number);
		return date;
		break;
	}
	case "h": {
		date.setHours(date.getHours() + number);
		return date;
		break;
	}
	case "M": {
		date.setMinutes(date.getMinutes() + number);
		return date;
		break;
	}
	case "s": {
		date.setSeconds(date.getSeconds() + number);
		return date;
		break;
	}
	}
}


function validateTable(table_name,sku_id,index){
	var table=$('#'+table_name+'');
	var result=true;
	var current_index=0;
	if(table.find("tr").length>2){
		table.find("tr:gt(0)").each(function(){
			var tdArr = $(this).children();
			var current_sku = $(this).find(".skuId").find("option:selected").val();//收入类别
			if(current_index!=index&&(typeof(sku_id)!="undefined"&&sku_id!="")&&current_sku==sku_id){
				var x = i-1;
				console.log(index);
				$('.skuId.combobox_'+index).val('');
				result=false;
				return false;
			}
			current_index++;
		});
	}

	return result;
}
function validateShipmentTable(table_name,sku_id,terminal_id,index){
	var table=$('#'+table_name+'');
	var result=true;
	var current_index=0;
	if(table.find("tr").length>2){
		table.find("tr:gt(0)").each(function(){

			var tdArr = $(this).children();
			var current_sku = $(this).find(".skuId").find("option:selected").val();
			var current_ter = $(this).find(".terminalId").find("option:selected").val();
			if(current_index!=index&&(typeof(terminal_id)!="undefined"&&terminal_id!="")
					&&current_ter==terminal_id){
				console.log("current_sku:"+current_sku);
				if(current_index!=index&&(typeof(sku_id)!="undefined"&&sku_id!="")&&current_sku==sku_id){
					var x = i-1;
					$('.skuId.combobox_'+index).val('');
					result=false;
					return false;
				}
			}else{
				result = true;
			}
			current_index++;
		});
	}

	return result;
}
function setProductParameters(temp){
	var min_unit = $(temp).find("option:selected").attr("min_unit");
	var base_unit = $(temp).find("option:selected").attr("base_unit");
	var min_unit_code = $(temp).find("option:selected").attr("min_unit_code");
	var base_unit_code = $(temp).find("option:selected").attr("base_unit_code");
	var productName = $(temp).find("option:selected").attr("productName");
	var min_quantity = $(temp).find("option:selected").attr("unit_quantity");
	var base_quantity=1;
	$(temp).parents("tr").eq(0).find(".quantity").val(1);
	$(temp).parents("tr").eq(0).find(".min_unit").text(min_unit);
	$(temp).parents("tr").eq(0).find(".base_unit").text(base_unit);
	$(temp).parents("tr").eq(0).find(".unitQuantity").text(min_quantity);
	$(temp).parents("tr").eq(0).find(".quantity").attr("disabled",false);
	$(temp).parents("tr").eq(0).find(".minQuantity").val(min_quantity);
	$(temp).parents("tr").eq(0).find(".baseUnit").val(base_unit);
	$(temp).parents("tr").eq(0).find(".minUnit").val(min_unit);
	$(temp).parents("tr").eq(0).find(".baseUnitCode").val(base_unit_code);
	$(temp).parents("tr").eq(0).find(".minUnitCode").val(min_unit_code);
	$(temp).parents("tr").eq(0).find(".productName").val(productName);
	
	var count = parseInt(min_quantity)*parseInt(base_quantity);
	$(temp).parents("tr").eq(0).find(".count").val(count);
}

function hiddenStr(product){
	return "<input type='hidden'  class='productName' value='"+product.productName+"'/>"+
	"<input type='hidden'  class='baseUnit' value='"+product.baseUnit+"'/>"+
	"<input type='hidden' class='minUnit' value='"+product.minUnit+"'/>"+
	"<input type='hidden'  class='baseUnitCode' value='"+product.baseUnitCode+"'/>"+
	"<input type='hidden' class='minUnitCode' value='"+product.minUnitCode+"'/>"+
	"<input type='hidden' class='count' value='"+product.count+"'/>"+
	"<input type='hidden' class='minQuantity' value='"+product.minQuantity+"'/>";
}


function baseStr(quantity,unit,flag){
	return "<input type='text' class='form-control quantity' style='width:100px;'  onChange='quantityChange(this)' value='"+quantity+"'/><span class='label label-info base_unit'>"+unit+"</span>";
}
function minStr(quantity,unit){
	return "<span class='unitQuantity label label-default'>"+quantity+"</span>&nbsp;&nbsp;&nbsp;<span class='label label-info min_unit'>"+unit+"</span>";
}
function buttonStr(btnName){
	return "<button type='button' class='btn btn-danger'onClick='"+btnName+"(this)'>删除</button>";
}
function unitPriceStr(price){
	return "<span class='unitPrice label label-default'>"+price+"</span>&nbsp;&nbsp;&nbsp;<span class='label label-info'>元</span>";
}
function totalPriceStr(price){
	return "<span class='totalPrice label label-default'>"+price+"</span>&nbsp;&nbsp;&nbsp;<span class='label label-info'>元</span>";
}
function delItem(temp) {
	$(temp).parents("tr").eq(0).remove();
}
function delSaleItem(temp){
	$(temp).parents("tr").eq(0).remove();
	$("#countTotal").text(countPrice());
}





