<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  	<frameset rows="6%, 89%, 5%" border="0">
   	  <frame src="${basePath }home/header.action" scrolling="no">
	  <frameset cols="10%, 90%">
	  	<frame src="${basePath }home/left.action">
	  	<frame src="${basePath }home/main.action" name="mainFrame">
	  </frameset>
	  <frame src="${basePath }home/footer.action">
   </frameset>
  <body>
  </body>
</html>
