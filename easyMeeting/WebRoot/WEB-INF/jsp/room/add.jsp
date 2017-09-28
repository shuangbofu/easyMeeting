<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  <body>
  <div class="wrapper">
  	<h3 class="breadcrumbNavigation">会议预定 > 添加会议室</h3>
	  <div class="form">
	  	<h3 class="panel-title">会议室信息</h3>
	  	<form action="${basePath }room/insert.action" method="POST">
		    <div class="tr">
		    	<span class="td">门牌号: </span>
		    	<span class="td"><input type="text" name="number"/></span>
		    </div>
		    <div class="tr">
		    	<span class="td">会议室名称: </span>
		    	<span class="td"><input type="text" name="name"/></span>
		    </div>
		    <div class="tr">
		    	<span class="td">最多容纳人数: </span>
		    	<span class="td"><input type="text" name="maxCount"/></span>
		    </div>
		    <div class="tr">
		    	<span class="td">当前状态 </span>
		    	<span class="td">
		            <label><input type="radio" name="status" value="1" checked>可用</label>
		            <label><input type="radio" name="status" value="0">不可用</label>
		    	</span>
		    </div>
		     <div class="tr">
		   		<span class="td">备注: </span>
		   		<span class="td">
		   			<textarea rows="5" cols="60" style="margin-left:20px;" name="note"></textarea>
		   		</span>
		   	</div>
		   	<div class="tr">
		   		<span class="td"></span>
		   		<span class="td button-collection">
		   			<button type="submit">添加</button>
		    		<button type="reset">重置</button>
		   		</span>
		   	</div>
		</form>
	</div>
	</div>
  </body>
</html>
