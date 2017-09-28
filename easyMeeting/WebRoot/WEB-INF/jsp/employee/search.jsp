<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript">
  function closeEmployee(id) {
	  $.ajax({
	 		url: "${basePath}employee/close.action",
	 		method: 'POST',
	 		data: {
	 			"id": id
	 		},
	 		success: function(res) {
	 			if ("success" === res) {
	 				var str = "#employee-" + id;
		  			$("#employee-" + id).remove();
				 }
	 		}
	 	})
  }
  function doList(command) {
 	document.forms[0].action = "${basePath}employee/search.action?command="+command;
	document.forms[0].submit();
  }
  function doGoPage(value) {
		value = parseInt(value);
		var max = parseInt($("#currText").attr("max"));
		var min = parseInt($("#currText").attr("min"));
		if(value > max) {
			alert("输入的页数不能大于"+max+"！！！");
		} else if(value < min) {
			alert("输入的页数不能小于"+min+"！！！");
		} else {
			document.forms[0].action = "${basePath}employee/search.action?currentPage="+value;
			document.forms[0].submit();
		}
	}
  $(function(){
	  $("#status[value='${sessionScope.page.keyEntity.status}']").attr("checked", "checked");
	  $("#name").attr("value", "${sessionScope.page.keyEntity.name }");
	  $("#account").attr("value", "${sessionScope.page.keyEntity.account }");
  })
  function resetData(){
	  $("#status[value='0']").attr("checked", "checked");
	  $("#name").attr("value", "");
	  $("#account").attr("value", "");
  }
  function submit(){
	  document.forms[0].submit();
  }
  </script>
  </head>
  <body>
  <div class="wrapper">
  	<h3 class="breadcrumbNavigation">人员管理 > 搜索员工</h3>
	   <h2 class="title">搜索员工</h2>
	    <div class="operationPanel">
	    	<form action="${basePath }employee/search.action" method="POST">
		    	姓名: 
		    	<input type="text" name="name" value="" id="name"/>
		    	账户名: 
		    	<input type="text" name="account" id="account" value=""/>
		   		状态：
		   		<label><input id="status" type="radio" value="1" name="status"/>已批准</label>
		   		<label><input id="status" type="radio" value="4" name="status"/>待审批</label>
		   		<label><input id="status" type="radio" value="2" name="status"/>已关闭</label>
		   		<label><input id="status" type="radio" value="0" name="status" checked/>所有</label>
			    	
				<div class="button-collection" style="text-align: center; margin-top: 20px;">
					<button onclick="submit()">查询</button>
	    			<button type="reset" onclick="resetData()">重置</button>
				</div>
		 	</form>
		 </div>
		 <div class="staticPanel">
	 		<h3 class="panel-title">查询结果</h3>
			<div class="table">
					<div class="tr">
						<span class="td">姓名</span>
						<span class="td">账号名</span>
						<span class="td">联系电话</span>
						<span class="td">电子邮件</span>
						<span class="td">操作</span>
					</div>
				<c:forEach items="${sessionScope.page.pageData }" var="employee" varStatus="vs">	
					<div id="employee-${employee.id }" class="tr">
						<span class="td">${employee.name }</span>
						<span class="td">${employee.account }</span>
						<span class="td">${employee.phone }</span>
						<span class="td">${employee.email }</span>
						<span class="td">
						<c:choose>
							<c:when test="${employee.status!=2 }">
								<button onClick="closeEmployee(${employee.id })">关闭账号</button>
							</c:when>
							<c:otherwise>
								<h4 class="forbidden">账号已关闭</h4>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
			</div>
			<div style="margin-top: 15px;">
				<span>
	                	总共
	                	${sessionScope.page.totalRecordsCount }条记录，当前第
	                	
	                	 ${sessionScope.page.currentPage }页，
	                	 
	                	 共${sessionScope.page.pageCount }页 &nbsp;&nbsp;
	                </span>
	                <span style="float: right;">      
	                  	<a id="firstPage" href="javascript:doList('home')">首页</a>&nbsp;&nbsp;
	                   <a id="prePage" href="javascript:doList('previous')">上一页</a>&nbsp;&nbsp;
	                   
	                   <a id="nextPage" href="javascript:doList('next')">下一页</a>&nbsp;&nbsp;
	                   
	                  	<a id="lastPage" href="javascript:doList('end')">尾页</a>&nbsp;&nbsp;
	                   
					转到第&nbsp;<input style="width: 40px;" id="currText" type="text" style="width: 30px;" onkeypress="if(event.keyCode == 13){doGoPage(this.value);}" min="1"
					max="${sessionScope.page.pageCount }" value="${sessionScope.page.currentPage }" />&nbsp;页 &nbsp;&nbsp;
					<button type="button" onclick="doGoPage($('#currText').val())">跳转</button>
			    </span>
			</div>
		</div>
	</div>
  </body>
</html>
