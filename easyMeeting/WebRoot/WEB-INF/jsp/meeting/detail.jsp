<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript">
  		$("#depts").change(function() {
  			console.log("dddd");
  		});
  		function abolishMeeting (id, roomId) {
  			$.ajax({
  				url: "${basePath}meeting/abolishMeeting.action",
  				method: 'POST',
  				data: {
  					"id": id,
  					"roomId": roomId
  				},
  				success(res) {
  					if ("success" === res) {
  						$("#abolish").remove();
  					}
  				}
  			});
  		}
  	</script>
  </head>
  <body>
  <div class="wrapper">
  	<h3 class="breadcrumbNavigation">会议预定 > 修改会议预定</h3>
  	<div class="detail">
	    <h3 class="title">会议信息</h3>
	    <div class="item">
		    	<span class="title">会议名称: </span>
		    	<span class="content">${meeting.name }</span>
		    </div>
		   <div class="item">
		    	<span class="title">预计参加人数: </span>
		    	<span class="content">${meeting.count }</span>
		    </div>
		    <div class="item">
		    	<span class="title">预计开始时间: </span>
		    	<span class="content"><fmt:formatDate value="${meeting.startTime }" type="BOTH" dateStyle="default" /></span>
		    </div>
		     <div class="item">
		    	<span class="title">预计结束时间: </span>
		    	<span class="content"><fmt:formatDate value="${meeting.endTime }" type="BOTH" dateStyle="default" /></span>
		    </div>
		     <div class="item">
		   		<span class="title">会议说明: </span>
		   		<span class="content">${meeting.note }</span>
		   	</div>
		   	<div class="item">
		   		<span class="title">参会人员: </span>
		   		<span class="content">
			   		<div class="table white">
			   			<div class="tr">
			   				<span class="td">姓名</span>
			   				<span class="td">联系电话</span>
			   				<span class="td">电子邮件</span>
			   			</div>
		            	<c:forEach items="${employees }" var="employee">
			            	<div class="tr">
			            		<span class="td">${employee.name }</span>
			            		<span class="td">${employee.phone }</span>
			            		<span class="td">${employee.email }</span>
			            	</div>
		            	</c:forEach>
	            	</table>
		   		</span>
		   	</div>
		   	<div class="item">
		   		<span class="content button-collection">
			   		<c:if test="${meeting.status > 0 and sessionScope.id == meeting.creator.id }">
			   			<button id="abolish" onClick="abolishMeeting(${meeting.id}, ${meeting.room.id })">取消会议</button>
			   		</c:if>
		    		<button onclick="javascript:history.go(-1);">返回</button>
		   		</span>
		   	</div>
	  </div>
	 </div>
  </body>
</html>
