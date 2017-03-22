
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Deepure Flow</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/datepicker3.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-table.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/styles.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-combobox.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">
<link
	href="<%=request.getContextPath()%>/css/jquery.msgbox.css"
	rel="stylesheet" media="screen">
<link
	href="<%=request.getContextPath()%>/css/fileinput.min.css"
	rel="stylesheet" media="screen">
<!-- <link href="//cdn.bootcss.com/Ladda/1.0.0/ladda-themeless.min.css" rel="stylesheet">
<link href="//cdn.bootcss.com/Ladda/1.0.0/ladda.min.css" rel="stylesheet">
	
<SCRIPT type=text/javascript src="http://code.jquery.com/jquery-latest.min.js"></SCRIPT> -->
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.msgbox.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.dragndrop.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
<script src="<%=request.getContextPath()%>/js/vue.min.js"></script>

<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/chart.min.js"></script>
<script src="<%=request.getContextPath()%>/js/chart-data.js"></script>
<script src="<%=request.getContextPath()%>/js/easypiechart.js"></script>
<script src="<%=request.getContextPath()%>/js/easypiechart-data.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-combobox.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.js"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>	
<script src="<%=request.getContextPath()%>/js/bootstrap-table.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.bootbox.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=request.getContextPath()%>/js/fileinput.min.js"></script>
<script src="<%=request.getContextPath()%>/js/ajaxfileupload.js"></script>
<!-- <script src="//cdn.bootcss.com/Ladda/1.0.0/ladda.min.js"></script>
<script src="//cdn.bootcss.com/Ladda/1.0.0/spin.min.js"></script> -->

<script type="text/javascript">
	$(document).ready(function() { 
		$('.combobox').combobox()
	});
	/**
	 * 删除左右两端的空格
	 */
	String.prototype.trim = function() {
		return this.replace(/(^\s*)|(\s*$)/g, '');
	}
	/**
	 * 删除左边的空格
	 */
	String.prototype.ltrim = function() {
		return this.replace(/(^\s*)/g, '');
	}
	/**
	 * 删除右边的空格
	 */
	String.prototype.rtrim = function() {
		return this.replace(/(\s*$)/g, '');
	}

	// 对Date的扩展，将 Date 转化为指定格式的String 
	// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
	// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
	// 例子： 
	// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
	// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
	Date.prototype.Format = function(fmt) { //author: meizz 
		var o = {
			"M+" : this.getMonth() + 1, //月份 
			"d+" : this.getDate(), //日 
			"h+" : this.getHours(), //小时 
			"m+" : this.getMinutes(), //分 
			"s+" : this.getSeconds(), //秒 
			"q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
			"S" : this.getMilliseconds()
		//毫秒 
		};
		if (/(y+)/.test(fmt))
			fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
					.substr(4 - RegExp.$1.length));
		for ( var k in o)
			if (new RegExp("(" + k + ")").test(fmt))
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
						: (("00" + o[k]).substr(("" + o[k]).length)));
		return fmt;
	}
</script>

<style type="text/css">
/*左侧菜单*/
.sidebar-menu {
	border-right: 1px solid #c4c8cb;
}
/*一级菜单*/
.menu-first {
	height: 45px;
	line-height: 45px;
	background-color: #e9e9e9;
	border-top: 1px solid #efefef;
	border-bottom: 1px solid #e1e1e1;
	padding: 0;
	font-size: 14px;
	font-weight: normal;
	text-align: center;
}
/*一级菜单鼠标划过状态*/
.menu-first:hover {
	text-decoration: none;
	background-color: #d6d4d5;
	border-top: 1px solid #b7b7b7;
	border-bottom: 1px solid #acacac;
}
/*二级菜单*/
.menu-second li a {
	background-color: #f6f6f6;
}
/*二级菜单鼠标划过样式*/
.menu-second li a:hover {
	text-decoration: none;
	background-color: #66c3ec;
	border-top: 1px solid #83ceed;
	border-bottom: 1px solid #83ceed;
	border-right: 3px solid #f8881c;
	border-left: 3px solid #66c3ec;
}
/*二级菜单选中状态*/
.menu-second-selected {
	background-color: #66c3ec;
	height: 31px;
	line-height: 31px;
	border-top: 1px solid #83ceed;
	border-bottom: 1px solid #83ceed;
	border-right: 3px solid #f8881c;
	border-left: 3px solid #66c3ec;
	text-align: center;
}
/*覆盖bootstrap的样式*/
.nav-list, .nav-list li a {
	padding: 0px;
	margin: 0px;
}
</style>
