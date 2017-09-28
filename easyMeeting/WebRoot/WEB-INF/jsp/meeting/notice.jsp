<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <script type="text/javascript">
   function viewDetails(id) {
	   window.location.href="${basePath }meeting/detail.action?id=" + id;
   }
  </script>
  </head>
  <body>
  	<div class="wrapper">
  	<h3 class="breadcrumbNavigation">个人中心 > 最新通知</h3>
	<h3 class="title">未来七天我要参加的会议：</h3>
	<div class="table">
		<div class="tr">
			<span class="td">会议名称</span>
			<span class="td">会议室</span>
			<span class="td">起始时间</span>
			<span class="td">结束时间</span>
			<span class="td">操作</span>
		</div>
			<c:forEach items="${recentMeetings }" var="meeting" varStatus="vs">
			<div class="tr">
				<span class="td">${meeting.name }</span>
				<span class="td">${meeting.room.name }</span>
				<span class="td"><fmt:formatDate value="${meeting.startTime }" type="BOTH" dateStyle="default" /></span>
				<span class="td"><fmt:formatDate value="${meeting.endTime }" type="BOTH" dateStyle="default" /></span>
				<span class="td">
					<button onclick="viewDetails(${meeting.id})">查看${meeting.status > 0?'/取消':'(已取消)' }</button>
				</span>
			</div>
			</c:forEach>
	</div>
	<h3 class="title">已取消的会议：</h3>
	<div class="table">
		<div class="tr">
			<span class="td">会议名称</span>
			<span class="td">会议室</span>
			<span class="td">起始时间</span>
			<span class="td">结束时间</span>
			<span class="td">操作</span>
		</div>
		<c:forEach items="${cancelMeetings }" var="meeting" varStatus="vs">
			<div class="tr">
				<span class="td">${meeting.name }</span>
				<span class="td">${meeting.room.name }</span>
				<span class="td"><fmt:formatDate value="${meeting.startTime }" type="BOTH" dateStyle="default" /></span>
				<span class="td"><fmt:formatDate value="${meeting.endTime }" type="BOTH" dateStyle="default" /></span>
	
				<span class="td">
					<button onclick="viewDetails(${meeting.id})">查看${meeting.status > 0?'/取消':'(已取消)' }</button>
				</span>
			</div>
		</c:forEach>
	</div>
	</div>
  </body>
</html>
