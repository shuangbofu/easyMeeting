<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript">
  function doExam(id, status) {
	  $.ajax({
	 		url: "${basePath}employee/setStatus.action",
	 		method: 'POST',
	 		data: {
	 			"status": status,
	 			"id": id,
	 		},
	 		success: function(res) {
	 			if ("success" === res) {
	 				var str = "#employee-" + id;
		  			$("#employee-" + id).remove();
				 }
	 		}
	 	})
  }
  </script>
  </head>
  <body>
  <div class="wrapper">
  	<h3 class="breadcrumbNavigation">人员管理 > 注册审批</h3>
	  <h2 class="title">
	  	所有待审批注册信息：
	  </h2>
		<div class="table">
			<div class="tr">
				<span class="td">姓名</span>
				<span class="td">账号名</span>
				<span class="td">联系电话</span>
				<span class="td">电子邮件</span>
				<span class="td">操作</span>
			</div>
			<c:forEach items="${employees }" var="employee" varStatus="vs">	
				<div id="employee-${employee.id }" class="tr">
					<span class="td">${employee.name }</span>
					<span class="td">${employee.account }</span>
					<span class="td">${employee.phone }</span>
					<span class="td">${employee.email }</span>
					<span class="td button-collection">
						<button onClick="doExam(${employee.id }, 1)" class="danger">通过</button>
						<button onClick="doExam(${employee.id }, 3)" class="success">不通过</button>
					</span>
				</div>
			</c:forEach>
		</div>
	</div>
  </body>
</html>

