<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	</head>
	<body>
		<div class="wrapper">
			<h3 class="breadcrumbNavigation">会议预定 > 会议室详情</h3>
			<div class="detail">
				<h3 class="title">会议室信息</h3>
				<div class="item">
					<span class="title">门牌号: </span>
					<span class="content">${room.number }</span>
				</div>
				<div class="item">
					<span class="title">会议室名称: </span>
					<span class="content">${room.name }</span>
				</div>
				<div class="item">
					<span class="title">最多容纳人数: </span>
					<span class="content">${room.maxCount }</span>
				</div>
				<div class="item">
					<span class="title">当前状态: </span>
					<span class="content">${room.status > 0 ? '可用' : '不可用' }</span>
				</div>
				<div class="item">
					<span class="title">备注: </span>
					<span class="content">${room.note }</span>
				</div>
				<div class="item">
					<button onclick="javascript:history.go(-1);">返回</button>
				</div>
			</div>
		</div>
	</body>
</html>
