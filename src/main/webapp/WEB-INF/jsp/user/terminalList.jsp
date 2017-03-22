<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="<%=request.getContextPath()%>/js/common/address.js"></script>
<script type="text/javascript">
	$(document).ready(function() { 
		loadTerminalPage(1, 10);
		$('#modal-terminalComment').on('hide.bs.modal', function () {
		     //$(".agentId").removeClass("combobox_");
		 }); 
	});
	
	document.onkeydown=function(event){ 
        var e = event || window.event || arguments.callee.caller.arguments[0]; 
         if(e && e.keyCode==13){ // enter 键 
			$("#queryButton").trigger("click");
         };
	}
	function loadTerminalPage(currentPage, limit) {
		//先销毁表格  
        $('#table').bootstrapTable('destroy');
		
		var queryTerminalCode=$('#queryTerminalCode').val();
		var queryTerminalName=$('#queryTerminalName').val();
		var queryAgent=$('#queryAgent').val();
		var queryTerminalStatus=$('#queryTerminalStatus').val();
		var queryTerminalType=$('#queryTerminalType').val();
		var queryChannelId=$('#queryChannelId').val();
		var queryHierarchyId=$('#queryHierarchyId').val();
		
        $("#table").bootstrapTable({
        	method: "post",  //使用get请求到服务器获取数据  
        	contentType: "application/x-www-form-urlencoded",
        	dataType: "json",
            url: '<%=request.getContextPath()%>/terminal/terminalPage', //获取数据的Servlet地址  
            striped: true,  //表格显示条纹  
            pagination: true, //启动分页  
            pageSize: limit,  //每页显示的记录数  
            pageNumber:currentPage, //当前第几页  
            pageList: [5, 10, 15, 20, 25],  //记录数可选列表  
            search: false,  //是否启用查询  
            sidePagination: "server", //表示服务端请求
            clickToSelect: true,
            undefinedText:'',
            //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder  
            //设置为limit可以获取limit, offset, search, sort, order  
            queryParamsType : "undefined",   
            queryParams: function queryParams(params) {   //设置查询参数  
              var param = {    
                  pageSize: params.pageNumber,
                  pageNumber: params.pageSize,
                  queryTerminalCode:queryTerminalCode,
                  queryTerminalName:queryTerminalName,
                  queryAgent:queryAgent,
                  queryTerminalStatus:queryTerminalStatus,
                  queryTerminalType:queryTerminalType,
                  queryChannelId:queryChannelId,
                  queryHierarchyId:queryHierarchyId
              };    
              return param;                   
            },  
            onLoadSuccess: function(data){  //加载成功时执行  
            },  
            onLoadError: function(){  //加载失败时执行  
            	bootbox.alert("加载数据失败");  
            },
            columns: [{
                checkbox: true
            }, {
                field: 'terminalId',
                title: '终端编号',
                valign: 'middle',
                align: 'center',
                order:'asc'
            }, {
                field: 'terminalName',
                valign: 'middle',
                align: 'center',
                title: '终端名称'
            }, {
                field: 'terminalType',
                class:"hidden",
                title: '终端类型'
            },{
                field: 'terminalType',
                valign: 'middle',
                align: 'center',
                width: '50',
                title: '终端类型',
                formatter: function (value, row, index) {
                	var result="";
                	if(value==0){
                		result="个人";
                	}else if(value==1){
                		result="非个人";
                	}
                	return result;
                }
            }, {
                field: 'erpCode',
                valign: 'middle',
                align: 'center',
                title: 'ERP编号',
            },{
                field: 'station',
                title: '岗位编号',
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	return value.stationCode;
                }
            }, {
                field: 'station',
                valign: 'middle',
                align: 'center',
                title: '所属岗位',
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	console.log(value);
                	if(value.isDelete==1){
                		return "<font color='red'>"+value.stationName+"</font>";
                	}
                	return value.stationName;
                }
               
            },{
                field: 'user',
                title: '业务员编号',
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	return value.id;
                }
            },{
                field: 'user',
                valign: 'middle',
                align: 'center',
                title: '所属业务员',
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	
                	if(value.isDelete==1){
                		return "<font color='red'>"+value.username+"</font>";
                	}
                	return value.username;
                }
            },{
                field: 'channel',
                title: '渠道编号',
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.channelId;
                	}
                	return '';
                	
                }
            },{
                field: 'channel',
                valign: 'middle',
                align: 'center',
                title: '所属渠道',
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	
                	if(value.isDelete==1){
                		return "<font color='red'>"+value.channelName+"</font>";
                	}
                	return value.channelName;
                }
            },{
                field: 'hierarchy',
                title: '体系编号',
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.hierarchyId;
                	}
                	return '';
                }
            },{
                field: 'hierarchy',
                valign: 'middle',
                align: 'center',
                title: '所属体系',
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	
                	if(value.isDelete==1){
                		return "<font color='red'>"+value.hierarchyName+"</font>";
                	}
                	return value.hierarchyName;
                }
            }, {
                field: 'agent',
                title: '经销商编号',
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.agentId;
                	}
                	if(value.isDelete==1){
                		return "";
                	}
                	return '';
                }
            },{
                field: 'agent',
                valign: 'middle',
                align: 'center',
                title: '所属经销商',
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	
                	if(value.isDelete==1){
                		return "<font color='red'>"+value.agentName+"</font>";
                	}
                	return value.agentName;
                }
            },{
                field: 'province',
                title: '省编号',
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.areacode;
                	}
                	return '';
                }
            },{
                field: 'province',
                valign: 'middle',
                align: 'center',
                title: '所属省',
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.areaname;
                	}
                	return '无';
                }
            },{
                field: 'city',
                title: '市编号',
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.areacode;
                	}
                	return '';
                }
            },{
                field: 'city',
                valign: 'middle',
                align: 'center',
                title: '所属市',
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.areaname;
                	}
                	return '无';
                }
            },{
                field: 'district',
                title: '区编号',
                class:"hidden",
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.areacode;
                	}
                	return '';
                }
            },{
                field: 'district',
                valign: 'middle',
                align: 'center',
                title: '所属区',
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value.areaname;
                	}
                	return '无';
                }
            },{
                field: 'terminalAddress',
                valign: 'middle',
                align: 'center',
                title: '详细地址',
                formatter: function (value, row, index) {
                	if(value!=null){
                		return value;
                	}
                	return '';
                }
            },  {
                field: 'terminalStatus',
                class:"hidden",
                title: '终端类型ID'
            },{
                field: 'terminalStatus',
                valign: 'middle',
                align: 'center',
                title: '终端类型',
                formatter: function (value, row, index) {
                	var result="";
                	if(value==0){
                		result="待开发";
                	}else if(value==1){
                		result="正式";
                	}
                	return result;
                }
            },  {
                field: 'planDate',
                valign: 'middle',
                align: 'center',
                title: '计划开发时间',
                formatter: function (value, row, index) {
                	if(value!=null){
                		return  new Date(parseInt(value)).Format('yyyy-MM-dd');	
                	}
                	return "无";
                }
            },{
                field: 'productCategoryIds',
                title: '主营产品组',
                class:"hidden",
            },{
                field: 'productCategoryIds',
                title: '主营产品组',
                //class:"hidden",
                formatter: function (value, row, index) {
                	if(value!=null){
                		var productStr = "";
                		var productCategoryIds=value.split(",");
						for(var i=0;i<productCategoryIds.length;i++){
							var product = "";
							if(productCategoryIds[i]=="1"){
								product = "小分子水";
							}
							if(productCategoryIds[i]=="2"){
								product = "袋装水";
							}
							if(productCategoryIds[i]=="3"){
								product = "拉罐";
							}
							if(productCategoryIds[i]=="4"){
								product = "酒";
							}
							if(productCategoryIds[i]=="5"){
								product = "茶珍";
							}
							if(productCategoryIds[i]=="6"){
								product = "传统茶";
							}
							if(productCategoryIds[i]=="7"){
								product = "其他";
							}
							if(i==0){
								productStr = product;
							}else{
								productStr = productStr+","+product;
							}
						}
						return productStr;
                	}
                	return "无";
                }
            },{
                field: 'agent',
                class:"hidden",
                title: '所属经销商',
                formatter: function (value, row, index) {
                	if(value==null){
                		return '无';
                	}
                	
                	if(value.isDelete==1){
                		return "无";
                	}
                	if(value.erpCode!=null){
                		return value.erpCode+"-"+value.agentName;
                	}else{
                		return value.agentName;
                	}
                	
                }
            }],
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
	
	function showAddTerminal() {
		selectHierarchy();
		$('#terminalStatus').removeAttr("disabled");
		$(".agentId").val("");
		$('#terminalId').text(generateId(1));
		$('#terminalName').val('');
		$('#terminalType').val('');
		$('#erpCode').val('');
		$('#stationId').val('');
		$('#terminalAddress').val('');
		$('#channelId').val('');
		$('#hierarchyId').val('');
		$('#cagentId').val('');
		$('#terminalStatus').val('');
		$('#planDate').val('');
		$("input[name='productCategoryId']").removeAttr("checked");
		
		$('#addBtn').show();
		$('#editBtn').hide();
		
		$('#modalTitle').text('新增终端');
		$("#modal-terminalComment").modal("show");
	}
	
	function validateParam(){
		var terminalName=$('#terminalName').val();
		var terminalType=$('#terminalType').val();
		var stationCode=$('#stationId').val();
		var channelId=$('#channelId').val();
		var hierarchyId=$('#hierarchyId').val();
		var agentId=$('#cagentId').val();
		var terminalStatus=$('#terminalStatus').val();
		var planDate=$('#planDate').val();
		var erpCode = $('#erpCode').val();
		
		if(terminalName==null||terminalName==''){
			bootbox.alert("终端名称不能为空");
			$('#terminalName').focus();
			return false;
		}
		
		if(terminalType==null||terminalType==''){
			bootbox.alert("客户类型不能为空");
			$('#terminalType').focus();
			return false;
		}

		if(stationCode==null||stationCode==''){
			bootbox.alert("岗位不能为空");
			$('#stationId').focus();
			return false;
		}
		
		if(agentId==null||agentId==''){
			bootbox.alert("经销商不能为空");
			$('#agentId').focus();
			return false;
		}
		
		if(hierarchyId==null||hierarchyId==''){
			bootbox.alert("体系不能为空");
			$('#hierarchyId').focus();
			return false;
		}
		
		if(channelId==null||channelId==''){
			bootbox.alert("渠道不能为空");
			$('#channelId').focus();
			return false;
		}
		
		if(terminalStatus==null||terminalStatus==''){
			bootbox.alert("请选择终端开发状态");
			$('#terminalStatus').focus();
			return false;
		}else{
			if(terminalStatus==0&&(planDate==null||planDate=='')){
				bootbox.alert("因为该终端为计划终端，所以计划开发时间不能为空");
				$('#planDate').focus();
				return false;
			}
			if(terminalStatus==1&&terminalType==0&&(erpCode==null||erpCode=='')){
				bootbox.alert("正式个人用户必须填写ERP编号");
				$('#erpCode').focus();
				return false;
			}
			if(terminalStatus==0&&(erpCode!=='')){
				bootbox.alert("待开发终端不能填写ERP编号");
				return false;
			}
		}
		var c = 0;
		$("input[name='productCategoryId']").each(function() {
			if ($(this).is(":checked")) {
				c++;
			}
		});
		if(c==0){
			bootbox.alert("请选择主营产品组");
			return false;
		}
		
		return true;
	}
	
	function addTerminal(){
		var terminalId=$('#terminalId').html();
		var terminalName=$('#terminalName').val();
		var terminalType=$('#terminalType').val();
		var erpCode=$('#erpCode').val();
		var stationCode=$('#stationId').val();
		var channelId=$('#channelId').val();
		var hierarchyId=$('#hierarchyId').val();
		var agentId=$('#cagentId').val();
		var planDate=$('#planDate').val();
		var terminalStatus=$('#terminalStatus').val();
		
		var province=$('#province').val();
		var city=$('#city').val();
		var district=$('#district').val();
		var terminalAddress=$('#terminalAddress').val();
		
		var productCategoryIds = [];
		$("input[name='productCategoryId']").each(function() {
			if ($(this).is(":checked")) {

				var id = $(this).val();
				productCategoryIds.push(id);
			}
		});
		var isAdd=validateParam();
		if(isAdd){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : '<%=request.getContextPath()%>/terminal/addTerminal',
				data : {
					'terminalId':terminalId,
					'terminalName':terminalName,
					'terminalType':terminalType,
					'erpCode':erpCode,
					'stationCode':stationCode,
					'channelId':channelId,
					'hierarchyId':hierarchyId,
					'agentId':agentId,
					'terminalStatus':terminalStatus,
					'planDate':planDate,
					'province':province,
					'city':city,
					'district':district,
					'terminalAddress':terminalAddress,
					'productCategoryIds':productCategoryIds
				},
				traditional : true,
				dataType : 'JSON',

				success : function(data) {

					if (data.status) {
						bootbox.alert(data.msg);
						loadTerminalPage($('#currentPage').val(), $('#limit').val());
						$("#modal-terminalComment").modal("hide");
					} else {
						bootbox.alert(data.msg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					bootbox.alert(ERROR_MSG);
				}
			});
		}
		
	}
	
	function delTerminal() {
		var terminalIds = [];
		$("input[name='subBox']").each(function() {
			if ($(this).is(":checked")) {

				var tr = $(this).parent().parent();
				var a = tr.children();

				terminalIds.push(a.eq(1).text());
			}
		});

		if (terminalIds.length > 0) {
			bootbox.confirm({  
		        buttons: {  
		            confirm: {  
		                label: '确认',  
		                className: 'btn-primary'  
		            },  
		            cancel: {  
		                label: '取消',  
		                className: 'btn-default'  
		            }  
		        },  
		        message: '你确定要删除终端吗?!',  
		        callback: function(result) {  
		            if(result) {  
		            	$.ajax({
		    				//提交数据的类型 POST GET
		    				type : "POST",
		    				//提交的网址
		    				url : '<%=request.getContextPath()%>/terminal/delTerminal',
		    				data : {
		    					'terminalIds' : terminalIds
		    				},
		    				traditional : true,
		    				dataType : 'JSON',

		    				success : function(data) {

		    					if (data.status) {
		    						bootbox.alert(data.msg);
		    						loadTerminalPage($('#currentPage').val(), $('#limit').val());
		    					} else {
		    						bootbox.alert(data.msg);
		    					}
		    				},
		    				error : function(XMLHttpRequest, textStatus, errorThrown) {
		    					bootbox.alert(ERROR_MSG);
		    				}
		    			});
		            }  
		        },  
		        });
		} else {
			bootbox.alert('请选择具体终端后删除');
		}

	}
	
	function showEditTerminal(){
		$("#province").html('');
		$("#city").html('');
		$("#district").html('');
		$("input[name='productCategoryId']").removeAttr("checked");
		if($("input[name='subBox']:checked").length==1){
			$("input[name='subBox']").each(function() {
				if ($(this).is(":checked")) {
					
					var tr = $(this).parent().parent();
					var a = tr.children();	
					$('#terminalId').text(a.eq(1).text());
					$('#terminalName').val(a.eq(2).text());
					$('#terminalType').val(a.eq(3).text());
					$('#erpCode').val(a.eq(5).text());
					//alert(a.eq(6).text());
					$('#stationId').val(a.eq(6).text());
					// $(".agentId").find("option[value='"+a.eq(14).text()+"']").attr("selected",true);
					$('#cagentId').val(a.eq(14).text());
					$('.agentId').val(a.eq(28).text());
					//$('.col-sm-4').find(".agentId").val(a.eq(14).text());
					/* $('#channelId').val(a.eq(10).text());
					$('#hierarchyId').val(a.eq(12).text()); */
					$('#terminalAddress').val(a.eq(22).text());
					$('#terminalStatus').val(a.eq(23).text());
					if(a.eq(24).text()=='正式'){
						$('#terminalStatus').attr("disabled","true");
						$('#isShowPlanDate').hide();
					}else{
						$('#terminalStatus').removeAttr("disabled");
						$('#isShowPlanDate').show();
						if(a.eq(25).text()!="无"){
							$('#planDate').val(a.eq(25).text());
						}
					}
					selectHierarchy1(a.eq(12).text(),a.eq(10).text());
					
					selectProvince(a.eq(16).text(),a.eq(18).text(),a.eq(20).text());

					var productCategoryIds=a.eq(26).text().split(",");
					if(productCategoryIds!=null&&productCategoryIds.length>0){
						$("input[name='productCategoryId']").each(function(){
							var id = $(this).val();
							for(var i=0;i<productCategoryIds.length;i++){
								if(id==productCategoryIds[i]){
									$(this).prop("checked",'true');
								}
							}
						});
					}
					
					$('#addBtn').hide();
					$('#editBtn').show();
					$('#modalTitle').text('修改终端');
					$("#modal-terminalComment").modal("show");
				}
			});
		}else if($("input[name='subBox']:checked").length==0){
			bootbox.alert('请至少选择一个终端！');
		}else{
			bootbox.alert('不可以选择多个终端！');
		}
	}
	
	function editTerminal(){
		var terminalId=$('#terminalId').html();
		var terminalName=$('#terminalName').val();
		var terminalType=$('#terminalType').val();
		var erpCode=$('#erpCode').val();
		var stationCode=$('#stationId').val();
		var channelId=$('#channelId').val();
		var hierarchyId=$('#hierarchyId').val();
		var agentId=$('#cagentId').val();
		var planDate=$('#planDate').val();
		var terminalStatus=$('#terminalStatus').val();
		
		var province=$('#province').val();
		var city=$('#city').val();
		var district=$('#district').val();
		var terminalAddress=$('#terminalAddress').val();
		
		var productCategoryIds = [];
		$("input[name='productCategoryId']").each(function() {
			if ($(this).is(":checked")) {

				var id = $(this).val();
				productCategoryIds.push(id);
			}
		});
		var isAdd=validateParam();
		
		if(isAdd){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : '<%=request.getContextPath()%>/terminal/editTerminal',
				data : {
					'terminalId':terminalId,
					'terminalName':terminalName,
					'terminalType':terminalType,
					'erpCode':erpCode,
					'stationCode':stationCode,
					'channelId':channelId,
					'hierarchyId':hierarchyId,
					'agentId':agentId,
					'terminalStatus':terminalStatus,
					'planDate':planDate,
					'province':province,
					'city':city,
					'district':district,
					'terminalAddress':terminalAddress,
					'productCategoryIds':productCategoryIds
				},
				traditional : true,
				dataType : 'JSON',

				success : function(data) {

					if (data.status) {
						bootbox.alert(data.msg);
						$("#modal-terminalComment").modal("hide");
						loadTerminalPage($('#currentPage').val(), $('#limit').val());
						
					} else {
						bootbox.alert(data.msg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					bootbox.alert(ERROR_MSG);
				}
			});
		}
		
	}
	
	function parseShowPlanDate(){
		var terminalStatus=$('#terminalStatus').val();
		if(terminalStatus==1){
			$('#isShowPlanDate').hide();
		}else{
			$('#isShowPlanDate').show();
		}
		$('#planDate').val('');
	}
	
	function turnTerminal(){
		if($("input[name='subBox']:checked").length>0){
			var terminalIds = [];
			$("input[name='subBox']").each(function() {
				if ($(this).is(":checked")) {
					var tr = $(this).parent().parent();
					var a = tr.children();	
					
					if(a.eq(23).text()==0){
						terminalIds.push(a.eq(1).text());
					}else{
						bootbox.alert("不能选择已是正式的终端");
						return;
					}
				}
			});
			
			if (terminalIds.length > 0) {
				bootbox.confirm({  
			        buttons: {  
			            confirm: {  
			                label: '确认',  
			                className: 'btn-primary'  
			            },  
			            cancel: {  
			                label: '取消',  
			                className: 'btn-default'  
			            }  
			        },  
			        message: '你确定要这些终端转正式吗!',  
			        callback: function(result) {  
			            if(result) {  
			            	$.ajax({
								//提交数据的类型 POST GET
								type : "POST",
								//提交的网址
								url : '<%=request.getContextPath()%>/terminal/turnTerminal',
								data : {
									'terminalIds' : terminalIds
								},
								traditional : true,
								dataType : 'JSON',
								success : function(data) {
									if (data) {
										bootbox.alert("更新成功");
									} else {
										bootbox.alert("更新失败");
									}
									loadTerminalPage($('#currentPage').val(), $('#limit').val());
								},
								error : function(XMLHttpRequest,textStatus, errorThrown) {
									bootbox.alert(ERROR_MSG);
								}
							});
			            }  
			        },  
			        });
			}
		} else if ($("input[name='subBox']:checked").length == 0) {
			bootbox.alert('请至少选择一个终端！');
		}
	}
	function importTerminal(){
		 var url = '<%=request.getContextPath()%>/terminal/importTerminalExcel';  //   /** 使用ajaxFileUpload */
		    $.ajaxFileUpload({
		        url: url, //用于文件上传的服务器端请求地址
		        secureuri: false, //是否需要安全协议，一般设置为false
		        fileElementId: 'upload_file', //文件上传域的ID  就是选定文件的 type=file的input框的id  ajaxFileUpload 会帮我们把他分装到ajax请求的 携带对象域中去
		        dataType: 'json', //返回值类型 一般设置为json
		        type: 'post',
		        success:function(data){
		        	if (data.status) {
		        		bootbox.alert(data.msg);
		        		$("#modal-importExcel").modal("hide");
						loadTerminalPage($('#currentPage').val(), $('#limit').val());
					} else {
						bootbox.alert(data.msg);
					}
		        },
		        error:function(data, status, e){ //服务器响应失败时的处理函数
		        	bootbox.alert(ERROR_MSG);
				}
		    })
	}

	function importExcel(){
		$('#modalTitle1').text('批量导入');
		$("#modal-importExcel").modal("show");
	}
	
	/**
  * 显示上传文件名称
  * @param fileObj
  */
 function selectUploadFile(fileObj){
     var fullPath = $(fileObj).val();
     var index = fullPath.lastIndexOf('\\') + 1;
     var fileName = fullPath.substring(index);
     $('input[name="upload_filename"]').val(fileName);
 }
 function toExportTerminal(){
	 window.location.href = '<%=request.getContextPath()%>/terminal/toExportTerminal';
}
	
</script>
<input type="hidden" id="currentPage" />
<input type="hidden" id="limit" />

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">终端管理</li>
	</ol>
</div>
<!--/.row-->

<!-- <div class="row">
	<div class="col-lg-12">
		 <h3 class="page-header">终端管理</h3> 
	</div>
</div> -->
<!--/.row-->
<br/>
<fieldset>
	<legend>查询条件</legend>
	<div class="will">

		<div style="text-align: center;">
			<div class="form-group">
				<label for="textfield" class="control-label col-sm-2">终端编号:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="queryTerminalCode">
				</div>
				<label for="textfield" class="control-label col-sm-2">终端名称:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="queryTerminalName">
				</div>

			</div>

			<div class="form-group">
				<label for="textfield" class="control-label col-sm-2">终端类型:</label>
				<div class="col-sm-4">
					<select id="queryTerminalType" class="form-control">
						<option></option>
						<option value="0">个人</option>
						<option value="1">非个人</option>
					</select>
				</div>
				
				<label for="textfield" class="control-label col-sm-2">开发状态:</label>
				<div class="col-sm-4">
					<select id="queryTerminalStatus" class="form-control">
						<option></option>
						<option value="0">待开发</option>
						<option value="1">正式</option>
					</select>
				</div>

			</div>
			
			<div class="form-group">
				<label for="textfield" class="control-label col-sm-2">渠道:</label>
				<div class="col-sm-4">
				
					<select id="queryChannelId" class="form-control">
								<option></option>
								<c:if test="${not empty channelList}">
									<c:forEach var="channel" items="${channelList}">
										<option value="${channel.channelId}">${channel.channelName}</option>
									</c:forEach>
								</c:if>
							</select>
				</div>
				
				<label for="textfield" class="control-label col-sm-2">体系:</label>
				<div class="col-sm-4">
					<select id="queryHierarchyId" class="form-control">
								<option></option>
								<c:if test="${not empty hierarchyList}">
									<c:forEach var="hierarchy" items="${hierarchyList}">
										<option value="${hierarchy.hierarchyId}">${hierarchy.hierarchyName}</option>
									</c:forEach>
								</c:if>
							</select>

				</div>

			</div>
			
			<div class="form-group">
				<label for="textfield" class="control-label col-sm-2">所属业务员:</label>
				<div class="col-sm-4">
					<select id="queryAgent" class="form-control combobox">
						<option></option>
						<c:if test="${not empty userList}">
									<c:forEach var="user" items="${userList}">
										<option value="${user.id}">${user.username}</option>
									</c:forEach>
								</c:if>
					</select>
				</div>
			</div>
			<div class="form-group col-sm-12">
				<button id="queryButton" class="btn btn-primary"
				style="margin-top: 10px;width:100px;" onClick="loadTerminalPage(1,10)">查询</button>
			</div>

		</div>

	</div>
</fieldset>

<fieldset>
	<legend>查询内容</legend>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<!-- 	<div class="panel-heading">Advanced Table</div> -->
				<div class="panel-body">
					<div id="toolbar1" class="btn-group">
						<shiro:hasPermission name="master.terminal.add">
							<button id="btn_add" type="button" class="btn btn-default"
								onclick="showAddTerminal()">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
							</button>
						</shiro:hasPermission>
						<shiro:hasPermission name="master.terminal.edit">
							<button id="btn_edit" type="button" class="btn btn-default"
								onclick="showEditTerminal()">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
							</button>
						</shiro:hasPermission>
						<shiro:hasPermission name="master.terminal.delete">
							<button id="btn_delete" type="button" class="btn btn-default"
								onclick="delTerminal()">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
							</button>
						</shiro:hasPermission>
						<%-- <shiro:hasPermission name="master.terminal.turnformal">
							<button id="btn_delete" type="button" class="btn btn-default"
								onclick="turnTerminal()">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>转正式
							</button>
						</shiro:hasPermission> --%>
						<shiro:hasPermission name="master.terminal.import">
							<button id="btn_import" type="button" class="btn btn-default"
								onClick='importExcel()'>
								<span class="glyphicon glyphicon-open" aria-hidden="true"></span>导入
							</button>

						</shiro:hasPermission>
						<shiro:hasPermission name="master.terminal.export">
							<button id="btn_export" type="button" class="btn btn-default"
								onclick='toExportTerminal()'>
								<span class="glyphicon glyphicon-save" aria-hidden="true"></span>导出
							</button>
							<br />
							<br />
						</shiro:hasPermission>
					</div>

					<shiro:hasPermission name="master.terminal.query">
						<table data-show-refresh="false" data-show-toggle="false"
							data-show-columns="false" data-switchable="true"
							data-select-item-name="subBox" data-pagination="true"
							data-sort-order="desc" id="table" class="table table-hover" style="width:2200px;">
						</table>
					</shiro:hasPermission>
				</div>
			</div>
		</div>
	</div>
</fieldset>
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
					class="btn btn-success pdlr16"  onclick="importTerminal()">
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

<!--------------------------------------------------修改备注对话框------------------------------------------------------->
<div id="modal-terminalComment" class="modal fade" role="dialog"
	data-backdrop="static">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="modalTitle"></h4>
			</div>
			<!-- /.modal-header -->
			<div class="modal-body">
				<div class="form-horizontal" role="form">
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">终端编号:</label>
						<div class="col-sm-4">
							<label id="terminalId" style="margin-top:6px;"></label>
						</div>
						<label for="textfield" class="control-label col-sm-2">终端名称:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="terminalName">
						</div>
					</div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">是否个人客户:</label>
						<div class="col-sm-4">
							<select id="terminalType" class="form-control">
								<option></option>
								<option value="0">是</option>
								<option value="1">否</option>
							</select>
						</div>
						<label for="textfield" class="control-label col-sm-2">ERP编号:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="erpCode">
						</div>
					</div>

					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">所属岗位:</label>
						<div class="col-sm-4">
							<select id="stationId" class="form-control">
								<option></option>
								<c:if test="${not empty stationList}">
									<c:forEach var="station" items="${stationList}">
										<c:choose>
										  <c:when test="${empty station.user.id}">   
										   <option value="${station.stationCode}">${station.stationName}-无</option>
										  </c:when> 
										  <c:otherwise>   
										   <option value="${station.stationCode}">${station.stationName}-${station.user.username}</option>
										  </c:otherwise> 
										</c:choose>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<label for="textfield" class="control-label col-sm-2">所属经销商:</label>
						<div class="col-sm-4">
							<select id="agentId" class="form-control agentId combobox" onchange="setAgent(this)">
								<option></option>
								<c:if test="${not empty agentList}">
									<c:forEach var="agent" items="${agentList}">
									<c:choose> 
									  <c:when test="${empty agent.erpCode}">   
										   <option value='${agent.agentId}'>${agent.agentName}</option>
										  </c:when> 
										  <c:otherwise>   
										   <option value='${agent.agentId}'>${agent.erpCode}-${agent.agentName}</option>
										  </c:otherwise> 
										</c:choose>
										
									</c:forEach>
								</c:if>
							</select>
							<input type="hidden" id="cagentId" value=""/>
						</div>
						
					</div>

					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">终端开发状态:</label>
						<div class="col-sm-4">
							<select id="terminalStatus" class="form-control"
								onchange="parseShowPlanDate()">
								<option></option>
								<option value="0">待开发</option>
								<option value="1">正式</option>
							</select>
						</div>
						<div id="isShowPlanDate">
							<label for="textfield" class="control-label col-sm-2">计划开发时间:</label>
							<div class="col-md-4">
								<div class="input-group date form_datetime col-md-15"
									data-link-field="dtp_input1">
									<input class="form-control" type="text" value="" readonly
										id="planDate"> <span class="input-group-addon"><span
										class="glyphicon glyphicon-remove"></span></span> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-calendar"></span></span>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">所属体系:</label>
						<div class="col-sm-4">
							<select id="hierarchyId" class="form-control" onchange="selectChannel()">
								<option></option>
								<c:if test="${not empty hierarchyList}">
									<c:forEach var="hierarchy" items="${hierarchyList}">
										<option value="${hierarchy.hierarchyId}">${hierarchy.hierarchyName}</option>
									</c:forEach>
								</c:if>
							</select>

						</div>
						<label for="textfield" class="control-label col-sm-2">所属渠道:</label>
						<div class="col-sm-4">
							<select id="channelId" class="form-control">
								<%-- <option></option>
								<c:if test="${not empty channelList}">
									<c:forEach var="channel" items="${channelList}">
										<option value="${channel.channelId}">${channel.channelName}</option>
									</c:forEach>
								</c:if> --%>
							</select>

						</div>
					</div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">地区:</label>
						<div class="col-sm-10">
							<jsp:include page="../common/address.jsp" />
						</div>
					</div>

					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">地址:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="terminalAddress">
						</div>
					</div>

					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">主营产品组:</label>
						<div class="col-sm-10">
							<c:if test="${not empty productCategoryList}">
								<c:forEach var="productCategory" items="${productCategoryList}">
									<label class="checkbox col-sm-3"> <input type="checkbox"
										value="${productCategory.id}" name="productCategoryId">${productCategory.name}
									</label>
								</c:forEach>
							</c:if>

						</div>
					</div>
				</div>
			</div>

			<!-- /.modal-body -->
			<div class="modal-footer">
				<button id="addBtn" type="button" class="btn btn-primary"
					onclick='addTerminal()'>新增</button>
				<button id="editBtn" type="button" class="btn btn-primary"
					onclick='return editTerminal()'>修改</button>
				<button id="delBtn" type="button" class="btn btn-primary"
					data-dismiss="modal">取 消</button>
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<script type="text/javascript">
	function setAgent(temp){
		var agentId = $(temp).find("option:selected").val();
		$("#cagentId").val(agentId);
	}
	function selectHierarchy(){
		$("#hierarchyId").html('');
		$.ajax(
		        {
		            type: "get",
		            url: '<%=request.getContextPath()%>/hierarchy/queryHierarchy',
		            success: function (msg) {
		            	var json =msg;
		            	console.log(msg);
		            	$("#hierarchyId").append("<option></option>");
		                for (var i = 0; i < json.length; i++) {
		                	$("#hierarchyId").append("<option value=" + json[i].hierarchyId + " >" + json[i].hierarchyName + "</option>");
		                }
		                //selectChannel();
		            }
		        });
		
	}
	
	function selectChannel1(hierarchyId,channelId){
		$("#channelId").html('');
		$.ajax(
		        {
		            type: "get",
		            url: '<%=request.getContextPath()%>/channel/queryChannelByHierarchyId',
		            data: {"hierarchyId":hierarchyId},
		            success: function (msg) {
		            	var json =msg;
		                for (var i = 0; i < json.length; i++) {
		                   	if(json[i].channelId == channelId) {
		                   		$("#channelId").append("<option value=" + json[i].channelId + " selected=selected>" + json[i].channelName + "</option>");
		                    }else{
		                    	$("#channelId").append("<option value=" + json[i].channelId + " >" + json[i].channelName + "</option>");
		                    }
		                }
		            }
		        });
	}
	
	function selectHierarchy1(hierarchyId,channelId){
		$("#hierarchyId").html('');
		$.ajax(
		        {
		            type: "get",
		            url: '<%=request.getContextPath()%>/hierarchy/queryHierarchy',
		            data: {"hierarchyId":hierarchyId},
		            success: function (msg) {
		            	var json =msg;
		                for (var i = 0; i < json.length; i++) {
		                	if(json[i].hierarchyId == hierarchyId) {
		                		$("#hierarchyId").append("<option value=" + json[i].hierarchyId + " selected=selected>" + json[i].hierarchyName + "</option>");
		                    }else{
		                    	$("#hierarchyId").append("<option value=" + json[i].hierarchyId + " >" + json[i].hierarchyName + "</option>");
		                    }
		                	
		                }
		                selectChannel1(hierarchyId,channelId);
		            }
		        });
	}
	
	function selectChannel(){
		$("#channelId").html('');
		$.ajax(
		        {
		            type: "get",
		            url: '<%=request.getContextPath()%>/channel/queryChannelByHierarchyId',
		            data: {"hierarchyId":$("#hierarchyId").val()},
		            success: function (msg) {
		            	var json =msg;
		            	$("#channelId").append("<option></option>");
		                for (var i = 0; i < json.length; i++) {
		                	$("#channelId").append("<option value=" + json[i].channelId + " >" + json[i].channelName + "</option>");
		                   /*  if(json[i].areacode == province) {
		                        $("#province").append("<option value=" + json[i].areacode + " selected=selected>" + json[i].areaname + "</option>");
		                    }else{
		                        $("#province").append("<option value=" + json[i].areacode + ">" + json[i].areaname + "</option>");
		                    } */
		                }
		            }
		        });
	}
	$('.form_datetime').datetimepicker({
		language:"zh-CN",
		format : 'yyyy-mm-dd',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 2,
		forceParse : 0,
		showMeridian : 1,
		startDate:new Date()
	});
</script>