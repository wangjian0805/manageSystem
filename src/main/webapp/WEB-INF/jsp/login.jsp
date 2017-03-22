<%@ page language="java" pageEncoding="UTF-8"%>  
<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">  
window.onload=reloadVerifyCode;
window.onresize = function(){
	location.reload();
}
function reloadVerifyCode(){  
    document.getElementById('verifyCodeImage').setAttribute('src', '${pageContext.request.contextPath}/security/getVerifyCodeImage');  
}  
 
</script>  
 <title>Deepure Flow</title>
<div class="main">
  <div class="denglu">
  
    <div class="text"><h1 class="threed">帝泊洱流向管理系统</h1> <br />
    
    </div>
    <div class="dlk">
    <form action="<%=request.getContextPath()%>/security/login" method="POST">  
      <table width="300" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="76" colspan="3"></td>
        </tr>
        <tr>
          <td width="80" style="font-size:14px;">员工编号：</td>
          <td colspan="2"><input name="userCode" type="text" class="dlinput" /></td>
        </tr>
        <tr>
          <td height="16" colspan="3"></td>
        </tr>
        <tr>
          <td style="font-size:14px;">密码：</td>
          <td colspan="2"><input name="password" type="password" class="dlinput" autocomplete="off" /></td>
        </tr>
        <tr>
          <td height="16" colspan="3"></td>
        </tr>
        <tr>
          <td style="font-size:14px;">验证码</td>
          <td width="100"><input name="verifyCode" type="text" class="dlinput" style="width:90px;" maxlength="4" /></td>
          <td width="127"><img src="<%=request.getContextPath()%>/mydemo/getVerifyCodeImage" width="98" height="27" id="verifyCodeImage" onclick="reloadVerifyCode()" /></td>
        </tr>
        <tr>
          <td height="16" colspan="3"><div style="color:red; font-size:15px;">${message_login}</div></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2"><input type="submit" value="登 录" class="loginbtn" /></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2"><table width="224" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <!-- <td height="24"><a href="#none" class="mm">忘记登录密码？</a></td> -->
            <!--   <td align="right"><a href="#none" class="zc" style="font-size:13px;">立即网上注册</a></td> -->
            </tr>
          </table></td>
        </tr>
      </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
	document.onkeydown=function(event){ 
	    var e = event || window.event || arguments.callee.caller.arguments[0]; 
	     if(e && e.keyCode==13){ // enter 键 
			$(".loginbtn").trigger("click");
	     };
	}
	$(function(){
		//alert($(window).height());
		$(".main").height($(window).height());
		$(".main").width($(window).width());
		$(".denglu").height($(window).height());
		$(".denglu").width($(window).width());
	});
	
</script>