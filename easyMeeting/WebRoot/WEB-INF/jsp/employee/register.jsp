<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<style type="text/css">
		.tip {
			color: red;
			margin-left: 5px;
		}
	</style>
	<script type="text/javascript">
	$(function(){
		$("#account").blur(function(){
			var account = $(this).val();
			if (account == "") {
				$("#tip").text("不能为空");
				return;
			} else {
				$("#tip").text("");
			}
			$.ajax ({
				url: "${basePath}employee/existsCheck.action",
				type:"POST",
				data:{
					"account":account
				},
				success:function(backData) {
					if(backData === "success") {
						$("#tip").text("");
						return;
					} else {
						$("#tip").text("该账号已经存在");	
					}
				}
			});
		});

		$("#comfirmPassword").blur(function(){
			var comfirmPassword = $(this).val();
			var password = $("#password").val();
			if (comfirmPassword !== password && password !=="" && comfirmPassword !== "") {
				$("#tip2").text("两次密码不一致")
			} else {
				$("#tip2").text("");
			}
		});
	});
	</script>
	</head>
	<body>
		<div class="wrapper">
			<h3 class="breadcrumbNavigation">人员管理 > 人员注册</h3>
			<h3 class="title">员工信息</h3>
			<form action="${basePath }/employee/registerSubmit.action" method="POST">
				<div class="form">
					<div class="tr">
						<span class="td">姓名: </span>
						<span class="td"><input type="text" name="name"/></span>
					</div>
					<div class="tr">
						<span class="td">账户名: </span>
						<span class="td"><input type="text" name="account" id="account"/><span id="tip" class="tip"></span></span>
					</div>
					<div class="tr">
						<span class="td">密码: </span>
						<span class="td"><input type="password" name="password" id="password"/></span>
					</div>
					<div class="tr">
						<span class="td">确认密码: </span>
						<span class="td"><input type="password" id="comfirmPassword"/><span id="tip2" class="tip"></span></span>
					</div>
					<div class="tr">
						<span class="td">联系电话: </span>
						<span class="td"><input type="text" name="phone"/></span>
					</div>
					<div class="tr">
						<span class="td">电子邮件: </span>
						<span class="td"><input type="text" name="email"/></span>
					</div>
					<div class="tr">
						<span class="td">所在部门: </span>
						<span class="td">
							<select id="dept" name="dept.id">
									<c:forEach items="${depts }" var="dept">
										<option value="${dept.id }" id="${dept.id }" >${dept.name }</option>
									</c:forEach>
									</select>
									<select id="gender" name="gender">
								<option value="1">男</option>
								<option value="0">女</option>
							</select>
						</span>
					</div>
					<div class="tr">
						<span class="td"></span>
						<span class="td button-collection">
							<button type="submit">注册</button>
							<button type="reset">重置</button>
							<button onclick="javascript:history.go(-1);">返回登录页面</button>
						</span>
					</div>
				</div>
			<form>
		</div>
	</body>
</html>
