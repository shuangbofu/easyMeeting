<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<link href="${basePath}css/other.css" rel="stylesheet" type="text/css" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  <body>
  <div class="login-wrapper">
  	<form action="${basePath }home/loginSubmit.action" method="POST">
	  <div class="form">
	  	 <h3 class="title">Easy-Meeting会议系统</h3>
		  <div class="tr">
			 <span class="td">账号：</span>
		  	<span class="td"><input type="text" name="account"></input></span>
		  </div>
	  	  <div class="tr">
			 <span class="td">密码：</span>
		  	<span class="td"><input type="password" name="password"></input></span>
		  </div>
	  	  <div class="tr">
		  	  <span class="td">
			  	  <a href="${basePath }employee/register.action">注册</a>
			  	  <button type="submit" class="login"/>登录</button>
		  	  </span>
	  	  </div>
	  </div>
  	</form>
  </div>
  </body>
</html>
