<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <script type="text/javascript">
  	function addDept() {  		
  		document.forms[0].action = "${basePath}dept/add.action";
  		document.forms[0].submit();
  	}
	function doDelete(id) {
		document.forms[0].action = "${basePath}dept/delete.action?id=" + id;
  		document.forms[0].submit();
	}
  </script>
  </head>
  <body>
  	<div class="wrapper">
  		<h3 class="breadcrumbNavigation">
	  		人员管理 > 部门管理
	  	</h3>
	  		<h2 class="title">添加部门</h2>
	  			<div class="operationPanel">
		  			<form method="POST">
			  			部门名称：<input type="text" name="name" />
			  			<button onclick="addDept()" style="margin-left: 10px;">添加</button>
			  		</form>
	  			</div>
	  	</fieldset>
	  	<div class="staticPanel">
			<h3 class="panel-title">所有部门：</h3>
			<div class="table">
				<div class="tr">
					<span class="td">部门编号</span>
					<span class="td">部门名称</span>
					<span class="td">操作</span>
				</div>
					<c:forEach items="${depts }" var="dept" varStatus="vs">
					<div class="tr">
						<span class="td">${vs.count }</span>
						<span class="td">${dept.name }</span>
						<span class="td">
							<button onClick="doDelete('${dept.id}')">删除</button>
						</span>
					</div>
					</c:forEach>
			</div>
		</div>
	</div>		
 </body>
</html>
