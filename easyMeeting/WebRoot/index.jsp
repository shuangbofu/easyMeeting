<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
    This is my JSP page. <br>
    <a href="${basePath }employee/register.action">注册</a><br>
    <hr>
    <a href="${basePath }meeting/list.action">我的预定</a><br>
    <a href="${basePath }meeting/detail.action?id=1">修改会议预定(id=1)</a><br>
    <a href="${basePath }meeting/notice.action">最新通知</a><br>
    
    <hr>
    <a href="${basePath }dept/list.action">部门管理</a><br>
    <a href="${basePath }employee/search.action">搜索员工</a><br>
    <a href="${basePath }employee/exam.action">注册审批</a><br>
    <hr>
    <a href="${basePath }room/add.action">添加会议室</a><br>
    <a href="${basePath }room/list.action">查看会议室</a><br>
    <a href="${basePath }room/detail.action?id=1">会议室详情(id=1)</a><br>
   	<a href="${basePath }meeting/add.action">预定会议</a><br>   
   	<hr>
   	<a href="${basePath }home/index.action">进入系统</a>
  </body>
</html>
