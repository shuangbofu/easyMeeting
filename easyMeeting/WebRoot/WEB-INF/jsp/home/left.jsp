<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<link href="${basePath}css/left.css" rel="stylesheet" type="text/css" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<script type="text/javascript">
		$(function(){
			$(".item").click(function(){
				$(".item").removeClass("activated");
				$(this).addClass("activated")
			});
		});
		function visit(url){
			window.top.mainFrame.location = "${basePath}"+url+".action";
		}
	</script>
	</head>
	
	<body style="text-align:center;">
		<div class="left-wrapper">
			<div class="nav">
				<h2 class="title">个人中心</h2>
				<div class="item" onclick="visit('meeting/list')" id="item">
					我的预定
				</div>
				<div class="item" onclick="visit('meeting/notice')">
					最新通知
				</div>
			 </div>
			 <div class="nav">
				<h2 class="title">人员管理</h2>
				<div class="item" onclick="visit('dept/list')">
					部门管理
				</div>
				<div class="item" onclick="visit('employee/search')">
					搜索员工
				</div>
				<div class="item" onclick="visit('employee/exam')">
					注册审批
				</div>
			</div>
			<div class="nav">
				<h2 class="title">会议预定</h2>
				<div class="item" onclick="visit('room/add')">
					添加会议室
				</div>
				<div class="item" onclick="visit('room/list')">
					查看会议室
				</div>
				<div class="item" onclick="visit('meeting/add')">
					预定会议
				</div>
			</div>
		</div>
	</body>
</html>
