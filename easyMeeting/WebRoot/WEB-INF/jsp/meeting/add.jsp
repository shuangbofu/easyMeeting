<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<script type="text/javascript" src="${basePath}js/My97DatePicker/WdatePicker.js"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<script type="text/javascript">
	$(function(){
		$("#depts").change(function(){
			$("#employees option").remove();
			var deptId = $("#depts option:selected").val();
			if(deptId !== 0) {
				$.ajax({
					url: "${basePath}employee/getEmployeesByDetpId.action",
					method: 'POST',
					data: {
						"deptId": deptId
					},
					success: function(backData) {
						for(var i=0; i<backData.length; i++) {
							var employee = backData[i];
							var $option = $("<option></option>");
							$option.text(employee.name);
							$option.val(employee.id);
							$("#employees").append($option);
						}
					}
				});
			}
		});
	});
	function go(){
		var idStr = $("#employees option:selected").val();
		var id = parseInt(idStr);
		if (id === ${sessionScope.id}) {
			alert("不需要添加自己");
			return;
		}
		oldVal = $("#string").val();
		if (oldVal.indexOf(",#" + idStr +"#") != -1) {
			alert("不可重复添加")
			return;
		}
		var newVal = oldVal + ",#" + idStr +"#";
		$("#string").attr("value", newVal);
		var name = $("#employees option:selected").text();
		var $option = $("<option></option>");
		var $input = $("<input type='hidden'></input>")
		var index = $("#selected option").size();
		var str = "employees["+index+"].id";
		if (id!="" && name!="") {
			$option.text(name);
			$option.val(id);
			$option.attr("name", str);
			$option.attr("selected", "selected");
			
			$input.attr("name", str);
			$input.val(id);
			$("#selected").append($option);
			$("#hiddenArea").append($input);
		}
	}
	function back(){
		var idStr = $("#selected option:selected").val();
		var str = $("#selected option:selected").attr("name");
		$("#selected option:selected").remove();
		$("#hiddenArea input[name='"+str+"']").remove();
		var string = $("#string").attr("value");
		var index = string.indexOf(",#"+idStr+"#");
		var newVal = string.substring(0, index) + string.substring(index+idStr.length+3, string.length);
		$("#string").val(newVal);
		console.log(newVal);
	}
	function resetData(){
		$("#selected").empty();
		$("#hiddenArea").empty();
		$("#employees").empty();
	}
	</script>
	<style type="text/css">
		.depts, .buttons, .selected {
			display: inline-block;
		}
		.buttons button {
			display: block;
		}
		.buttons button:last-of-type {
			margin-top: 50px;
			margin-bottom: 10px;
		}
		#employees, #selected {
			width: 80px;
			height: 120px;
		}
		#employees {
			display: block;
		}
	</style>
  </head>
   <body>
   <div class="wrapper">
	<h3 class="breadcrumbNavigation">会议预定 > 预定会议</h3>
	<div class="form">
		<h3 class="panel-title">会议信息</h3>
		<form action="${basePath }meeting/insert.action" method="POST">
			<input type="hidden" value="${sessionScope.id }" name="creator.id">
			<input type="hidden" id="string" value="">
			<div id="hiddenArea"></div>
			<div class="tr">
				<span class="td">会议名称: </span>
				<span class="td"><input type="text" name="name"/></span>
			</div>
			<div class="tr">
				<span class="td">预计参加人数: </span>
				<span class="td"><input type="text" name="count"/></span>
			</div>
			<div class="tr">
				<span class="td">预计开始时间: </span>
				<span class="td"><input type="text" name="startTime" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></span>
			</div>
			 <div class="tr">
				<span class="td">预计结束时间: </span>
				<span class="td"><input type="text" name="endTime" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></span>
			</div>
			<div class="tr">
				<span class="td">选择会议室: </span>
				<span class="td">
					<select id="room" name="room.id">
						<option value="0">选择会议室</option>
						<c:forEach items="${rooms }" var="room">
							<option value="${room.id }" id="${room.id }" >${room.name }</option>
						</c:forEach>
					</select>
				</span>
			</div>
			 <div class="tr">
				<span class="td">会议说明: </span>
				<span class="td">
					<textarea rows="5" cols="60" style="margin-left:20px;" name="note"></textarea>
				</span>
			</div>
			<div class="tr">
				<span class="td button-collection">
					<button type="submit">预定会议</button>
					<button type="reset" onclick="resetData()">重置</button>
				</span>
			</div>
			<div class="tr" id="selector">
				<span class="td">选择参会人员</span>
				<span class="td">
					<div class="depts">
						<select id="depts">
							<option value="0">选择部门</option>
							<c:forEach items="${depts }" var="dept">
								<option value="${dept.id }" id="${dept.id }" >${dept.name }</option>
							</c:forEach>
						</select>
						<select id="employees" multiple>
						</select>
					 </div>
					 <div class="buttons">
						<button type="button" onclick="go()">></button>
						<button type="button" onclick="back()"><</button>
					 </div>
					 <div class="selected">
						<select id="selected" multiple>
					 </div>
				</span>
			</div>
		</form>		
	 </div>
  </body>
</html>
