<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<c:set var="selectItem" scope="request" />
<title><sitemesh:write property='title' /></title>
<sitemesh:write property='head' />
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>Deepure</span>Flow</a>
				<ul class="user-menu">
					<li class="dropdown pull-right"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><span
							class="glyphicon glyphicon-user"></span> 用户管理 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<%=request.getContextPath()%>/user/userInfo"><span class="glyphicon glyphicon-user"></span>
									信息</a></li>
							<li><a href="<%=request.getContextPath()%>/security/logout"
								target="_blank"><span class="glyphicon glyphicon-log-out"></span>
									登出</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!-- /.container-fluid -->
	</nav>

	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<!-- 		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form> -->
<!-- 		<div class="sidebar-menu">
		    <a href="#userMeun" class="nav-header menu-first collapsed" data-toggle="collapse"><i class="icon-user-md icon-large"></i> 用户管理</a>
		    <ul id="userMeun" class="nav nav-list collapse menu-second">
		        <li><a href="#"><i class="icon-user"></i> 增加用户</a></li>
		        <li><a href="#"><i class="icon-edit"></i> 修改用户</a></li>
		        <li><a href="#"><i class="icon-trash"></i> 删除用户</a></li>
		        <li><a href="#"><i class="icon-list"></i> 用户列表</a></li>
		 
		    </ul>
		    <a href="#articleMenu" class="nav-header menu-first collapsed" data-toggle="collapse"><i class="icon-book icon-large"></i> 文章管理</a>
		    <ul id="articleMenu" class="nav nav-list collapse menu-second">
		        <li><a href="#"><i class="icon-pencil"></i> 添加文章</a></li>
		        <li><a href="#"><i class="icon-list-alt"></i> 文章列表</a></li>
		    </ul>
		</div> -->
		<ul class="nav menu">
<%-- 		
			<li  <c:if test="${sessionScope.selectItem=='user'}">class='active'</c:if>>
				<a href="<%=request.getContextPath()%>/user/getUserInfo"><span
							class="glyphicon glyphicon-dashboard"></span> 用户</a>
			</li> --%>
			<c:forEach var="menu" items="${menus}">
				<li class="parent "> 
					<c:choose> 
					    <c:when test="${empty menu.url}"><a href="#"></c:when> 
					    <c:otherwise><a href="<%=request.getContextPath()%>${menu.url}"></c:otherwise> 
					</c:choose>
 					<span
					class="glyphicon glyphicon-list"></span>${menu.name}</a>
					<c:forEach var="subMenu" items="${menu.children}">
					<ul class="nav nav-list menu-second" id="sub-item-1">
					<li>
					<c:choose> 
					    <c:when test="${empty subMenu.url}"><a href="#"></c:when> 
					    <c:otherwise><a <c:if test="${sessionScope.selectItem==subMenu.id}">class="active"</c:if>href="<%=request.getContextPath()%>${subMenu.url}"></c:otherwise> 
					</c:choose> 
					 <span 
							class="glyphicon glyphicon-share-alt"></span>${subMenu.name}
					</a></li>
					</ul>
					</c:forEach>
				
			</c:forEach>
			<li role="presentation" class="divider"></li>
			<li><a href="#"><span class="glyphicon glyphicon-user"></span>${user.username}</a></li>
		</ul>
		<div class="attribution"></div>
	</div>
	<!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<sitemesh:write property='body' />
	</div>
	<!--/.main-->

	<script>
		$('#calendar').datepicker({});

		!function($) {
			$(document)
					.on(
							"click",
							"ul.nav li.parent > a > span.icon",
							function() {
								$(this).find('em:first').toggleClass(
										"glyphicon-minus");
							});
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function() {
			if ($(window).width() > 768)
				$('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function() {
			if ($(window).width() <= 767)
				$('#sidebar-collapse').collapse('hide')
		})
	</script>
</body>
</html>