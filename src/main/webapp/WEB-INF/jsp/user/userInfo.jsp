<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		<li class="active">用户信息</li>
	</ol>
</div>
<!--/.row-->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">用户信息</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!-- 	<div class="panel-heading">Advanced Table</div> -->
			<div class="panel-body">
				
				<!-- <br /> <br /> -->
				<%-- <jsp:include  page="../common/address.jsp"/>  --%>
				
      		<div class="box">
					<div class="box-title">
							<i class="fa fa-edit"></i> <span style="font-size:22px;margin-right:15px;vertical-align:middle;">基本信息</span>
						<div id="toolbar1" class="btn-group">
							<button id="btn_add" type="button" class="btn btn-default"
								onclick='showEditPassword()'>
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改密码
							</button>
						</div>
						<!-- <div class="actions">
							<a href="#" class="btn btn-mini content-slideUp"> <i
								class="fa fa-angle-down"></i>
							</a>
						</div> -->
						<hr/>
					</div>
					<div class="box-content">
						<div class='form-horizontal'>
							<div class="col-sm-6">
								<div class="form-group order-query-text">
									<label for="textfield" class="control-label col-sm-4">用户编号:
									</label>
									<div class="col-sm-8">
										<span class="form-control kno-border">${user.id}</span>
									</div>
								</div>
								<div class="form-group order-query-text">
									<label for="textfield" class="control-label col-sm-4">是否激活
									</label>
									<div class="col-sm-8">
										<span class="form-control kno-border">
										<c:choose> 
										    <c:when test="${user.isactive==false}">未激活</c:when> 
										    <c:when test="${user.isactive==true}">已激活</c:when> 
										</c:choose>
										</span>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group order-query-text">
									<label for="textfield" class="control-label col-sm-4">姓名:
									</label>
									<div class="col-sm-8">
										<span class="form-control kno-border">${user.username}</span>
									</div>
								</div>
								<div class="form-group order-query-text">
									<label for="textfield" class="control-label col-sm-4">对应角色:
									</label>
									<div class="col-sm-8">
										<span class="form-control kno-border" id="roleName">${user.role.name}</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
<!--/.row-->
<form id="modifyUserPassword" action="<%=request.getContextPath()%>/member/modifyPassword" method="POST" class="form-horizontal">
<div id="modal-passcode" class="modal fade" role="dialog" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"  aria-hidden="true" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <!-- /.modal-header -->
            <div class="modal-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-sm-3">原密码 :</label>
                        <div class="col-sm-8">
                            <input id="oldPwd" name="oldPwd" type="password" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">新密码 :</label>

                        <div class="col-sm-8">
                            <input id="password" name="password" type="password" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">再次输入密码 :</label>

                        <div class="col-sm-8">
                            <input id="confirmPassword" name="confirmPassword" type="password" class="form-control"/>
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="control-label col-sm-3"></label>
						<div class="col-sm-8">
							<label class="control-label" id="errors"></label>
						</div>
                    </div>
                </div>
            </div>
            <!-- /.modal-body -->
            <div class="modal-footer">
            	<button type="button" id="savePassword" class="btn btn-primary">保 存</button>
                <button type="button" class="btn btn-default"  onclick="cancel()">取 消</button>
            </div>
            <!-- /.modal-footer -->
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
</form>

<script type="text/javascript">
$(function(){
	
	$("#savePassword").click(function(){
			var password=$("#password").val();
			var confirmPassword=$("#confirmPassword").val();
			var oldPassword=$("#oldPwd").val();
			$.ajax({
				url : "<%=request.getContextPath()%>/user/modifyUserPassword",
				type: 'POST',
				dataType : 'json',
				data : {
					oldPwd :oldPassword,
					password:password,
					confirmPassword:confirmPassword
				},
				success : function(data) {
					if(data.status){
						$("#errors").text(data.msg);
					}else{
						bootbox.alert('密码修改成功');
						$("#errors").text("");
						$("#modal-passcode").modal("hide");
					}
				},
				error : function(errmsg) {
					bootbox.alert(ERROR_MSG);
				}
			})
		});
		

	 $("#modifyUserPassword").validate({
        rules:{
        	oldPwd:{
        		required : true
        	},
        	password:{
        		required : true,
        		notEqualTo :"#oldPwd"
        	},
        	confirmPassword:{
        		required : true,
        		equalTo :"#password"
        	}
        },
        messages:{
        	oldPwd:{
        		required : "请填写原密码"
        	},
        	password:{
        		required : "请填写新密码",
        		notEqualTo :"原密码和新密码不能相同"
        	},
        	confirmPassword:{
        		required : "请填写确认密码",
        		equalTo :"确认密码和新密码不同"
        	}
        }
	 }); 
	 jQuery.validator.addMethod("notEqualTo", function(value, element, param) {
		return value != $(param).val();
	}, $.validator.format("两次输入不能相同!"));
})
	
	function cancel(){
		$("#errors").text("");
		$("#modal-passcode").modal("hide");
	}
	
	function showEditPassword(){
		$('#oldPwd').val('');
		$('#password').val('');
		$('#confirmPassword').val('');

		$("#modal-passcode").modal("show");
	}
</script>