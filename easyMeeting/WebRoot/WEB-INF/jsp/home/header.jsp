<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<link href="${basePath}css/header.css" rel="stylesheet" type="text/css" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  <body>
	<div class="head-wrapper">
	  	<h2 class="name">Easy-Meeting会议管理系统</h2>
	  	<h4 class="count">目前网站访问次数: &nbsp;${applicationScope.count }</h4>
	  	<div class="more">
	  		欢迎您，${name } &nbsp;<a href="${basePath }employee/editPsd.action" target="_top">[修改密码]</a>&nbsp;<a href="${basePath }home/logout.action" target="_top">[注销]</a>
		</div>
 	</div>
  </body>
</html>
