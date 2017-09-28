<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript">
  	function viewDetails(id){
  		window.location.href="${basePath }room/detail.action?id="+id;
  	}
  </script>
  </head>
  <body>
  <div class="wrapper">
	<h3 class="breadcrumbNavigation">会议预定 > 查看会议室</h3>
	<h3 class="title">所有会议室：</h3>
		<div class="table">
			<div class="tr">
				<span class="td">门派编号</span>
				<span class="td">会议室名称</span>
				<span class="td">容纳人数</span>
				<span class="td">当前状态</span>
				<span class="td">操作</span>
			</div>
			<c:forEach items="${rooms }" var="room" varStatus="vs">
				<div class="tr">
					<span class="td">${room.number }</span>
					<span class="td">${room.name }</span>
					<span class="td">${room.maxCount }</span>
					<span class="td">${room.status > 0? '可用' :'不可用' }</span>
					<span class="td">
						<button onclick="viewDetails(${room.id})">查看详情</button>
					</span>
				</div>
			</c:forEach>
		</div>
	</div>
  </body>
</html>
